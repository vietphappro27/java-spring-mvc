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
                                    <h4>Shop</h4>
                                    <div class="breadcrumb__links">
                                        <a href="./index.html">Home</a>
                                        <span>Shop</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- Breadcrumb Section End -->

                <!-- Shop Section Begin -->
                <section class="shop spad">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-3">
                                <div class="shop__sidebar">
                                    <div class="shop__sidebar__search">
                                        <form action="#">
                                            <input type="text" placeholder="Tìm kiếm...">
                                            <button type="submit"><span class="icon_search"></span></button>
                                        </form>
                                    </div>
                                    <div class="shop__sidebar__accordion">
                                        <div class="accordion" id="accordionExample">
                                            <div class="card">
                                                <div class="card-heading">
                                                    <a data-toggle="collapse" data-target="#collapseOne">Danh mục</a>
                                                </div>
                                                <div id="collapseOne" class="collapse show"
                                                    data-parent="#accordionExample">
                                                    <div class="card-body">
                                                        <div class="shop__sidebar__categories">
                                                            <ul class="nice-scroll">
                                                                <li><a href="#">Nam (20)</a></li>
                                                                <li><a href="#">Nữ (20)</a></li>
                                                                <li><a href="#">Phụ kiện (20)</a></li>
                                                                <li><a href="#">Giảm giá (20)</a></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="card">
                                                <div class="card-heading">
                                                    <a data-toggle="collapse" data-target="#collapseTwo">Thương hiệu</a>
                                                </div>
                                                <div id="collapseTwo" class="collapse show"
                                                    data-parent="#accordionExample">
                                                    <div class="card-body">
                                                        <div class="shop__sidebar__brand">
                                                            <ul>
                                                                <li><a href="#">Nike</a></li>
                                                                <li><a href="#">Adidas</a></li>
                                                                <li><a href="#">Vans</a></li>
                                                                <li><a href="#">Converse</a></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="card">
                                                <div class="card-heading">
                                                    <a data-toggle="collapse" data-target="#collapseThree">Giá</a>
                                                </div>
                                                <div id="collapseThree" class="collapse show"
                                                    data-parent="#accordionExample">
                                                    <div class="card-body">
                                                        <div class="shop__sidebar__price">
                                                            <ul>
                                                                <li><a href="#">&gt;800k</a></li>
                                                                <li><a href="#">500k - 800k</a></li>
                                                                <li><a href="#">200k - 500k</a></li>
                                                                <li><a href="#">&#60; 200k</a></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="card">
                                                <div class="card-heading">
                                                    <a data-toggle="collapse" data-target="#collapseFour">Size</a>
                                                </div>
                                                <div id="collapseFour" class="collapse show"
                                                    data-parent="#accordionExample">
                                                    <div class="card-body">
                                                        <div class="shop__sidebar__size">
                                                            <label for="36">36
                                                                <input type="radio" id="36">
                                                            </label>
                                                            <label for="37">37
                                                                <input type="radio" id="37">
                                                            </label>
                                                            <label for="38">38
                                                                <input type="radio" id="38">
                                                            </label>
                                                            <label for="39">39
                                                                <input type="radio" id="39">
                                                            </label>
                                                            <label for="40">40
                                                                <input type="radio" id="40">
                                                            </label>
                                                            <label for="41">41
                                                                <input type="radio" id="41">
                                                            </label>
                                                            <label for="42">42
                                                                <input type="radio" id="42">
                                                            </label>
                                                            <label for="43">43
                                                                <input type="radio" id="43">
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="card">
                                                <div class="card-heading">
                                                    <a data-toggle="collapse" data-target="#collapseFive">Màu sắc</a>
                                                </div>
                                                <div id="collapseFive" class="collapse show"
                                                    data-parent="#accordionExample">
                                                    <div class="card-body">
                                                        <div class="shop__sidebar__color">
                                                            <label class="c-1" for="sp-1">
                                                                <input type="radio" id="sp-1">
                                                            </label>
                                                            <label class="c-2" for="sp-2">
                                                                <input type="radio" id="sp-2">
                                                            </label>
                                                            <label class="c-3" for="sp-3">
                                                                <input type="radio" id="sp-3">
                                                            </label>
                                                            <label class="c-4" for="sp-4">
                                                                <input type="radio" id="sp-4">
                                                            </label>
                                                            <label class="c-5" for="sp-5">
                                                                <input type="radio" id="sp-5">
                                                            </label>
                                                            <label class="c-6" for="sp-6">
                                                                <input type="radio" id="sp-6">
                                                            </label>
                                                            <label class="c-7" for="sp-7">
                                                                <input type="radio" id="sp-7">
                                                            </label>
                                                            <label class="c-8" for="sp-8">
                                                                <input type="radio" id="sp-8">
                                                            </label>
                                                            <label class="c-9" for="sp-9">
                                                                <input type="radio" id="sp-9">
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-9">
                                <div class="shop__product__option">
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-6">
                                            <div class="shop__product__option__left">
                                                <p>Showing 1–12 of 126 results</p>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-6">
                                            <div class="shop__product__option__right">
                                                <p>Sort by Price:</p>
                                                <select>
                                                    <option value="">Low To High</option>
                                                    <option value="name_asc">Name (A - Z)</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <c:forEach items="${products}" var="product">
                                        <div class="col-lg-4 col-md-6 col-sm-6">
                                            <div class="product__item">
                                                <div class="product__item__pic set-bg"
                                                    data-setbg="/images/product/${product.image}">
                                                    <ul class="product__hover">
                                                        <li><a href="/product/${product.id}"><img src="/client/img/icon/search.png"
                                                                    alt=""></a>
                                                        </li>
                                                    </ul>
                                                </div>
                                                <div class="product__item__text">
                                                    <h6>${product.name}</h6>
                                                    <h5>${product.price} VND</h5>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="product__pagination">
                                            <c:if test="${currentPage > 1}">
                                                <a href="/product?page=${currentPage - 1}"><i class="fa fa-angle-left"></i></a>
                                            </c:if>
                                            
                                            <c:choose>
                                                <%-- Nếu tổng số trang ≤ 5, hiển thị tất cả các trang --%>
                                                <c:when test="${totalPages <= 5}">
                                                    <c:forEach begin="1" end="${totalPages}" var="pageNumber">
                                                        <a href="/product?page=${pageNumber}" class="${pageNumber == currentPage ? 'active' : ''}">
                                                            ${pageNumber}
                                                        </a>
                                                    </c:forEach>
                                                </c:when>
                                                
                                                <%-- Nếu tổng số trang > 5, hiển thị theo chiến lược --%>
                                                <c:otherwise>
                                                    <%-- Luôn hiển thị trang 1 --%>
                                                    <a href="/product?page=1" class="${1 == currentPage ? 'active' : ''}">1</a>
                                                    
                                                    <%-- Xử lý hiển thị dấu "..." đầu tiên --%>
                                                    <c:if test="${currentPage > 3}">
                                                        <span>...</span>
                                                    </c:if>
                                                    
                                                    <%-- Hiển thị các trang ở giữa --%>
                                                    <c:choose>
                                                        <c:when test="${currentPage <= 3}">
                                                            <%-- Gần trang đầu --%>
                                                            <c:forEach begin="2" end="4" var="pageNumber">
                                                                <c:if test="${pageNumber <= totalPages}">
                                                                    <a href="/product?page=${pageNumber}" class="${pageNumber == currentPage ? 'active' : ''}">
                                                                        ${pageNumber}
                                                                    </a>
                                                                </c:if>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:when test="${currentPage >= totalPages - 2}">
                                                            <%-- Gần trang cuối --%>
                                                            <c:forEach begin="${totalPages - 3}" end="${totalPages - 1}" var="pageNumber">
                                                                <c:if test="${pageNumber > 1}">
                                                                    <a href="/product?page=${pageNumber}" class="${pageNumber == currentPage ? 'active' : ''}">
                                                                        ${pageNumber}
                                                                    </a>
                                                                </c:if>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <%-- Ở giữa --%>
                                                            <c:forEach begin="${currentPage - 1}" end="${currentPage + 1}" var="pageNumber">
                                                                <a href="/product?page=${pageNumber}" class="${pageNumber == currentPage ? 'active' : ''}">
                                                                    ${pageNumber}
                                                                </a>
                                                            </c:forEach>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    
                                                    <%-- Xử lý hiển thị dấu "..." thứ hai --%>
                                                    <c:if test="${currentPage < totalPages - 2}">
                                                        <span>...</span>
                                                    </c:if>
                                                    
                                                    <%-- Luôn hiển thị trang cuối --%>
                                                    <a href="/product?page=${totalPages}" class="${totalPages == currentPage ? 'active' : ''}">
                                                        ${totalPages}
                                                    </a>
                                                </c:otherwise>
                                            </c:choose>
                                            
                                            <c:if test="${currentPage < totalPages}">
                                                <a href="/product?page=${currentPage + 1}"><i class="fa fa-angle-right"></i></a>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>

                </section>
                <!-- Shop Section End -->

                <!-- Footer Section Begin -->
                <jsp:include page="../layout/footer.jsp" />
                <!-- Footer Section End -->

                <!-- Search Begin -->
                <div class="search-model">
                    <div class="h-100 d-flex align-items-center justify-content-center">
                        <div class="search-close-switch">+</div>
                        <form class="search-model-form">
                            <input type="text" id="search-input" placeholder="Search here.....">
                        </form>
                    </div>
                </div>
                <!-- Search End -->

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