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
            @media only screen and (max-width: 500px), only screen and (max-height: 400px) {
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
                    width: 40%;
                }
                .ListOrderLine tbody td:nth-child(2),
                .ListOrderLine thead th:nth-child(2){
                    width: 25%;
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
                .table td:nth-child(3),
                .totalMoney{
                    text-align: end;
                    padding-right: 10%;
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
                <th>Xóa</th>
                </thead>
                <c:forEach var="order" items="${sessionScope.OrderLine}">
                    <c:if test="${order.sid.id==2}">
                        <tbody>
                        <td>
                            ${order.pid.name}
                            <p style="color: #F90;">(đã đặt)</p>
                        </td>
                        <td>${order.quantity}</td>
                        <td>${order.pid.price}00</td>
                        <td></td>
                        </tbody>
                    </c:if>
                    <c:if test="${order.sid.id==1}">
                        <tbody>
                        <td>
                            ${order.pid.name}
                            <p style="color: green;">(món mới)</p>
                        </td>
                        <td>${order.quantity}</td>
                        <td>${order.pid.price}00</td>
                        <td><a href="deleteProductByMobile?id=${order.id}" style="background-color: white;"><i class="fas fa-trash-alt"></i></a></td>
                        </tbody>
                    </c:if>
                    <c:if test="${order.sid.id==3}">
                        <tbody>
                        <td>
                            ${order.pid.name}
                            <p style="color: brown;">(đã ra)</p>
                        </td>
                        <td>${order.quantity}</td>
                        <td>${order.pid.price}00</td>
                        <td></td>
                        </tbody>
                    </c:if>
                </c:forEach>
                <tbody style="border-bottom: 1px solid gray;border-top: 1px solid gray;">
                <td colspan="2" style="color: brown;">Tổng tiền</td>
                <td style="color: #F90;" class="totalMoney">${sessionScope.totalMoney}</td>
                </tbody>
            </table>
            <a href="ConfirmOrder?action=buy&idTable=${sessionScope.tableNumber}">Đặt</a>
        </div>
    </body>
</html>