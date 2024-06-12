<%-- 
    Document   : ListOrderLine
    Created on : Jun 13, 2024, 12:07:37 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            @media only screen and (max-width: 500px) {
                .header {
                    display: none;
                }
                body {
                    background: none;
                }
                .ListOrderLine {
                    margin-top: 20px;
                    padding: 0 5%;
                }
                .ListOrderLine table {
                    width: 100%;
                }
                .ListOrderLine table td {
                    height: 32px;
                }
                .ListOrderLine tbody td:nth-child(1) {
                    width: 60%;
                }
                .ListOrderLine tbody td:nth-child(2),
                .ListOrderLine thead th:nth-child(2){
                    text-align: center;
                }
                .ListOrderLine tbody {
                    border-bottom: 1px solid #d3d3d3;
                }
                .ListOrderLine div {
                    display: flex;
                    justify-content: space-between;
                    padding: 0 4px;
                    font-weight: bold;
                }
                .ListOrderLine a {
                    text-align: center; 
                    display: block;
                    font-size: 20px;
                    font-weight: bold;
                    background-color: #E2D9BC;
                    color: brown;
                    text-decoration: none;
                    border-radius: 8px;
                }
                
                .ListOrderLine a:active {
                    background-color: rgb(150, 144, 125);
                }
                .footer{
                    display: none;
                }
            }
        </style>
    </head>
    <body>
        <div class="ListOrderLine">
            <table>
                <thead>
                <th>Tên sản phẩm</th>
                <th>Số lượng</th>
                <th>Giá</th>
                </thead>
                <c:forEach var="order" items="${sessionScope.OrderLine}">
                    <c:set var="user" value="${order.aid.username}"/>
                    <tbody>
                        <td>${order.pid.name}</td>
                        <td>${order.quantity}</td>
                        <td>${order.pid.price}</td>
                    </tbody>
                </c:forEach>
            </table>
            <div>
                <div>
                    <p>Tổng Tiền:</p>
                </div>
                <div>
                    <p><c:out value="${sessionScope.totalMoney}"/></p>
                </div>
            </div>
                <a href="ConfirmOrder?action=buy&user=${user}">Đặt</a>
        </div>
    </body>
</html>
