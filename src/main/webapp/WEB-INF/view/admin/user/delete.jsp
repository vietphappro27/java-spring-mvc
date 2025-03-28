<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!-- jstl core -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- form: -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- <!DOCTYPE html> -->
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
      crossorigin="anonymous"
    />
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
      crossorigin="anonymous"
    ></script>
    <!-- <link rel="stylesheet" href="/css/demo.css" /> -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Dashboard - SB Admin</title>
    <link
      href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
      rel="stylesheet"
    />
    <link href="/css/styles.css" rel="stylesheet" />
    <script
      src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
      crossorigin="anonymous"
    ></script>
  </head>

  <body>
    <!-- header -->
    <jsp:include page="../layout/header.jsp" />
    <div id="layoutSidenav">
      <!-- sidebar -->
      <jsp:include page="../layout/sidebar.jsp" />
      <div id="layoutSidenav_content">
        <div class="container mt-5">
          <div class="row">
            <div class="col-12 mx-auto">
              <h3>Delete a user #${id}</h3>
              <hr />
              <div class="alert alert-danger">
                Are you sure to delete this user ?
              </div>
              <form:form
                method="post"
                action="/admin/user/delete"
                modelAttribute="newUser"
              >
                <div class="mb-3" style="display: none">
                  <label class="form-label">Id:</label>
                  <form:input
                    value="${id}"
                    type="text"
                    class="form-control"
                    path="id"
                  />
                </div>
                <button type="submit" class="btn btn-danger">Confirm</button>
              </form:form>
            </div>
          </div>
        </div>

        <!-- footer -->
        <jsp:include page="../layout/footer.jsp" />
      </div>
    </div>
  </body>
</html>
