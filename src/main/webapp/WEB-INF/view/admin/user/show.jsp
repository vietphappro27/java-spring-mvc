<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <!-- jstl core -->
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!-- form: -->
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
      <!-- <!DOCTYPE html> -->
      <html lang="en">

      <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
          crossorigin="anonymous"></script>
        <!-- <link rel="stylesheet" href="/css/demo.css" /> -->
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Dashboard User</title>
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
                <h1 class="mt-4">Quản lý người dùng</h1>
                <ol class="breadcrumb mb-4">
                  <li class="breadcrumb-item active">
                    <a href="/admin">Dashboard</a> / User
                  </li>
                </ol>
              </div>
              <div class="container mt-5">
                <div class="row">
                  <div class="col-12 mx-auto">
                    <div class="d-flex justify-content-between">
                      <h3>Danh sách người dùng</h3>
                      <a href="/admin/user/create" class="btn btn-primary">
                        Thêm người dùng
                      </a>
                    </div>
                    <hr />
                    <table class="table table-bordered table-hover">
                      <thead>
                        <tr>
                          <th>ID</th>
                          <th>Email</th>
                          <th>Họ tên</th>
                          <th>Vai trò</th>
                          <th>Hành động</th>
                        </tr>
                      </thead>
                      <tbody>
                        <!-- render user -->
                        <c:forEach items="${users}" var="user">
                          <th>${user.id}</th>
                          <td>${user.email}</td>
                          <td>${user.fullname}</td>
                          <td>${user.role.name}</td>
                          <td>
                            <a href="/admin/user/${user.id}" class="btn btn-success">Chi tiết</a>
                            <a href="/admin/user/update/${user.id}" class="btn btn-warning">Cập nhật</a>
                            <a href="/admin/user/delete/${user.id}" class="btn btn-danger">Xóa</a>
                          </td>
                          </tr>
                        </c:forEach>
                      </tbody>
                    </table>
                  </div>
                </div>
                <nav aria-label="Page navigation example">
                  <ul class="pagination justify-content-center">
                    <li class="page-item">
                      <a class="${1 == currentPage ? 'disabled page-link' : 'page-link'}"
                        href="/admin/user?page=${currentPage - 1}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                      </a>
                    </li>
                    <c:forEach begin="0" end="${totalPages - 1}" varStatus="loop">
                      <li class="page-item">
                        <a class="${loop.index + 1 == currentPage ? 'active page-link' : 'page-link'}"
                          href="/admin/user?page=${loop.index + 1}">
                          ${loop.index + 1}
                        </a>
                      </li>
                    </c:forEach>
                    <li class="page-item">
                      <a class="${totalPages == currentPage ? 'disabled page-link' : 'page-link'}"
                        href="/admin/user?page=${currentPage + 1}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                      </a>
                    </li>
                  </ul>
                </nav>
              </div>
            </main>
            <!-- footer -->
            <jsp:include page="../layout/footer.jsp" />
          </div>
        </div>
      </body>

      </html>