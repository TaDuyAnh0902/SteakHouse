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

        .wrapperr, .profileChange {
            width: 80%;
            margin: 0 auto;
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
        .profile input[type="email"],
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

        .profile .choose a,
        .profile .choose input[type="submit"] {
            display: inline-block;
            padding: 10px 20px;
            margin: 10px;
            text-decoration: none;
            color: white;
            background-color: #4A148C;
            border-radius: 5px;
        }

        .profile .choose a:hover,
        .profile .choose input[type="submit"]:hover {
            background-color: #6A1B9A;
        }

        .profile h4 {
            text-align: center;
            color: red;
        }

        input[type="submit"] {
            cursor: pointer;
            border: none;
        }
        </style>
    </head>
    <body>
    <c:set var="profileNew" value="${requestScope.profileNew}"/>
    <div class="profileChange">
        <h2>PROFILE</h2>
        <form action="changeProfile" method="post">
            <div class="profile">
                <div>
                    <img src="images/user.jpg" alt="image"/>
                </div>
                <div>
                    Name: <input type="text" placeholder="Name *" name="name" value="${profileNew.name}" required />
                    Email: <input type="email" placeholder="Email *" name="email" value="${profileNew.email}" required />
                    Phone: <input type="text" placeholder="Phone" name="phoneNumber" value="${profileNew.phoneNumber}"/>
                    <div class="choose">
                        <div class="submit">
                            <input type="submit" value="Save">
                        </div>
                        <div class="back">
                            <a href="Profile?user=${profileNew.username}">Back</a>
                        </div>
                    </div>
                    <h4><c:out value="${requestScope.passwordNotMatch}"/></h4>
                </div>
                <div>
                    Username: <input type="text" placeholder="Username *" name="user" value="${profileNew.username}" readonly />
                    Password: <input type="password" placeholder="Password *" name="pass" value="${profileNew.passWord}" required />
                    Confirm Password: <input type="password" placeholder="Confirm Password *" name="confirmPass" required />
                </div>
            </div>
        </form>
    </div>
</body>
</html>
