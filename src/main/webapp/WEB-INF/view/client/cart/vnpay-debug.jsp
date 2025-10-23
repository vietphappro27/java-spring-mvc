<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="VNPay Debug">
    <meta name="keywords" content="VNPay, debug">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>VNPay Debug | P-Shoes</title>

    <!-- Google Font -->
    <link
        href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
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

    <!-- Debug Section Begin -->
    <section class="checkout spad">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-10">
                    <div class="checkout__form">
                        <h3 class="text-center mb-4">VNPay Debug Information</h3>
                        
                        <div class="alert alert-info">
                            <h5>Thông tin từ URL:</h5>
                            <p><strong>URL hiện tại:</strong> ${pageContext.request.requestURL}</p>
                            <p><strong>Query String:</strong> ${pageContext.request.queryString}</p>
                        </div>
                        
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>Parameter Name</th>
                                        <th>Parameter Value</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="param" items="${param}">
                                        <tr>
                                            <td><strong>${param.key}</strong></td>
                                            <td>${param.value}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        
                        <div class="alert alert-warning">
                            <h5>Thông tin quan trọng:</h5>
                            <ul>
                                <li><strong>vnp_ResponseCode:</strong> ${param.vnp_ResponseCode}</li>
                                <li><strong>vnp_TransactionStatus:</strong> ${param.vnp_TransactionStatus}</li>
                                <li><strong>vnp_Amount:</strong> ${param.vnp_Amount}</li>
                                <li><strong>vnp_OrderInfo:</strong> ${param.vnp_OrderInfo}</li>
                                <li><strong>vnp_TxnRef:</strong> ${param.vnp_TxnRef}</li>
                                <li><strong>vnp_SecureHash:</strong> ${param.vnp_SecureHash}</li>
                            </ul>
                        </div>
                        
                        <div class="text-center">
                            <a href="/vnpay-test" class="site-btn">Quay lại Test</a>
                            <a href="/" class="site-btn" style="background-color: #6c757d;">Về Trang Chủ</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Debug Section End -->

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
</body>

</html>
