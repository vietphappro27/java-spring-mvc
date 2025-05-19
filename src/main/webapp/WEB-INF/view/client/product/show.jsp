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
                                        <form action="/product" method="get">
                                            <input type="text" name="keyword" placeholder="Tìm kiếm..." value="${keyword}">
                                            <button type="submit"><span class="icon_search"></span></button>
                                        </form>
                                    </div>
                                    <div class="shop__sidebar__accordion">
                                        <form id="filter-form" action="/product" method="get">
                                            <div class="accordion" id="accordionExample">
                                                <div class="card" id="categoryFilter">
                                                    <div class="card-heading">
                                                        <a data-toggle="collapse" data-target="#collapseOne">Danh mục</a>
                                                    </div>
                                                    <div id="collapseOne" class="collapse show">
                                                        <div class="card-body">
                                                            <div class="shop__sidebar__categories">
                                                                <ul class="nice-scroll">
                                                                    <li>
                                                                        <label>
                                                                            <input type="checkbox" name="category" value="Nam" ${selectedCategories.contains('Nam') ? 'checked' : ''}> Nam 
                                                                        </label>
                                                                    </li>
                                                                    <li>
                                                                        <label>
                                                                            <input type="checkbox" name="category" value="Nữ" ${selectedCategories.contains('Nữ') ? 'checked' : ''}> Nữ 
                                                                        </label>
                                                                    </li>
                                                                    <li>
                                                                        <label>
                                                                            <input type="checkbox" name="category" value="Phụ Kiện" ${selectedCategories.contains('Phụ Kiện') ? 'checked' : ''}> Phụ kiện 
                                                                        </label>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="card" id="brandFilter">
                                                    <div class="card-heading">
                                                        <a data-toggle="collapse" data-target="#collapseTwo">Thương hiệu</a>
                                                    </div>
                                                    <div id="collapseTwo" class="collapse show">
                                                        <div class="card-body">
                                                            <div class="shop__sidebar__brand">
                                                                <ul class="nice-scroll">
                                                                    <li>
                                                                        <label>
                                                                            <input type="checkbox" name="brand" value="Ananas" ${selectedBrands.contains('Ananas') ? 'checked' : ''}> Ananas
                                                                        </label>
                                                                    </li>
                                                                    <li>
                                                                        <label>
                                                                            <input type="checkbox" name="brand" value="Adidas" ${selectedBrands.contains('Adidas') ? 'checked' : ''}> Adidas
                                                                        </label>
                                                                    </li>
                                                                    <li>
                                                                        <label>
                                                                            <input type="checkbox" name="brand" value="Vans" ${selectedBrands.contains('Vans') ? 'checked' : ''}> Vans
                                                                        </label>
                                                                    </li>
                                                                    <li>
                                                                        <label>
                                                                            <input type="checkbox" name="brand" value="Converse" ${selectedBrands.contains('Converse') ? 'checked' : ''}> Converse
                                                                        </label>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="card" id="priceFilter">
                                                    <div class="card-heading">
                                                        <a data-toggle="collapse" data-target="#collapseThree">Giá</a>
                                                    </div>
                                                    <div id="collapseThree" class="collapse show">
                                                        <div class="card-body">
                                                            <div class="shop__sidebar__price">
                                                                <ul class="nice-scroll">
                                                                    <li>
                                                                        <label>
                                                                            <input type="checkbox" name="price" value="3000plus" ${selectedPrices.contains('3000plus') ? 'checked' : ''}> &gt;3000k
                                                                        </label>
                                                                    </li>
                                                                    <li>
                                                                        <label>
                                                                            <input type="checkbox" name="price" value="2000-3000" ${selectedPrices.contains('2000-3000') ? 'checked' : ''}> 2000k - 3000k
                                                                        </label>
                                                                    </li>
                                                                    <li>
                                                                        <label>
                                                                            <input type="checkbox" name="price" value="1000-2000" ${selectedPrices.contains('1000-2000') ? 'checked' : ''}> 1000k - 2000k
                                                                        </label>
                                                                    </li>
                                                                    <li>
                                                                        <label>
                                                                            <input type="checkbox" name="price" value="below-1000" ${selectedPrices.contains('below-1000') ? 'checked' : ''}> &#60; 1000k
                                                                        </label>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mt-4">
                                                <button type="button" id="btnFilter" class="btn btn-dark btn-block">Lọc sản phẩm</button>
                                                <button type="button" id="reset-button" class="btn btn-outline-dark btn-block mt-2">Xóa bộ lọc</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-9">
                                <div class="shop__product__option">
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-6">
                                            <div class="shop__product__option__left">
                                                <%-- <p>Showing 1–12 of 126 results</p> --%>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-6">
                                            <div class="shop__product__option__right">
                                                <p>Sắp xếp theo:</p>
                                                <select id="sortSelect">
                                                    <option value="">Mặc định</option>
                                                    <option value="price_asc" ${selectedSort == 'price_asc' ? 'selected' : ''}>Giá: Thấp đến Cao</option>
                                                    <option value="price_desc" ${selectedSort == 'price_desc' ? 'selected' : ''}>Giá: Cao đến Thấp</option>
                                                    <option value="name_asc" ${selectedSort == 'name_asc' ? 'selected' : ''}>Tên (A - Z)</option>
                                                    <option value="name_desc" ${selectedSort == 'name_desc' ? 'selected' : ''}>Tên (Z - A)</option>
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
                                                    <h5>
                                                    <fmt:formatNumber value="${product.price}" type="number" groupingUsed="true" /> VNĐ
                                                    </h5>
                                                    <%-- <h5>${product.price} VND</h5> --%>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>


                                <%-- pagination --%>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="product__pagination">
                                            <c:if test="${currentPage > 1}">
                                                <a href="/product?page=${currentPage - 1}<c:if test="${not empty param.category}">&category=${param.category}</c:if><c:if test="${not empty param.brand}">&brand=${param.brand}</c:if><c:if test="${not empty param.price}">&price=${param.price}</c:if><c:if test="${not empty param.sort}">&sort=${param.sort}</c:if><c:if test="${not empty param.keyword}">&keyword=${param.keyword}</c:if>"><i class="fa fa-angle-left"></i></a>
                                            </c:if>
                                            <c:choose>
                                                <%-- Nếu tổng số trang ≤ 5, hiển thị tất cả các trang --%>
                                                <c:when test="${totalPages <= 5}">
                                                    <c:forEach begin="1" end="${totalPages}" var="pageNumber">
                                                        <a href="/product?page=${pageNumber}<c:if test="${not empty param.category}">&category=${param.category}</c:if><c:if test="${not empty param.brand}">&brand=${param.brand}</c:if><c:if test="${not empty param.price}">&price=${param.price}</c:if><c:if test="${not empty param.sort}">&sort=${param.sort}</c:if><c:if test="${not empty param.keyword}">&keyword=${param.keyword}</c:if>" class="${pageNumber == currentPage ? 'active' : ''}">
                                                            ${pageNumber}
                                                        </a>
                                                    </c:forEach>
                                                </c:when>
                                                <%-- Nếu tổng số trang > 5, hiển thị theo chiến lược --%>
                                                <c:otherwise>
                                                    <%-- Luôn hiển thị trang 1 --%>
                                                    <a href="/product?page=1<c:if test="${not empty param.category}">&category=${param.category}</c:if><c:if test="${not empty param.brand}">&brand=${param.brand}</c:if><c:if test="${not empty param.price}">&price=${param.price}</c:if><c:if test="${not empty param.sort}">&sort=${param.sort}</c:if><c:if test="${not empty param.keyword}">&keyword=${param.keyword}</c:if>" class="${1 == currentPage ? 'active' : ''}">1</a>
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
                                                                    <a href="/product?page=${pageNumber}<c:if test="${not empty param.category}">&category=${param.category}</c:if><c:if test="${not empty param.brand}">&brand=${param.brand}</c:if><c:if test="${not empty param.price}">&price=${param.price}</c:if><c:if test="${not empty param.sort}">&sort=${param.sort}</c:if><c:if test="${not empty param.keyword}">&keyword=${param.keyword}</c:if>" class="${pageNumber == currentPage ? 'active' : ''}">
                                                                        ${pageNumber}
                                                                    </a>
                                                                </c:if>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:when test="${currentPage >= totalPages - 2}">
                                                            <%-- Gần trang cuối --%>
                                                            <c:forEach begin="${totalPages - 3}" end="${totalPages - 1}" var="pageNumber">
                                                                <c:if test="${pageNumber > 1}">
                                                                    <a href="/product?page=${pageNumber}<c:if test="${not empty param.category}">&category=${param.category}</c:if><c:if test="${not empty param.brand}">&brand=${param.brand}</c:if><c:if test="${not empty param.price}">&price=${param.price}</c:if><c:if test="${not empty param.sort}">&sort=${param.sort}</c:if><c:if test="${not empty param.keyword}">&keyword=${param.keyword}</c:if>" class="${pageNumber == currentPage ? 'active' : ''}">
                                                                        ${pageNumber}
                                                                    </a>
                                                                </c:if>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <%-- Ở giữa --%>
                                                            <c:forEach begin="${currentPage - 1}" end="${currentPage + 1}" var="pageNumber">
                                                                <a href="/product?page=${pageNumber}<c:if test="${not empty param.category}">&category=${param.category}</c:if><c:if test="${not empty param.brand}">&brand=${param.brand}</c:if><c:if test="${not empty param.price}">&price=${param.price}</c:if><c:if test="${not empty param.sort}">&sort=${param.sort}</c:if><c:if test="${not empty param.keyword}">&keyword=${param.keyword}</c:if>" class="${pageNumber == currentPage ? 'active' : ''}">
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
                                                    <a href="/product?page=${totalPages}<c:if test="${not empty param.category}">&category=${param.category}</c:if><c:if test="${not empty param.brand}">&brand=${param.brand}</c:if><c:if test="${not empty param.price}">&price=${param.price}</c:if><c:if test="${not empty param.sort}">&sort=${param.sort}</c:if><c:if test="${not empty param.keyword}">&keyword=${param.keyword}</c:if>" class="${totalPages == currentPage ? 'active' : ''}">
                                                        ${totalPages}
                                                    </a>
                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${currentPage < totalPages}">
                                                <a href="/product?page=${currentPage + 1}<c:if test="${not empty param.category}">&category=${param.category}</c:if><c:if test="${not empty param.brand}">&brand=${param.brand}</c:if><c:if test="${not empty param.price}">&price=${param.price}</c:if><c:if test="${not empty param.sort}">&sort=${param.sort}</c:if><c:if test="${not empty param.keyword}">&keyword=${param.keyword}</c:if>"><i class="fa fa-angle-right"></i></a>
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
                <script src="/client/js/product-filter.js"></script>
                
                <script>
                    $(document).ready(function() {
                        // Xử lý nút lọc sản phẩm
                        $('#btnFilter').on('click', function() {
                            // Lấy các giá trị đã chọn
                            var selectedCategories = [];
                            $('input[name="category"]:checked').each(function() {
                                selectedCategories.push($(this).val());
                            });
                            
                            var selectedBrands = [];
                            $('input[name="brand"]:checked').each(function() {
                                selectedBrands.push($(this).val());
                            });
                            
                            var selectedPrices = [];
                            $('input[name="price"]:checked').each(function() {
                                selectedPrices.push($(this).val());
                            });
                            
                            // Lấy giá trị sắp xếp
                            var sortValue = $('#sortSelect').val();
                            
                            // Tạo URL với các tham số đã chọn
                            var url = window.location.pathname + '?';
                            var params = [];
                            
                            if (selectedCategories.length > 0) {
                                params.push('category=' + selectedCategories.join(','));
                            }
                            
                            if (selectedBrands.length > 0) {
                                params.push('brand=' + selectedBrands.join(','));
                            }
                            
                            if (selectedPrices.length > 0) {
                                params.push('price=' + selectedPrices.join(','));
                            }
                            
                            if (sortValue) {
                                params.push('sort=' + sortValue);
                            }
                            
                            // Thêm tham số keyword nếu có
                            var urlParams = new URLSearchParams(window.location.search);
                            if (urlParams.has("keyword")) {
                                params.push("keyword=" + urlParams.get("keyword"));
                            }
                            
                            // Thêm tham số page nếu có
                            var urlParams = new URLSearchParams(window.location.search);
                            if (urlParams.has('page')) {
                                params.push('page=' + urlParams.get('page'));
                            }
                            
                            // Chuyển hướng đến URL mới
                            if (params.length > 0) {
                                window.location.href = url + params.join('&');
                            } else {
                                window.location.href = url;
                            }
                        });
                        
                        // Xử lý sự kiện thay đổi select box sắp xếp
                        $('#sortSelect').on('change', function() {
                            // Lấy các giá trị đã chọn từ URL hiện tại
                            var urlParams = new URLSearchParams(window.location.search);
                            var url = window.location.pathname + '?';
                            var params = [];
                            
                            // Giữ lại các tham số lọc hiện tại
                            if (urlParams.has("keyword")) {
                                params.push("keyword=" + urlParams.get("keyword"));
                            }
                            if (urlParams.has('category')) {
                                params.push('category=' + urlParams.get('category'));
                            }
                            
                            if (urlParams.has('brand')) {
                                params.push('brand=' + urlParams.get('brand'));
                            }
                            
                            if (urlParams.has('price')) {
                                params.push('price=' + urlParams.get('price'));
                            }
                            
                            // Thêm tham số sắp xếp mới
                            var sortValue = $(this).val();
                            if (sortValue) {
                                params.push('sort=' + sortValue);
                            }
                            
                            // Thêm tham số page nếu có
                            if (urlParams.has('page')) {
                                params.push('page=' + urlParams.get('page'));
                            }
                            
                            // Chuyển hướng đến URL mới
                            window.location.href = url + params.join('&');
                        });
                        
                        // Xử lý nút xóa bộ lọc
                        $("#reset-button").on("click", function() {
                            // Bỏ chọn tất cả các checkbox
                            $("input[type=\"checkbox\"]").prop("checked", false);
                            
                            // Chuyển hướng đến URL không có tham số lọc, nhưng giữ lại keyword nếu có
                            var urlParams = new URLSearchParams(window.location.search);
                            if (urlParams.has("keyword")) {
                                window.location.href = window.location.pathname + "?keyword=" + urlParams.get("keyword");
                            } else {
                                window.location.href = window.location.pathname;
                            }
                        });
                        $('#reset-button').on('click', function() {
                            // Bỏ chọn tất cả các checkbox
                            $('input[type="checkbox"]').prop('checked', false);
                            
                            // Chuyển hướng đến URL không có tham số lọc
                            window.location.href = window.location.pathname;
                        });
                        
                        // Đánh dấu các bộ lọc đã chọn khi tải trang
                        var urlParams = new URLSearchParams(window.location.search);
                        
                        if (urlParams.has('category')) {
                            var categories = urlParams.get('category').split(',');
                            categories.forEach(function(category) {
                                $('input[name="category"][value="' + category + '"]').prop('checked', true);
                            });
                        }
                        
                        if (urlParams.has('brand')) {
                            var brands = urlParams.get('brand').split(',');
                            brands.forEach(function(brand) {
                                $('input[name="brand"][value="' + brand + '"]').prop('checked', true);
                            });
                        }
                        
                        if (urlParams.has('price')) {
                            var prices = urlParams.get('price').split(',');
                            prices.forEach(function(price) {
                                $('input[name="price"][value="' + price + '"]').prop('checked', true);
                            });
                        }
                        
                        // Đánh dấu tùy chọn sắp xếp đã chọn
                        if (urlParams.has('sort')) {
                            $('#sortSelect').val(urlParams.get('sort'));
                        }
                    });
                </script>
                
                <style>
                    /* Style cho checkbox */
                    input[type="checkbox"] + label {
                        cursor: pointer;
                    }
                    
                    input[type="checkbox"]:checked + label {
                        font-weight: bold;
                        color: #000;
                    }
                    
                    /* Style cho size */
                    .shop__sidebar__size {
                        display: flex;
                        flex-wrap: wrap;
                        gap: 10px;
                        margin-top: 5px;
                    }
                    
                    .shop__sidebar__size .size-box {
                        position: relative;
                        display: inline-block;
                        width: 45px;
                        height: 45px;
                        margin: 0 8px 8px 0;
                        cursor: pointer;
                    }
                    
                    .shop__sidebar__size .size-box input[type="checkbox"] {
                        position: absolute;
                        opacity: 0;
                        cursor: pointer;
                    }
                    
                    .shop__sidebar__size .size-text {
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        width: 100%;
                        height: 100%;
                        border: 1px solid #e5e5e5;
                        background-color: #fff;
                        transition: all 0.3s;
                        font-weight: 500;
                        border-radius: 4px;
                    }
                    
                    .shop__sidebar__size input[type="checkbox"]:checked + .size-text {
                        background-color: #111111;
                        color: white;
                        border-color: #111111;
                        box-shadow: 0 2px 5px rgba(0,0,0,0.2);
                        transform: translateY(-2px);
                    }
                    
                    .shop__sidebar__size .size-box:hover .size-text {
                        border-color: #111111;
                        transform: translateY(-2px);
                        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
                    }
                    
                    /* Style cho card-heading */
                    .card-heading a {
                        display: block;
                        position: relative;
                        cursor: pointer;
                        font-weight: 600;
                        padding: 10px 0;
                    }
                    
                    /* Style cho form */
                    #filter-form label {
                        display: block;
                        margin-bottom: 8px;
                        cursor: pointer;
                    }
                    
                    #filter-form input[type="checkbox"] {
                        margin-right: 8px;
                    }
                </style>
            </body>

            </html>