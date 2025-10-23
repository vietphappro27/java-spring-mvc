<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Male_Fashion Template">
    <meta name="keywords" content="Male_Fashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Thanh toán thất bại | P-Shoes</title>

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

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>Thanh toán thất bại</h4>
                        <div class="breadcrumb__links">
                            <a href="./index.html">Home</a>
                            <a href="./shop.html">Shop</a>
                            <span>Thanh toán thất bại</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Error Section Begin -->
    <section class="checkout spad">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="checkout__form">
                        <div class="text-center">
                            <div class="mb-4">
                                <i class="fa fa-times-circle" style="font-size: 80px; color: #dc3545;"></i>
                            </div>
                            <h2 class="mb-3" style="color: #dc3545;">Thanh toán thất bại!</h2>
                            <p class="mb-4">Rất tiếc, quá trình thanh toán của bạn đã gặp lỗi. Vui lòng thử lại sau.</p>
                            
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <a href="/checkout" class="site-btn" style="width: 100%;">
                                        <i class="fa fa-arrow-left"></i> Thử lại thanh toán
                                    </a>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <a href="/cart" class="site-btn" style="width: 100%; background-color: #6c757d;">
                                        <i class="fa fa-shopping-cart"></i> Xem giỏ hàng
                                    </a>
                                </div>
                            </div>
                            
                            <div class="mt-4">
                                <a href="/" class="btn btn-link">
                                    <i class="fa fa-home"></i> Về trang chủ
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Error Section End -->

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