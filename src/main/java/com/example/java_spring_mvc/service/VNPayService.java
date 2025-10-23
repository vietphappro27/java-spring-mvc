package com.example.java_spring_mvc.service;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class VNPayService {

    @Value("${vnpay.url}")
    private String vnpayUrl;

    @Value("${vnpay.return.url}")
    private String returnUrl;

    @Value("${vnpay.tmn.code}")
    private String tmnCode;

    @Value("${vnpay.secret.key}")
    private String secretKey;

    @Value("${vnpay.version}")
    private String version;

    @Value("${vnpay.command}")
    private String command;

    @Value("${vnpay.curr.code}")
    private String currCode;

    @Value("${vnpay.locale}")
    private String locale;

    public String createPaymentUrl(String orderId, String amount, String orderInfo, String ipAddress) {
        try {
            // Kiểm tra và đảm bảo số tiền hợp lệ
            long amountInVND = Long.parseLong(amount);
            if (amountInVND < 5000) {
                amountInVND = 5000; // Tối thiểu 5,000 VND
            }

            // VNPay yêu cầu amount tính bằng xu (1 VND = 100 xu)
            long amountInCents = amountInVND * 100;

            // Tạo timestamp theo định dạng yyyyMMddHHmmss (theo VNPay sample)
            java.util.Calendar cld = java.util.Calendar.getInstance(java.util.TimeZone.getTimeZone("Etc/GMT+7"));
            java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
            String createDate = formatter.format(cld.getTime());

            // Thêm expire date (15 phút sau)
            cld.add(java.util.Calendar.MINUTE, 15);
            String expireDate = formatter.format(cld.getTime());

            Map<String, String> vnpParams = new HashMap<>();
            vnpParams.put("vnp_Version", version);
            vnpParams.put("vnp_Command", command);
            vnpParams.put("vnp_TmnCode", tmnCode);
            vnpParams.put("vnp_Amount", String.valueOf(amountInCents));
            vnpParams.put("vnp_CurrCode", currCode);
            vnpParams.put("vnp_TxnRef", orderId);
            vnpParams.put("vnp_OrderInfo", orderInfo);
            vnpParams.put("vnp_OrderType", "other");
            vnpParams.put("vnp_Locale", locale);
            vnpParams.put("vnp_ReturnUrl", returnUrl);
            vnpParams.put("vnp_IpAddr", ipAddress);
            vnpParams.put("vnp_CreateDate", createDate);
            vnpParams.put("vnp_ExpireDate", expireDate);

            // Debug: In ra console để kiểm tra
            System.out.println("VNPay Debug - Amount in VND: " + amountInVND);
            System.out.println("VNPay Debug - Amount in Cents: " + amountInCents);
            System.out.println("VNPay Debug - Create Date: " + createDate);
            System.out.println("VNPay Debug - Expire Date: " + expireDate);
            System.out.println("VNPay Debug - Order ID: " + orderId);
            System.out.println("VNPay Debug - IP Address: " + ipAddress);
            System.out.println("VNPay Debug - Order Info: " + orderInfo);
            System.out.println("VNPay Debug - TMN Code: " + tmnCode);
            System.out.println("VNPay Debug - Secret Key: " + secretKey);

            // Sắp xếp các tham số theo thứ tự alphabet (theo VNPay sample)
            List<String> fieldNames = new ArrayList<>(vnpParams.keySet());
            Collections.sort(fieldNames);

            StringBuilder hashData = new StringBuilder();
            StringBuilder query = new StringBuilder();
            Iterator<String> itr = fieldNames.iterator();
            while (itr.hasNext()) {
                String fieldName = itr.next();
                String fieldValue = vnpParams.get(fieldName);
                if ((fieldValue != null) && (fieldValue.length() > 0)) {
                    // Build hash data (encode cho hash data theo VNPay sample)
                    hashData.append(fieldName);
                    hashData.append('=');
                    try {
                        try {
                            hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                        } catch (Exception e) {
                            hashData.append(fieldValue);
                        }
                    } catch (Exception e) {
                        hashData.append(fieldValue);
                    }
                    // Build query (encode cho URL)
                    query.append(URLEncoder.encode(fieldName, StandardCharsets.UTF_8));
                    query.append('=');
                    query.append(URLEncoder.encode(fieldValue, StandardCharsets.UTF_8));
                    if (itr.hasNext()) {
                        query.append('&');
                        hashData.append('&');
                    }
                }
            }

            String queryUrl = query.toString();
            String hashDataString = hashData.toString();
            String vnpSecureHash = hmacSHA512(secretKey, hashDataString);
            queryUrl += "&vnp_SecureHash=" + vnpSecureHash;
            String paymentUrl = vnpayUrl + "?" + queryUrl;

            // Debug: In ra thông tin chi tiết
            System.out.println("VNPay Debug - Hash Data: " + hashDataString);
            System.out.println("VNPay Debug - Secure Hash: " + vnpSecureHash);
            System.out.println("VNPay Debug - Query URL: " + queryUrl);
            System.out.println("VNPay Debug - Payment URL: " + paymentUrl);

            // Debug: In ra từng tham số
            System.out.println("VNPay Debug - Parameters:");
            for (String fieldName : fieldNames) {
                String fieldValue = vnpParams.get(fieldName);
                System.out.println("  " + fieldName + " = " + fieldValue);
            }

            return paymentUrl;
        } catch (Exception e) {
            System.err.println("VNPay Error: " + e.getMessage());
            e.printStackTrace();
            throw new RuntimeException("Lỗi tạo URL thanh toán VNPay: " + e.getMessage());
        }
    }

    public boolean verifyPayment(Map<String, String> params) {
        String vnpSecureHash = params.get("vnp_SecureHash");
        params.remove("vnp_SecureHashType");
        params.remove("vnp_SecureHash");

        List<String> fieldNames = new ArrayList<>(params.keySet());
        Collections.sort(fieldNames);
        StringBuilder hashData = new StringBuilder();
        Iterator<String> itr = fieldNames.iterator();
        while (itr.hasNext()) {
            String fieldName = itr.next();
            String fieldValue = params.get(fieldName);
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                hashData.append(fieldName);
                hashData.append('=');
                try {
                    try {
                        hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                    } catch (Exception e) {
                        hashData.append(fieldValue);
                    }
                } catch (Exception e) {
                    hashData.append(fieldValue);
                }
                if (itr.hasNext()) {
                    hashData.append('&');
                }
            }
        }
        String secureHash = hmacSHA512(secretKey, hashData.toString());

        // Debug: In ra thông tin verify
        System.out.println("VNPay Verify - Hash Data: " + hashData.toString());
        System.out.println("VNPay Verify - Secure Hash: " + secureHash);
        System.out.println("VNPay Verify - VNPay Hash: " + vnpSecureHash);
        System.out.println("VNPay Verify - Result: " + secureHash.equals(vnpSecureHash));

        return secureHash.equals(vnpSecureHash);
    }

    private String hmacSHA512(String key, String data) {
        try {
            if (key == null || data == null) {
                throw new NullPointerException("Key hoặc data không được null");
            }

            final Mac hmac512 = Mac.getInstance("HmacSHA512");
            byte[] hmacKeyBytes = key.getBytes(StandardCharsets.UTF_8);
            final SecretKeySpec secretKey = new SecretKeySpec(hmacKeyBytes, "HmacSHA512");
            hmac512.init(secretKey);
            byte[] dataBytes = data.getBytes(StandardCharsets.UTF_8);
            byte[] result = hmac512.doFinal(dataBytes);

            StringBuilder sb = new StringBuilder(2 * result.length);
            for (byte b : result) {
                sb.append(String.format("%02x", b & 0xff));
            }

            System.out.println("VNPay Debug - HMAC Input: " + data);
            System.out.println("VNPay Debug - HMAC Key: " + key);
            System.out.println("VNPay Debug - HMAC Result: " + sb.toString());

            return sb.toString();
        } catch (Exception ex) {
            System.err.println("VNPay HMAC Error: " + ex.getMessage());
            ex.printStackTrace();
            throw new RuntimeException("Lỗi tạo HMAC: " + ex.getMessage());
        }
    }

    public String generateOrderId() {
        Random rnd = new Random();
        int n = 100000 + rnd.nextInt(900000);
        return String.valueOf(n);
    }

    // Method kiểm tra cấu hình VNPay
    public void checkVNPayConfig() {
        System.out.println("=== VNPay Configuration Check ===");
        System.out.println("VNPay URL: " + vnpayUrl);
        System.out.println("VNPay Return URL: " + returnUrl);
        System.out.println("VNPay TMN Code: " + tmnCode);
        System.out.println("VNPay Secret Key: "
                + (secretKey != null ? "***" + secretKey.substring(secretKey.length() - 4) : "NULL"));
        System.out.println("VNPay Version: " + version);
        System.out.println("VNPay Command: " + command);
        System.out.println("VNPay Currency: " + currCode);
        System.out.println("VNPay Locale: " + locale);

        // Kiểm tra các tham số bắt buộc
        if (tmnCode == null || tmnCode.isEmpty() || "YOUR_TMN_CODE_HERE".equals(tmnCode)) {
            System.err.println("ERROR: TMN Code chưa được cấu hình đúng!");
        }
        if (secretKey == null || secretKey.isEmpty() || "YOUR_SECRET_KEY_HERE".equals(secretKey)) {
            System.err.println("ERROR: Secret Key chưa được cấu hình đúng!");
        }
        if (returnUrl == null || returnUrl.isEmpty()) {
            System.err.println("ERROR: Return URL chưa được cấu hình!");
        }
    }

    // Method test để kiểm tra chữ ký (theo VNPay sample)
    public void testSignature() {
        try {
            System.out.println("=== VNPay Signature Test ===");

            // Test với data thực tế theo VNPay sample
            Map<String, String> testParams = new HashMap<>();
            testParams.put("vnp_Amount", "500000");
            testParams.put("vnp_Command", "pay");
            testParams.put("vnp_CreateDate", "20231023100159");
            testParams.put("vnp_CurrCode", "VND");
            testParams.put("vnp_ExpireDate", "20231023101659");
            testParams.put("vnp_IpAddr", "127.0.0.1");
            testParams.put("vnp_Locale", "vn");
            testParams.put("vnp_OrderInfo", "Thanh toan don hang:123456");
            testParams.put("vnp_OrderType", "other");
            testParams.put("vnp_ReturnUrl", "http://localhost:8080/vnpay-return");
            testParams.put("vnp_TmnCode", "OLDN7MWJ");
            testParams.put("vnp_TxnRef", "123456");
            testParams.put("vnp_Version", "2.1.0");

            // Tạo hash data theo cách VNPay sample
            List<String> fieldNames = new ArrayList<>(testParams.keySet());
            Collections.sort(fieldNames);
            StringBuilder hashData = new StringBuilder();
            Iterator<String> itr = fieldNames.iterator();
            while (itr.hasNext()) {
                String fieldName = itr.next();
                String fieldValue = testParams.get(fieldName);
                if ((fieldValue != null) && (fieldValue.length() > 0)) {
                    hashData.append(fieldName);
                    hashData.append('=');
                    try {
                        try {
                            hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                        } catch (Exception e) {
                            hashData.append(fieldValue);
                        }
                    } catch (Exception e) {
                        hashData.append(fieldValue);
                    }
                    if (itr.hasNext()) {
                        hashData.append('&');
                    }
                }
            }

            String testKey = "W63Q3DG1KBTJ03GOFQ7QUHCV5UYADWKI";
            String realHash = hmacSHA512(testKey, hashData.toString());

            System.out.println("VNPay Test - Hash Data: " + hashData.toString());
            System.out.println("VNPay Test - Secret Key: " + testKey);
            System.out.println("VNPay Test - Generated Hash: " + realHash);

            // Test với data mẫu từ VNPay
            String vnpaySampleData = "vnp_Amount=500000&vnp_Command=pay&vnp_CreateDate=20231023100159&vnp_CurrCode=VND&vnp_ExpireDate=20231023101659&vnp_IpAddr=127.0.0.1&vnp_Locale=vn&vnp_OrderInfo=Thanh%20toan%20don%20hang%3A123456&vnp_OrderType=other&vnp_ReturnUrl=http%3A%2F%2Flocalhost%3A8080%2Fvnpay-return&vnp_TmnCode=OLDN7MWJ&vnp_TxnRef=123456&vnp_Version=2.1.0";
            String vnpaySampleHash = hmacSHA512(testKey, vnpaySampleData);
            System.out.println("VNPay Test - Sample Data: " + vnpaySampleData);
            System.out.println("VNPay Test - Sample Hash: " + vnpaySampleHash);

        } catch (Exception e) {
            System.err.println("VNPay Test Error: " + e.getMessage());
            e.printStackTrace();
        }
    }
}