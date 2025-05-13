<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <!-- jstl core -->
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!-- form: -->
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <!-- fmt for number formatting -->
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
      <!DOCTYPE html>
      <html lang="en">

      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Male-Fashion | Template</title>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
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
        <!-- Google Font -->
      </head>

      <body>
        <!-- Header Section Begin -->
        <jsp:include page="../layout/header.jsp" />
        <!-- Header Section End -->

        <!-- Hero Section Begin -->
        <section class="hero">
          <div class="hero__slider owl-carousel">
            <!-- <div class="hero__items set-bg" data-setbg="/client/img/hero/hero-1.jpg"> -->
            <div class="hero__items set-bg" data-setbg="/client/img/hero/hero1.png">
            </div>
            <!-- <div class="hero__items set-bg" data-setbg="/client/img/hero/hero-2.jpg"> -->
            <div class="hero__items set-bg" data-setbg="/client/img/hero/hero2.png">
            </div>
          </div>
        </section>
        <!-- Hero Section End -->

        <!-- Banner Section Begin -->
        <section class="banner spad">
          <div class="container">
            <div class="row">
              <div class="col-lg-7 offset-lg-4">
                <div class="banner__item">
                  <div class="banner__item__pic">
                    <img src="/client/img/banner/1.png" alt="" style="width: 440px;height: 440px;object-fit: cover;">
                  </div>
                  <div class="banner__item__text">
                    <h2>BST Adidas Runners</h2>
                    <a href="/product">Xem thêm</a>
                  </div>
                </div>
              </div>
              <div class="col-lg-5">
                <div class="banner__item banner__item--middle">
                  <div class="banner__item__pic">
                    <img src="/client/img/banner/2.png" alt="">
                  </div>
                  <div class="banner__item__text">
                    <h2>Phụ kiện</h2>
                    <a href="/product">Xem thêm</a>
                  </div>
                </div>
              </div>
              <div class="col-lg-7">
                <div class="banner__item banner__item--last">
                  <div class="banner__item__pic">
                    <img src="/client/img/banner/banner-3.jpg" alt="">
                  </div>
                  <div class="banner__item__text">
                    <h2>Xu Hướng <br>2025</h2>
                    <a href="/product">Xem thêm</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
        <!-- Banner Section End -->

        <!-- Product Section Begin -->
        <section class="product spad">
          <div class="container">
            <div class="row">
              <div class="col-lg-12">
                <ul class="filter__controls">
                  <li class="active" data-filter="*">Sản Phẩm Bán Chạy</li>
                </ul>
              </div>
            </div>
            <div class="row product__filter">
            <%--  render product --%>
              <c:forEach items="${products}" var="product">
                <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix">
                  <div class="product__item">
                    <div class="product__item__pic set-bg" data-setbg="/images/product/${product.image}">
                      <ul class="product__hover">
                        <li><a href="/product/${product.id}"><img src="/client/img/icon/search.png" alt=""></a></li>
                      </ul>
                    </div>
                    <div class="product__item__text">
                      <h6>${product.name}</h6>
                      <form action="/add-product-to-cart/${product.id}" method="post">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        <%-- <input type="hidden" name="productId" value="${product.id}" /> --%>
                        <button type="submit" class="add-cart">+ Add To Cart</button>
                      </form>
                      <h5><fmt:formatNumber value="${product.price}" type="number" groupingUsed="true"/> VNĐ</h5>
                    </div>
                  </div>
                </div>
              </c:forEach>
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