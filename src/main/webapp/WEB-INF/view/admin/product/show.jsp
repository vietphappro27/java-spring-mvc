<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <!-- jstl core -->
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!-- form: -->
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
      <!-- form: -->
      <!DOCTYPE html>
      <html lang="en">

      <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Dashboard - SB Admin</title>
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
                <h1 class="mt-4">Quản lý sản phẩm</h1>
                <ol class="breadcrumb mb-4">
                  <li class="breadcrumb-item active">
                    <a href="/admin">Dashboard</a> / Product
                  </li>
                </ol>
              </div>
              <div class="container mt-5">
                <div class="row">
                  <div class="col-12 mx-auto">
                    <div class="d-flex justify-content-between">
                      <h3>Danh sách sản phẩm</h3>
                      <a href="/admin/product/create" class="btn btn-primary">
                        Thêm sản phẩm
                      </a>
                    </div>
                    <hr />
                    <table class="table table-bordered table-hover">
                      <thead>
                        <tr>
                          <th>ID</th>
                          <th>Tên</th>
                          <th>Thương hiệu</th>
                          <th>Danh mục</th>
                          <th>Giá</th>
                          <th>Hành Động</th>
                        </tr>
                      </thead>
                      <tbody>
                        <!-- render user -->
                        <!-- <c:forEach items="${products}" var="product">
                        <th>${product.id}</th>
                        <td>${product.name}</td>
                        <td>${product.price}</td>
                        <td>${product.brand}</td>
                        <td>
                          <a href="/admin/user/${user.id}" class="btn btn-success">View</a>
                          <a href="/admin/user/update/${user.id}" class="btn btn-warning">Update</a>
                          <a href="/admin/user/delete/${user.id}" class="btn btn-danger">Delete</a>
                        </td>
                        </tr>
                      </c:forEach> -->

                        <!-- template -->
                        <tr>
                          <th>1</th>
                          <td>Vans Old Skool</td>
                          <td>Vans</td>
                          <td>All</td>
                          <td>1.200.000 VND</td>
                          <td>
                            <a href="/admin/user/1" class="btn btn-success">View</a>
                            <a href="/admin/user/update/1" class="btn btn-warning">Update</a>
                            <a href="/admin/user/delete/1" class="btn btn-danger">Delete</a>
                          </td>
                        </tr>
                        <tr>
                          <th>2</th>
                          <td>Vintas Vivu - Low Top - Plantation</td>
                          <td>Ananas</td>
                          <td>Men</td>
                          <td>700.000 VND</td>
                          <td>
                            <a href="/admin/user/1" class="btn btn-success">View</a>
                            <a href="/admin/user/update/1" class="btn btn-warning">Update</a>
                            <a href="/admin/user/delete/1" class="btn btn-danger">Delete</a>
                          </td>
                        </tr>
                        <tr>
                          <th>3</th>
                          <td>Ultraboost 5</td>
                          <td>Adidas</td>
                          <td>Woman</td>
                          <td>1.700.000 VND</td>
                          <td>
                            <a href="/admin/user/1" class="btn btn-success">View</a>
                            <a href="/admin/user/update/1" class="btn btn-warning">Update</a>
                            <a href="/admin/user/delete/1" class="btn btn-danger">Delete</a>
                          </td>
                        </tr>
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