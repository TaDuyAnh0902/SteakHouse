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
                height: 100vh;
            }
            .manageOrder-left {
                width: 20%;
                font-size: 20px;
                border-right: 1px solid gray;
            }
            .manageOrder-left > ul {
                list-style: none;
                display: block;
                height: 100%;
            }
            .manageOrder-left ul li {
                cursor: pointer;
                padding: 16px;
                text-align: center;
                border-bottom: 1px solid rgb(179, 179, 179);
            }
            .manageOrder-left ul li:hover {
                background-color: #E2D9BC;
            }
            .manageOrder-right {
                width: 80%;
                margin-top: 20px;
            }
            .manageOrder-right-content {
                display: flex;
            }
            #table-container {
                width: 70%;
                padding: 0 10px;
            }
            #table-container table {
                display: inline-block;
                width: 100%;
                border-collapse: collapse;
            }
            #table-container th,
            #table-container td {
                padding: 5px;
            }
            #table-container thead {
                width: 100%;
            }
            #table-container table th {
                text-align: center;
            }
            #table-container table thead:nth-child(1) {
                border-top-left-radius: 16px;
            }
            #table-container th:nth-child(1),
            #table-container th:nth-child(3)
            {
                width: 40%;
            }
            #table-container th:nth-child(4),
            #table-container th:nth-child(5)
            {
                width: 15%;
            }
            #table-container th:nth-child(2)
            {
                width: 10%;
            }
            .allListTable {
                display: flex;
                flex-wrap: wrap;
                font-size: 24px;
            }
            .allListTable > div {
                width: calc(20% - 40px);
                margin: 20px;
                display: flex;
            }
            .allListTable a {
                color: black;
                padding: 10px;
                border: 1px solid gray;
                height: 120px;
                width: 300px;
                border-radius: 40%;
                text-decoration: none;
                padding-top: 40px;
            }
            .manageOrder-right-content {
                display: flex;
            }
            .ListOrderbyTable {
                text-align: center;
            }
            .ListOrderbyTable td:nth-child(1){
                text-align: start;
            }
            .ListOrderbyTable table th:nth-child(1)
            {
                width: 40%;
            }
            .ListOrderbyTable table th:nth-child(2),
            .ListOrderbyTable table th:nth-child(3)
            {
                width: 30%;
            }
            .ListOrderbyTable table td:nth-child(3),
            .totalMoney{
                text-align: end;
                padding-right: 10%;
            }
            #RequestPayment-content li{
                width: 100%;
            }
        </style>

    </head>
    <body>
        <h4 style="text-align: center; color: red;"><c:out value="${requestScope.payFail}"/></h4>
        <div class="manageOrder">
            <div class="manageOrder-left">
                <ul>
                    <li onclick="manageOrderAction('viewOrder')" id="refreshBtn">Đơn hàng</li>

                    <li onclick="manageOrderAction('viewTable')" id="clearBtn">Quản lý bàn</li>
                </ul>
            </div>

            <div class="manageOrder-right">
                <c:if test="${sessionScope.allListOrderLine!=null}">
                    <div class="manageOrder-right-content">
                        <div id="table-container">
                            <table border="1">
                                <thead>
                                    <tr>
                                        <th>Tên món ăn</th>
                                        <th>Số lượng</th>
                                        <th>Thời gian</th>
                                        <th>Bàn</th>
                                        <th>Trạng thái</th>
                                    </tr>
                                </thead>
                                <c:forEach items="${sessionScope.allListOrderLine}" var="o">
                                    <c:if test="${o.sid.id!=1}">
                                        <tbody>
                                        <td>
                                            <div style="display: flex; justify-content: space-between; align-items: center;">
                                                <div>
                                                    ${o.pid.name} 
                                                </div>
                                                <div>
                                                    <img src="${o.pid.image}" width="50px" height="50px" alt="alt" style="border-radius: 16px;"/>
                                                </div>
                                            </div>
                                        </td>
                                        <td style="text-align: center;">${o.quantity}</td>
                                        <td>${o.dateOrderline}</td>
                                        <td style="text-align: center;">${o.tid.nameTable}</td>
                                        <td style="text-align: center;">
                                            <c:if test="${o.sid.id==2}">
                                                <a href="ConfirmOrderByCashier?id=${o.id}&pid=${o.pid.id}&quantity=${o.quantity}">Confirm</a>
                                            </c:if>
                                            <c:if test="${o.sid.id==3}">
                                                Done
                                            </c:if>
                                        </td>
                                        </tbody>
                                    </c:if>
                                </c:forEach>
                            </table>
                        </div>
                        <div id="RequestPayment-content">
                            <h3>Thông báo </h3>
                            <ul style="list-style: none;">
                                <c:forEach items="${sessionScope.listPaymentRequest}" var="l">
                                    <c:set var="type" value="${l.type}"/>
                                    <li>
                                        <div style="display: flex; justify-content: space-between;
                                             align-items: center; width: 100%; height: 50px;
                                             color: brown; background-color: white;
                                             padding: 5px; border-radius: 8px; margin-bottom: 5px;">
                                            <div>
                                                <c:if test="${type==1}">
                                                    <span>Tiền mặt</span>
                                                </c:if>
                                                <c:if test="${type==2}">
                                                    <span>Thẻ ngân hàng</span>
                                                </c:if>
                                                <c:if test="${type==3}">
                                                    <span>Ứng dụng điện thoại</span>
                                                </c:if>
                                            </div>
                                            <div>
                                                <span>Bàn ${l.tid.id}</span>
                                            </div>
                                        </div>
                                    </li>
                                </c:forEach>
                                <c:forEach items="${sessionScope.listClientRequest}" var="cl">
                                    <li>
                                        <div style="display: flex; justify-content: space-between;
                                             align-items: center; width: 100%; height: 50px;
                                             color: orange; background-color: white;
                                             padding: 5px; border-radius: 8px; margin-bottom: 5px;">
                                            <div>
                                                <span>${cl.content}</span>
                                            </div>
                                            <div>
                                                <span>Bàn ${cl.tid.id}</span>
                                            </div>
                                        </div>
                                    </li>
                                </c:forEach>
                            </ul>

                        </div>
                    </div>
                </c:if>
                <c:if test="${sessionScope.tableStatus!=null}">
                    <div class="manageOrder-right-content">
                        <div class="allListTable">

                            <%--<c:forEach items="${sessionScope.allListTable}" var="t">--%>
                                <!--<li><a href="ViewTable?idTable=${t.id}">${t.nameTable}</a></li>-->
                            <%--</c:forEach>--%>
                            <c:forEach var="entry" items="${sessionScope.tableStatus}">
                                <c:set var="key" value="${entry.key}" />
                                <c:set var="value" value="${entry.value}" />

                                <c:if test="${value==true}">
                                    <div><a href="ViewTable?idTable=${key}" style="color: brown; background-color: #E2D9BC; text-align: center;">Bàn ${key}</a></div>
                                </c:if>
                                <c:if test="${value==false}">
                                    <div><a href="ViewTable?idTable=${key}" style="text-align: center;">Bàn ${key}</a></div>
                                </c:if>
                            </c:forEach>

                        </div>
                        <c:if test="${requestScope.orderDetail!=null}">
                            <div style="border: 1px solid gray; padding: 0 10px;" class="ListOrderbyTable">
                                <h2>SteakHouse</h2>
                                <h5>Ăn tại chỗ</h5>
                                <hr>
                                <c:forEach items="${requestScope.orderDetail}" var="o">
                                    <c:set var="time" value="${o.dateOrderline}"/>
                                </c:forEach>

                                <c:if test="${time!=null}">
                                    Thời gian đặt hàng: <c:out value="${time}"/>
                                    <table style="width: 350px;">
                                        <thead style="width: 100%; border-bottom: 1px solid gray;border-top: 1px solid gray;">
                                            <tr>
                                                <th>Tên</th>
                                                <th>Số lượng</th>
                                                <th>Giá</th>
                                            </tr>
                                        </thead>
                                        <c:forEach items="${requestScope.orderDetail}" var="o">
                                            <c:set var="table" value="${o.tid.id}"/>
                                            <c:if test="${o.sid.id!=1}">
                                                <tbody>
                                                <td>${o.pid.name}</td>
                                                <td>${o.quantity}</td>
                                                <td>
                                                    ${o.pid.price}00
                                                </td>
                                                </tbody>
                                            </c:if>
                                        </c:forEach>
                                        <tbody style="border-bottom: 1px solid gray;border-top: 1px solid gray;">
                                        <td colspan="2" style="color: brown;">Tổng tiền</td>
                                        <td style="color: #F90;"class="totalMoney">${requestScope.totalMoney}</td>
                                        </tbody>
                                        <tfoot>
                                        <td colspan="3" ><a href="pay?idTable=${table}&totalMoney=${requestScope.totalMoney}" style="color: red;font-size: 20px;
                                                            text-decoration: none; display: block; text-align: center;">Hoàn tất</a></td>
                                        </tfoot>
                                    </table>
                                </c:if>

                            </div>
                        </c:if>
                    </div>
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