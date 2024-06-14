<%-- 
    Document   : manageOrder
    Created on : Jun 14, 2024, 10:53:56 PM
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
            .manageOrder {
                display: flex;
                height: 100%;
                margin-bottom: -50px;
            }
            .manageOrder-left {
                width: 15%;
                font-size: 20px;
                min-height: 500px;
            }
            .manageOrder-left > ul {
                list-style: none;
                display: block;
                height: 100%;
                background: #E2D9BC;
            }
            .manageOrder-left ul li {
                cursor: pointer;
                padding: 16px;
                padding-left: 16%;
                border-bottom: 1px solid rgb(179, 179, 179);
            }
            .manageOrder-left ul li:hover {
                color: gray;
            }
            .manageOrder-right {
                width: 85%;
                text-align: center;
                margin-top: 20px;
            }
            .manageOrder-right table {
                display: inline-block;
                width: 80%;
                border-collapse: collapse;
            }
            .manageOrder-right table th:nth-child(1),
            .manageOrder-right table th:nth-child(3)
            {
                width: 30%;
            }
            .manageOrder-right table th:nth-child(4),
            .manageOrder-right table th:nth-child(5)
            {
                width: 15%;
            }
            .manageOrder-right table th:nth-child(2),
            .manageOrder-right table th:nth-child(6)
            {
                width: 5%;
            }
            .allListTable ul{
                list-style: none;
                display: flex;
                padding: 0 20px;
            }
            .allListTable ul li{
                font-size: 24px;
                margin: 0 20px;
            }
            .allListTable ul li a {
                color: black;
                border: 1px solid gray;
                padding: 10px;
                text-decoration: none;
            }
        </style>

    </head>
    <body>
        <div class="manageOrder">
            <div class="manageOrder-left">
                <ul>
                    <li onclick="manageOrderAction('viewOrder')" id="refreshBtn">View Order</li>
                    <li onclick="manageOrderAction('viewTable')" id="clearBtn">View Table</li>
                </ul>
            </div>
            <div class="manageOrder-right">
                <c:if test="${sessionScope.allListOrderLine!=null}">
                    <div id="table-container">

                    </div>
                </c:if>
                <c:if test="${sessionScope.allListTable!=null}">
                    <div class="allListTable">
                        <ul>
                            <c:forEach items="${sessionScope.allListTable}" var="t">
                                <li><a href="ViewTable?idTable=${t.id}">${t.nameTable}</a></li>
                                </c:forEach>
                        </ul>
                    </div>
                </c:if>
                <c:if test="${requestScope.orderDetail!=null}">
                    <table border="1">
                        <thead>
                            <tr>
                                <th>Product Name</th>
                                <th>Quantity</th>
                                <th>Note</th>
                                <th>Time</th>
                                <th>Table</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <c:forEach items="${requestScope.orderDetail}" var="o">
                            <c:if test="${o.sid.id==2}">
                                <tbody>
                                <td>${o.pid.name}</td>
                                <td>${o.quantity}</td>
                                <td>lskdfjlskdf</td>
                                <td>${o.dateOrderline}</td>
                                <td>${o.tid.nameTable}</td>
                                <td><a href="">Confirm</a></td>
                                </tbody>
                            </c:if>
                        </c:forEach>
                    </table>
                </c:if>
            </div>
        </div>

    </body>
    <script>
        function manageOrderAction(ac) {
            window.location.href = "manageOrderAction?check=" + ac;
        }
    </script>
</html>