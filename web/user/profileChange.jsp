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
            :root {
                --green-color: rgb(139, 197, 63);
                --dark-green-color: rgb(19, 149, 79);
            }

            .profileChange {
                margin: 50px 0;
                padding: 0 15%;
            }

            .profile {
                margin-top: 50px;
                display: flex;
                justify-content: center;
                font-size: 18px;
            }

            .profile > div {
                width: 33.33%;
            }

            img {
                width: 50%;
            }

            input {
                margin-bottom: 50px;
                width: 90%;
                height: 30px;
                font-size: 16px;
            }

            .choose {
                display: flex;
            }

            .back {
                width: auto;
                height: 35px;
                background-color: var(--dark-green-color);
                margin: 0 10px;
                padding: 0 10px;
                padding-top: 5px;
                border-radius: 4px;
            }

            .submit {
                height:  auto;
            }

            .submit input{
                color: white;
                border: 0;
                height: 35px;
                padding: 0 15px 0 10px;
                border-radius: 4px;
                background-color: var(--dark-green-color);
            }
            .back:hover {
                background-color: var(--green-color);
            }
            .submit input:hover {
                cursor: pointer;
                background-color: var(--green-color);
            }
            a {
                color: white;
                text-decoration: none;
            }
            a:hover {
                color: white;
                text-decoration: none;
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
                        <h4 style="color: red;"><c:out value="${requestScope.passwordNotMatch}"/></h4>
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
