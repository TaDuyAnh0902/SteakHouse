<%-- 
    Document   : productUpdate
    Created on : May 29, 2024, 11:26:15 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
            .productUpdate {
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
        <div class="productUpdate">
            <h1>Update Product</h1>
            <c:set var="x" value="${requestScope.productUpdate}"/>
            <c:set var="cid" value="${requestScope.cid}"/>
            <form action="productAction" method="post">
                Id: <input type="text" name="id" value="${x.id}"  readonly><br>
                Name: <input type="text" name="name" value="${x.name}" required><br>
                Quantity: <input type="number" name="quantity" value="${x.quantity}" required><br>
                Price: <input type="text" name="price" value="${x.price}" required><br>
                Describe: <input type="text" name="describe" value="${x.describe}" required><br>
                Image: <input type="text" name="image" value="${x.image}" required><br>

                Cid : <input type="text" name="cid" value="${x.category.id}" readonly><br>
                <input type="submit" value="Update">
            </form>
        </div>

    </body>
</html>
