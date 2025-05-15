<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <!-- jstl core -->
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!-- form: -->
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
      <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <!-- <!DOCTYPE html> -->
        <html lang="en">

        <head>
          <meta charset="UTF-8" />
          <meta name="viewport" content="width=device-width, initial-scale=1.0" />
          <title>Update Order Status</title>
          <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
          <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
          <meta http-equiv="X-UA-Compatible" content="IE=edge" />
          <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
          <meta name="description" content="" />
          <meta name="author" content="" />
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
                  <h1 class="mt-4">Cập Nhật Đơn Hàng</h1>
                  <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item active">
                      <a href="/admin">Dashboard</a> / <a href="/admin/order">Order</a> / Update
                    </li>
                  </ol>
                </div>
                <div class="container mt-5">
                  <div class="row">
                    <div class="col-12 mx-auto">
                      <h3>Cập nhật trạng thái đơn hàng #${order.id}</h3>
                      <hr />
                      <form:form method="post" action="/admin/order/update" modelAttribute="order">
                        <!-- Only include necessary fields -->
                        <form:hidden path="id" />
                        
                        <div class="mb-3">
                          <label for="status" class="form-label">Trạng thái đơn hàng:</label>
                          <form:select path="status" class="form-select">
                            <form:option value="PENDING">Chờ xác nhận(Pending)</form:option>
                            <form:option value="PROCESSING">Đang xử lý(Processing)</form:option>
                            <form:option value="SHIPPING">Đang giao hàng(Shipping)</form:option>
                            <form:option value="DELIVERED">Đã giao hàng(Delivered)</form:option>
                            <form:option value="CANCELLED">Đã hủy(Cancelled)</form:option>
                          </form:select>
                        </div>
                        
                        <!-- Order Information (read-only) -->
                        <div class="card mb-4">
                          <div class="card-header">
                            <i class="fas fa-info-circle me-1"></i>
                            Thông tin đơn hàng
                          </div>
                          <div class="card-body">
                            <div class="row mb-2">
                              <div class="col-md-3 fw-bold">Khách hàng:</div>
                              <div class="col-md-9">${order.user.fullname}</div>
                            </div>
                            <div class="row mb-2">
                              <div class="col-md-3 fw-bold">Ngày đặt hàng:</div>
                              <div class="col-md-9">${order.orderDate}</div>
                            </div>
                            <div class="row mb-2">
                              <div class="col-md-3 fw-bold">Tổng tiền:</div>
                              <div class="col-md-9">
                                <fmt:formatNumber value="${order.totalPrice}" type="number" groupingUsed="true" /> VNĐ
                              </div>
                            </div>
                            <div class="row mb-2">
                              <div class="col-md-3 fw-bold">Người nhận:</div>
                              <div class="col-md-9">${order.shipName}</div>
                            </div>
                            <div class="row mb-2">
                              <div class="col-md-3 fw-bold">Số điện thoại:</div>
                              <div class="col-md-9">${order.shipPhone}</div>
                            </div>
                            <div class="row mb-2">
                              <div class="col-md-3 fw-bold">Địa chỉ:</div>
                              <div class="col-md-9">${order.shipAddress}</div>
                            </div>
                            <div class="row mb-2">
                              <div class="col-md-3 fw-bold">Ghi chú:</div>
                              <div class="col-md-9">${order.note}</div>
                            </div>
                          </div>
                        </div>
                        
                        <div class="row mb-3">
                          <div class="col-auto">
                            <button type="submit" class="btn btn-primary">
                              Cập nhật
                            </button>
                          </div>
                          <div class="col-auto">
                            <a href="/admin/order" class="btn btn-secondary">Quay lại</a>
                          </div>
                        </div>
                      </form:form>
                    </div>
                  </div>
                </div>
              </main>

              <!-- footer -->
              <jsp:include page="../layout/footer.jsp" />
            </div>
          </div>
        </body>

        </html>
