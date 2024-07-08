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
       body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f8f9fa;
            }
            .manageOrder {
                display: flex;
                height: 100vh;
            }
            .manageOrder-left {
                width: 20%;
                background-color: #343a40;
                color: white;
                padding: 20px 0;
            }
            .manageOrder-left ul {
                list-style: none;
                padding: 0;
                margin: 0;
            }
            .manageOrder-left ul li {
                padding: 20px;
                text-align: center;
                cursor: pointer;
                border-bottom: 1px solid #495057;
                transition: background-color 0.3s;
            }
            .manageOrder-left ul li:hover {
                background-color: #495057;
            }
            .manageOrder-right {
                flex: 1;
                padding: 20px;
                overflow-y: auto;
                background-color: white;
            }
            .manageOrder-right h4 {
                text-align: center;
                color: red;
                margin-bottom: 20px;
            }
            #table-container {
                width: 100%;
                margin-bottom: 20px;
            }
            #table-container table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
            }
            #table-container th,
            #table-container td {
                padding: 10px;
                border: 1px solid #dee2e6;
                text-align: center;
            }
            #table-container th {
                background-color: #e9ecef;
                cursor: pointer;
            }
            .notification {
                background-color: white;
                border: 1px solid #dee2e6;
                border-radius: 8px;
                padding: 15px;
                margin-bottom: 10px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                transition: background-color 0.3s;
            }
            .notification:hover {
                background-color: #f8f9fa;
            }
            .allListTable {
                display: grid;
                grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
                gap: 20px;
            }
            .allListTable a {
                display: block;
                text-decoration: none;
                padding: 20px;
                border: 1px solid gray;
                border-radius: 10px;
                text-align: center;
                background-color: #e2d9bc;
                color: black;
                transition: background-color 0.3s;
            }
            .allListTable a:hover {
                background-color: #c2b49a;
            }
            .ListOrderbyTable {
                border: 1px solid gray;
                padding: 20px;
                border-radius: 10px;
            }
            .ListOrderbyTable table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }
            .ListOrderbyTable th,
            .ListOrderbyTable td {
                padding: 10px;
                border: 1px solid #dee2e6;
                text-align: center;
            }
            .ListOrderbyTable th {
                background-color: #e9ecef;
            }
            .totalMoney {
                font-weight: bold;
                color: #f90;
            }
            .complete-link {
                color: red;
                font-size: 20px;
                text-decoration: none;
                display: block;
                text-align: center;
                margin-top: 20px;
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
                                        <th onclick="OrderSort('name')">Tên món ăn</th>
                                        <th onclick="OrderSort('quantity')">Số lượng</th>
                                        <th onclick="OrderSort('time')">Thời gian</th>
                                        <th onclick="OrderSort('table')">Bàn</th>
                                        <th onclick="OrderSort('status')">Trạng thái</th>
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
                            <h3>Thông báo thanh toán</h3>
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
                                             color: brown; background-color: white;
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
        function OrderSort(id) {
            var currentUrl = window.location.href;
            if (id === "name") {
                var baseUrlHome = "http://localhost:9999/SWP391-SteakHouse/orderSort?check=name&action=NameDESC";
                if (currentUrl === baseUrlHome) {
                    window.location.href = "orderSort?check=name&action=NameASC";
                } else {
                    window.location.href = "orderSort?check=name&action=NameDESC";
                }
            }
            if (id === "quantity") {
                var baseUrlHome = "http://localhost:9999/SWP391-SteakHouse/orderSort?check=quantity&action=QuantityDESC";
                if (currentUrl === baseUrlHome) {
                    window.location.href = "orderSort?check=quantity&action=QuantityASC";
                } else {
                    window.location.href = "orderSort?check=quantity&action=QuantityDESC";
                }
            }
            if (id === "time") {
                var baseUrlHome = "http://localhost:9999/SWP391-SteakHouse/orderSort?check=time&action=TimeDESC";
                if (currentUrl === baseUrlHome) {
                    window.location.href = "orderSort?check=time&action=TimeASC";
                } else {
                    window.location.href = "orderSort?check=time&action=TimeDESC";
                }
            }
            if (id === "table") {
                var baseUrlHome = "http://localhost:9999/SWP391-SteakHouse/orderSort?check=table&action=TableDESC";
                if (currentUrl === baseUrlHome) {
                    window.location.href = "orderSort?check=table&action=TableASC";
                } else {
                    window.location.href = "orderSort?check=table&action=TableDESC";
                }
            }
            if (id === "status") {
                var baseUrlHome = "http://localhost:9999/SWP391-SteakHouse/orderSort?check=status&action=StatusDESC";
                if (currentUrl === baseUrlHome) {
                    window.location.href = "orderSort?check=status&action=StatusASC";
                } else {
                    window.location.href = "orderSort?check=status&action=StatusDESC";
                }
            }
        }

    </script>
</html>