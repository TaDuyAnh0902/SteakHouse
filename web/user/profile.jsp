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
                margin: 20px auto;
                padding: 20px;
                background-color: white;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .profile-header {
                width: 100%;
                position: relative;
                text-align: center;
            }

            .profile-header img.background {
                width: 100%;
                height: 200px;
                object-fit: cover;
                border-radius: 10px 10px 0 0;
            }

            .profile-header img.user {
                width: 100px;
                height: 100px;
                border-radius: 50%;
                border: 5px solid white;
                position: absolute;
                bottom: -50px;
                left: 50%;
                transform: translateX(-50%);
            }

            h2 {
                text-align: center;
                color: #4A148C;
                margin: 70px 0 20px; /* Adjusted margin to account for profile picture */
            }

            .profile-info {
                width: 100%;
                padding-top: 40px;
                display: flex;
                flex-direction: column;
                align-items: center; /* Center the content horizontally */
            }

            .profile-info .info-item {
                display: flex;
                align-items: center;
                justify-content: center; /* Center the items */
                margin: 5px 0;
                width: 100%;
            }

            .profile-info label {
                width: 20%;
                text-align: right;
                margin-right: 10px;
            }

            .profile-info input[type="text"],
            .profile-info input[type="password"] {
                width: 60%; /* Adjusted width to be smaller */
                padding: 8px;
                border: 1px solid #ddd;
                border-radius: 5px;
            }

            .choose {
                margin-top: 20px; /* Added margin for separation */
                display: flex;
                justify-content: center;
                width: 100%;
            }

            .choose div {
                text-align: center;
            }

            .choose a {
                display: inline-block;
                padding: 10px 20px;
                margin: 10px;
                text-decoration: none;
                color: white;
                background-color: #4A148C;
                border-radius: 5px;
            }

            .choose a:hover {
                background-color: #6A1B9A;
            }
        </style>
    </head>
    <body>
        <c:set var="profile" value="${requestScope.profile}"/>
        <div class="wrapperr">
            <div class="profile-header">
                <img src="images/banner6.jpg" alt="background" class="background"/>
                <img src="images/user.jpg" alt="user" class="user"/>
            </div>
            <h2>PROFILE</h2>
            <div class="profile">
                <div class="profile-info">
                    <div class="info-item">
                        <label for="name">Name:</label>
                        <input type="text" id="name" value="${profile.name}" readonly>
                    </div>
                    <div class="info-item">
                        <label for="email">Email:</label>
                        <input type="text" id="email" value="${profile.email}" readonly>
                    </div>
                    <div class="info-item">
                        <label for="phone">Phone:</label>
                        <input type="text" id="phone" value="${profile.phoneNumber}" readonly>
                    </div>
                    <div class="info-item">
                        <label for="username">Username:</label>
                        <input type="text" id="username" value="${profile.username}" readonly>
                    </div>
                    <div class="info-item">
                        <label for="password">Password:</label>
                        <input type="password" id="password" value="${profile.passWord}" readonly>
                    </div>
                </div>
                <div class="choose">
                    <div>
                        <a href="home">home</a>
                    </div>
                    <div>
                        <a href="changeProfile?user=${profile.username}">Change Profile</a>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
