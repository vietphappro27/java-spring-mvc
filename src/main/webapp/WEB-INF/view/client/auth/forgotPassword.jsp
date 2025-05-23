<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!-- jstl core -->
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!-- form: -->
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <html lang="vi">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Quên Mật Khẩu</title>
                <link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
            </head>

            <!-- <body > -->

            <body class="d-flex align-items-center justify-content-center min-vh-100"
                style="background: url('/client/img/register_background.png') no-repeat center center/cover;">

                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-12 col-sm-10 col-md-8 col-lg-6 col-xl-5 col-xxl-4" style="width: 600px;">
                            <div class="card border border-light-subtle rounded-3 shadow-sm">
                                <div class="card-body p-3 p-md-4 p-xl-5">
                                    <div class="text-center mb-3">
                                        <h2>Quên Mật Khẩu</h2>
                                    </div>
                                    <c:if test="${not empty error}">
                                        <div class="alert alert-danger" role="alert">
                                            ${error}
                                        </div>
                                    </c:if>
                                    <c:if test="${not empty message}">
                                        <div class="alert alert-success" role="alert">
                                            ${message}
                                        </div>
                                    </c:if>
                                    <form action="/forgotPassword" method="POST">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                        <div class="form-floating mb-3">
                                            <input type="email" class="form-control" name="email" id="email"
                                                placeholder="name@example.com" required>
                                            <label for="email">Email</label>
                                        </div>
                                        <div class="d-grid my-3">
                                            <button class="btn btn-primary btn-lg" type="submit">Gửi mã OTP</button>
                                        </div>
                                        <div class="text-center">
                                            <a href="/login" class="link-primary text-decoration-none">Quay lại Đăng
                                                Nhập</a>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </body>


            </html>