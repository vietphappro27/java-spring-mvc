<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!-- jstl core -->
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!-- form: -->
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!-- <!DOCTYPE html> -->
            <html lang="en">

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>Document</title>
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
                    $(document).ready(() => {
                        const avatarFile = $("#avatarFile");
                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#avatarPreview").attr("src", imgURL);
                            $("#avatarPreview").css({ "display": "block" });
                        });
                    });
                </script>
                <script>
                    $(document).ready(() => {
                        let itemIndex = 0;

                        // Thêm ProductItem mới
                        $("#addProductItem").click(function () {
                            const newItemHtml = `
                                <div class="product-item row mb-3" id="productItem_${itemIndex}">
                                    <div class="col-12 col-md-3">
                                        <label class="form-label">Size:</label>
                                        <select class="form-select" name="productItems[${itemIndex}].size.id" required>
                                            <c:forEach items="${sizes}" var="size">
                                                <option value="${size.id}">${size.sizeValue}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="col-12 col-md-3">
                                        <label class="form-label">Quantity:</label>
                                        <input type="number" class="form-control" name="productItems[${itemIndex}].quantity" min="0" required />
                                    </div>
                                    <div class="col-12 col-md-3 d-flex align-items-end">
                                        <button type="button" class="btn btn-danger remove-product-item" data-index="${itemIndex}">Remove</button>
                                    </div>
                                </div>`;
                            $("#productItemsContainer").append(newItemHtml);
                            itemIndex++;
                            
                            // Hide error message if at least one item is added
                            $("#itemError").hide();
                            
                            // Renumber indices after removal
                            renumberIndices();
                        });

                        // Xóa ProductItem
                        $(document).on("click", ".remove-product-item", function () {
                            $(this).closest(".product-item").remove();
                            
                            // Renumber indices after removal
                            renumberIndices();
                            
                            // Show error if no items left
                            if ($(".product-item").length === 0) {
                                $("#itemError").show();
                            }
                        });
                        
                        // Renumber all indices to ensure continuous sequence
                        function renumberIndices() {
                            $(".product-item").each(function(idx) {
                                const item = $(this);
                                item.attr("id", "productItem_" + idx);
                                
                                // Update size select name
                                item.find("select").attr("name", "productItems[" + idx + "].size.id");
                                
                                // Update quantity input name
                                item.find("input[type='number']").attr("name", "productItems[" + idx + "].quantity");
                                
                                // Update remove button data-index
                                item.find(".remove-product-item").attr("data-index", idx);
                            });
                        }
                        
                        // Form validation before submit
                        $("form").submit(function(event) {
                            if ($(".product-item").length === 0) {
                                $("#itemError").show();
                                event.preventDefault();
                                return false;
                            }
                            return true;
                        });
                        
                        // Show error message initially
                        $("#itemError").show();
                    });
                </script>
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
                                        <h3>Create a product</h3>
                                        <hr />
                                        <form:form method="post" action="/admin/product/create"
                                            modelAttribute="newProduct" class="row" enctype="multipart/form-data">
                                            <div class="mb-3 col-12 col-md-6">
                                                <label class="form-label">Name:</label>
                                                <form:input type="text" class="form-control" path="name" />
                                            </div>
                                            <div class="mb-3 col-12 col-md-6">
                                                <label class="form-label">Price:</label>
                                                <form:input type="number" class="form-control" path="price" />
                                            </div>
                                            <div class="mb-3 col-12 col-md-6">
                                                <label class="form-label"> Brand: </label>
                                                <form:select class="form-select" path="brand">
                                                    <form:option value="Nike">Nike</form:option>
                                                    <form:option value="Adidas">Adidas</form:option>
                                                    <form:option value="Vans">Vans</form:option>
                                                    <form:option value="Converse">Converse</form:option>
                                                </form:select>
                                            </div>
                                            <div class="mb-3 col-12 col-md-6">
                                                <label class="form-label"> Category: </label>
                                                <form:select class="form-select" path="category">
                                                    <form:option value="Nam">Nam</form:option>
                                                    <form:option value="Nữ">Nữ</form:option>
                                                </form:select>
                                            </div>
                                            <div class="mb-3 col-12 col-md-6">
                                                <label class="form-label">Description:</label>
                                                <form:textarea class="form-control" path="description" rows="3"
                                                    required="true" />
                                            </div>
                                            <!-- image -->
                                            <div class="mb-3 col-12 col-md-6">
                                                <label for="avatarFile" class="form-label">Image:</label>
                                                <input class="form-control" type="file" id="avatarFile"
                                                    accept=".png, .jpg, .jpeg" name="vietphapFile" />
                                            </div>
                                            <div class="col-12 mb-3">
                                                <img style="max-height: 250px; display: none;" alt="avatar preview"
                                                    id="avatarPreview" />
                                            </div>
                                            <!-- Product Items -->
                                            <div class="mb-3">
                                                <h5>Product Items</h5>
                                                <button type="button" id="addProductItem"
                                                    class="btn btn-success mb-2">Add Product Item</button>
                                                <div id="productItemsContainer"></div>
                                                <div id="itemError" class="text-danger" style="display:none;">Please add at least one product item</div>
                                            </div>
                                            <!-- button -->
                                            <div class="row mb-5">
                                                <div class="col-auto">
                                                    <button type="submit" class="btn btn-primary">Create</button>
                                                </div>
                                                <div class="col-auto">
                                                    <a href="/admin/product" class="btn btn-secondary">Back</a>
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