# Khắc phục lỗi "Sai chữ ký" VNPay

## Nguyên nhân lỗi "Sai chữ ký"

Lỗi này xảy ra khi chữ ký HMAC SHA512 được tạo không đúng với yêu cầu của VNPay. Có thể do:

1. **Thứ tự tham số sai** - VNPay yêu cầu sắp xếp theo alphabet
2. **Cách tạo hash data sai** - Không đúng format
3. **Secret key sai** - Key không đúng hoặc bị lỗi
4. **Encoding sai** - Ký tự đặc biệt không được xử lý đúng

## Các bước khắc phục

### 1. **Kiểm tra Secret Key**

```properties
# Trong application.properties
vnpay.secret.key=9LX1OZNNJDGYUSKQ6WCLYRVGCPTAYXYC
```

- Đảm bảo không có khoảng trắng thừa
- Đảm bảo key đúng từ VNPay sandbox

### 2. **Kiểm tra thứ tự tham số**

VNPay yêu cầu sắp xếp theo alphabet:

```
vnp_Amount
vnp_Command
vnp_CreateDate
vnp_CurrCode
vnp_IpAddr
vnp_Locale
vnp_OrderInfo
vnp_OrderType
vnp_ReturnUrl
vnp_TmnCode
vnp_TxnRef
vnp_Version
```

### 3. **Kiểm tra format hash data**

Hash data phải có format:

```
vnp_Amount=500000&vnp_Command=pay&vnp_CreateDate=20231023100159&vnp_CurrCode=VND&vnp_IpAddr=127.0.0.1&vnp_Locale=vn&vnp_OrderInfo=Test order&vnp_OrderType=other&vnp_ReturnUrl=http://localhost:8080/vnpay-return&vnp_TmnCode=OLDN7MWJ&vnp_TxnRef=123456&vnp_Version=2.1.0
```

### 4. **Test chữ ký**

Truy cập: `http://localhost:8080/vnpay-signature-test`

- Kiểm tra console log
- So sánh với VNPay documentation

## Debug chi tiết

### 1. **Kiểm tra console log**

Khi chọn thanh toán VNPay, kiểm tra:

```
VNPay Debug - Parameters:
  vnp_Amount = 500000
  vnp_Command = pay
  vnp_CreateDate = 20231023100159
  vnp_CurrCode = VND
  vnp_IpAddr = 127.0.0.1
  vnp_Locale = vn
  vnp_OrderInfo = Thanh toan don hang 1698060119123
  vnp_OrderType = other
  vnp_ReturnUrl = http://localhost:8080/vnpay-return
  vnp_TmnCode = OLDN7MWJ
  vnp_TxnRef = 1698060119123
  vnp_Version = 2.1.0

VNPay Debug - Hash Data: vnp_Amount=500000&vnp_Command=pay&vnp_CreateDate=20231023100159&vnp_CurrCode=VND&vnp_IpAddr=127.0.0.1&vnp_Locale=vn&vnp_OrderInfo=Thanh toan don hang 1698060119123&vnp_OrderType=other&vnp_ReturnUrl=http://localhost:8080/vnpay-return&vnp_TmnCode=OLDN7MWJ&vnp_TxnRef=1698060119123&vnp_Version=2.1.0
VNPay Debug - HMAC Input: [hash_data]
VNPay Debug - HMAC Key: 9LX1OZNNJDGYUSKQ6WCLYRVGCPTAYXYC
VNPay Debug - HMAC Result: [secure_hash]
```

### 2. **So sánh với VNPay test**

Sử dụng VNPay test tools để so sánh:

- Hash data format
- Secret key
- Kết quả HMAC

### 3. **Kiểm tra từng tham số**

- **vnp_Amount**: Phải là số xu (VND \* 100)
- **vnp_CreateDate**: Format yyyyMMddHHmmss
- **vnp_TxnRef**: Unique transaction reference
- **vnp_ReturnUrl**: URL chính xác

## Các lỗi thường gặp

### 1. **Lỗi thứ tự tham số**

```java
// SAI: Không sắp xếp
Map<String, String> params = new HashMap<>();
params.put("vnp_Command", "pay");
params.put("vnp_Amount", "500000");

// ĐÚNG: Sắp xếp theo alphabet
List<String> fieldNames = new ArrayList<>(params.keySet());
Collections.sort(fieldNames);
```

### 2. **Lỗi encoding**

```java
// SAI: Không encode
query.append(fieldName + "=" + fieldValue);

// ĐÚNG: Encode cho URL
query.append(URLEncoder.encode(fieldName, StandardCharsets.UTF_8));
query.append("=");
query.append(URLEncoder.encode(fieldValue, StandardCharsets.UTF_8));
```

### 3. **Lỗi hash data**

```java
// SAI: Encode cho hash data
hashData.append(URLEncoder.encode(fieldName, StandardCharsets.UTF_8));

// ĐÚNG: Không encode cho hash data
hashData.append(fieldName);
hashData.append("=");
hashData.append(fieldValue);
```

## Test và verify

### 1. **Test với VNPay sandbox**

1. Truy cập: `http://localhost:8080/vnpay-test`
2. Click "Test Chữ Ký"
3. Kiểm tra console log
4. So sánh với VNPay documentation

### 2. **Test thanh toán thực tế**

1. Thêm sản phẩm vào giỏ hàng
2. Chọn VNPay thanh toán
3. Kiểm tra console log
4. Test với thẻ VNPay

### 3. **Verify với VNPay**

- Sử dụng VNPay test tools
- So sánh hash data
- Kiểm tra secret key

## Troubleshooting

### Nếu vẫn gặp lỗi "Sai chữ ký":

1. **Kiểm tra Secret Key**

   - Đảm bảo key đúng từ VNPay
   - Không có khoảng trắng thừa
   - Không có ký tự đặc biệt

2. **Kiểm tra thứ tự tham số**

   - Sắp xếp theo alphabet
   - Không thiếu tham số bắt buộc

3. **Kiểm tra format**

   - Hash data format đúng
   - Không encode cho hash data
   - Encode cho URL

4. **Kiểm tra timestamp**
   - Format yyyyMMddHHmmss
   - Không có ký tự đặc biệt

## Liên hệ hỗ trợ

Nếu vẫn gặp lỗi:

- Email: hotrovnpay@vnpay.vn
- Hotline: 1900 55 55 77
- VNPay Documentation: https://sandbox.vnpayment.vn/apis/docs/
