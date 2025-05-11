<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!-- jstl core -->
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!-- form: -->
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!-- Page Preloder -->
            <div id="preloder">
                <div class="loader"></div>
            </div>

            <!-- Offcanvas Menu Begin -->
            <!-- <div class="offcanvas-menu-overlay"></div>
            <div class="offcanvas-menu-wrapper">
                <div class="offcanvas__option">
                    <div class="offcanvas__links">
                        <a href="#">Sign in</a>
                        <a href="#">FAQs</a>
                    </div>
                    <div class="offcanvas__top__hover">
                        <span>Usd <i class="arrow_carrot-down"></i></span>
                        <ul>
                            <li>USD</li>
                            <li>EUR</li>
                            <li>USD</li>
                        </ul>
                    </div>
                </div>
                <div class="offcanvas__nav__option">
                    <a href="#" class="search-switch"><img src="/client/img/icon/search.png" alt=""></a>
                    <a href="#"><img src="/client/img/icon/heart.png" alt=""></a>
                    <a href="#"><img src="/client/img/icon/cart.png" alt=""> <span>0</span></a>
                    <div class="price">$0.00</div>
                </div>
                <div id="mobile-menu-wrap"></div>
                <div class="offcanvas__text">
                    <p>Free shipping, 30-day return or refund guarantee.</p>
                </div>
            </div> -->
            <!-- Offcanvas Menu End -->
            <header class="header">
                <div class="header__top">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-6 col-md-7">
                                <div class="header__top__left">
                                    <p>Miễn phí vận chuyển, bảo đảm hoàn trả hoặc hoàn tiền trong 30 ngày</p>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-5">
                                <div class="header__top__right">
                                    <div class="header__top__links">
                                        <a href="/login">Đăng nhập</a>
                                        <a href="#">FAQs</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-3 col-md-3">
                            <div class="header__logo">
                                <a href="/" class="logo-text">PShoes</a>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6">
                            <nav class="header__menu mobile-menu">
                                <ul>
                                    <li><a href="/">Trang Chủ</a></li>
                                    <li><a href="/product">Sản Phẩm</a></li>
                                    <li><a href="/product">Nam</a>
                                        <ul class="dropdown">
                                            <li><a href="/product">Nike</a></li>
                                            <li><a href="/product">Adidas</a></li>
                                            <li><a href="/product">Vans</a></li>
                                            <li><a href="/product">Converse</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="/product">Nữ</a>
                                        <ul class="dropdown">
                                            <li><a href="/product">Nike</a></li>
                                            <li><a href="/product">Adidas</a></li>
                                            <li><a href="/product">Vans</a></li>
                                            <li><a href="/product">Converse</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="/product">Phụ Kiện</a></li>
                                </ul>
                            </nav>
                        </div>
                        <div class="col-lg-3 col-md-3">
                            <div class="header__nav__option">
                                <a href="#" class="search-switch"><img src="/client/img/icon/search.png" alt=""></a>
                                <a href="#"><img src="/client/img/icon/heart.png" alt=""></a>
                                <a href="/cart"><img src="/client/img/icon/cart.png" alt=""> <span>0</span></a>
                                <!-- <div class="price">$0.00</div> -->
                            </div>
                        </div>
                    </div>
                    <div class="canvas__open"><i class="fa fa-bars"></i></div>
                </div>
            </header>