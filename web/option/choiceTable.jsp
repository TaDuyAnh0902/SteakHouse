<%-- 
    Document   : choiceTable
    Created on : May 25, 2024, 5:11:33 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div>
            <ul>
                <c:forEach items="${requestScope.table}" var="tb">
                    <li>
                        <a href="choiceTable?tableNumber=${tb.id}">${tb.nameTable}</a>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </body>
</html>