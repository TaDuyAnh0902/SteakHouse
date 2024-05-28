<%-- 
    Document   : manageOption
    Created on : May 28, 2024, 2:08:25 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .manageOption {
                padding-top: 10px;
                background: #E2D9BC;
                height: 50px;
                font-size: 18px;
                /*font-weight: bold;*/
            }
                
            .manageOption > ul {
                display: flex;
                list-style: none;
            }
            .manageOption ul li {
                margin-right: 30px;
                cursor: pointer;
                padding-right: 30px;
                border-right: black 1px solid;
            }
            .manageOption ul li:nth-last-child(1) {
                border: 0px;
            }
            .manageOption ul li:hover {
                color: gray;
            }
        </style>
    </head>
    <body>
        <div class="manageOption">
            <ul>
                <li onclick="ac('productsManagement')">Quản Lý Sản Phẩm</li>
                <li onclick="ac('accountManagement')">Quản Lý Tài Khoản</li>
                <li onclick="ac('blogManagement')">Quản Lý Tin Tức</li>
                <li onclick="ac('billManagement')">Quản Lý Đơn Hàng</li>
                <li onclick="ac('tableManagement')">Quản Lý Bàn</li>
            </ul>
        </div>

        <script>
            function ac(id) {
                window.location.href = "manageOption?check=" + id;
            }
        </script>
    </body>
</html>
