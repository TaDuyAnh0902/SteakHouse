<%-- 
    Document   : header
    Created on : May 25, 2024, 4:39:16 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            :root {
                --green-color: rgb(139, 197, 63);
                --dark-green-color: rgb(19, 149, 79);
            }

            .header {
                display: flex;
                box-shadow: 0px 2px 2px 0px rgba(0, 0, 0, 0.2);
            }

            .header>div {
                width: 25%;
            }

            .header>nav {
                width: 50%;
                height: 10vh;
            }

            .logo {
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .logo img {
                width: 169px;
                height: 153px;
                float: right;
            }

            .nav ul {
                width: 100%;
                display: flex;
                justify-content: center;
                list-style: none;
                padding: 0;
                padding-top: 8%;
            }

            .nav ul li {
                line-height: 22px;
                font-size: 22px;
                margin: 0 10px;
                font-weight: bold;
                color: var(--green-color);
                cursor: pointer;
            }

            .nav li:hover {

                color: var(--dark-green-color);
            }

            .header-right ul {
                list-style: none;
                display: flex;
                /*align-items: center;*/
                padding-top: 16%;
            }

            .header-right li {
                margin: 0 10px;
            }

            .header-right li :hover {
                color: var(--dark-green-color);
            }

            .header-right i {
                color: var(--green-color);
            }
            .cart {
                display: none;
            }
            @media only screen and (max-width: 600px) {
                body{
                    position: relative;
                    height: 100vh;
                    background: url(images/loginPhone2.jpg);
                    background-repeat: no-repeat;
                    background-size: 100% 100vh;
                }
                .header {
                    display: inline;
                }
                .logo {
                    display: none;
                }
                .banner {
                    display: none;
                }
                .nav {
                    width: 100%;
                    margin: 0 auto;
                }
                .nav ul li {
                    display: none;
                }
                .header-right {
                    display: none;
                }
                .nav ul li:nth-child(2) {
                    border: 1px solid black;
                    border-radius: 20px;
                    background-color: #E2D9BC;
                    padding: 50px 50px;
                    display: inline;
                    position: absolute;
                    top: 35%;
                    color: brown;
                }
                .header-right ul li:nth-child(1) {
                    display: inline;
                }
            }
        </style>
    </head>
    <body>
        <div class="header">
            <div class="logo">
                <c:if test="${sessionScope.tableNumber != null}">
                    <h2 style="color: red;margin-right: 20px;">Bàn <c:out value="${sessionScope.tableNumber}"/></h2>
                </c:if>
                <a href="home" title="Livehealthy - Sức khỏe mạnh bắt đầu từ chọn lựa">
                    <img src="images/logo.jpg" alt="images"></a>
            </div>
            <nav class="nav">
                <ul>
                    <li onclick="action('main')">TRANG CHỦ</li>
                    <li onclick="action('store')">MENU</li>
                    <li onclick="action('blog')">BLOG</li>
                    <li onclick="action('introduction')">GIỚI THIỆU</li>

                    <c:if test="${sessionScope.role == 1}">
                        <li onclick="action('manage')">QUẢN LÝ</li>
                        </c:if>
                        <c:if test="${sessionScope.role == 2}">
                        <li onclick="action('contact')">QUẢN LÝ ORDER</li>
                        </c:if>
                        <c:if test="${sessionScope.role == 3}">
                        <li onclick="action('contact')">LIÊN HỆ</li>
                        </c:if>
                </ul>
            </nav>
            <div class="header-right">
                <ul>
                    <li><a href="Action?check=ListOrderLine" title="shopping cart"><i class="fas fa-shopping-cart"></i></a></li>
                            <c:set var="a" value="${sessionScope.success}"/>
                            <c:if test="${a==null}">
                        <li><a href="LogInLogOut?check=logIn" title="Log In"><i class="fas fa-sign-in-alt"></i></a></li>
                            </c:if>

                    <c:if test="${a!=null}">
                        <c:set var="user" value="${sessionScope.user}"/>
                        <li>
                            <a href="LogInLogOut?check=logOut" title="Log Out"><i class="fas fa-sign-out-alt"></i></a>
                        </li>
                        <li>
                            <a href="Profile?user=${user}" class="name"><i class="fas fa-user"></i></a>
                        </li>
                    </c:if>
                </ul>
            </div>
        </div>

        <script>
            function action(id) {
                window.location.href = "Action?check=" + id;
            }
        </script>
    </body>
</html>
