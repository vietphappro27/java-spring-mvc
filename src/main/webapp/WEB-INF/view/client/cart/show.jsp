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
                                    <h4>Giỏ Hàng</h4>
                                    <div class="breadcrumb__links">
                                        <a href="/">Home</a>
                                        <a href="/">Shop</a>
                                        <span>Cart</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- Breadcrumb Section End -->

                <!-- Shopping Cart Section Begin -->
                <section class="shopping-cart spad">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-8">
                                <div class="shopping__cart__table">
                                    <!-- <table>
                                        <thead>
                                            <tr>
                                                <th>Sản Phẩm </th>
                                                <th>Số Lượng</th>
                                                <th>Thành Tiền</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td class="product__cart__item">
                                                    <div class="product__cart__item__pic">
                                                        <img src="/client/img/shopping-cart/cart-1.jpg" alt="">
                                                    </div>
                                                    <div class="product__cart__item__text">
                                                        <h6>T-shirt Contrast Pocket</h6>
                                                        <h5>$98.49</h5>
                                                    </div>
                                                </td>
                                                <td class="quantity__item">
                                                    <div class="quantity">
                                                        <div class="pro-qty-2">
                                                            <input type="text" value="1">
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="cart__price">$ 30.00</td>
                                                <td class="cart__close"><i class="fa fa-close"></i></td>
                                            </tr>
                                            <tr>
                                                <td class="product__cart__item">
                                                    <div class="product__cart__item__pic">
                                                        <img src="/client/img/shopping-cart/cart-2.jpg" alt="">
                                                    </div>
                                                    <div class="product__cart__item__text">
                                                        <h6>Diagonal Textured Cap</h6>
                                                        <h5>$98.49</h5>
                                                    </div>
                                                </td>
                                                <td class="quantity__item">
                                                    <div class="quantity">
                                                        <div class="pro-qty-2">
                                                            <input type="text" value="1">
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="cart__price">$ 32.50</td>
                                                <td class="cart__close"><i class="fa fa-close"></i></td>
                                            </tr>
                                            <tr>
                                                <td class="product__cart__item">
                                                    <div class="product__cart__item__pic">
                                                        <img src="/client/img/shopping-cart/cart-3.jpg" alt="">
                                                    </div>
                                                    <div class="product__cart__item__text">
                                                        <h6>Basic Flowing Scarf</h6>
                                                        <h5>$98.49</h5>
                                                    </div>
                                                </td>
                                                <td class="quantity__item">
                                                    <div class="quantity">
                                                        <div class="pro-qty-2">
                                                            <input type="text" value="1">
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="cart__price">$ 47.00</td>
                                                <td class="cart__close"><i class="fa fa-close"></i></td>
                                            </tr>
                                            <tr>
                                                <td class="product__cart__item">
                                                    <div class="product__cart__item__pic">
                                                        <img src="/client/img/shopping-cart/cart-4.jpg" alt="">
                                                    </div>
                                                    <div class="product__cart__item__text">
                                                        <h6>Basic Flowing Scarf</h6>
                                                        <h5>$98.49</h5>
                                                    </div>
                                                </td>
                                                <td class="quantity__item">
                                                    <div class="quantity">
                                                        <div class="pro-qty-2">
                                                            <input type="text" value="1">
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="cart__price">$ 30.00</td>
                                                <td class="cart__close"><i class="fa fa-close"></i></td>
                                            </tr>
                                        </tbody>
                                    </table> -->
                                    <table>
                                        <thead>
                                            <tr>
                                                <th>Sản Phẩm</th>
                                                <th>Size</th>
                                                <th>Số Lượng</th>
                                                <th>Thành Tiền</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td class="product__cart__item">
                                                    <div class="product__cart__item__pic">
                                                        <img src="/client/img/shopping-cart/cart1.jpg" alt="">
                                                    </div>
                                                    <div class="product__cart__item__text">
                                                        <h6>Converse x CDG Chuck 70</h6>
                                                        <h5>1.000.000 VND</h5>
                                                    </div>
                                                </td>
                                                <!-- <td class="cart__size"> L</td> -->
                                                <td class="cart__size">
                                                    <select class="form-control">
                                                        <option value="37">37</option>
                                                        <option value="38">38</option>
                                                        <option value="39">39</option>
                                                        <option value="40">40</option>
                                                        <option value="41">41</option>
                                                        <option value="42">42</option>
                                                        <option value="43">43</option>
                                                    </select>
                                                </td>

                                                <td class="quantity__item">
                                                    <div class="quantity">
                                                        <div class="pro-qty-2">
                                                            <input type="text" value="1">
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="cart__price">1.000.000 VND</td>
                                                <td class="cart__close"><i class="fa fa-close"></i></td>
                                            </tr>
                                            <tr>
                                                <td class="product__cart__item">
                                                    <div class="product__cart__item__pic">
                                                        <img src="/client/img/shopping-cart/cart2.jpg" alt="">
                                                    </div>
                                                    <div class="product__cart__item__text">
                                                        <h6>Vintas Denim - Low Top</h6>
                                                        <h5>650.000 VND</h5>
                                                    </div>
                                                </td>
                                                <td class="cart__size">
                                                    <select class="form-control">
                                                        <option value="37">37</option>
                                                        <option value="38">38</option>
                                                        <option value="39">39</option>
                                                        <option value="40">40</option>
                                                        <option value="41">41</option>
                                                        <option value="42">42</option>
                                                        <option value="43">43</option>
                                                    </select>
                                                </td>

                                                <td class="quantity__item">
                                                    <div class="quantity">
                                                        <div class="pro-qty-2">
                                                            <input type="text" value="1">
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="cart__price">650.000 VND</td>
                                                <td class="cart__close"><i class="fa fa-close"></i></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-6">
                                        <div class="continue__btn">
                                            <a href="/product">Tiếp tục mua sắm</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="cart__total">
                                    <h6>Đơn hàng</h6>
                                    <ul>
                                        <li>Tạm tính <span>1.650.000 VND</span></li>
                                        <li>Tổng cộng <span>1.650.000 VND</span></li>
                                    </ul>
                                    <a href="/cart/checkout" class="primary-btn">Thanh toán</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- Shopping Cart Section End -->

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