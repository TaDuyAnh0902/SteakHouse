<%-- 
    Document   : register
    Created on : May 24, 2024, 10:52:47 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Webleb</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
              integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <style>
            @import url(https://fonts.googleapis.com/css?family=Poppins:300);
            :root {
                --green-color: rgb(139, 197, 63);
                --dark-green-color: rgb(19, 149, 79);
            }
            body {
                height: 100vh;
                overflow: hidden;
                font-family: "Poppins";
                background: url(images/bannerLogin2.jpg);
                background-repeat: no-repeat;
                background-size: 100% 100vh;
            }

            .register-page {
                width: 400px;
                padding: 8% 0 0;
                margin: 0 auto;
                margin-top: -50px;
            }

            .form {
                position: relative;
                z-index: 1;
                background: #FFFFFF;
                max-width: 400px;
                padding: 45px;
                text-align: center;
                border-radius: 15px;
                box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
            }

            .form input {
                font-family: "Poppins", sans-serif;
                outline: 0;
                background: #f2f2f2;
                width: 100%;
                border: 0;
                border-radius: 7px;
                margin: 0 0 15px;
                padding: 15px;
                box-sizing: border-box;
                font-size: 14px;

            }

            .form button {
                font-family: "Poppins", sans-serif;
                text-transform: uppercase;
                outline: 0;
                background: var(--dark-green-color);
                width: 100%;
                border: 0;
                padding: 15px;
                color: #FFFFFF;
                border-radius: 7px;
                font-size: 14px;
                -webkit-transition: all 0.3 ease;
                transition: all 0.3s ease;
                cursor: pointer;
            }

            .form button:hover,
            .form button:active,
            .form button:focus {
                background: var(--green-color);
            }

            .form .message {
                margin: 15px 0 0;
                color: #b3b3b3;
                font-size: 12px;
            }

            .form .message a {
                color: #234666;
                text-decoration: none;
            }

        </style>
    </head>
    <body>
        <div class="register-page">
            <div class="form">
                <form action="Register" class="register-form" method="post" name="register" onsubmit="return validateRegister()">
                    <h2><i class="fas fa-lock"></i> Register</h2>
                    <!--<input type="text" placeholder="Full Name *" required />-->
                    <input type="text" placeholder="Name *" name="name" value="${param.name}" required>
                    <input type="text" placeholder="Username *" name="username" value="${param.username}" required />
                    <input type="email" placeholder="Email *" name="email" value="${param.email}" required/>
                    <input type="hidden" name="phone"/>
                    <input type="password" placeholder="Password *" name="pass" value="${param.pass}" required />
                    <input type="password" placeholder="Confirm Password *" name="confirmPass" required />

                    <c:if test="${requestScope.usernameFail != null}">
                        <p style="color: red;"><c:out value="${requestScope.usernameFail}"/></p>
                    </c:if>  
                    <c:if test="${requestScope.duplicateUser != null}">
                        <p style="color: red;"><c:out value="${requestScope.duplicateUser}"/></p>
                    </c:if>
                    <c:if test="${requestScope.passwordNotMatch != null}">
                        <p style="color: red;"><c:out value="${requestScope.passwordNotMatch}"/></p>
                    </c:if>
                    <c:if test="${requestScope.successfully != null}">
                        <p style="color: green;"><c:out value="${requestScope.successfully}"/></p>
                    </c:if>

                    <button type="submit">create</button>
                    <p class="message">Already registered? <a href="login">Sign In</a></p>
                </form>
            </div>
        </div>
    </body>
    <script>
        function validateRegister() {
            var form = document.forms["register"];
            var name = form["name"].value;
            var username = form["username"].value;
            var email = form["email"].value;
            var password = form["pass"].value;
            var confirmPassword = form["confirmPass"].value;

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

            if (!/^[a-zA-Z0-9\sÀ-Ỹà-ỹẠ-Ỷạ-ỵĂ-Ắă-ắẰ-Ỳằ-ỳẠ-Ỵạ-ỵÂ-Ậâ-ậẦ-Ỷầ-ỷẠ-Ỵạ-ỵĐđĨĩƠ-ớơ-ớỠ-Ỷỡ-ỷỌ-Ựọ-ựỜ-Ỹờ-ỹỘ-Ỷộ-ỷỢ-Ựợ-ựÚú]+$/u.test(name)) {
                alert("Name contains invalid characters.");
                return false;
            }

            if (/^\s/.test(username)) {
                alert("Username cannot have leading spaces.");
                return false;
            }

            if (/\s$/.test(username)) {
                alert("Username cannot have trailing spaces.");
                return false;
            }

            if (/ {2,}/.test(username)) {
                alert("Username cannot contain multiple consecutive spaces.");
                return false;
            }

            if (!/^[a-zA-Z0-9_]+$/.test(username)) {
                alert("Username contains invalid characters.");
                return false;
            }

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

            return true;
        }
    </script>
</html>