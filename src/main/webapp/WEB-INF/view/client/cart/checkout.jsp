<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!-- jstl core -->
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!-- form: -->
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%-- format number --%>
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
                                            <h4>Thanh Toán</h4>
                                            <div class="breadcrumb__links">
                                                <a href="./index.html">Home</a>
                                                <a href="./shop.html">Shop</a>
                                                <span>Check Out</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <!-- Breadcrumb Section End -->

                        <!-- Checkout Section Begin -->
                        <section class="checkout spad">
                            <div class="container">
                                <div class="checkout__form">
                                    <form:form action="/place-order" method="post" modelAttribute="cart">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                        <div class="row">
                                            <div class="col-lg-7 col-md-6">
                                                <div class="checkout__input">
                                                    <p>Tên người nhận<span>*</span></p>
                                                    <input name="shipName" type="text" class="checkout__input__add"
                                                        required>
                                                </div>
                                                <div class="checkout__input">
                                                    <p>Địa chỉ nhận<span>*</span></p>
                                                    <input name="shipAddress" type="text" class="checkout__input__add"
                                                        required>
                                                </div>
                                                <div class="checkout__input">
                                                    <p>Số điện thoại<span>*</span></p>
                                                    <input name="shipPhone" type="number" class="checkout__input__add"
                                                        required>
                                                </div>
                                                <div class="checkout__input">
                                                    <p>Ghi chú</p>
                                                    <input name="note" type="text" class="checkout__input__add">
                                                </div>
                                            </div>
                                            <div class="col-lg-5 col-md-6">
                                                <div class="checkout__order">
                                                    <h4 class="order__title">Đơn Hàng</h4>
                                                    <ul class="checkout__total__products">
                                                        <c:forEach items="${cartDetails}" var="cartDetail">
                                                            <li>
                                                                <span
                                                                    style="width: 60%; float: left; font-weight: bold">
                                                                    ${cartDetail.productItem.product.name}
                                                                </span>
                                                                <span
                                                                    style="width: 40%; float: right; text-align: right;">
                                                                    <fmt:formatNumber
                                                                        value="${cartDetail.productItem.product.price}"
                                                                        type="number" groupingUsed="true" /> VNĐ
                                                                </span>
                                                            </li>
                                                            <li>
                                                                <span style="width: 60%; float: left;">
                                                                    Size: ${cartDetail.productItem.size.sizeValue}
                                                                </span>
                                                                <span style="width: 40%">x ${cartDetail.quantity}</span>
                                                            </li>
                                                        </c:forEach>
                                                    </ul>
                                                    <ul class="checkout__total__all">
                                                        <li>Tạm tính
                                                            <span>
                                                                <fmt:formatNumber value="${totalPrice}" type="number"
                                                                    groupingUsed="true" /> VNĐ
                                                            </span>
                                                        </li>
                                                        <c:if test="${totalPrice < 5000}">
                                                            <li style="color: #e53637; font-weight: bold;">
                                                                ⚠️ Số tiền tối thiểu cho VNPay: 5,000 VNĐ
                                                            </li>
                                                        </c:if>
                                                        <li>Tổng Cộng
                                                            <span>
                                                                <fmt:formatNumber value="${totalPrice}" type="number"
                                                                    groupingUsed="true" /> VNĐ
                                                            </span>
                                                        </li>
                                                    </ul>
                                                    <!-- <div class="checkout__input__checkbox">
                                                        <label for="cod">
                                                            Thanh toán khi nhận hàng (COD)
                                                            <input type="checkbox" id="cod" name="payment-method"
                                                                onclick="toggleCheckbox(this)">
                                                            <span class="checkmark"></span>
                                                        </label>
                                                    </div>
                                                    <div class="checkout__input__checkbox">
                                                        <label for="vnpay">
                                                            QR VNPAY
                                                            <input type="checkbox" id="vnpay" name="payment-method"
                                                                onclick="toggleCheckbox(this)">
                                                            <span class="checkmark"></span>
                                                        </label>
                                                    </div> -->

                                                    <!-- Phương thức thanh toán -->
                                                    <div class="mb-3" style="margin-top:16px;">
                                                        <label style="display:block; font-weight:600; margin-bottom:8px;">
                                                            Phương thức thanh toán
                                                        </label>
                                                    
                                                        <label style="display:flex; align-items:center; gap:8px; margin-bottom:6px;">
                                                            <input type="checkbox" name="paymentMethod" value="COD" checked>
                                                            <span>Thanh toán khi nhận hàng (COD)</span>
                                                        </label>
                                                    
                                                        <label style="display:flex; align-items:center; gap:8px;">
                                                            <input type="checkbox" name="paymentMethod" value="VNPAY">
                                                            <span>Thanh toán qua VNPay</span>
                                                        </label>
                                                    </div>

                                                    <button type="submit" class="site-btn">Đặt hàng</button>
                                                    <script>
                                                        function toggleCheckbox(selectedCheckbox) {
                                                            const checkboxes = document.getElementsByName('payment-method');
                                                            checkboxes.forEach(checkbox => {
                                                                if (checkbox !== selectedCheckbox) {
                                                                    checkbox.checked = false;
                                                                }
                                                            });
                                                        }
                                                    </script>
                                                </div>
                                            </div>
                                        </div>
                                    </form:form>
                                </div>
                            </div>
                        </section>
                        <!-- Checkout Section End -->


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
                        <script>
                            // Chỉ cho phép chọn 1 checkbox
                            (function () {
                                const boxes = document.querySelectorAll('input[name="paymentMethod"]');
                                const totalPrice = ${totalPrice};
                                
                                boxes.forEach(box => {
                                    box.addEventListener('change', () => {
                                        if (box.checked) {
                                            boxes.forEach(b => { if (b !== box) b.checked = false; });
                                            
                                            // Cảnh báo nếu chọn VNPay với số tiền < 5,000 VND
                                            if (box.value === 'VNPAY' && totalPrice < 5000) {
                                                alert('⚠️ Cảnh báo: Số tiền tối thiểu cho VNPay là 5,000 VNĐ. Hệ thống sẽ tự động điều chỉnh số tiền.');
                                            }
                                        } else {
                                            // luôn đảm bảo có 1 lựa chọn
                                            box.checked = true;
                                        }
                                    });
                                });

                                // đảm bảo khi submit luôn có 1 giá trị
                                document.querySelector('form')?.addEventListener('submit', (e) => {
                                    const anyChecked = Array.from(boxes).some(b => b.checked);
                                    if (!anyChecked) boxes[0].checked = true; // mặc định COD
                                    
                                    // Cảnh báo cuối cùng trước khi submit
                                    const vnpayBox = document.querySelector('input[value="VNPAY"]');
                                    if (vnpayBox && vnpayBox.checked && totalPrice < 5000) {
                                        if (!confirm('Số tiền hiện tại (' + totalPrice.toLocaleString() + ' VNĐ) nhỏ hơn mức tối thiểu cho VNPay (5,000 VNĐ). Bạn có muốn tiếp tục? Hệ thống sẽ tự động điều chỉnh số tiền.')) {
                                            e.preventDefault();
                                            return false;
                                        }
                                    }
                                });
                            })();
                        </script>
                    </body>

                    </html>