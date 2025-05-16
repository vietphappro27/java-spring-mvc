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
                    <title>Lịch sử đơn hàng | PShoes</title>

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
                    <style>
                        .order-card {
                            margin-bottom: 30px;
                            border: 1px solid #e5e5e5;
                            border-radius: 5px;
                            overflow: hidden;
                        }
                        
                        .order-header {
                            background-color: #f5f5f5;
                            padding: 15px;
                            border-bottom: 1px solid #e5e5e5;
                        }
                        
                        .order-body {
                            padding: 15px;
                        }
                        
                        .order-items {
                            margin-top: 15px;
                        }
                        
                        .order-item {
                            padding: 10px;
                            border-bottom: 1px solid #f0f0f0;
                        }
                        
                        .order-item:last-child {
                            border-bottom: none;
                        }
                        
                        .order-footer {
                            background-color: #f9f9f9;
                            padding: 15px;
                            border-top: 1px solid #e5e5e5;
                        }
                        
                        .status-badge {
                            padding: 5px 10px;
                            border-radius: 3px;
                            font-size: 12px;
                            font-weight: 600;
                            text-transform: uppercase;
                            color: #fff;
                        }
                        
                        .status-pending {
                            background-color: #ffc107;
                        }
                        
                        .status-processing {
                            background-color: #17a2b8;
                        }
                        
                        .status-shipping {
                            background-color: #007bff;
                        }
                        
                        .status-delivered {
                            background-color: #28a745;
                        }
                        
                        .status-cancelled {
                            background-color: #dc3545;
                        }
                        
                        .product-image {
                            width: 60px;
                            height: 60px;
                            object-fit: cover;
                        }
                        
                        .accordion-button:not(.collapsed) {
                            background-color: #f8f9fa;
                            color: #212529;
                        }
                        
                        .accordion-button:focus {
                            box-shadow: none;
                        }
                    </style>
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
                                        <h4>Lịch sử đơn hàng</h4>
                                        <div class="breadcrumb__links">
                                            <a href="/">Home</a>
                                            <a href="/product">Product</a>
                                            <span>Order History</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <!-- Breadcrumb Section End -->

                    <!-- Order History Section Begin -->
                    <section class="order-history spad">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12">
                                    <h5 class="mb-4">Danh sách đơn hàng của bạn</h5>

                                    <c:if test="${empty orders}">
                                        <div class="text-center py-5">
                                            <i class="fa fa-shopping-bag fa-4x mb-3 text-muted"></i>
                                            <h5>Bạn chưa có đơn hàng nào</h5>
                                            <p class="text-muted">Hãy mua sắm và quay lại đây để xem lịch sử đơn hàng của bạn.</p>
                                            <a href="/product" class="primary-btn mt-3">Mua sắm ngay</a>
                                        </div>
                                    </c:if>

                                    <c:if test="${not empty orders}">
                                        <div class="accordion" id="orderAccordion">
                                            <c:forEach items="${orders}" var="order">
                                                <div class="order-card">
                                                    <div class="order-header">
                                                        <div class="row align-items-center">
                                                            <div class="col-md-3">
                                                                <h6 class="mb-0">Mã đơn hàng: #${order.id}</h6>
                                                            </div>
                                                            <div class="col-md-3">
                                                                <span class="text-muted">Ngày đặt: ${order.orderDate}</span>
                                                            </div>
                                                            <div class="col-md-3">
                                                                <span class="status-badge 
                                                                    <c:choose>
                                                                        <c:when test="${order.status eq 'PENDING'}">status-pending</c:when>
                                                                        <c:when test="${order.status eq 'PROCESSING'}">status-processing</c:when>
                                                                        <c:when test="${order.status eq 'SHIPPING'}">status-shipping</c:when>
                                                                        <c:when test="${order.status eq 'DELIVERED'}">status-delivered</c:when>
                                                                        <c:when test="${order.status eq 'CANCELLED'}">status-cancelled</c:when>
                                                                    </c:choose>
                                                                ">
                                                                    <c:choose>
                                                                        <c:when test="${order.status eq 'PENDING'}">Chờ xác nhận</c:when>
                                                                        <c:when test="${order.status eq 'PROCESSING'}">Đang xử lý</c:when>
                                                                        <c:when test="${order.status eq 'SHIPPING'}">Đang giao hàng</c:when>
                                                                        <c:when test="${order.status eq 'DELIVERED'}">Đã giao hàng</c:when>
                                                                        <c:when test="${order.status eq 'CANCELLED'}">Đã hủy</c:when>
                                                                        <c:otherwise>${order.status}</c:otherwise>
                                                                    </c:choose>
                                                                </span>
                                                            </div>
                                                            <div class="col-md-3 text-end">
                                                                <button class="btn btn-sm btn-link text-dark toggle-details" type="button" 
                                                                    data-order-id="${order.id}">
                                                                    Chi tiết <i class="fa fa-angle-down ms-1"></i>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div id="order${order.id}" class="order-details" style="display: none;">
                                                        <div class="order-body">
                                                            <div class="row mb-3">
                                                                <div class="col-md-6">
                                                                    <h6>Thông tin giao hàng</h6>
                                                                    <p class="mb-1"><strong>Người nhận:</strong> ${order.shipName}</p>
                                                                    <p class="mb-1"><strong>Số điện thoại:</strong> ${order.shipPhone}</p>
                                                                    <p class="mb-1"><strong>Địa chỉ:</strong> ${order.shipAddress}</p>
                                                                    <c:if test="${not empty order.note}">
                                                                        <p class="mb-1"><strong>Ghi chú:</strong> ${order.note}</p>
                                                                    </c:if>
                                                                </div>
                                                            </div>

                                                            <h6>Sản phẩm đã đặt</h6>
                                                            <div class="order-items">
                                                                <c:forEach items="${orderDetailMap[order.id]}" var="orderDetail">
                                                                    <div class="order-item">
                                                                        <div class="row align-items-center">
                                                                            <div class="col-md-2">
                                                                                <img src="/images/product/${orderDetail.productItem.product.image}"
                                                                                    alt="${orderDetail.productItem.product.name}"
                                                                                    class="product-image">
                                                                            </div>
                                                                            <div class="col-md-5">
                                                                                <h6 class="mb-1">${orderDetail.productItem.product.name}</h6>
                                                                                <p class="text-muted mb-0">Size: ${orderDetail.productItem.size.sizeValue}</p>
                                                                            </div>
                                                                            <div class="col-md-2 text-center">
                                                                                <span>x${orderDetail.quantity}</span>
                                                                            </div>
                                                                            <div class="col-md-3 text-end">
                                                                                <fmt:formatNumber value="${orderDetail.price}" type="number" groupingUsed="true" /> VNĐ
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </c:forEach>
                                                            </div>
                                                        </div>
                                                        <div class="order-footer">
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <c:if test="${order.status eq 'PENDING'}">
                                                                        <form action="/cancel-order/${order.id}" method="post" onsubmit="return confirm('Bạn có chắc chắn muốn hủy đơn hàng này?');">
                                                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                                                            <button type="submit" class="btn btn-sm btn-outline-danger">Hủy đơn hàng</button>
                                                                        </form>
                                                                    </c:if>
                                                                </div>
                                                                <div class="col-md-6 text-end">
                                                                    <h6 class="mb-0">Tổng tiền: <fmt:formatNumber value="${order.totalPrice}" type="number" groupingUsed="true" /> VNĐ</h6>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </section>
                    <!-- Order History Section End -->

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
                    <!-- Custom script for accordion -->
                    <script>
                        $(document).ready(function() {
                            // Manual toggle for accordion
                            $('.toggle-details').on('click', function() {
                                var orderId = $(this).data('order-id');
                                $('#order' + orderId).slideToggle();
                            });
                        });
                    </script>
                </body>

                </html>
