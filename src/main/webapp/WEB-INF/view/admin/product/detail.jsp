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
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
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
          $(document).ready(function() {
            // Bật chế độ chỉnh sửa khi click vào nút Edit
            $(".edit-item-btn").click(function() {
              const row = $(this).closest("tr");
              row.find(".display-mode").hide();
              row.find(".edit-mode").show();
            });

            // Hủy chỉnh sửa
            $(".cancel-edit-btn").click(function() {
              const row = $(this).closest("tr");
              row.find(".edit-mode").hide();
              row.find(".display-mode").show();
            });
          });
        </script>
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
                <h1 class="mt-4">Manage Product</h1>
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
                      <h3>Detail Product ${product.id}</h3>
                    </div>
                    <hr />
                    <div class="card mb-4">
                      <div class="card-header">Information Product</div>
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
                              <li class="list-group-item">Name: ${product.name}</li>
                              <li class="list-group-item">Price: <fmt:formatNumber value="${product.price}" type="number" groupingUsed="true"/> VNĐ</li>
                              <li class="list-group-item">Brand: ${product.brand}</li>
                              <li class="list-group-item">Category: ${product.category}</li>
                              <li class="list-group-item">Description: ${product.description}</li>
                            </ul>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- Product Items Section -->
                    <div class="card mb-4">
                      <div class="card-header">
                        <div class="d-flex justify-content-between align-items-center">
                          <div>Product Items</div>
                          <button class="btn btn-sm btn-primary" id="addNewItemBtn">Add New Item</button>
                        </div>
                      </div>
                      <div class="card-body">
                        <div class="table-responsive">
                          <table class="table table-bordered">
                            <thead>
                              <tr>
                                <th>ID</th>
                                <th>Size</th>
                                <th>Quantity</th>
                                <th>Sold</th>
                                <th>Actions</th>
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
                                        <input type="hidden" name="itemId" value="${item.id}">
                                        <input type="hidden" name="productId" value="${product.id}">
                                        <select name="sizeId" class="form-select form-select-sm">
                                          <c:forEach items="${sizes}" var="size">
                                            <option value="${size.id}" ${item.size.id == size.id ? 'selected' : ''}>${size.sizeValue}</option>
                                          </c:forEach>
                                        </select>
                                      </div>
                                  </td>
                                  <td>
                                    <span class="display-mode">${item.quantity}</span>
                                    <div class="edit-mode" style="display:none;">
                                      <input type="number" name="quantity" class="form-control form-control-sm" value="${item.quantity}" min="0">
                                    </div>
                                  </td>
                                  <td>${item.sold}</td>
                                  <td>
                                    <div class="display-mode">
                                      <button type="button" class="btn btn-sm btn-warning edit-item-btn">Update</button>
                                      <a href="/admin/product/item/delete/${item.id}?productId=${product.id}" class="btn btn-sm btn-danger" 
                                        onclick="return confirm('Are you sure you want to delete this item?')">Delete</a>
                                    </div>
                                    <div class="edit-mode" style="display:none;">
                                      <button type="submit" class="btn btn-sm btn-success">Save</button>
                                      <button type="button" class="btn btn-sm btn-secondary cancel-edit-btn">Cancel</button>
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
                    <a href="/admin/product" class="btn btn-secondary"> Back </a>
                    <a href="/admin/product/update/${product.id}" class="btn btn-primary">Update Product</a>
                  </div>
                </div>
              </div>
            </main>
            <!-- footer -->
            <jsp:include page="../layout/footer.jsp" />
          </div>
        </div>

        <!-- Modal for adding new product item -->
        <div class="modal fade" id="addItemModal" tabindex="-1" aria-labelledby="addItemModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="addItemModalLabel">Add New Product Item</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <form action="/admin/product/item/add" method="post">
                <div class="modal-body">
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
                    <label for="quantity" class="form-label">Quantity</label>
                    <input type="number" class="form-control" id="quantity" name="quantity" min="1" required>
                  </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                  <button type="submit" class="btn btn-primary">Add Item</button>
                </div>
              </form>
            </div>
          </div>
        </div>

        <script>
          // Initialize modal for adding new items
          document.getElementById('addNewItemBtn').addEventListener('click', function() {
            const modal = new bootstrap.Modal(document.getElementById('addItemModal'));
            modal.show();
          });
        </script>
      </body>

      </html>