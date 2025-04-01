<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <!-- jstl core -->
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!-- form: -->
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
                    <a href="#">Xem thêm</a>
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
                    <a href="#">Xem thêm</a>
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
                    <a href="#">Xem thêm</a>
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
                  <li data-filter=".new-arrivals">Sản Phẩm Mới</li>
                  <li data-filter=".hot-sales">Giảm Giá</li>
                </ul>
              </div>
            </div>
            <div class="row product__filter">
              <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix new-arrivals">
                <div class="product__item">
                  <div class="product__item__pic set-bg" data-setbg="/client/img/product/1.jpeg">
                    <span class="label">New</span>
                    <ul class="product__hover">
                      <li><a href="#"><img src="/client/img/icon/heart.png" alt=""></a></li>
                      <li><a href="#"><img src="/client/img/icon/compare.png" alt=""> <span>Compare</span></a></li>
                      <li><a href="#"><img src="/client/img/icon/search.png" alt=""></a></li>
                    </ul>
                  </div>
                  <div class="product__item__text">
                    <h6>Vintas Vivu - Low Top - Plantation</h6>
                    <a href="#" class="add-cart">+ Add To Cart</a>
                    <div class="rating">
                      <i class="fa fa-star-o"></i>
                      <i class="fa fa-star-o"></i>
                      <i class="fa fa-star-o"></i>
                      <i class="fa fa-star-o"></i>
                      <i class="fa fa-star-o"></i>
                    </div>
                    <h5>750.000 VND</h5>
                    <div class="product__color__select">
                      <label for="pc-1">
                        <input type="radio" id="pc-1">
                      </label>
                      <label class="active black" for="pc-2">
                        <input type="radio" id="pc-2">
                      </label>
                      <label class="grey" for="pc-3">
                        <input type="radio" id="pc-3">
                      </label>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix hot-sales">
                <div class="product__item sale">
                  <div class="product__item__pic set-bg" data-setbg="/client/img/product/2.jpg">
                    <span class="label">Sale</span>
                    <ul class="product__hover">
                      <li><a href="#"><img src="/client/img/icon/heart.png" alt=""></a></li>
                      <li><a href="#"><img src="/client/img/icon/compare.png" alt=""> <span>Compare</span></a></li>
                      <li><a href="#"><img src="/client/img/icon/search.png" alt=""></a></li>
                    </ul>
                  </div>
                  <div class="product__item__text">
                    <h6>Vintas Denim - Low Top</h6>
                    <a href="#" class="add-cart">+ Add To Cart</a>
                    <div class="rating">
                      <i class="fa fa-star-o"></i>
                      <i class="fa fa-star-o"></i>
                      <i class="fa fa-star-o"></i>
                      <i class="fa fa-star-o"></i>
                      <i class="fa fa-star-o"></i>
                    </div>
                    <h5>650.000 VND</h5>
                    <div class="product__color__select">
                      <label for="pc-4">
                        <input type="radio" id="pc-4">
                      </label>
                      <label class="active black" for="pc-5">
                        <input type="radio" id="pc-5">
                      </label>
                      <label class="grey" for="pc-6">
                        <input type="radio" id="pc-6">
                      </label>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix new-arrivals">
                <div class="product__item new">
                  <div class="product__item__pic set-bg" data-setbg="/client/img/product/3.jpeg">
                    <span class="label">New</span>
                    <ul class="product__hover">
                      <li><a href="#"><img src="/client/img/icon/heart.png" alt=""></a></li>
                      <li><a href="#"><img src="/client/img/icon/compare.png" alt=""> <span>Compare</span></a></li>
                      <li><a href="#"><img src="/client/img/icon/search.png" alt=""></a></li>
                    </ul>
                  </div>
                  <div class="product__item__text">
                    <h6>Track 6 Jazico - Low Top</h6>
                    <a href="#" class="add-cart">+ Add To Cart</a>
                    <div class="rating">
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star-o"></i>
                    </div>
                    <h5>1.190.000 VND</h5>
                    <div class="product__color__select">
                      <label for="pc-7">
                        <input type="radio" id="pc-7">
                      </label>
                      <label class="active black" for="pc-8">
                        <input type="radio" id="pc-8">
                      </label>
                      <label class="grey" for="pc-9">
                        <input type="radio" id="pc-9">
                      </label>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix hot-sales">
                <div class="product__item sale">
                  <div class="product__item__pic set-bg" data-setbg="/client/img/product/4.jpg">
                    <span class="label">Sale</span>
                    <ul class="product__hover">
                      <li><a href="#"><img src="/client/img/icon/heart.png" alt=""></a></li>
                      <li><a href="#"><img src="/client/img/icon/compare.png" alt=""> <span>Compare</span></a></li>
                      <li><a href="#"><img src="/client/img/icon/search.png" alt=""></a></li>
                    </ul>
                  </div>
                  <div class="product__item__text">
                    <h6>Samba OG</h6>
                    <a href="#" class="add-cart">+ Add To Cart</a>
                    <div class="rating">
                      <i class="fa fa-star-o"></i>
                      <i class="fa fa-star-o"></i>
                      <i class="fa fa-star-o"></i>
                      <i class="fa fa-star-o"></i>
                      <i class="fa fa-star-o"></i>
                    </div>
                    <h5>1.500.000 VND</h5>
                    <div class="product__color__select">
                      <label for="pc-10">
                        <input type="radio" id="pc-10">
                      </label>
                      <label class="active black" for="pc-11">
                        <input type="radio" id="pc-11">
                      </label>
                      <label class="grey" for="pc-12">
                        <input type="radio" id="pc-12">
                      </label>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix new-arrivals">
                <div class="product__item">
                  <div class="product__item__pic set-bg" data-setbg="/client/img/product/5.jpg">
                    <span class="label">New</span>
                    <ul class="product__hover">
                      <li><a href="#"><img src="/client/img/icon/heart.png" alt=""></a></li>
                      <li><a href="#"><img src="/client/img/icon/compare.png" alt=""> <span>Compare</span></a></li>
                      <li><a href="#"><img src="/client/img/icon/search.png" alt=""></a></li>
                    </ul>
                  </div>
                  <div class="product__item__text">
                    <h6>Ultraboost 5</h6>
                    <a href="#" class="add-cart">+ Add To Cart</a>
                    <div class="rating">
                      <i class="fa fa-star-o"></i>
                      <i class="fa fa-star-o"></i>
                      <i class="fa fa-star-o"></i>
                      <i class="fa fa-star-o"></i>
                      <i class="fa fa-star-o"></i>
                    </div>
                    <h5>1.700.000 VND</h5>
                    <div class="product__color__select">
                      <label for="pc-13">
                        <input type="radio" id="pc-13">
                      </label>
                      <label class="active black" for="pc-14">
                        <input type="radio" id="pc-14">
                      </label>
                      <label class="grey" for="pc-15">
                        <input type="radio" id="pc-15">
                      </label>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix hot-sales">
                <div class="product__item sale">
                  <div class="product__item__pic set-bg" data-setbg="/client/img/product/6.jpg">
                    <span class="label">Sale</span>
                    <ul class="product__hover">
                      <li><a href="#"><img src="/client/img/icon/heart.png" alt=""></a></li>
                      <li><a href="#"><img src="/client/img/icon/compare.png" alt=""> <span>Compare</span></a></li>
                      <li><a href="#"><img src="/client/img/icon/search.png" alt=""></a></li>
                    </ul>
                  </div>
                  <div class="product__item__text">
                    <h6>Chuck 70</h6>
                    <a href="#" class="add-cart">+ Add To Cart</a>
                    <div class="rating">
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star-o"></i>
                    </div>
                    <h5>800.000 VND</h5>
                    <div class="product__color__select">
                      <label for="pc-16">
                        <input type="radio" id="pc-16">
                      </label>
                      <label class="active black" for="pc-17">
                        <input type="radio" id="pc-17">
                      </label>
                      <label class="grey" for="pc-18">
                        <input type="radio" id="pc-18">
                      </label>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix new-arrivals">
                <div class="product__item">
                  <div class="product__item__pic set-bg" data-setbg="/client/img/product/7.jpg">
                    <span class="label">New</span>
                    <ul class="product__hover">
                      <li><a href="#"><img src="/client/img/icon/heart.png" alt=""></a></li>
                      <li><a href="#"><img src="/client/img/icon/compare.png" alt=""> <span>Compare</span></a></li>
                      <li><a href="#"><img src="/client/img/icon/search.png" alt=""></a></li>
                    </ul>
                  </div>
                  <div class="product__item__text">
                    <h6>Converse x CDG Chuck 70</h6>
                    <a href="#" class="add-cart">+ Add To Cart</a>
                    <div class="rating">
                      <i class="fa fa-star-o"></i>
                      <i class="fa fa-star-o"></i>
                      <i class="fa fa-star-o"></i>
                      <i class="fa fa-star-o"></i>
                      <i class="fa fa-star-o"></i>
                    </div>
                    <h5>1.000.000 VND</h5>
                    <div class="product__color__select">
                      <label for="pc-19">
                        <input type="radio" id="pc-19">
                      </label>
                      <label class="active black" for="pc-20">
                        <input type="radio" id="pc-20">
                      </label>
                      <label class="grey" for="pc-21">
                        <input type="radio" id="pc-21">
                      </label>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix hot-sales">
                <div class="product__item sale">
                  <div class="product__item__pic set-bg" data-setbg="/client/img/product/8.jpg">
                    <span class="label">Sale</span>
                    <ul class="product__hover">
                      <li><a href="#"><img src="/client/img/icon/heart.png" alt=""></a></li>
                      <li><a href="#"><img src="/client/img/icon/compare.png" alt=""> <span>Compare</span></a></li>
                      <li><a href="#"><img src="/client/img/icon/search.png" alt=""></a></li>
                    </ul>
                  </div>
                  <div class="product__item__text">
                    <h6>VANS AUTHENTIC CLASSIC BLACK/WHITE</h6>
                    <a href="#" class="add-cart">+ Add To Cart</a>
                    <div class="rating">
                      <i class="fa fa-star-o"></i>
                      <i class="fa fa-star-o"></i>
                      <i class="fa fa-star-o"></i>
                      <i class="fa fa-star-o"></i>
                      <i class="fa fa-star-o"></i>
                    </div>
                    <h5>1.200.000 VND</h5>
                    <div class="product__color__select">
                      <label for="pc-22">
                        <input type="radio" id="pc-22">
                      </label>
                      <label class="active black" for="pc-23">
                        <input type="radio" id="pc-23">
                      </label>
                      <label class="grey" for="pc-24">
                        <input type="radio" id="pc-24">
                      </label>
                    </div>
                  </div>
                </div>
              </div>
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