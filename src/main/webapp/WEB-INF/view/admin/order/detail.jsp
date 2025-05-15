<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <!-- jstl core -->
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!-- form: -->
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
      <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <!-- <!DOCTYPE html> -->
        <html lang="en">

        <head>
          <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous" />
          <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
          <!-- <link rel="stylesheet" href="/css/demo.css" /> -->
          <meta charset="utf-8" />
          <meta http-equiv="X-UA-Compatible" content="IE=edge" />
          <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
          <meta name="description" content="" />
          <meta name="author" content="" />
          <title>Chi tiết đơn hàng #${order.id}</title>
          <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
          <link href="/css/styles.css" rel="stylesheet" />
          <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        </head>

        <body>
          <!-- header -->
          <jsp:include page="../layout/header.jsp" />
          <div id="layoutSidenav">
            <!-- sidebar -->
            <jsp:include page="../layout/sidebar.jsp" />

            <div id="layoutSidenav_content">
              <main>
                <div class="container-fluid px-4">
                  <h1 class="mt-4">Chi tiết đơn hàng #${order.id}</h1>
                  <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item">
                      <a href="/admin">Dashboard</a> / <a href="/admin/order">Order</a> / Detail
                    </li>
                  </ol>

                  <!-- Order Details Section -->
                  <div class="row mt-4">
                    <!-- Order Info Column -->
                    <div class="col-lg-6">
                      <!-- Order Information -->
                      <div class="card mb-4">
                        <div class="card-header">
                          <i class="fas fa-info-circle me-1"></i>
                          Thông tin đơn hàng
                        </div>
                        <div class="card-body">
                          <div class="row mb-2">
                            <div class="col-md-4 fw-bold">Mã đơn hàng:</div>
                            <div class="col-md-8">#${order.id}</div>
                          </div>
                          <div class="row mb-2">
                            <div class="col-md-4 fw-bold">Ngày đặt hàng:</div>
                            <div class="col-md-8">${order.orderDate}</div>
                          </div>
                          <div class="row mb-2">
                            <div class="col-md-4 fw-bold">Trạng thái:</div>
                            <div class="col-md-8">
                              <span class="order-status status-${order.status.toLowerCase()}">${order.status}</span>
                            </div>
                          </div>
                          <div class="row mb-2">
                            <div class="col-md-4 fw-bold">Tổng thanh toán:</div>
                            <div class="col-md-8 fw-bold text-danger">
                              <fmt:formatNumber value="${order.totalPrice}" type="number" groupingUsed="true" /> VNĐ
                            </div>
                          </div>
                          <%-- <div class="row mb-2">
                            <div class="col-md-4 fw-bold">Phương thức thanh toán:</div>
                            <div class="col-md-8">${order.paymentMethod}</div>
                          </div> --%>
                          <div class="row mb-2">
                            <div class="col-md-4 fw-bold">Ghi chú:</div>
                            <div class="col-md-8">${order.note}</div>
                          </div>
                        </div>
                      </div>
                    </div>

                    <!-- Customer Info Column -->
                    <div class="col-lg-6">
                      <!-- Customer Information -->
                      <div class="card mb-4">
                        <div class="card-header">
                          <i class="fas fa-user me-1"></i>
                          Thông tin khách hàng
                        </div>
                        <div class="card-body">
                          <div class="row mb-2">
                            <div class="col-md-4 fw-bold">Khách hàng:</div>
                            <div class="col-md-8">${order.user.fullname}</div>
                          </div>
                          <div class="row mb-2">
                            <div class="col-md-4 fw-bold">Email:</div>
                            <div class="col-md-8">${order.user.email}</div>
                          </div>
                          <div class="row mb-2">
                            <div class="col-md-4 fw-bold">Người nhận:</div>
                            <div class="col-md-8">${order.shipName}</div>
                          </div>
                          <div class="row mb-2">
                            <div class="col-md-4 fw-bold">Số điện thoại:</div>
                            <div class="col-md-8">${order.shipPhone}</div>
                          </div>
                          <div class="row mb-2">
                            <div class="col-md-4 fw-bold">Địa chỉ giao hàng:</div>
                            <div class="col-md-8">${order.shipAddress}</div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>

                  <!-- Order Items Table -->
                  <div class="card mb-4">
                    <div class="card-header">
                      <i class="fas fa-table me-1"></i>
                      Danh sách sản phẩm
                    </div>
                    <div class="card-body">
                      <table class="table table-striped table-hover">
                        <thead>
                          <tr>
                            <th>Ảnh</th>
                            <th>Sản phẩm</th>
                            <th>Size</th>
                            <th>Đơn giá</th>
                            <th>Số lượng</th>
                            <th>Thành tiền</th>
                          </tr>
                        </thead>
                        <tbody>
                          <c:forEach items="${orderDetails}" var="detail">
                            <tr>
                              <td>
                                <img src="/images/product/${detail.productItem.product.image}" alt="${detail.productItem.product.name}" class="product-image">
                              </td>
                              <td>${detail.productItem.product.name}</td>
                              <td>${detail.productItem.size.sizeValue}</td>
                              <td><fmt:formatNumber value="${detail.productItem.product.price}" type="number" groupingUsed="true" /> VNĐ</td>
                              <td>${detail.quantity}</td>
                              <td><fmt:formatNumber value="${detail.productItem.product.price * detail.quantity}" type="number" groupingUsed="true" /> VNĐ</td>
                            </tr>
                          </c:forEach>
                        </tbody>
                        <tfoot>
                          <tr>
                            <td colspan="5" class="text-end fw-bold">Tổng cộng:</td>
                            <td class="fw-bold text-danger"><fmt:formatNumber value="${order.totalPrice}" type="number" groupingUsed="true" /> VNĐ</td>
                          </tr>
                        </tfoot>
                      </table>
                    </div>
                  </div>

                  <!-- Order Status Timeline -->
                  <%-- <div class="card mb-4">
                    <div class="card-header">
                      <i class="fas fa-history me-1"></i>
                      Lịch sử đơn hàng
                    </div>
                    <div class="card-body">
                      <div class="timeline">
                        <div class="timeline-item">
                          <div class="timeline-date">${order.orderDate}</div>
                          <div class="fw-bold">Đơn hàng đã được tạo</div>
                          <p>Đơn hàng #${order.id} đã được tạo thành công.</p>
                        </div>
                        
                        <c:if test="${order.status != 'PENDING'}">
                          <div class="timeline-item">
                            <div class="timeline-date"><!-- Date would go here --></div>
                            <div class="fw-bold">Đơn hàng đã được xác nhận</div>
                            <p>Đơn hàng của bạn đã được xác nhận và đang được xử lý.</p>
                          </div>
                        </c:if>
                        
                        <c:if test="${order.status == 'SHIPPING' || order.status == 'DELIVERED'}">
                          <div class="timeline-item">
                            <div class="timeline-date"><!-- Date would go here --></div>
                            <div class="fw-bold">Đơn hàng đang được giao</div>
                            <p>Đơn hàng của bạn đã được giao cho đơn vị vận chuyển.</p>
                          </div>
                        </c:if>
                        
                        <c:if test="${order.status == 'DELIVERED'}">
                          <div class="timeline-item">
                            <div class="timeline-date"><!-- Date would go here --></div>
                            <div class="fw-bold">Giao hàng thành công</div>
                            <p>Đơn hàng đã được giao thành công.</p>
                          </div>
                        </c:if>
                        
                        <c:if test="${order.status == 'CANCELLED'}">
                          <div class="timeline-item">
                            <div class="timeline-date"><!-- Date would go here --></div>
                            <div class="fw-bold">Đơn hàng đã bị hủy</div>
                            <p>Đơn hàng đã bị hủy.</p>
                          </div>
                        </c:if>
                      </div>
                    </div>
                  </div> --%>

                  <!-- Action Buttons -->
                  <div class="mb-4 d-flex gap-2">
                    <a href="/admin/order/update/${order.id}" class="btn btn-primary">
                      <i class="fas fa-edit me-1"></i> Cập nhật trạng thái
                    </a>
                    <%-- <c:if test="${order.status != 'DELIVERED' && order.status != 'CANCELLED'}">
                      <a href="/admin/order/cancel/${order.id}" class="btn btn-danger" onclick="return confirm('Bạn có chắc chắn muốn hủy đơn hàng này?')">
                        <i class="fas fa-times me-1"></i> Hủy đơn hàng
                      </a>
                    </c:if> --%>
                    <button class="btn btn-success" onclick="window.print()">
                      <i class="fas fa-print me-1"></i> In đơn hàng
                    </button>
                    <a href="/admin/order" class="btn btn-secondary">
                      <i class="fas fa-arrow-left me-1"></i> Quay lại
                    </a>
                  </div>
                </div>
              </main>
              <!-- footer -->
              <jsp:include page="../layout/footer.jsp" />
            </div>
          </div>
        </body>

        </html>