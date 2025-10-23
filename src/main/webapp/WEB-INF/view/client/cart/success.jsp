<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!-- jstl core -->
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!-- form: -->
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%-- format number --%>
                <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                    <!DOCTYPE html>
                    <html lang="zxx">

                    <head>
                        <meta charset="UTF-8">
                        <meta name="description" content="Male_Fashion Template">
                        <meta name="keywords" content="Male_Fashion, unica, creative, html">
                        <meta name="viewport" content="width=device-width, initial-scale=1.0">
                        <meta http-equiv="X-UA-Compatible" content="ie=edge">
                        <title>Đặt hàng thành công</title>

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
                        <style>

                        </style>
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
                                            <h4>Đặt hàng thành công</h4>
                                            <div class="breadcrumb__links">
                                                <a href="./index.html">Home</a>
                                                <a href="./shop.html">Shop</a>
                                                <span>Đặt hàng thành công</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <!-- Breadcrumb Section End -->

                        <!-- Success Section Begin -->
                        <section class="checkout spad">
                            <div class="container">
                                <div class="row justify-content-center">
                                    <div class="col-lg-8">
                                        <div class="checkout__form">
                                            <div class="text-center">
                                                <div class="mb-4">
                                                    <i class="fa fa-check-circle" style="font-size: 80px; color: #28a745;"></i>
                                                </div>
                                                <h2 class="mb-3" style="color: #28a745;">Đặt hàng thành công!</h2>
                                                <p class="mb-4">
                                                    <c:choose>
                                                        <c:when test="${not empty message}">
                                                            ${message}
                                                        </c:when>
                                                        <c:otherwise>
                                                            Cảm ơn bạn đã mua sắm tại P-Shoes. Đơn hàng của bạn đã được xác nhận và đang được xử lý.
                                                        </c:otherwise>
                                                    </c:choose>
                                                </p>
                                                
                                                <c:if test="${not empty amount}">
                                                    <div class="alert alert-success">
                                                        <h5>Thông tin thanh toán:</h5>
                                                        <p><strong>Số tiền:</strong> <fmt:formatNumber value="${amount}" type="number" groupingUsed="true" /> VNĐ</p>
                                                        <c:if test="${not empty orderInfo}">
                                                            <p><strong>Mô tả:</strong> ${orderInfo}</p>
                                                        </c:if>
                                                        <c:if test="${not empty txnRef}">
                                                            <p><strong>Mã giao dịch:</strong> ${txnRef}</p>
                                                        </c:if>
                                                    </div>
                                                </c:if>

                                <%-- <div class="order-details">
                                    <h4 style="margin-bottom: 20px">Chi tiết đơn hàng #${cart.id}</h4>

                                    <div class="row" style="margin-bottom: 10px">
                                        <div class="col-md-6">
                                            <strong>Người nhận:</strong> ${cart.shipName}
                                        </div>
                                        <div class="col-md-6">
                                            <strong>Điện thoại:</strong> ${cart.shipPhone}
                                        </div>
                                    </div>

                                    <div style="margin-bottom: 20px">
                                        <strong>Địa chỉ giao hàng:</strong> ${cart.shipAddress}
                                    </div>

                                    <div style="margin-bottom: 20px">
                                        <strong>Phương thức thanh toán:</strong>
                                        <c:choose>
                                            <c:when test="${cart.paymentMethod == 'COD'}">Thanh toán khi nhận hàng
                                            </c:when>
                                            <c:when test="${cart.paymentMethod == 'VNPAY'}">Thanh toán VNPAY</c:when>
                                            <c:otherwise>Chưa thanh toán</c:otherwise>
                                        </c:choose>
                                    </div>

                                    <div style="margin-bottom: 15px">
                                        <strong>Tổng thanh toán:</strong>
                                        <span style="font-size: 18px; color: #e53637; font-weight: bold">
                                            <fmt:formatNumber value="${cart.totalPrice}" type="number"
                                                groupingUsed="true" /> VNĐ
                                        </span>
                                    </div>
                                </div> --%>

                                                <div class="row">
                                                    <div class="col-md-6 mb-3">
                                                        <a href="/" class="site-btn" style="width: 100%;">
                                                            <i class="fa fa-home"></i> Tiếp tục mua hàng
                                                        </a>
                                                    </div>
                                                    <div class="col-md-6 mb-3">
                                                        <a href="/order_history" class="site-btn" style="width: 100%; background-color: #6c757d;">
                                                            <i class="fa fa-list"></i> Xem đơn hàng của tôi
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <!-- Success Section End -->

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