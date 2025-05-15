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
          <title>Dashboard Order</title>
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
                  <h1 class="mt-4">Quản Lý đơn Hàng</h1>
                  <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item active">
                      <a href="/admin">Dashboard</a> / Order
                    </li>
                  </ol>
                </div>
                <div class="container mt-5">
                  <div class="row">
                    <div class="col-12 mx-auto">
                      <div class="d-flex justify-content-between">
                        <h3>Danh sách đơn hàng</h3>
                      </div>
                      <hr />
                      <table class="table table-bordered table-hover">
                        <thead>
                          <tr>
                            <th>ID</th>
                            <th>Người mua</th>
                            <th>Ngày đặt hàng</th>
                            <th>Đơn giá</th>
                            <th>Trạng thái</th>
                            <th>Hành Động</th>
                          </tr>
                        </thead>
                        <tbody>
                          <c:forEach items="${orders}" var="order">
                            <tr>
                              <th>${order.id}</th>
                              <td>${order.user.fullname}</td>
                              <td>${order.orderDate}</td>
                              <td>
                                <fmt:formatNumber value="${order.totalPrice}" type="number" groupingUsed="true" /> VNĐ
                              </td>
                              <td>
                                <span class="order-status status-${order.status.toLowerCase()}">${order.status}</span>
                              </td>
                              <td>
                                <a href="/admin/order/${order.id}" class="btn btn-success">Chi tiết</a>
                                <a href="/admin/order/update/${order.id}" class="btn btn-warning">Cập nhật</a>
                                <a href="/admin/order/delete/${order.id}" class="btn btn-danger">Xóa</a>
                              </td>
                            </tr>
                          </c:forEach>
                        </tbody>
                      </table>
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