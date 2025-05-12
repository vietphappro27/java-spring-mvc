<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!-- jstl core -->
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!-- form: -->
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Document</title>
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
                                        <h2>Đăng Nhập</h2>
                                    </div>
                                    <form action="/login" method="post">
                                        <c:if test="${param.error != null}">
                                            <div class="my-2" style="color: red;">
                                                <p>Tên đăng nhập hoặc mật khẩu không chính xác</p>
                                            </div>
                                        </c:if>
                                        <c:if test="${param.logout != null}">
                                            <div class="my-2" style="color: green;">
                                                <p>Đăng xuất thành công</p>
                                            </div>
                                        </c:if>
                                        <div class="row gy-2 overflow-hidden">
                                            <div class="col-12">
                                                <div class="form-floating mb-3">
                                                    <input type="email" class="form-control" id="email"
                                                        placeholder="name@example.com" name="username" required>
                                                    <label for="email" class="form-label">Email</label>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="form-floating mb-3">
                                                    <input type="password" class="form-control" name="password"
                                                        id="password" value="" placeholder="Password" required>
                                                    <label for="password" class="form-label">Mật Khẩu</label>
                                                </div>
                                            </div>
                                            <%-- CSRF token --%>
                                            <div>
                                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                            </div>

                                            <div class="col-12">
                                                <div class="d-flex gap-2 justify-content-between">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" value=""
                                                            name="rememberMe" id="rememberMe">
                                                        <label class="form-check-label text-secondary" for="rememberMe">
                                                            Duy trì đăng nhập
                                                        </label>
                                                    </div>
                                                    <a href="/forgotPassword"
                                                        class="link-primary text-decoration-none">Quên mật
                                                        khẩu?</a>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="d-grid my-3">
                                                    <button class="btn btn-primary btn-lg" type="submit">Đăng
                                                        nhập</button>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <p class="m-0 text-secondary text-center">Chưa có tài khoản? <a
                                                        href="/register" class="link-primary text-decoration-none">Đăng
                                                        ký</a>
                                                </p>
                                            </div>
                                        </div>
                                    </form>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </body>

            </html>