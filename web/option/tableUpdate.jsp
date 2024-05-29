<%-- 
    Document   : tableUpdate
    Created on : May 30, 2024, 12:40:51 AM
    Author     : HP
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
            .tableUpdate {
                padding: 0 20%;
            }
            h1 {
                color: #333;
                text-align: center;
            }
            form {
                margin: 20px;
                padding: 20px;
                background-color: #fff;
                border: 1px solid #ddd;
                border-radius: 5px;
            }

            input[type="text"],
            input[type="number"] {
                width: calc(100% - 20px);
                padding: 10px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 3px;
                font-size: 16px;
            }
            input[type="submit"] {
                background-color: var(--dark-green-color);
                color: #fff;
                border: none;
                padding: 10px 20px;
                border-radius: 3px;
                cursor: pointer;
            }
            input[type="submit"]:hover {
                background-color: var(--green-color);
            }
        </style>
    </head>
    <body>
        <div class="tableUpdate">
            <h1>Update Product</h1>
            <c:set var="t" value="${requestScope.tableUpdate}"/>
            <form action="tableAction" method="post">
                <input type="hidden" name="id" value="${t.id}">
                Table Name: <input type="text" name="tableUpdate" value="${t.nameTable}" required><br>
                <input type="submit" value="Update">
            </form>
        </div>

    </body>
</html>
