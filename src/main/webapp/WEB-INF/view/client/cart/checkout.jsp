<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!-- jstl core -->
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!-- form: -->
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="zxx">

            <head>
                <meta charset="UTF-8">
                <meta name="description" content="Male_Fashion Template">
                <meta name="keywords" content="Male_Fashion, unica, creative, html">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <meta http-equiv="X-UA-Compatible" content="ie=edge">
                <title>Male-Fashion | Template</title>

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
                                    <h4>Thanh Toán</h4>
                                    <div class="breadcrumb__links">
                                        <a href="./index.html">Home</a>
                                        <a href="./shop.html">Shop</a>
                                        <span>Check Out</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- Breadcrumb Section End -->

                <!-- Checkout Section Begin -->
                <section class="checkout spad">
                    <div class="container">
                        <div class="checkout__form">
                            <form action="#">
                                <div class="row">
                                    <form:form action="/place-order" method="post" modelAttribute="cart">
                                        <input type="hidden" name ="${_csrf.parameterName}" value="${_csrf.token}" />
                                        <div class="col-lg-7 col-md-6">
                                            <div class="checkout__input">
                                                <p>Tên người nhận<span>*</span></p>
                                                <input name="shipName" type="text" class="checkout__input__add">
                                            </div>
                                            <div class="checkout__input">
                                                <p>Địa chỉ nhận<span>*</span></p>
                                                <input name="shipAddress" type="text" class="checkout__input__add">
                                            </div>
                                            <%-- <div class="row"> --%>
                                                <%-- <div class="col-lg-6"> --%>
                                                    <div class="checkout__input">
                                                        <p>Số điện thoại<span>*</span></p>
                                                        <input name="shipPhone" type="number" class="checkout__input__add">
                                                    </div>
                                                <%-- </div> --%>
                                                <%-- <div class="col-lg-6">
                                                    <div class="checkout__input">
                                                        <p>Email<span>*</span></p>
                                                        <input type="text">
                                                    </div>
                                                </div> --%>
                                            <%-- </div> --%>
                                            <div class="checkout__input">
                                                <p>Ghi chú<span>*</span></p>
                                                <input type="text">
                                            </div>
                                        </div>
                                    </form:form>
                                    <div class="col-lg-5 col-md-6">
                                        <div class="checkout__order">
                                            <h4 class="order__title">Đơn Hàng</h4>
                                            <div class="checkout__order__products">Sản Phẩm <span>Đơn giá</span></div>
                                            <ul class="checkout__total__products">
                                                <li>Converse x CDG Chuck 70<span>1.000.000 VND</span></li>
                                                <li>Vintas Denim - Low Top<span>650.000 VND</span></li>

                                            </ul>
                                            <ul class="checkout__total__all">
                                                <li>Tạm tính <span>1.650.000 VND</span></li>
                                                <li>Tổng Cộng <span>1.650.000 VND</span></li>
                                            </ul>

                                            <div class="checkout__input__checkbox">
                                                <label for="cod">
                                                    Thanh toán khi nhận hàng (COD)
                                                    <input type="checkbox" id="cod" name="payment-method"
                                                        onclick="toggleCheckbox(this)">
                                                    <span class="checkmark"></span>
                                                </label>
                                            </div>
                                            <div class="checkout__input__checkbox">
                                                <label for="vnpay">
                                                    QR VNPAY
                                                    <input type="checkbox" id="vnpay" name="payment-method"
                                                        onclick="toggleCheckbox(this)">
                                                    <span class="checkmark"></span>
                                                </label>
                                            </div>

                                            <script>
                                                function toggleCheckbox(selectedCheckbox) {
                                                    const checkboxes = document.getElementsByName('payment-method');
                                                    checkboxes.forEach(checkbox => {
                                                        if (checkbox !== selectedCheckbox) {
                                                            checkbox.checked = false;
                                                        }
                                                    });
                                                }
                                            </script>
                                            <button type="submit" class="site-btn">Đặt hàng</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </section>
                <!-- Checkout Section End -->


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