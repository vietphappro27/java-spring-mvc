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
                <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
                                <%-- anh phu --%>
                                <div class="col-lg-3 col-md-3">
                                    <%-- <ul class="nav nav-tabs" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">
                                                <div class="product__thumb__pic set-bg"
                                                    data-setbg="/client/img/shop-details/1.jpeg">
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
                                                </div>
                                            </a>
                                        </li>
                                    </ul> --%>
                                </div>
                                <%-- anh chinh --%>
                                <div class="col-lg-6 col-md-9">
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                            <div class="product__details__pic__item">
                                                <img src="/images/product/${product.image}" alt="">
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
                                        <form action="/add-productItem-to-cart/${product.id}" method="post">
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                            <h4>${product.name}</h4>
                                            <h3><fmt:formatNumber value="${product.price}" type="number" groupingUsed="true"/> VND</h3>
                                            <div class="product__details__option">
                                                <div class="product__details__option__size">
                                                    <span>Size:</span>
                                                    <c:forEach items="${sizes}" var="size" varStatus="status">
                                                        <label for="${size.id}" ${status.first ? 'class="active"' : ''}>${size.sizeValue}
                                                            <input type="radio" id="${size.id}" name="sizeId" value="${size.id}" ${status.first ? 'checked' : ''}>
                                                        </label>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                            <div class="product__details__cart__option">
                                                <div class="quantity">
                                                    <div class="pro-qty">
                                                        <input type="text" name="quantity" value="1">
                                                    </div>
                                                </div>
                                                <button type="submit" class="primary-btn">Thêm vào giỏ hàng</button>
                                            </div>
                                        </form>
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
                                            <%-- <li class="nav-item">
                                                <a class="nav-link" data-toggle="tab" href="#tabs-6" role="tab">Đánh giá
                                                    sản phẩm</a>
                                            </li> --%>
                                        </ul>
                                        <div class="tab-content">
                                            <!-- detail form -->
                                            <div class="tab-pane active" id="tabs-5" role="tabpanel">
                                                <div class="product__details__tab__content">
                                                    <div class="product__details__tab__content__item">
                                                    ${product.description}
                                                    </div>
                                                    <%-- <div class="product__details__tab__content__item">
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
                                                    </div> --%>
                                                </div>
                                            </div>
                                            <!-- rating form -->
                                            <%-- <div class="tab-pane" id="tabs-6" role="tabpanel">
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
                                            </div> --%>
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
                                    <%-- <a href="#" class="add-cart">+ Add To Cart</a> --%>
                                    <h5><fmt:formatNumber value="${product.price}" type="number" groupingUsed="true"/> VNĐ</h5>
                                    </div>
                                </div>
                                </div>
                            </c:forEach>
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