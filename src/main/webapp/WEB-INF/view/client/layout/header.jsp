<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!-- jstl core -->
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!-- form: -->
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!-- Page Preloder -->
            <div id="preloder">
                <div class="loader"></div>
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
                                <li><a href="/product?category=Nam">Nam</a>
                                    <ul class="dropdown">
                                        <li><a href="/product?category=Nam&brand=Ananas">Ananas</a></li>
                                        <li><a href="/product?category=Nam&brand=Adidas">Adidas</a></li>
                                        <li><a href="/product?category=Nam&brand=Vans">Vans</a></li>
                                        <li><a href="/product?category=Nam&brand=Converse">Converse</a></li>
                                    </ul>
                                </li>
                                <li><a href="/product?category=Nữ">Nữ</a>
                                    <ul class="dropdown">
                                        <li><a href="/product?category=Nữ&brand=Nike">Nike</a></li>
                                        <li><a href="/product?category=Nữ&brand=Adidas">Adidas</a></li>
                                        <li><a href="/product?category=Nữ&brand=Vans">Vans</a></li>
                                        <li><a href="/product?category=Nữ&brand=Converse">Converse</a></li>
                                    </ul>
                                </li>
                                <li><a href="/product?category=Phụ Kiện">Phụ Kiện</a></li>
                            </ul>
                        </nav>
                    </div>
                    <div class="col-lg-3 col-md-3">
                        <div class="header__nav__option">
                            <c:if test="${not empty pageContext.request.userPrincipal}">
                                <%-- icon cart --%>
                                    <a href="/cart" class="cart-icon-container"><img src="/client/img/icon/cart.png"
                                            alt=""><span>${sessionScope.sum}</span></a>
                                    <%-- icon user --%>
                                        <div class="user-dropdown">
                                            <a href="#" class="user-icon-link"><img src="/client/img/icon/user.png"
                                                    alt=""></a>
                                            <div class="user-dropdown-content">
                                                <div class="user-info">
                                                    <img src="/images/avatar/${sessionScope.avatar}" alt="User Avatar"
                                                        class="user-avatar">
                                                    <div class="user-name">
                                                        <c:out value="${sessionScope.fullName}" />
                                                    </div>
                                                </div>
                                                <a href="/account" class="dropdown-item">Quản lý tài khoản</a>
                                                <a href="/order_history" class="dropdown-item">Lịch sử mua hàng</a>
                                                <div class="dropdown-divider"></div>
                                                <form:form action="/logout" method="POST">
                                                    <input type="hidden" name="${_csrf.parameterName}"
                                                        value="${_csrf.token}" />
                                                    <button type="submit" class="dropdown-item">Đăng xuất</button>
                                                </form:form>
                                            </div>
                                        </div>
                            </c:if>
                            <c:if test="${empty pageContext.request.userPrincipal}">
                                <a href="/login">Đăng nhập</a>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
            </header>