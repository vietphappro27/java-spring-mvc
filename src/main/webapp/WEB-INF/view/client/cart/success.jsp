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

                        <section class="success-container">
                            <div class="container">
                                <div class="success-icon">
                                    <i class="fa fa-check-circle"></i>
                                </div>
                                <h2 class="success-title">Đặt hàng thành công!</h2>
                                <p class="success-message">
                                    Cảm ơn bạn đã mua sắm tại PShoes. Đơn hàng của bạn đã được xác nhận và đang được xử
                                    lý.
                                </p>

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

                                <div class="action-buttons">
                                    <a href="/" class="site-btn">Tiếp tục mua hàng</a>
                                    <a href="/order_history" class="site-btn">Xem đơn hàng của tôi</a>
                                </div>
                            </div>
                        </section>

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