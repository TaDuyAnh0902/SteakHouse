<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            :root {
                --primary-color: #28a745;
                --secondary-color: #155724;
                --background-color: #f8f9fa;
                --text-color: #212529;
                --hover-color: #218838;
                --danger-color: #dc3545;
                --warning-color: #ffc107;
            }
            #table-container table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
            }

            #table-container th, td {
                padding: 12px;
                border: 1px solid #ddd;
                text-align: center;
                vertical-align: middle;
            }

            #table-container th {
                background-color: var(--primary-color);
                color: white;
            }

            #table-container tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            #table-container tr:hover {
                background-color: #ddd;
            }

            #table-container th:hover {
                cursor: pointer;
            }
            .manageOrder {
                display: flex;
                height: 100vh;
            }
            /*            .manageOrder-left {
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
                        }*/
            .manageOrder-left {
                width: 20%;
                font-size: 20px;
                min-height: 500px;
            }

            .manageOrder-left > ul {
                list-style: none;
                display: block;
                min-height: 1500px;
                /*height: 100%;*/
                background: #E2D9BC;
                padding: 0;
                margin: 0;
                border-radius: 5px;
                overflow: hidden;
            }

            .manageOrder-left ul li {
                cursor: pointer;
                padding: 16px;
                padding-left: 16%;
                border-bottom: 1px solid rgb(179, 179, 179);
                transition: background-color 0.3s ease, color 0.3s ease;
            }

            .manageOrder-left ul li:hover {
                color: var(--hover-color);
                background-color: var(--background-color);
            }
            .manageOrder-right {
                width: 80%;
            }
            .manageOrder-right-content {
                display: flex;
            }
            #table-container {
                width: 70%;
                /*padding: 0 10px;*/
            }
            /*            #table-container table {
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
                        #table-container table th:hover{
                            cursor: pointer;
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
                        }*/
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
            input[type="number"]{
                width: 10%;
            }
        </style>

    </head>
    <body>
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
                                        <th colspan="2"></th>
                                    </tr>
                                </thead>
                                <c:forEach items="${sessionScope.allListOrderLine}" var="o">
                                    <c:if test="${o.sid.id!=1}">
                                        <tbody>
                                        <td>
                                            <div style="display: flex; justify-content: space-between; align-items: center;">
                                                <div>
                                                    <p style="text-align: left" > ${o.pid.name}   (${o.pid.quantity}) </p>
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
                                                <a href="ConfirmOrderByCashier?id=${o.id}&pid=${o.pid.id}&quantity=${o.quantity}" style="text-decoration: none;color: brown" onclick="return confirmProduct()">Xác Nhận</a>
                                            </c:if>
                                            <c:if test="${o.sid.id==3}">
                                                <i class="fas fa-check" style="color:green;"></i>
                                            </c:if>
                                        </td>
                                        <td>
                                            <a href="cashierAction?check=edit&id=${o.id}"><i class="fas fa-edit" style="color:green;"></i></a>
                                        </td>
                                        <td>
                                            <a href="cashierAction?check=delete&id=${o.id}&tid=${o.tid.id}" onclick="return confirmDeletion()">
                                                <i class="fas fa-trash" style="color:green;"></i>
                                            </a>
                                        </td>
                                        </tbody>
                                    </c:if>
                                </c:forEach>
                            </table>
                        </div>
                        <div id="RequestPayment-content" style="margin: 0 auto;">
                            <c:if test="${requestScope.editOrderline!=null}">
                                <div>
                                    <c:set var="olt" value="${requestScope.editOrderline}"/>
                                    <h3 style="color: brown;">Sửa sản phẩm</h3>
                                    <form action="orderlineAction" method="post">
                                        <input type="hidden" value="${olt.id}" name="id"/>
                                        <input type="hidden" value="${olt.pid.id}" name="pid"/>
                                        <img src="${olt.pid.image}" width="30px" height="30px" alt="alt" style="border-radius: 16px;"/>${olt.pid.name} - Bàn ${olt.tid.id} - Số lượng: 
                                        <input type="number" value="${olt.quantity}" name="quantity"/>
                                        <input type="submit" value="Sửa" style="background-color: #E2D9BC;
                                               color: brown; width: 50px; height: 30px; border: 0; border-radius: 8px;
                                               cursor: pointer;"  onsubmit="return confirmEdit();"/>
                                    </form>
                                </div>
                            </c:if>
                            <h3 style="color: brown;">Thông báo thanh toán</h3>
                            <ul style="list-style: none;">
                                <c:forEach items="${sessionScope.listPaymentRequest}" var="l">
                                    <c:set var="type" value="${l.type}"/>
                                    <li>
                                        <div style="display: flex; justify-content: space-between;
                                             align-items: center; width: 100%; height: 50px;
                                             color: black; background-color: white;
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
                                <h3 style="margin-top: 50px;color: brown;">Yêu cầu khách hàng</h3>
                                <c:forEach items="${sessionScope.listClientRequest}" var="cl">
                                    <li>
                                        <div style="display: flex; justify-content: space-between;
                                             align-items: center; width: 100%; height: 50px;
                                             color: black; background-color: white;
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
                <c:if test="${sessionScope.changedQuantity!=null}">
                    <script>
                        alert("${sessionScope.changedQuantity}");
                    </script>
                </c:if>

                <c:if test="${sessionScope.tableStatus!=null}">
                    <div class="manageOrder-right-content">
                        <div class="allListTable">
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
                                    <table style="width: 350px;" border="0">
                                        <thead style="width: 100%; border-bottom: 1px solid gray;border-top: 1px solid gray;">
                                            <tr>
                                                <th style=" width: 50%;">Tên</th>
                                                <th>Số lượng</th>
                                                <th>Giá</th>
                                            </tr>
                                        </thead>
                                        <c:forEach items="${requestScope.orderDetail}" var="o">
                                            <c:set var="table" value="${o.tid.id}"/>
                                            <c:if test="${o.sid.id!=1}">
                                                <tbody>
                                                <td style="border: 0; font-size: 16px;">${o.pid.name}</td>
                                                <td style="border: 0;">${o.quantity}</td>
                                                <td style="border: 0; float: right;">
                                                    ${o.pid.price}00
                                                </td>
                                                </tbody>
                                            </c:if>
                                        </c:forEach>
                                        <tbody style="border-bottom: 1px solid gray;border-top: 1px solid gray;">
                                        <td colspan="2" style="color: brown; border: 0;">Tổng tiền</td>
                                        <td style="color: #F90; border: 0; float: right;"class="totalMoney">${requestScope.totalMoney}</td>
                                        </tbody>
                                        <tfoot>
                                        <td colspan="3" style="border: 0;">
                                            <a href="pay?idTable=${table}&totalMoney=${requestScope.totalMoney}" 
                                               style="color: red;font-size: 20px; text-decoration: none; display: block; text-align: center;"
                                               onclick="return confirmCompletion()">
                                                Hoàn tất
                                            </a>
                                        </td>
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

    <script>
        function confirmDeletion() {
            var result = confirm("Bạn có chắc chắn muốn xóa món này không?");
            return result;
        }

        function confirmCompletion() {
           var result = confirm("Bạn có chắc chắn muốn hoàn tất đơn hàng này không?");
            return result;
        }

        function confirmProduct() {
            var result = confirm("Món ăn đã được phục vụ chưa?");
            return result;
        }
    </script>
</html>
