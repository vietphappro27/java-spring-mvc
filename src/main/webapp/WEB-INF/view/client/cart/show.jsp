<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!-- jstl core -->
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!-- form: -->
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                                            <c:forEach items="${cartDetails}" var="cartDetail">
                                                <tr>
                                                    <td class="product__cart__item">
                                                        <div class="product__cart__item__pic">
                                                            <img src="/images/product/${cartDetail.product.image}" alt="">
                                                        </div>
                                                        <div class="product__cart__item__text">
                                                            <%-- <h6>Converse x CDG Chuck 70</h6>
                                                            <h5>1.000.000 VND</h5> --%>
                                                            <a href="/product/${cartDetail.product.id}">
                                                                <h6>${cartDetail.product.name}</h6>
                                                            </a>
                                                            <h5>
                                                                <fmt:formatNumber value="${cartDetail.product.price}" type="number" groupingUsed="true"/> VNĐ
                                                            </h5>
                                                        </div>
                                                    </td>
                                                    <td class="cart__size">
                                                        <select class="form-control">
                                                            <c:forEach items="${cartDetail.product.productItems}" var="item">
                                                                <option value="${item.size.id}">${item.size.sizeValue}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </td>

                                                    <td class="quantity__item">
                                                        <div class="quantity">
                                                            <div class="pro-qty-2">
                                                                <input type="text"
                                                                value="${cartDetail.quantity}"
                                                                data-cart-detail-id="${cartDetail.id}"
                                                                data-cart-detail-price="${cartDetail.price}">
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td class="cart__price" data-cart-detail-id="${cartDetail.id}">
                                                        <fmt:formatNumber value="${cartDetail.price * cartDetail.quantity}" type="number" groupingUsed="true"/> VNĐ</td>
                                                    <td class="cart__close"><i class="fa fa-close"></i></td>
                                                </tr>
                                            </c:forEach>
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
                                        <%-- <li>Tạm tính <span>1.650.000 VND</span></li> --%>
                                        <li>Tạm tính
                                            <span data-cart-total-price="${totalPrice}">
                                                <fmt:formatNumber value="${totalPrice}" type="number" groupingUsed="true"/> VNĐ
                                            </span>
                                        </li>
                                        <li>Tổng cộng
                                            <span data-cart-total-price="${totalPrice}">
                                                <fmt:formatNumber value="${totalPrice}" type="number" groupingUsed="true"/> VNĐ
                                            </span>
                                        </li>
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
                <%-- <script>
                    // Xử lý thay đổi size
                    $(document).ready(function() {
                        $('.cart__size select').on('change', function() {
                            const sizeId = $(this).val();
                            const productId = $(this).closest('tr').find('.product__cart__item__text a').attr('href').split('/').pop();
                            const cartDetailId = $(this).closest('tr').find('.cart__price').data('cart-detail-id');
                            
                            // Hiển thị thông báo
                            alert('Đã chọn size ' + $(this).find('option:selected').text() + ' cho sản phẩm ' + productId);
                            
                            // Có thể gửi AJAX request để cập nhật size trong giỏ hàng
                            // $.post('/update-cart-size', { cartDetailId: cartDetailId, sizeId: sizeId });
                        });
                    });
                </script> --%>
            </body>

            </html>