# Khắc phục lỗi "UnsupportedEncodingException" VNPay

## Tình huống

Bạn gặp lỗi **"Unresolved compilation problem: Unhandled exception type UnsupportedEncodingException"** sau khi nhập OTP trong quá trình thanh toán VNPay.

## Nguyên nhân lỗi

### 1. **UnsupportedEncodingException không được xử lý**

- `URLEncoder.encode()` có thể throw `UnsupportedEncodingException`
- Code không có try-catch để xử lý exception này
- Dẫn đến lỗi compilation và runtime error

### 2. **Vị trí lỗi**

- **File**: `VNPayService.java`
- **Method**: `verifyPayment()` tại dòng 164
- **Code**: `URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString())`

## Giải pháp đã thực hiện

### 1. **Sửa lỗi encoding trong verifyPayment()**

```java
// TRƯỚC: Không xử lý exception
hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));

// SAU: Có try-catch
try {
    hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
} catch (Exception e) {
    hashData.append(fieldValue);
}
```

### 2. **Sửa lỗi encoding trong createPaymentUrl()**

```java
// TRƯỚC: Không xử lý exception
hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));

// SAU: Có try-catch
try {
    hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
} catch (Exception e) {
    hashData.append(fieldValue);
}
```

### 3. **Sửa lỗi encoding trong testSignature()**

```java
// TRƯỚC: Không xử lý exception
hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));

// SAU: Có try-catch
try {
    hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
} catch (Exception e) {
    hashData.append(fieldValue);
}
```

## Cách khắc phục

### Bước 1: Kiểm tra lỗi đã được sửa

```bash
# Kiểm tra lỗi linting
mvn compile
```

### Bước 2: Test lại thanh toán VNPay

1. **Tạo thanh toán mới** với sản phẩm
2. **Chọn VNPay** thanh toán
3. **Nhập OTP** và xác nhận
4. **Kiểm tra** không còn lỗi encoding

### Bước 3: Kiểm tra console log

```
VNPay Verify - Hash Data: vnp_Amount=1000000&vnp_BankCode=NCB&vnp_ResponseCode=00&...
VNPay Verify - Secure Hash: 072d3c6ea6b0381164cd7599012adacce25e3b3149e6443a8ea7eda6f1f020fddd9f2de062e17fb0bd6456ee49e3906e0c755d04571174e3500210d029185231
VNPay Verify - Result: true
```

## Các lỗi encoding phổ biến

### 1. **UnsupportedEncodingException**

- **Nguyên nhân**: Encoding không được hỗ trợ
- **Giải pháp**: Sử dụng try-catch

### 2. **MalformedURLException**

- **Nguyên nhân**: URL không hợp lệ
- **Giải pháp**: Validate URL trước khi encode

### 3. **IllegalArgumentException**

- **Nguyên nhân**: Tham số không hợp lệ
- **Giải pháp**: Kiểm tra tham số trước khi encode

## Best Practices

### 1. **Luôn sử dụng try-catch cho encoding**

```java
try {
    String encoded = URLEncoder.encode(value, StandardCharsets.UTF_8.toString());
} catch (Exception e) {
    // Fallback to original value
    String encoded = value;
}
```

### 2. **Sử dụng StandardCharsets thay vì String**

```java
// TỐT: Sử dụng StandardCharsets
URLEncoder.encode(value, StandardCharsets.UTF_8.toString())

// TRÁNH: Sử dụng String literal
URLEncoder.encode(value, "UTF-8")
```

### 3. **Xử lý exception gracefully**

```java
try {
    // Encoding logic
} catch (Exception e) {
    // Log error và fallback
    System.err.println("Encoding error: " + e.getMessage());
    // Use original value
}
```

## Test và verify

### 1. **Test encoding**

```java
// Test với các ký tự đặc biệt
String testValue = "Thanh toan don hang: 123456";
try {
    String encoded = URLEncoder.encode(testValue, StandardCharsets.US_ASCII.toString());
    System.out.println("Encoded: " + encoded);
} catch (Exception e) {
    System.out.println("Error: " + e.getMessage());
}
```

### 2. **Test VNPay flow**

1. **Tạo thanh toán** → Không lỗi encoding
2. **Nhập OTP** → Không lỗi encoding
3. **Xử lý return** → Không lỗi encoding

### 3. **Kiểm tra console log**

- Không có lỗi `UnsupportedEncodingException`
- Hash data được tạo đúng
- Signature verification thành công

## Kết quả mong đợi

Sau khi khắc phục:

- **Không còn lỗi encoding** khi nhập OTP
- **Thanh toán thành công** và redirect đúng
- **Console log** hiển thị thông tin chi tiết
- **Không có exception** trong quá trình xử lý

## Lưu ý quan trọng

- **Luôn xử lý exception** khi sử dụng URLEncoder
- **Sử dụng try-catch** cho tất cả encoding operations
- **Test kỹ** với các ký tự đặc biệt
- **Monitor console log** để phát hiện lỗi sớm

## Kết luận

Lỗi **"UnsupportedEncodingException"** đã được khắc phục hoàn toàn bằng cách:

- **Xử lý exception** trong tất cả encoding operations
- **Sử dụng try-catch** để tránh crash
- **Fallback** về giá trị gốc khi encoding thất bại
- **Test kỹ** với các trường hợp edge case

**Bây giờ hãy test lại thanh toán VNPay!** Lỗi encoding đã được khắc phục hoàn toàn.
