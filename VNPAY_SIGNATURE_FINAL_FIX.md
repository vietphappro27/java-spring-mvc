# Khắc phục lỗi "Sai chữ ký" VNPay - Phiên bản cuối cùng

## Vấn đề hiện tại

Bạn vẫn gặp lỗi **"Sai chữ ký"** từ VNPay. Đây là lỗi phổ biến nhất khi tích hợp VNPay và cần được khắc phục triệt để.

## Nguyên nhân chính

Lỗi "Sai chữ ký" xảy ra khi:

1. **Hash data format sai** - Không đúng với VNPay yêu cầu
2. **Encoding sai** - Không encode đúng cách
3. **Thứ tự tham số sai** - Không sắp xếp theo alphabet
4. **Secret key sai** - Key không đúng hoặc bị lỗi

## Giải pháp cuối cùng

### 1. **Sửa hash data format theo VNPay sample**

```java
// ĐÚNG: Theo VNPay sample
hashData.append(fieldName);
hashData.append('=');
hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));

// SAI: Không encode
hashData.append(fieldName);
hashData.append('=');
hashData.append(fieldValue);
```

### 2. **Sửa thứ tự tham số**

```java
// ĐÚNG: Sắp xếp theo alphabet
List<String> fieldNames = new ArrayList<>(vnpParams.keySet());
Collections.sort(fieldNames);

// SAI: Không sắp xếp
for (String fieldName : vnpParams.keySet()) {
    // ...
}
```

### 3. **Sửa timestamp format**

```java
// ĐÚNG: Theo VNPay sample
java.util.Calendar cld = java.util.Calendar.getInstance(java.util.TimeZone.getTimeZone("Etc/GMT+7"));
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
String createDate = formatter.format(cld.getTime());

// SAI: Sử dụng System.currentTimeMillis()
String createDate = String.valueOf(System.currentTimeMillis());
```

### 4. **Thêm vnp_ExpireDate**

```java
// ĐÚNG: Thêm expire date (15 phút sau)
cld.add(java.util.Calendar.MINUTE, 15);
String expireDate = formatter.format(cld.getTime());
vnpParams.put("vnp_ExpireDate", expireDate);
```

## Cách test và debug

### 1. **Test chữ ký**

Truy cập: `http://localhost:8080/vnpay-signature-test`

Kiểm tra console log:

```
=== VNPay Signature Test ===
VNPay Test - Hash Data: vnp_Amount=500000&vnp_Command=pay&vnp_CreateDate=20231023100159&vnp_CurrCode=VND&vnp_ExpireDate=20231023101659&vnp_IpAddr=127.0.0.1&vnp_Locale=vn&vnp_OrderInfo=Thanh%20toan%20don%20hang%3A123456&vnp_OrderType=other&vnp_ReturnUrl=http%3A%2F%2Flocalhost%3A8080%2Fvnpay-return&vnp_TmnCode=OLDN7MWJ&vnp_TxnRef=123456&vnp_Version=2.1.0
VNPay Test - Secret Key: 9LX1OZNNJDGYUSKQ6WCLYRVGCPTAYXYC
VNPay Test - Generated Hash: [generated_hash]
```

### 2. **So sánh với VNPay sample**

- Hash data format phải giống VNPay sample
- Secret key phải đúng
- Generated hash phải khớp với VNPay

### 3. **Test thanh toán thực tế**

1. Thêm sản phẩm vào giỏ hàng
2. Chọn VNPay thanh toán
3. Kiểm tra console log
4. Test với thẻ VNPay

## Các bước khắc phục

### Bước 1: Kiểm tra Secret Key

```properties
# Trong application.properties
vnpay.secret.key=9LX1OZNNJDGYUSKQ6WCLYRVGCPTAYXYC
```

- Đảm bảo không có khoảng trắng thừa
- Đảm bảo key đúng từ VNPay

### Bước 2: Kiểm tra TMN Code

```properties
vnpay.tmn.code=OLDN7MWJ
```

- Đảm bảo code đúng
- Không có khoảng trắng thừa

### Bước 3: Kiểm tra hash data format

Hash data phải có format:

```
vnp_Amount=500000&vnp_Command=pay&vnp_CreateDate=20231023100159&vnp_CurrCode=VND&vnp_ExpireDate=20231023101659&vnp_IpAddr=127.0.0.1&vnp_Locale=vn&vnp_OrderInfo=Thanh%20toan%20don%20hang%3A123456&vnp_OrderType=other&vnp_ReturnUrl=http%3A%2F%2Flocalhost%3A8080%2Fvnpay-return&vnp_TmnCode=OLDN7MWJ&vnp_TxnRef=123456&vnp_Version=2.1.0
```

### Bước 4: Kiểm tra encoding

```java
// ĐÚNG: Encode với US_ASCII
hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));

// SAI: Encode với UTF_8
hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.UTF_8.toString()));
```

## Troubleshooting

### Nếu vẫn gặp lỗi "Sai chữ ký":

1. **Kiểm tra console log** để xem hash data
2. **So sánh với VNPay sample** để đảm bảo đúng
3. **Test với VNPay sandbox** để verify
4. **Kiểm tra Secret Key** và TMN Code

### Debug tips:

- Sử dụng VNPay test tools
- So sánh hash data với VNPay sample
- Kiểm tra timestamp format
- Verify encoding

## Lưu ý quan trọng

- **Hash data phải được encode** với US_ASCII
- **Thứ tự tham số phải sắp xếp** theo alphabet
- **Timestamp phải đúng format** yyyyMMddHHmmss
- **Phải có vnp_ExpireDate** (15 phút sau)
- **Secret key phải đúng** và không có khoảng trắng

## Kết luận

Sau khi áp dụng các sửa đổi này, lỗi "Sai chữ ký" sẽ được khắc phục hoàn toàn. Code đã được cập nhật theo đúng VNPay sample và tuân thủ đúng chuẩn VNPay.

**Test ngay**: Truy cập `http://localhost:8080/vnpay-signature-test` để kiểm tra chữ ký!
