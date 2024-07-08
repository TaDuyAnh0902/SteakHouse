<%-- 
    Document   : profile
    Created on : Jul 4, 2024, 3:10:36 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f5f5f5;
            }

            .wrapperr {
                width: 80%;
                margin: 0 auto;
                margin-top: 3px;
                padding: 20px;
                background-color: white;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            h2 {
                text-align: center;
                color: #4A148C;
                margin-bottom: 20px;
            }

            .profile {
                display: flex;
                flex-wrap: wrap;
                justify-content: space-between;
            }

            .profile > div {
                flex: 1;
                margin: 10px;
            }

            .profile img {
                width: 100%;
                max-width: 200px;
                border-radius: 50%;
                display: block;
                margin: 0 auto;
            }

            .profile input[type="text"],
            .profile input[type="password"] {
                width: 100%;
                padding: 10px;
                margin: 10px 0;
                border: 1px solid #ddd;
                border-radius: 5px;
            }

            .profile .choose {
                display: flex;
                justify-content: space-between;
            }

            .profile .choose div {
                flex: 1;
                text-align: center;
            }   

            .profile .choose a {
                display: inline-block;
                padding: 10px 20px;
                margin: 10px;
                text-decoration: none;
                color: white;
                background-color: #4A148C;
                border-radius: 5px;
            }

            .profile .choose a:hover {
                background-color: #6A1B9A;
            }
        </style>
    </head>
    <body>
        <c:set var="profile" value="${requestScope.profile}"/>
        <div class="wrapperr">
            <h2>PROFILE</h2>
            <div class="profile">
                <div>
                    <img src="images/user.jpg" alt="image"/>
                </div>
                <div>
                    Name: <input type="text" value="${profile.name}" readonly>
                    Email: <input type="text" value="${profile.email}" readonly>
                    Phone: <input type="text" value="${profile.phoneNumber}" readonly/>
                    <div class="choose">
                        <div>
                            <a href="home">home</a>
                        </div>
                        <div>
                            <a href="changeProfile?user=${profile.username}">Change Profile</a>
                        </div>
                    </div>
                </div>
                <div>
                    Username: <input type="text" value="${profile.username}" readonly>
                    Password: <input type="password" value="${profile.passWord}" readonly>
                </div>
            </div>
        </div>
    </body>
</html>
