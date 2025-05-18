<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <!-- jstl core -->
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!-- form: -->
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
      <!-- fmt for number formatting -->
      <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <!-- <!DOCTYPE html> -->
        <html lang="en">

        <head>
          <meta charset="UTF-8" />
          <meta name="viewport" content="width=device-width, initial-scale=1.0" />
          <title>Detail Product</title>
          <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous" />
          <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
          <!-- <link rel="stylesheet" href="/css/demo.css" /> -->
          <meta http-equiv="X-UA-Compatible" content="IE=edge" />
          <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
          <meta name="description" content="" />
          <meta name="author" content="" />
          <title>Dashboard - SB Admin</title>
          <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
          <link href="/css/styles.css" rel="stylesheet" />
          <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
          <script>
            $(document).ready(function () {
              // Bật chế độ chỉnh sửa khi click vào nút Edit
              $(".edit-item-btn").click(function () {
                const row = $(this).closest("tr");
                row.find(".display-mode").hide();
                row.find(".edit-mode").show();
              });

              // Hủy chỉnh sửa
              $(".cancel-edit-btn").click(function () {
                const row = $(this).closest("tr");
                row.find(".edit-mode").hide();
                row.find(".display-mode").show();
              });
            });
          </script>
        </head>

        <body>
          <!-- header -->
          <jsp:include page="../layout/header.jsp" />
          <!-- header -->
          <div id="layoutSidenav">
            <!-- sidebar -->
            <jsp:include page="../layout/sidebar.jsp" />
            <div id="layoutSidenav_content">
              <main>
                <div class="container-fluid px-4">
                  <h1 class="mt-4">Quản lý sản phẩm</h1>
                  <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item active">
                      <a href="/admin">Dashboard</a> / <a href="/admin/product">Product</a> / Detail
                    </li>
                  </ol>
                </div>
                <div class="container mt-5">
                  <div class="row">
                    <div class="col-12 mx-auto">
                      <div class="d-flex justify-content-between">
                        <h3>Chi tiết sản phẩm #${product.id}</h3>
                      </div>
                      <hr />
                      <div class="card mb-4">
                        <div class="card-header">Thông tin sản phẩm</div>
                        <div class="card-body">
                          <div class="row">
                            <div class="col-md-4">
                              <div class="d-flex justify-content-center p-3">
                                <img src="${pageContext.request.contextPath}/images/product/${product.image}"
                                  style="width: 200px; height: 200px; object-fit: cover;" alt="img" />
                              </div>
                            </div>
                            <div class="col-md-8">
                              <ul class="list-group list-group-flush">
                                <li class="list-group-item">ID: ${product.id}</li>
                                <li class="list-group-item">Tên: ${product.name}</li>
                                <li class="list-group-item">Giá:
                                  <fmt:formatNumber value="${product.price}" type="number" groupingUsed="true" /> VNĐ
                                </li>
                                <li class="list-group-item">Thương hiệu: ${product.brand}</li>
                                <li class="list-group-item">Danh mục: ${product.category}</li>
                                <li class="list-group-item">Mô tả: ${product.description}</li>
                              </ul>
                            </div>
                          </div>
                        </div>
                      </div>
                      <!-- Product Items Section -->
                      <div class="card mb-4">
                        <div class="card-header">
                          <div class="d-flex justify-content-between align-items-center">
                            <div>Danh sách biến thể</div>
                            <button class="btn btn-sm btn-primary" id="addNewItemBtn">Thêm biến thể</button>
                          </div>
                        </div>
                        <div class="card-body">
                          <div class="table-responsive">
                            <table class="table table-bordered">
                              <thead>
                                <tr>
                                  <th>ID</th>
                                  <th>Size</th>
                                  <th>Số lượng</th>
                                  <th>Đã bán</th>
                                  <th>Hành động</th>
                                </tr>
                              </thead>
                              <tbody>
                                <c:forEach items="${product.productItems}" var="item">
                                  <tr>
                                    <td>${item.id}</td>
                                    <td>
                                      <span class="display-mode">${item.size.sizeValue}</span>
                                      <div class="edit-mode" style="display:none;">
                                        <form action="/admin/product/item/update" method="post">
                                          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                          <input type="hidden" name="itemId" value="${item.id}">
                                          <input type="hidden" name="productId" value="${product.id}">
                                          <select name="sizeId" class="form-select form-select-sm">
                                            <c:forEach items="${sizes}" var="size">
                                              <option value="${size.id}" ${item.size.id==size.id ? 'selected' : '' }>
                                                ${size.sizeValue}</option>
                                            </c:forEach>
                                          </select>
                                      </div>
                                    </td>
                                    <td>
                                      <span class="display-mode">${item.quantity}</span>
                                      <div class="edit-mode" style="display:none;">
                                        <input type="number" name="quantity" class="form-control form-control-sm"
                                          value="${item.quantity}" min="0">
                                      </div>
                                    </td>
                                    <td>${item.sold}</td>
                                    <td>
                                      <div class="display-mode">
                                        <button type="button"
                                          class="btn btn-sm btn-warning edit-item-btn">Cập nhật</button>
                                        <a href="/admin/product/item/delete/${item.id}?productId=${product.id}"
                                          class="btn btn-sm btn-danger"
                                          onclick="return confirm('Bạn có chắc chắn muốn xóa biến thể này?')">Xóa</a>
                                      </div>
                                      <div class="edit-mode" style="display:none;">
                                        <button type="submit" class="btn btn-sm btn-success">Lưu</button>
                                        <button type="button"
                                          class="btn btn-sm btn-secondary cancel-edit-btn">Hủy</button>
                                        </form>
                                      </div>
                                    </td>
                                  </tr>
                                </c:forEach>
                              </tbody>
                            </table>
                          </div>
                        </div>
                      </div>
                      <a href="/admin/product/update/${product.id}" class="btn btn-primary">Cập nhật sản phẩm</a>
                      <a href="/admin/product" class="btn btn-secondary"> Quay lại </a>
                    </div>
                  </div>
                </div>
              </main>
              <!-- footer -->
              <jsp:include page="../layout/footer.jsp" />
            </div>
          </div>

          <!-- Modal for adding new product item -->
          <div class="modal fade" id="addItemModal" tabindex="-1" aria-labelledby="addItemModalLabel"
            aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="addItemModalLabel">Thêm biến thể</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="/admin/product/item/add" method="post">
                  <div class="modal-body">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    <input type="hidden" name="productId" value="${product.id}">
                    <div class="mb-3">
                      <label for="sizeId" class="form-label">Size</label>
                      <select id="sizeId" name="sizeId" class="form-select" required>
                        <c:forEach items="${sizes}" var="size">
                          <option value="${size.id}">${size.sizeValue}</option>
                        </c:forEach>
                      </select>
                    </div>
                    <div class="mb-3">
                      <label for="quantity" class="form-label">Số lượng</label>
                      <input type="number" class="form-control" id="quantity" name="quantity" min="1" required>
                    </div>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                    <button type="submit" class="btn btn-primary">Thêm</button>
                  </div>
                </form>
              </div>
            </div>
          </div>

          <script>
            // Initialize modal for adding new items
            document.getElementById('addNewItemBtn').addEventListener('click', function () {
              const modal = new bootstrap.Modal(document.getElementById('addItemModal'));
              modal.show();
            });
          </script>
        </body>

        </html>