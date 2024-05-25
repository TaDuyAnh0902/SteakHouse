<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .introduction {
                margin-top: 50px;
                padding: 0 20%;
                display: flex;
                justify-content: center;
                align-items: center;
                font-size: 18px;
            }

            .left-introduction,
            .right-introduction {
                width: 50%;
            }
        </style>
    </head>
    <body>
        <c:set var="intro" value="${requestScope.introduction}"/>
        <div class="introduction">
            <div class="left-introduction">
                <img src="images/store.jpg" width="100%" height="400px" alt="image"/>
            </div>
            <div class="right-introduction">
                <h3>VỀ CHÚNG TÔI</h3>
                <hr>
                <p></p>
            </div>
        </div>    
    </body>
</html>