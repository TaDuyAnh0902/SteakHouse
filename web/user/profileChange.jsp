<%-- 
    Document   : profileChange
    Created on : Jul 4, 2024, 3:11:07 PM
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

            .wrapper {
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

            .profile {
                display: flex;
                flex-wrap: wrap;
                justify-content: space-between;
                margin-bottom: 20px;
            }

            .info-container {
                width: 100%;
                display: flex;
                justify-content: space-between;
                margin-bottom: 20px; /* Increased margin-bottom for more spacing */
            }

            .info-item {
                width: 48%;
                margin-bottom: 20px; /* Added margin-bottom for more spacing */
            }

            .info-item label {
                display: block;
                text-align: left;
                margin-bottom: 5px;
            }

            .info-item input {
                width: 100%;
                padding: 8px;
                border: 1px solid #ddd;
                border-radius: 5px;
                box-sizing: border-box;
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

            .choose a,
            .choose input[type="submit"] {
                display: inline-block;
                padding: 10px 20px;
                margin: 10px 20px; /* Increased horizontal margin for more spacing */
                text-decoration: none;
                color: white;
                background-color: #4A148C;
                border-radius: 5px;
                border: none;
                cursor: pointer;
            }

            .choose a:hover,
            .choose input[type="submit"]:hover {
                background-color: #6A1B9A;
            }
        </style>
    </head>
    <body>
        <c:set var="profileNew" value="${requestScope.profileNew}"/>
        <div class="wrapper">
            <div class="profile-header">
                <img src="images/banner6.jpg" alt="background" class="background"/>
                <img src="images/user.jpg" alt="user" class="user"/>
            </div>
            <h2>PROFILE</h2>
            <form action="changeProfile" method="post" name="changeProfile" onsubmit="return validateUpdateProfile()">
                <div class="profile">
                    <div class="info-container">
                        <div class="info-item">
                            <label for="name">Name:</label>
                            <input type="text" id="name" placeholder="Name *" name="name" value="${profileNew.name}" required />
                        </div>
                        <div class="info-item">
                            <label for="email">Email:</label>
                            <input type="email" id="email" placeholder="Email *" name="email" value="${profileNew.email}" required />
                        </div>
                        <div class="info-item">
                            <label for="phone">Phone:</label>
                            <input type="text" id="phone" placeholder="Phone" name="phoneNumber" value="${profileNew.phoneNumber}"/>
                        </div>
                    </div>
                    <div class="info-container">
                        <div class="info-item">
                            <label for="username">Username:</label>
                            <input type="text" id="username" placeholder="Username *" name="user" value="${profileNew.username}" readonly />
                        </div>
                        <div class="info-item">
                            <label for="password">Password:</label>
                            <input type="password" id="password" placeholder="Password *" name="pass" value="${profileNew.passWord}" required />
                        </div>
                        <div class="info-item">
                            <label for="confirmPass">Confirm Password:</label>
                            <input type="password" id="confirmPass" placeholder="Confirm Password *" name="confirmPass" required />
                        </div>
                    </div>
                </div>
                <div class="choose">
                    <div>
                        <input type="submit" value="Save">
                    </div>
                    <div>
                        <a href="Profile?user=${profileNew.username}">Back</a>
                    </div>
                </div>
            </form>
        </div>
    </body>
    <script>
        function validateUpdateProfile() {
            var form = document.forms["changeProfile"];
            var name = form["name"].value;
            var email = form["email"].value;
            var phoneNumber = form["phoneNumber"].value;
            var password = form["pass"].value;
            var confirmPassword = form["confirmPass"].value;

            // Validate Name
            if (/^\s/.test(name)) {
                alert("Name cannot have leading spaces.");
                return false;
            }

            if (/\s$/.test(name)) {
                alert("Name cannot have trailing spaces.");
                return false;
            }

            if (/ {2,}/.test(name)) {
                alert("Name cannot contain multiple consecutive spaces.");
                return false;
            }

            if (!/^[a-zA-Z\sÀ-Ỹà-ỹẠ-Ỷạ-ỵĂ-Ắă-ắẰ-Ỳằ-ỳẠ-Ỵạ-ỵÂ-Ậâ-ậẦ-Ỷầ-ỷẠ-Ỵạ-ỵĐđĨĩƠ-ớơ-ớỠ-Ỷỡ-ỷỌ-Ựọ-ựỜ-Ỹờ-ỹỘ-Ỷộ-ỷỢ-Ựợ-ựÚú]+$/u.test(name)) {
                alert("Name contains invalid characters.");
                return false;
            }
            if (name.length < 6) {
                alert("Name must be at least 6 characters long.");
                return false;
            }
            // Validate Email
            var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            if (/^\s/.test(email)) {
                alert("Email cannot have leading spaces.");
                return false;
            }

            if (/\s$/.test(email)) {
                alert("Email cannot have trailing spaces.");
                return false;
            }

            if (!emailPattern.test(email)) {
                alert("Invalid email format.");
                return false;
            }

            // Validate Phone Number
            var phonePattern = /^(09|03|07|08|05)\d{8}$/;
            if (phoneNumber) {
                if (!phonePattern.test(phoneNumber)) {
                    alert("Invalid phone number format. Please enter a valid 10-digit number.");
                    return false;
                }
            }


            // Validate Password
            if (password.length < 8) {
                alert("Password must be at least 8 characters long.");
                return false;
            }

            if (/^\s/.test(password)) {
                alert("Password cannot have leading spaces.");
                return false;
            }

            if (/\s$/.test(password)) {
                alert("Password cannot have trailing spaces.");
                return false;
            }

            if (/ {2,}/.test(password)) {
                alert("Password cannot contain multiple consecutive spaces.");
                return false;
            }

            // Confirm Password Match
            if (password !== confirmPassword) {
                alert("Passwords do not match.");
                return false;
            }

            return true;
        }
    </script>
</html>
