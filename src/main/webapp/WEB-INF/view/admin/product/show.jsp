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
        <!-- fmt for number formatting -->
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                        <!-- render product -->
                        <c:forEach items="${products}" var="product">
                          <th>${product.id}</th>
                          <td>
                            <img src="/images/product/${product.image}" alt="product image"
                              style="width: 100px; height: 100px;">
                            <span>${product.name}</span>
                          </td>
                          <td>${product.brand}</td>
                          <td>${product.category}</td>
                          <td>
                            <fmt:formatNumber value="${product.price}" type="number" groupingUsed="true" /> VNĐ
                          </td>
                          <td>
                            <a href="/admin/product/${product.id}" class="btn btn-success">Chi tiết</a>
                            <a href="/admin/product/update/${product.id}" class="btn btn-warning">Cập nhật</a>
                            <a href="/admin/product/delete/${product.id}" class="btn btn-danger">Xóa</a>
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
                        href="/admin/product?page=${currentPage - 1}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                      </a>
                    </li>
                    <c:forEach begin="0" end="${totalPages - 1}" varStatus="loop">
                      <li class="page-item">
                        <a class="${loop.index + 1 == currentPage ? 'active page-link' : 'page-link'}"
                          href="/admin/product?page=${loop.index + 1}">
                          ${loop.index + 1}
                        </a>
                      </li>
                    </c:forEach>
                    <li class="page-item">
                      <a class="${totalPages == currentPage ? 'disabled page-link' : 'page-link'}"
                        href="/admin/product?page=${currentPage + 1}" aria-label="Next">
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