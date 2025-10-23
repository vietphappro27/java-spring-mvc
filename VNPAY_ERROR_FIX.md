# Khắc phục lỗi VNPay "Có lỗi xảy ra trong quá trình xử lý"

## Nguyên nhân có thể gây lỗi

### 1. **Lỗi định dạng timestamp**

- VNPay yêu cầu `vnp_CreateDate` theo định dạng `yyyyMMddHHmmss`
- Đã sửa: Sử dụng `SimpleDateFormat` thay vì `System.currentTimeMillis()`

### 2. **Lỗi HMAC SHA512**

- Secret key hoặc hash data không đúng
- Đã sửa: Cải tiến method `hmacSHA512` với debug chi tiết

### 3. **Lỗi encoding URL**

- Ký tự đặc biệt trong URL không được encode đúng
- Đã sửa: Sử dụng `URLEncoder.encode` với UTF-8

### 4. **Lỗi tham số thiếu hoặc sai**

- Thiếu tham số bắt buộc
- Đã sửa: Kiểm tra và validate tất cả tham số

## Các cải tiến đã thực hiện

### 1. **VNPayService.java**

```java
// Sửa timestamp format
java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
String createDate = sdf.format(new java.util.Date());

// Cải tiến HMAC với debug
private String hmacSHA512(String key, String data) {
    // Thêm debug log chi tiết
    System.out.println("VNPay Debug - HMAC Input: " + data);
    System.out.println("VNPay Debug - HMAC Key: " + key);
    System.out.println("VNPay Debug - HMAC Result: " + result);
}
```

### 2. **ItemController.java**

```java
// Thêm validation và debug
System.out.println("=== VNPay Payment Debug ===");
System.out.println("VNPay Debug - User ID: " + user.getId());
System.out.println("VNPay Debug - Total Price: " + totalPrice);
System.out.println("VNPay Debug - Amount String: " + amount);
```

### 3. **Error Handling**

- Thêm try-catch chi tiết
- Debug log cho từng bước
- Validation tham số đầu vào

## Cách kiểm tra và debug

### 1. **Kiểm tra Console Log**

Khi chọn thanh toán VNPay, kiểm tra console để thấy:

```
=== VNPay Payment Debug ===
VNPay Debug - User ID: [user_id]
VNPay Debug - Total Price: [total_price]
VNPay Debug - Amount String: [amount_string]
VNPay Debug - Order ID: [order_id]
VNPay Debug - IP Address: [ip_address]
VNPay Debug - Order Info: [order_info]
VNPay Debug - Amount in VND: [amount_vnd]
VNPay Debug - Amount in Cents: [amount_cents]
VNPay Debug - Create Date: [create_date]
VNPay Debug - Hash Data: [hash_data]
VNPay Debug - Secure Hash: [secure_hash]
VNPay Debug - Query URL: [query_url]
VNPay Debug - Payment URL: [payment_url]
```

### 2. **Test với trang debug**

Truy cập: `http://localhost:8080/vnpay-test`

- Xem thông tin cấu hình VNPay
- Kiểm tra các tham số

### 3. **Kiểm tra các tham số quan trọng**

- **TMN Code**: `OLDN7MWJ`
- **Secret Key**: `9LX1OZNNJDGYUSKQ6WCLYRVGCPTAYXYC`
- **Amount**: Phải >= 5,000 VNĐ
- **Create Date**: Định dạng `yyyyMMddHHmmss`
- **Hash**: Phải đúng với VNPay

## Các bước test

### 1. **Test cơ bản**

1. Thêm sản phẩm vào giỏ hàng (tổng >= 5,000 VNĐ)
2. Vào checkout, chọn VNPay
3. Kiểm tra console log
4. Kiểm tra URL được tạo

### 2. **Test với số tiền khác nhau**

- Test với 1,000 VNĐ (sẽ được điều chỉnh thành 5,000 VNĐ)
- Test với 10,000 VNĐ (bình thường)
- Test với 100,000 VNĐ (bình thường)

### 3. **Test với thẻ VNPay**

- Sử dụng thẻ test của VNPay sandbox
- Test thanh toán thành công
- Test thanh toán thất bại

## Troubleshooting

### Nếu vẫn gặp lỗi:

1. **Kiểm tra Secret Key**

   - Đảm bảo Secret Key đúng
   - Không có khoảng trắng thừa

2. **Kiểm tra TMN Code**

   - Đảm bảo TMN Code đúng
   - Không có khoảng trắng thừa

3. **Kiểm tra URL**

   - Return URL phải đúng: `http://localhost:8080/vnpay-return`
   - Không có lỗi encoding

4. **Kiểm tra Hash**
   - So sánh hash được tạo với VNPay
   - Kiểm tra thứ tự tham số

### Debug chi tiết:

1. Mở Developer Tools (F12)
2. Xem Network tab
3. Kiểm tra request đến VNPay
4. Xem response từ VNPay

## Lưu ý quan trọng

- **Sandbox**: Chỉ dùng cho test
- **Production**: Cần cấu hình thực tế
- **Bảo mật**: Không commit Secret Key
- **Test**: Luôn test kỹ trước khi deploy

## Liên hệ hỗ trợ

Nếu vẫn gặp lỗi:

- Email: hotrovnpay@vnpay.vn
- Hotline: 1900 55 55 77
- Kiểm tra log chi tiết trong console
