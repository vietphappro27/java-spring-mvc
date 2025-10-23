# Hướng dẫn Debug VNPay

## Vấn đề đã được sửa

Lỗi "Số tiền giao dịch không hợp lệ" đã được khắc phục với các cải tiến sau:

### 1. Kiểm tra số tiền tối thiểu

- VNPay yêu cầu số tiền tối thiểu 5,000 VNĐ
- Hệ thống sẽ tự động điều chỉnh số tiền nếu < 5,000 VNĐ

### 2. Cải tiến tính toán số tiền

- Đảm bảo số tiền được tính đúng từ giỏ hàng
- Chuyển đổi từ VND sang xu (1 VND = 100 xu) cho VNPay

### 3. Debug Console

- Thêm các log debug để kiểm tra:
  - Tổng tiền trong giỏ hàng
  - Số tiền được gửi đến VNPay
  - URL thanh toán được tạo

## Cách kiểm tra

### 1. Kiểm tra Console Log

Khi chọn thanh toán VNPay, kiểm tra console để thấy:

```
VNPay Debug - Total Price: [số tiền]
VNPay Debug - Amount String: [số tiền string]
VNPay Debug - Amount in VND: [số tiền VND]
VNPay Debug - Amount in Cents: [số tiền xu]
VNPay Debug - Payment URL: [URL thanh toán]
```

### 2. Kiểm tra số tiền trong giỏ hàng

- Đảm bảo giỏ hàng có sản phẩm với tổng tiền >= 5,000 VNĐ
- Nếu < 5,000 VNĐ, hệ thống sẽ tự động điều chỉnh

### 3. Test với số tiền khác nhau

- Test với giỏ hàng 1,000 VNĐ (sẽ được điều chỉnh thành 5,000 VNĐ)
- Test với giỏ hàng 10,000 VNĐ (bình thường)
- Test với giỏ hàng 100,000 VNĐ (bình thường)

## Các cải tiến đã thêm

### 1. Giao diện cảnh báo

- Hiển thị cảnh báo khi số tiền < 5,000 VNĐ
- JavaScript cảnh báo khi chọn VNPay với số tiền nhỏ

### 2. Xử lý lỗi tốt hơn

- Tự động điều chỉnh số tiền tối thiểu
- Debug log chi tiết
- Xử lý exception tốt hơn

### 3. Validation

- Kiểm tra số tiền trước khi gửi đến VNPay
- Cảnh báo người dùng về số tiền tối thiểu

## Các bước test

1. **Thêm sản phẩm vào giỏ hàng** với tổng tiền >= 5,000 VNĐ
2. **Vào trang checkout** và chọn "Thanh toán qua VNPay"
3. **Kiểm tra console log** để thấy debug info
4. **Kiểm tra URL** được tạo có đúng không
5. **Test thanh toán** với VNPay sandbox

## Troubleshooting

### Nếu vẫn gặp lỗi số tiền:

1. Kiểm tra console log để xem số tiền thực tế
2. Đảm bảo giỏ hàng có sản phẩm
3. Kiểm tra cấu hình VNPay trong application.properties
4. Test với số tiền lớn hơn (10,000+ VNĐ)

### Nếu gặp lỗi khác:

1. Kiểm tra TMN Code và Secret Key
2. Kiểm tra return URL
3. Kiểm tra network connection
4. Xem log chi tiết trong console

## Lưu ý quan trọng

- **Sandbox**: Chỉ dùng cho test, không dùng tiền thật
- **Production**: Cần cấu hình URL và thông tin thực tế
- **Bảo mật**: Không commit Secret Key vào git
- **Test**: Luôn test kỹ trước khi deploy production
