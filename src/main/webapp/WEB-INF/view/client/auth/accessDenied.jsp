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
                <%-- <link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css"> --%>
                <link rel="stylesheet" href="/client/css/accessDenied.css">
            </head>

            <!-- <body > -->

            <body>
                <div class="lock"></div>
                <div class="message">
                    <h1>Access to this page is restricted</h1>
                    <a href="/"><p style="margin-inline-start: 150px;">Back to Home Page</p></a>
                </div>
            </body>

            </html>