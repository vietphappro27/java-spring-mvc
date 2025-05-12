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
                                        <h2>Đăng Ký</h2>
                                    </div>
                                    <!-- register -->
                                    <form:form method="post" action="/register" modelAttribute="registerDTO">
                                        <c:set var="errorPassword">
                                            <form:errors path="confirmPassword" class="invalid-feedback" />
                                        </c:set>
                                        <c:set var="errorEmail">
                                            <form:errors path="email" class="invalid-feedback" />
                                        </c:set>
                                        <c:set var="errorFullname">
                                            <form:errors path="fullname" class="invalid-feedback" />
                                        </c:set>
                                        <div class="row gy-2 overflow-hidden">
                                            <div class="col-12">
                                                <div class="form-floating mb-3">
                                                    <form:input type="text" class="form-control ${not empty errorFullname ? 'is-invalid' : ''}" 
                                                        name="fullname" id="fullname" placeholder="Full Name" path="fullname" required="required" />
                                                    <label for="fullname" class="form-label">Họ tên</label>
                                                    ${errorFullname}
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="form-floating mb-3">
                                                    <form:input type="email" class="form-control ${not empty errorEmail ? 'is-invalid' : ''}"
                                                        name="email" id="email" placeholder="name@example.com" path="email" required="required" />
                                                    <label for="email" class="form-label">Email</label>
                                                    ${errorEmail}
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="form-floating mb-3">
                                                    <form:input type="tel" class="form-control" name="phone" id="phone"
                                                        placeholder="Phone Number" path="phone" required="required" />
                                                    <label for="phone" class="form-label">Số điện thoại</label>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="form-floating mb-3">
                                                    <form:input type="text" class="form-control" name="address" id="address"
                                                        placeholder="Address" path="address" required="required" />
                                                    <label for="address" class="form-label">Địa chỉ</label>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="form-floating mb-3">
                                                    <form:input type="password" class="form-control" name="password"
                                                        id="password" placeholder="Password" path="password" required="required" />
                                                    <label for="password" class="form-label">Mật khẩu</label>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="form-floating mb-3">
                                                    <form:input type="password" class="form-control ${not empty errorPassword ? 'is-invalid' : ''}" name="repeatpassword"
                                                        id="repeatpassword" placeholder="Repeat Password" path="confirmPassword" required="required" />
                                                    <label for="repeatpassword" class="form-label">Nhập lại mật
                                                        khẩu</label>
                                                    ${errorPassword}
                                                </div>
                                            </div>

                                            <div class="col-12">
                                                <div class="d-grid my-3">
                                                    <button class="btn btn-primary btn-lg" type="submit">Đăng
                                                        Ký</button>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <p class="m-0 text-secondary text-center">Đã có tài khoản ? <a
                                                        href="/login" class="link-primary text-decoration-none">Đăng
                                                        Nhập</a>
                                                </p>
                                            </div>
                                        </div>
                                    </form:form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </body>

            </html>