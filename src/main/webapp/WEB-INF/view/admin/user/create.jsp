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
          $(document).ready(() => {
            const avatarFile = $("#avatarFile");
            avatarFile.change(function (e) {
              const imgURL = URL.createObjectURL(e.target.files[0]);
              $("#avatarPreview").attr("src", imgURL);
              $("#avatarPreview").css({ "display": "block" });
            });
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
                <h1 class="mt-4">Manage User</h1>
                <ol class="breadcrumb mb-4">
                  <li class="breadcrumb-item active">
                    <a href="/admin">Dashboard</a> / User
                  </li>
                </ol>

              </div>
              <div class="container mt-5">
                <div class="row">
                  <div class="col-12 mx-auto">
                    <!-- <div class="col-12 mx-auto"> -->
                    <h3>Create a user</h3>
                    <hr />
                    <form:form method="post" action="/admin/user/create" modelAttribute="newUser" class="row"
                      enctype="multipart/form-data">
                      <div class="mb-3 col-12 col-md-6">
                        <label class="form-label">Email:</label>
                        <form:input type="email" class="form-control" path="email" />
                      </div>
                      <div class="mb-3 col-12 col-md-6">
                        <label class="form-label">Password:</label>
                        <form:input type="password" class="form-control" path="password" />
                      </div>
                      <div class="mb-3 col-12 col-md-6">
                        <label class="form-label">Phone:</label>
                        <form:input type="number" class="form-control" path="phone" />
                      </div>
                      <div class="mb-3 col-12 col-md-6">
                        <label class="form-label">FullName:</label>
                        <form:input type="text" class="form-control" path="fullname" />
                      </div>
                      <div class="mb-3">
                        <label class="form-label">Address:</label>
                        <form:input type="text" class="form-control" path="address" />
                      </div>

                      <div class="mb-3 col-12 col-md-6">
                        <label class="form-label"> Role: </label>
                        <form:select class="form-select" path="role.name">
                          <form:option value="USER">USER</form:option>
                          <form:option value="ADMIN">ADMIN</form:option>
                        </form:select>
                      </div>

                      <div class="mb-3 col-12 col-md-6">
                        <label for="avatarFile" class="form-label">Avatar:</label>
                        <input class="form-control" type="file" id="avatarFile" accept=".png, .jpg, .jpeg"
                          name="vietphapFile" />
                      </div>
                      <div class="col-12 mb-3">
                        <img style="max-height: 250px; display: none;" alt="avatar preview" id="avatarPreview" />
                      </div>
                      <div class="row mb-5">
                        <div class="col-auto">
                          <button type="submit" class="btn btn-primary">Create</button>
                        </div>
                        <div class="col-auto">
                          <a href="/admin/user" class="btn btn-secondary">Back</a>
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