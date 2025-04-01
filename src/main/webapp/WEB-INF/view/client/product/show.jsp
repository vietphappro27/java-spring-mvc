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
                                    <div class="col-lg-4 col-md-6 col-sm-6">
                                        <div class="product__item">
                                            <div class="product__item__pic set-bg"
                                                data-setbg="/client/img/product/1.jpeg">
                                                <ul class="product__hover">
                                                    <li><a href="#"><img src="/client/img/icon/heart.png" alt=""></a>
                                                    </li>
                                                    <li><a href="#"><img src="/client/img/icon/compare.png" alt="">
                                                            <span>Compare</span></a>
                                                    </li>
                                                    <li><a href="/product/1"><img src="/client/img/icon/search.png"
                                                                alt=""></a>
                                                    </li>
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
                                    <div class="col-lg-4 col-md-6 col-sm-6">
                                        <div class="product__item sale">
                                            <div class="product__item__pic set-bg"
                                                data-setbg="/client/img/product/2.jpg">
                                                <span class="label">Sale</span>
                                                <ul class="product__hover">
                                                    <li><a href="#"><img src="/client/img/icon/heart.png" alt=""></a>
                                                    </li>
                                                    <li><a href="#"><img src="/client/img/icon/compare.png" alt="">
                                                            <span>Compare</span></a>
                                                    </li>
                                                    <li><a href="#"><img src="/client/img/icon/search.png" alt=""></a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="product__item__text">
                                                <h6>Vintas Denim - Low Top</h6>
                                                <a href="#" class="add-cart">+ Add To Cart</a>
                                                <div class="rating">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div>
                                                <h5>650.000 VND</h5>
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
                                    <div class="col-lg-4 col-md-6 col-sm-6">
                                        <div class="product__item">
                                            <div class="product__item__pic set-bg"
                                                data-setbg="/client/img/product/3.jpeg">
                                                <ul class="product__hover">
                                                    <li><a href="#"><img src="/client/img/icon/heart.png" alt=""></a>
                                                    </li>
                                                    <li><a href="#"><img src="/client/img/icon/compare.png" alt="">
                                                            <span>Compare</span></a>
                                                    </li>
                                                    <li><a href="#"><img src="/client/img/icon/search.png" alt=""></a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="product__item__text">
                                                <h6>Track 6 Jazico - Low Top</h6>
                                                <a href="#" class="add-cart">+ Add To Cart</a>
                                                <div class="rating">
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div>
                                                <h5>1.190.000 VND</h5>
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
                                    <div class="col-lg-4 col-md-6 col-sm-6">
                                        <div class="product__item sale">
                                            <div class="product__item__pic set-bg"
                                                data-setbg="/client/img/product/4.jpg">
                                                <span class="label">Sale</span>
                                                <ul class="product__hover">
                                                    <li><a href="#"><img src="/client/img/icon/heart.png" alt=""></a>
                                                    </li>
                                                    <li><a href="#"><img src="/client/img/icon/compare.png" alt="">
                                                            <span>Compare</span></a>
                                                    </li>
                                                    <li><a href="#"><img src="/client/img/icon/search.png" alt=""></a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="product__item__text">
                                                <h6>Samba OG</h6>
                                                <a href="#" class="add-cart">+ Add To Cart</a>
                                                <div class="rating">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div>
                                                <h5>1.500.000 VND</h5>
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
                                    <div class="col-lg-4 col-md-6 col-sm-6">
                                        <div class="product__item">
                                            <div class="product__item__pic set-bg"
                                                data-setbg="/client/img/product/5.jpg">
                                                <ul class="product__hover">
                                                    <li><a href="#"><img src="/client/img/icon/heart.png" alt=""></a>
                                                    </li>
                                                    <li><a href="#"><img src="/client/img/icon/compare.png" alt="">
                                                            <span>Compare</span></a>
                                                    </li>
                                                    <li><a href="#"><img src="/client/img/icon/search.png" alt=""></a>
                                                    </li>
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
                                    <div class="col-lg-4 col-md-6 col-sm-6">
                                        <div class="product__item">
                                            <div class="product__item__pic set-bg"
                                                data-setbg="/client/img/product/6.jpg">
                                                <ul class="product__hover">
                                                    <li><a href="#"><img src="/client/img/icon/heart.png" alt=""></a>
                                                    </li>
                                                    <li><a href="#"><img src="/client/img/icon/compare.png" alt="">
                                                            <span>Compare</span></a>
                                                    </li>
                                                    <li><a href="#"><img src="/client/img/icon/search.png" alt=""></a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="product__item__text">
                                                <h6>Chuck 70</h6>
                                                <a href="#" class="add-cart">+ Add To Cart</a>
                                                <div class="rating">
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div>
                                                <h5>800.000 VND</h5>
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
                                    <div class="col-lg-4 col-md-6 col-sm-6">
                                        <div class="product__item">
                                            <div class="product__item__pic set-bg"
                                                data-setbg="/client/img/product/7.jpg">
                                                <ul class="product__hover">
                                                    <li><a href="#"><img src="/client/img/icon/heart.png" alt=""></a>
                                                    </li>
                                                    <li><a href="#"><img src="/client/img/icon/compare.png" alt="">
                                                            <span>Compare</span></a>
                                                    </li>
                                                    <li><a href="#"><img src="/client/img/icon/search.png" alt=""></a>
                                                    </li>
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
                                                    <label for="pc-25">
                                                        <input type="radio" id="pc-25">
                                                    </label>
                                                    <label class="active black" for="pc-26">
                                                        <input type="radio" id="pc-26">
                                                    </label>
                                                    <label class="grey" for="pc-27">
                                                        <input type="radio" id="pc-27">
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-6 col-sm-6">
                                        <div class="product__item sale">
                                            <div class="product__item__pic set-bg"
                                                data-setbg="/client/img/product/8.jpg">
                                                <span class="label">Sale</span>
                                                <ul class="product__hover">
                                                    <li><a href="#"><img src="/client/img/icon/heart.png" alt=""></a>
                                                    </li>
                                                    <li><a href="#"><img src="/client/img/icon/compare.png" alt="">
                                                            <span>Compare</span></a>
                                                    </li>
                                                    <li><a href="#"><img src="/client/img/icon/search.png" alt=""></a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="product__item__text">
                                                <h6>VANS AUTHENTIC CLASSIC BLACK/WHITE</h6>
                                                <a href="#" class="add-cart">+ Add To Cart</a>
                                                <div class="rating">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div>
                                                <h5>1.200.000 VND</h5>
                                                <div class="product__color__select">
                                                    <label for="pc-28">
                                                        <input type="radio" id="pc-28">
                                                    </label>
                                                    <label class="active black" for="pc-29">
                                                        <input type="radio" id="pc-29">
                                                    </label>
                                                    <label class="grey" for="pc-30">
                                                        <input type="radio" id="pc-30">
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-6 col-sm-6">
                                        <div class="product__item sale">
                                            <div class="product__item__pic set-bg"
                                                data-setbg="/client/img/product/9.jpg">
                                                <span class="label">Sale</span>
                                                <ul class="product__hover">
                                                    <li><a href="#"><img src="/client/img/icon/heart.png" alt=""></a>
                                                    </li>
                                                    <li><a href="#"><img src="/client/img/icon/compare.png" alt="">
                                                            <span>Compare</span></a>
                                                    </li>
                                                    <li><a href="#"><img src="/client/img/icon/search.png" alt=""></a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="product__item__text">
                                                <h6>VANS AUTHENTIC CLASSIC BLACK/WHITE</h6>
                                                <a href="#" class="add-cart">+ Add To Cart</a>
                                                <div class="rating">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div>
                                                <h5>1.200.000 VND </h5>
                                                <div class="product__color__select">
                                                    <label for="pc-28">
                                                        <input type="radio" id="pc-28">
                                                    </label>
                                                    <label class="active black" for="pc-29">
                                                        <input type="radio" id="pc-29">
                                                    </label>
                                                    <label class="grey" for="pc-30">
                                                        <input type="radio" id="pc-30">
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="product__pagination">
                                            <a class="active" href="#">1</a>
                                            <a href="#">2</a>
                                            <a href="#">3</a>
                                            <span>...</span>
                                            <a href="#">21</a>
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