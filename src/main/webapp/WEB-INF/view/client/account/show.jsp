<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <!-- jstl core -->
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!-- form: -->
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
      <!-- fmt for number formatting -->
      <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
          <meta charset="UTF-8" />
          <meta name="viewport" content="width=device-width, initial-scale=1.0" />
          <title>Thông tin tài khoản | PShoes</title>

          <!-- Google Font -->
          <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
            rel="stylesheet">

          <!-- Css Styles -->
          <link rel="stylesheet" href="/client/css/bootstrap.min.css" type="text/css">
          <link rel="stylesheet" href="/client/css/font-awesome.min.css" type="text/css">
          <link rel="stylesheet" href="/client/css/elegant-icons.css" type="text/css">
          <link rel="stylesheet" href="/client/css/magnific-popup.css" type="text/css">
          <link rel="stylesheet" href="/client/css/nice-select.css" type="text/css">
          <link rel="stylesheet" href="/client/css/owl.carousel.min.css" type="text/css">
          <link rel="stylesheet" href="/client/css/slicknav.min.css" type="text/css">
          <link rel="stylesheet" href="/client/css/style.css" type="text/css">
        </head>

        <body>
          <!-- Header Section Begin -->
          <jsp:include page="../layout/header.jsp" />
          <!-- Header Section End -->

          <!-- Breadcrumb Section Begin -->
          <section class="breadcrumb-option">
            <div class="container">
              <div class="row">
                <div class="col-lg-12">
                  <div class="breadcrumb__text">
                    <h4>Tài khoản</h4>
                    <div class="breadcrumb__links">
                      <a href="/">Home</a>
                      <span>Account</span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </section>
          <!-- Breadcrumb Section End -->

          <!-- Account Section Begin -->
          <section class="account spad">
            <div class="container">
              <div class="row">
                <div class="col-lg-3">
                  <div class="account__sidebar">
                    <div class="account__sidebar__avatar">
                      <img src="/images/avatar/${sessionScope.avatar}" alt="User Avatar" class="rounded-circle"
                        width="150">
                      <h5 class="mt-3">${user.fullname}</h5>
                    </div>
                    <div class="account__sidebar__menu">
                      <ul>
                        <li class="active"><a href="#info" data-toggle="tab">Thông tin cá nhân</a></li>
                        <li><a href="#update" data-toggle="tab">Cập nhật thông tin</a></li>
                        <li><a href="#password" data-toggle="tab">Đổi mật khẩu</a></li>
                      </ul>
                    </div>
                  </div>
                </div>
                <div class="col-lg-9">
                  <div class="tab-content">
                    <!-- Thông tin cá nhân -->
                    <div class="tab-pane fade show active" id="info">
                      <div class="account__info">
                        <h4 class="mb-4">Thông tin cá nhân</h4>
                        <div class="card">
                          <div class="card-body">
                            <div class="row mb-3">
                              <div class="col-md-4 font-weight-bold">Họ và tên:</div>
                              <div class="col-md-8">${user.fullname}</div>
                            </div>
                            <div class="row mb-3">
                              <div class="col-md-4 font-weight-bold">Email:</div>
                              <div class="col-md-8">${user.email}</div>
                            </div>
                            <div class="row mb-3">
                              <div class="col-md-4 font-weight-bold">Số điện thoại:</div>
                              <div class="col-md-8">${user.phone}</div>
                            </div>
                            <div class="row mb-3">
                              <div class="col-md-4 font-weight-bold">Địa chỉ:</div>
                              <div class="col-md-8">${user.address}</div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>

                    <!-- Cập nhật thông tin -->
                    <div class="tab-pane fade" id="update">
                      <div class="account__update">
                        <h4 class="mb-4">Cập nhật thông tin</h4>
                        <!-- Hiển thị thông báo thành công hoặc lỗi -->
                        <c:if test="${not empty successMessage}">
                          <div class="alert alert-success" role="alert">
                            ${successMessage}
                          </div>
                        </c:if>
                        <c:if test="${not empty errorMessage}">
                          <div class="alert alert-danger" role="alert">
                            ${errorMessage}
                          </div>
                        </c:if>
                        <div class="card">
                          <div class="card-body">
                            <form action="/account/update" method="POST" enctype="multipart/form-data">
                              <!-- csrf token -->
                              <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                              <!-- csrf token -->
                              <div class="form-group row">
                                <label for="fullname" class="col-md-3 col-form-label">Họ và tên</label>
                                <div class="col-md-9">
                                  <input type="text" class="form-control" id="fullname" name="fullname"
                                    value="${user.fullname}" required>
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="email" class="col-md-3 col-form-label">Email</label>
                                <div class="col-md-9">
                                  <input type="email" class="form-control" id="email" value="${user.email}" readonly>
                                  <small class="form-text text-muted">Email không thể thay đổi</small>
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="phone" class="col-md-3 col-form-label">Số điện thoại</label>
                                <div class="col-md-9">
                                  <input type="tel" class="form-control" id="phone" name="phone" value="${user.phone}"
                                    required>
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="address" class="col-md-3 col-form-label">Địa chỉ</label>
                                <div class="col-md-9">
                                  <textarea class="form-control" id="address" name="address" rows="3"
                                    required>${user.address}</textarea>
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="avatar" class="col-md-3 col-form-label">Ảnh đại diện</label>
                                <div class="col-md-9">
                                  <input type="file" class="form-control-file" id="avatar" name="avatar"
                                    accept="image/*">
                                  <small class="form-text text-muted">Chọn ảnh mới để thay đổi ảnh đại diện</small>
                                </div>
                              </div>
                              <div class="form-group row">
                                <div class="col-md-9 offset-md-3">
                                  <button type="submit" class="site-btn">Cập nhật</button>
                                </div>
                              </div>
                            </form>
                          </div>
                        </div>
                      </div>
                    </div>

                    <!-- Đổi mật khẩu -->
                    <div class="tab-pane fade" id="password">
                      <div class="account__password">
                        <h4 class="mb-4">Đổi mật khẩu</h4>
                        <!-- Hiển thị thông báo thành công hoặc lỗi -->
                        <c:if test="${not empty successMessage}">
                          <div class="alert alert-success" role="alert">
                            ${successMessage}
                          </div>
                        </c:if>
                        <c:if test="${not empty errorMessage}">
                          <div class="alert alert-danger" role="alert">
                            ${errorMessage}
                          </div>
                        </c:if>
                        <div class="card">
                          <div class="card-body">
                            <form action="/account/change-password" method="POST">
                              <!-- csrf token -->
                              <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                              <!-- csrf token -->
                              <div class="form-group row">
                                <label for="currentPassword" class="col-md-3 col-form-label">Mật khẩu hiện tại</label>
                                <div class="col-md-9">
                                  <input type="password" class="form-control" id="currentPassword"
                                    name="currentPassword" required>
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="newPassword" class="col-md-3 col-form-label">Mật khẩu mới</label>
                                <div class="col-md-9">
                                  <input type="password" class="form-control" id="newPassword" name="newPassword"
                                    required>
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="confirmPassword" class="col-md-3 col-form-label">Xác nhận mật khẩu
                                  mới</label>
                                <div class="col-md-9">
                                  <input type="password" class="form-control" id="confirmPassword"
                                    name="confirmPassword" required>
                                </div>
                              </div>
                              <div class="form-group row">
                                <div class="col-md-9 offset-md-3">
                                  <button type="submit" class="site-btn">Đổi mật khẩu</button>
                                </div>
                              </div>
                            </form>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </section>
          <!-- Account Section End -->

          <!-- Footer Section Begin -->
          <jsp:include page="../layout/footer.jsp" />
          <!-- Footer Section End -->

          <!-- Js Plugins -->
          <script src="/client/js/jquery-3.3.1.min.js"></script>
          <script src="/client/js/bootstrap.min.js"></script>
          <script src="/client/js/jquery.nice-select.min.js"></script>
          <script src="/client/js/jquery.nicescroll.min.js"></script>
          <script src="/client/js/jquery.magnific-popup.min.js"></script>
          <script src="/client/js/jquery.countdown.min.js"></script>
          <script src="/client/js/jquery.slicknav.js"></script>
          <script src="/client/js/mixitup.min.js"></script>
          <script src="/client/js/owl.carousel.min.js"></script>
          <script src="/client/js/main.js"></script>

          <script>
            $(document).ready(function () {
              // Đảm bảo chỉ tab đầu tiên được hiển thị khi trang tải
              $('.tab-pane').removeClass('show active');
              $('#info').addClass('show active');

              // Kiểm tra nếu có thông báo lỗi hoặc thành công
              var successMessage = "${successMessage}";
              var errorMessage = "${errorMessage}";

              if (successMessage || errorMessage) {
                // Nếu có thông báo liên quan đến mật khẩu
                if (successMessage.includes("mật khẩu") || errorMessage.includes("mật khẩu")) {
                  // Hiển thị tab đổi mật khẩu
                  $('.tab-pane').removeClass('show active');
                  $('#password').addClass('show active');
                  $('.account__sidebar__menu li').removeClass('active');
                  $('.account__sidebar__menu li a[href="#password"]').parent().addClass('active');
                } else {
                  // Hiển thị tab cập nhật thông tin
                  $('.tab-pane').removeClass('show active');
                  $('#update').addClass('show active');
                  $('.account__sidebar__menu li').removeClass('active');
                  $('.account__sidebar__menu li a[href="#update"]').parent().addClass('active');
                }

                // Tự động ẩn thông báo sau 5 giây
                setTimeout(function () {
                  $('.alert').fadeOut('slow');
                }, 5000);
              }

              // Xử lý chuyển tab
              $('.account__sidebar__menu a').click(function (e) {
                e.preventDefault();

                // Loại bỏ class active từ tất cả các menu item
                $('.account__sidebar__menu li').removeClass('active');
                // Thêm class active cho menu item được chọn
                $(this).parent('li').addClass('active');

                // Ẩn tất cả các tab pane
                $('.tab-pane').removeClass('show active');
                // Hiển thị tab pane tương ứng
                var targetTab = $(this).attr('href');
                $(targetTab).addClass('show active');
              });

              // Xác thực mật khẩu
              $('form').submit(function (e) {
                var newPassword = $('#newPassword').val();
                var confirmPassword = $('#confirmPassword').val();

                if (newPassword && confirmPassword && newPassword !== confirmPassword) {
                  alert('Mật khẩu xác nhận không khớp!');
                  e.preventDefault();
                }
              });
            });
          </script>

          <link rel="stylesheet" href="/client/css/account.css" type="text/css">


        </body>

        </html>