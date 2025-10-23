<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="VNPay Test">
    <meta name="keywords" content="VNPay, test">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>VNPay Test | P-Shoes</title>

    <!-- Google Font -->
    <link
        href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
        rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="/client/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/client/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="/client/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="/client/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="/client/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="/client/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/client/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="/client/css/style.css" type="text/css">
</head>

<body>
    <!-- Header Section Begin -->
    <jsp:include page="../layout/header.jsp" />
    <!-- Header Section End -->

    <!-- Test Section Begin -->
    <section class="checkout spad">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="checkout__form">
                        <h3 class="text-center mb-4">VNPay Test Configuration</h3>
                        
                        <div class="alert alert-info">
                            <h5>Thông tin cấu hình VNPay:</h5>
                            <ul>
                                <li><strong>URL:</strong> https://sandbox.vnpayment.vn/paymentv2/vpcpay.html</li>
                                <li><strong>Return URL:</strong> http://localhost:8080/vnpay-return</li>
                                <li><strong>TMN Code:</strong> OLDN7MWJ</li>
                                <li><strong>Version:</strong> 2.1.0</li>
                                <li><strong>Command:</strong> pay</li>
                                <li><strong>Currency:</strong> VND</li>
                                <li><strong>Locale:</strong> vn</li>
                            </ul>
                        </div>
                        
                        <div class="alert alert-warning">
                            <h5>Lưu ý quan trọng:</h5>
                            <ul>
                                <li>Đây là môi trường sandbox (test)</li>
                                <li>Số tiền tối thiểu: 5,000 VNĐ</li>
                                <li>Kiểm tra console log để debug</li>
                                <li>Test với thẻ test của VNPay</li>
                            </ul>
                        </div>
                        
                        <div class="text-center">
                            <a href="/checkout" class="site-btn">Test Thanh Toán VNPay</a>
                            <a href="/vnpay-signature-test" class="site-btn" style="background-color: #28a745;">Test Chữ Ký</a>
                            <a href="/vnpay-config-check" class="site-btn" style="background-color: #17a2b8;">Kiểm Tra Cấu Hình</a>
                            <a href="/" class="site-btn" style="background-color: #6c757d;">Về Trang Chủ</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Test Section End -->

    <!-- Footer Section Begin -->
    <jsp:include page="../layout/footer.jsp" />
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <script src="/client/js/jquery-3.3.1.min.js"></script>
    <script src="/client/js/bootstrap.min.js"></script>
    <script src="/client/js/jquery.nice-select.min.js"></script>
    <script src="/client/js/jquery.nicescroll.min.js"></script>
    <script src="/client/js/jquery.magnific-popup.min.js"></script>
    <script src="/client/js/jquery.countdown.min.js"></script>
    <script src="/client/js/jquery.slicknav.js"></script>
    <script src="/client/js/mixitup.min.js"></script>
    <script src="/client/js/owl.carousel.min.js"></script>
    <script src="/client/js/main.js"></script>
</body>

</html>
