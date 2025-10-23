# Hướng dẫn tích hợp VNPay

## 1. Cấu hình VNPay

### Bước 1: Đăng ký tài khoản VNPay

1. Truy cập https://sandbox.vnpayment.vn/
2. Đăng ký tài khoản merchant
3. Lấy thông tin:
   - TMN Code (Terminal Code)
   - Secret Key

### Bước 2: Cập nhật cấu hình

Mở file `src/main/resources/application.properties` và cập nhật:

```properties
# VNPay Configuration
vnpay.url=https://sandbox.vnpayment.vn/paymentv2/vpcpay.html
vnpay.return.url=http://localhost:8080/vnpay-return
vnpay.tmn.code=YOUR_TMN_CODE_HERE
vnpay.secret.key=YOUR_SECRET_KEY_HERE
vnpay.version=2.1.0
vnpay.command=pay
vnpay.curr.code=VND
vnpay.locale=vn
```

**Lưu ý:**

- Thay `YOUR_TMN_CODE_HERE` bằng TMN Code thực tế
- Thay `YOUR_SECRET_KEY_HERE` bằng Secret Key thực tế
- Đối với production, thay đổi `vnpay.url` thành URL production của VNPay

## 2. Cấu trúc tích hợp

### Các file đã được thêm/cập nhật:

1. **VNPayService.java** - Service xử lý logic VNPay
2. **ItemController.java** - Controller xử lý thanh toán
3. **Order.java** - Thêm trường `paymentMethod`
4. **checkout.jsp** - Giao diện chọn phương thức thanh toán
5. **success.jsp** - Trang thành công
6. **error.jsp** - Trang lỗi thanh toán

### Flow thanh toán:

1. **COD (Cash on Delivery):**

   - User chọn "Thanh toán khi nhận hàng"
   - Order được tạo với status "PENDING"
   - Redirect đến trang success

2. **VNPay:**
   - User chọn "Thanh toán qua VNPay"
   - Order được tạo với status "PENDING"
   - Redirect đến VNPay gateway
   - Sau khi thanh toán, VNPay redirect về `/vnpay-return`
   - Hệ thống xác thực và cập nhật order status

## 3. Testing

### Test với VNPay Sandbox:

1. Sử dụng thẻ test của VNPay
2. Kiểm tra log để debug
3. Test các trường hợp:
   - Thanh toán thành công
   - Thanh toán thất bại
   - Hủy thanh toán

### Test với COD:

1. Chọn "Thanh toán khi nhận hàng"
2. Kiểm tra order được tạo với status "PENDING"

## 4. Production Deployment

### Cấu hình Production:

1. Thay đổi URL VNPay thành production URL
2. Cập nhật return URL thành domain thực tế
3. Sử dụng TMN Code và Secret Key production
4. Test kỹ trước khi deploy

### Bảo mật:

1. Không commit Secret Key vào git
2. Sử dụng environment variables
3. Mã hóa thông tin nhạy cảm

## 5. Troubleshooting

### Lỗi thường gặp:

1. **Lỗi xác thực VNPay:** Kiểm tra Secret Key
2. **Lỗi redirect:** Kiểm tra return URL
3. **Lỗi encoding:** Kiểm tra UTF-8 encoding

### Debug:

1. Kiểm tra log trong console
2. Sử dụng VNPay test tools
3. Kiểm tra network requests

## 6. Tài liệu tham khảo

- [VNPay API Documentation](https://sandbox.vnpayment.vn/apis/)
- [VNPay Integration Guide](https://sandbox.vnpayment.vn/apis/docs/)
- [VNPay Test Cards](https://sandbox.vnpayment.vn/apis/docs/huong-dan-tich-hop/)
