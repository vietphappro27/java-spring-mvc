<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!-- jstl core -->
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!-- form: -->
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Document</title>
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
                <link rel="stylesheet"
                    href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

            </head>

            <body>

                <!-- Header Section Begin -->
                <jsp:include page="../layout/header.jsp" />
                <!-- Header Section End -->

                <!-- Shop Details Section Begin -->
                <section class="shop-details">
                    <div class="product__details__pic">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="product__details__breadcrumb">
                                        <a href="./index.html">Home</a>
                                        <a href="./shop.html">Shop</a>
                                        <span>Product</span>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-3 col-md-3">
                                    <ul class="nav nav-tabs" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">
                                                <div class="product__thumb__pic set-bg"
                                                    data-setbg="/client/img/shop-details/1.jpeg">
                                                    <!-- data-setbg="/client/img/shop-details/thumb-1.png"> -->
                                                </div>
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab">
                                                <div class="product__thumb__pic set-bg"
                                                    data-setbg="/client/img/shop-details/2.jpeg">
                                                </div>
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab">
                                                <div class="product__thumb__pic set-bg"
                                                    data-setbg="/client/img/shop-details/3.jpeg">
                                                </div>
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" data-toggle="tab" href="#tabs-4" role="tab">
                                                <div class="product__thumb__pic set-bg"
                                                    data-setbg="/client/img/shop-details/4.jpeg">
                                                    <!-- play video -->
                                                    <!-- <i class="fa fa-play"></i> -->
                                                </div>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="col-lg-6 col-md-9">
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                            <div class="product__details__pic__item">
                                                <img src="/client/img/shop-details/1.jpeg" alt="">
                                            </div>
                                        </div>
                                        <div class="tab-pane" id="tabs-2" role="tabpanel">
                                            <div class="product__details__pic__item">
                                                <img src="/client/img/shop-details/2.jpeg" alt="">
                                            </div>
                                        </div>
                                        <div class="tab-pane" id="tabs-3" role="tabpanel">
                                            <div class="product__details__pic__item">
                                                <img src="/client/img/shop-details/3.jpeg" alt="">
                                            </div>
                                        </div>
                                        <div class="tab-pane" id="tabs-4" role="tabpanel">
                                            <div class="product__details__pic__item">
                                                <img src="/client/img/shop-details/4.jpeg" alt="">
                                                <!-- play video -->
                                                <!-- <a href="https://www.youtube.com/watch?v=8PJ3_p7VqHw&list=RD8PJ3_p7VqHw&start_radio=1"
                                                    class="video-popup"><i class="fa fa-play"></i></a> -->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="product__details__content">
                        <div class="container">
                            <div class="row d-flex justify-content-center">
                                <div class="col-lg-8">
                                    <div class="product__details__text">
                                        <h4>Vintas Vivu - Low Top - Plantation </h4>
                                        <div class="rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-o"></i>
                                            <span> - 5 Reviews</span>
                                        </div>
                                        <h3>750.000 VND<span>1.000.000 VND</span></h3>
                                        <div class="product__details__option">
                                            <div class="product__details__option__size">
                                                <span>Size:</span>
                                                <!-- <label for="36">36
                                                    <input type="radio" id="36">
                                                </label>
                                                <label for="37">37
                                                    <input type="radio" id="37">
                                                </label> -->
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
                                                <!-- <label for="42">42
                                                    <input type="radio" id="42">
                                                </label>
                                                <label for="43">43
                                                    <input type="radio" id="43">
                                                </label> -->
                                            </div>
                                            <div class="product__details__option__color">
                                                <span>Color:</span>
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
                                                <label class="c-9" for="sp-9">
                                                    <input type="radio" id="sp-9">
                                                </label>
                                            </div>
                                        </div>
                                        <div class="product__details__cart__option">
                                            <div class="quantity">
                                                <div class="pro-qty">
                                                    <input type="text" value="1">
                                                </div>
                                            </div>
                                            <a href="#" class="primary-btn">Thêm vào giỏ hàng</a>
                                        </div>
                                        <!-- <div class="product__details__btns__option">
                                            <a href="#"><i class="fa fa-heart"></i> add to wishlist</a>
                                            <a href="#"><i class="fa fa-exchange"></i> Add To Compare</a>
                                        </div> -->
                                        <!-- <div class="product__details__last__option">
                                            <h5><span>Guaranteed Safe Checkout</span></h5>
                                            <img src="/client/img/shop-details/details-payment.png" alt="">
                                            <ul>
                                                <li><span>SKU:</span> 3812912</li>
                                                <li><span>Categories:</span> Clothes</li>
                                                <li><span>Tag:</span> Clothes, Skin, Body</li>
                                            </ul>
                                        </div> -->

                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="product__details__tab">
                                        <ul class="nav nav-tabs" role="tablist">
                                            <li class="nav-item">
                                                <a class="nav-link active" data-toggle="tab" href="#tabs-5"
                                                    role="tab">Thông tin chi tiết</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" data-toggle="tab" href="#tabs-6" role="tab">Đánh giá
                                                    sản phẩm</a>
                                            </li>
                                        </ul>
                                        <div class="tab-content">
                                            <!-- detail form -->
                                            <div class="tab-pane active" id="tabs-5" role="tabpanel">
                                                <div class="product__details__tab__content">
                                                    <!-- <p class="note">Nam tempus turpis at metus scelerisque placerat
                                                        nulla deumantos
                                                        solicitud felis. Pellentesque diam dolor, elementum etos
                                                        lobortis des mollis
                                                        ut risus. Sedcus faucibus an sullamcorper mattis drostique des
                                                        commodo
                                                        pharetras loremos.
                                                    </p> -->
                                                    <div class="product__details__tab__content__item">
                                                        <h5>Thông tin</h5>
                                                        <p> <b>Vintas Vivu - Low Top - Plantation</b>là một trong những
                                                            phiên
                                                            bản giày thuộc dòng Vintas của Ananas, mang phong cách cổ
                                                            điển nhưng vẫn phù hợp với xu hướng thời trang hiện đại.
                                                            Được thiết kế tối giản với gam màu Plantation xanh olive
                                                            trầm, đôi giày này tạo cảm giác vừa thanh lịch vừa năng
                                                            động, dễ dàng phối với nhiều trang phục khác nhau.
                                                        </p>
                                                        <h5>Đặc điểm nổi bật:</h5>
                                                        <ul>
                                                            <li><strong>Chất liệu cao cấp:</strong> Upper làm từ <span
                                                                    class="highlight">vải canvas dệt dày</span>, thoáng
                                                                khí và bền bỉ.</li>
                                                            <li><strong>Đế cao su lưu hóa:</strong> Công nghệ <span
                                                                    class="highlight">vulcanized rubber</span> cho độ
                                                                bám tốt, đàn hồi cao.</li>
                                                            <li><strong>Thiết kế Low Top:</strong> Kiểu dáng cổ thấp
                                                                giúp dễ di chuyển, phù hợp với mọi hoạt động.</li>
                                                            <li><strong>Chi tiết tinh tế:</strong> Logo Ananas dập nổi,
                                                                đường may chắc chắn tạo điểm nhấn đặc trưng.</li>
                                                            <li><strong>Lót giày êm ái:</strong> Sử dụng <span
                                                                    class="highlight">mút EVA cushion</span> giúp giảm
                                                                áp lực khi di chuyển.</li>
                                                        </ul>

                                                        <p>Ananas không chỉ là một đôi giày, mà còn là tuyên ngôn về
                                                            phong cách sống của những người trẻ năng động và sáng tạo!
                                                            🚀👟</p>
                                                    </div>
                                                    <div class="product__details__tab__content__item">
                                                        <h5>Bảng Size</h5>
                                                        <img src="/client/img/shop-details/size.png" alt="img">
                                                        <ul>
                                                            <li>Như các bảng size khác trong ngành giày/dép, Ananas Size
                                                                Chart không thể hướng dẫn bạn chọn đúng size một cách
                                                                hoàn toàn chắc chắn, bởi thực tế luôn có sự chênh lệch
                                                                thông số giữa bàn chân bạn và bàn chân mẫu.</li>
                                                            <li>Chúng tôi khuyến khích bạn nên đến trực tiếp cửa hàng để
                                                                thử size khi mua lần đầu, hoặc hãy cẩn thận thông tin
                                                                đến đội ngũ CS để được hỗ trợ nếu bạn ở xa, nhằm tránh
                                                                tối đa việc "size lệch".</li>
                                                            <li>Đây là bảng size mới được tối ưu hơn khi Ananas có sự bổ
                                                                sung thêm những size lẻ từ ngày 01/06/2023, số liệu có
                                                                thể có sự khác đi đôi chút so với các thông số được in
                                                                trong một số mẫu giày đã phát hành.1</li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- rating form -->
                                            <div class="tab-pane" id="tabs-6" role="tabpanel">
                                                <div class="product__details__tab__content">
                                                    <div class="product__details__tab__content__item">
                                                        <h4>Đánh giá của bạn *</h4>
                                                        <form action="#" method="POST" class="review-form">
                                                            <div class="form-group">
                                                                <div class="star-rating animated-stars">
                                                                    <input type="radio" id="star5" name="rating"
                                                                        value="5">
                                                                    <label for="star5" class="bi bi-star-fill"></label>
                                                                    <input type="radio" id="star4" name="rating"
                                                                        value="4">
                                                                    <label for="star4" class="bi bi-star-fill"></label>
                                                                    <input type="radio" id="star3" name="rating"
                                                                        value="3">
                                                                    <label for="star3" class="bi bi-star-fill"></label>
                                                                    <input type="radio" id="star2" name="rating"
                                                                        value="2">
                                                                    <label for="star2" class="bi bi-star-fill"></label>
                                                                    <input type="radio" id="star1" name="rating"
                                                                        value="1">
                                                                    <label for="star1" class="bi bi-star-fill"></label>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <!-- <label for="review">Your Review</label> -->
                                                                <textarea id="review" name="review" class="form-control"
                                                                    rows="4" required></textarea>
                                                            </div>
                                                            <button type="submit" class="btn btn-primary">Gửi</button>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- Shop Details Section End -->

                <!-- Related Section Begin -->
                <section class="related spad">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <h3 class="related-title">Sản Phẩm Liên Quan</h3>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3 col-md-6 col-sm-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="/client/img/product/1.jpeg">
                                        <span class="label">New</span>
                                        <ul class="product__hover">
                                            <li><a href="#"><img src="/client/img/icon/heart.png" alt=""></a></li>
                                            <li><a href="#"><img src="/client/img/icon/compare.png" alt="">
                                                    <span>Compare</span></a></li>
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
                            <div class="col-lg-3 col-md-6 col-sm-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="/client/img/product/2.jpg">
                                        <ul class="product__hover">
                                            <li><a href="#"><img src="/client/img/icon/heart.png" alt=""></a></li>
                                            <li><a href="#"><img src="/client/img/icon/compare.png" alt="">
                                                    <span>Compare</span></a></li>
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
                            <div class="col-lg-3 col-md-6 col-sm-6 col-sm-6">
                                <div class="product__item sale">
                                    <div class="product__item__pic set-bg" data-setbg="/client/img/product/3.jpeg">
                                        <span class="label">Sale</span>
                                        <ul class="product__hover">
                                            <li><a href="#"><img src="/client/img/icon/heart.png" alt=""></a></li>
                                            <li><a href="#"><img src="/client/img/icon/compare.png" alt="">
                                                    <span>Compare</span></a></li>
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
                            <div class="col-lg-3 col-md-6 col-sm-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="/client/img/product/4.jpg">
                                        <ul class="product__hover">
                                            <li><a href="#"><img src="/client/img/icon/heart.png" alt=""></a></li>
                                            <li><a href="#"><img src="/client/img/icon/compare.png" alt="">
                                                    <span>Compare</span></a></li>
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
                        </div>
                    </div>
                </section>
                <!-- Related Section End -->

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
                <!-- rating -->
                <script>
                    document.querySelectorAll('.star-rating:not(.readonly) label').forEach(star => {
                        star.addEventListener('click', function () {
                            this.style.transform = 'scale(1.2)';
                            setTimeout(() => {
                                this.style.transform = 'scale(1)';
                            }, 200);
                        });
                    });
                </script>
            </body>

            </html>