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
                .confirm-dialog {
                    display: none;
                    position: fixed;
                    top: 50%;
                    left: 50%;
                    transform: translate(-50%, -50%);
                    background-color: white;
                    padding: 20px;
                    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                    z-index: 1000;
                    text-align: center;
                    width: 80%;
                    max-width: 300px;
                    border-radius: 10px;
                }

                .confirm-dialog.active {
                    display: block;
                }

                .confirm-dialog button {
                    margin: 10px 5px;
                    padding: 10px 20px;
                    border: none;
                    cursor: pointer;
                    width: 40%;
                }

                .confirm-dialog .confirm-yes {
                    background-color: #f44336;
                    color: white;
                    border-radius: 5px;
                }

                .confirm-dialog .confirm-no {
                    background-color: #ccc;
                    color: black;
                    border-radius: 5px;
                }

                /* CSS cho nền tối */
                .confirm-overlay {
                    display: none;
                    position: fixed;
                    top: 0;
                    left: 0;
                    width: 100%;
                    height: 100%;
                    background-color: rgba(0, 0, 0, 0.5);
                    z-index: 999;
                }

                .confirm-overlay.active {
                    display: block;
                }

                /* Đảm bảo kích thước phông chữ phù hợp cho điện thoại di động */
                body {
                    font-size: 16px;
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
                        <td>

                            <a href="deleteProductByMobile?id=${order.id}" style="background-color: white;" onclick="openConfirmDialog(event, 'deleteProductByMobile?id=${order.id}', 'delete');">
                                <i class="fas fa-trash-alt"></i>
                            </a>    

                        </td>
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
            <a href="ConfirmOrder?action=buy&idTable=${sessionScope.tableNumber}" style="background-color: white;" onclick="openConfirmDialog(event, 'ConfirmOrder?action=buy&idTable=${sessionScope.tableNumber}', 'order');">
                Đặt
            </a>
        </div>
        <div class="confirm-overlay" id="confirmOverlay"></div>
        <div class="confirm-dialog" id="confirmDialog">
            <p id="confirmMessage">Bạn có chắc chắn muốn thực hiện hành động này không?</p>
            <button class="confirm-yes" id="confirmYesButton">Xác nhận</button>
            <button class="confirm-no" onclick="closeConfirmDialog()">Hủy</button>
        </div>
    </body>
    <script>
        let confirmLink;

        function openConfirmDialog(event, link, actionType) {
            event.preventDefault();
            confirmLink = link;

            const confirmDialog = document.getElementById('confirmDialog');
            const confirmMessage = document.getElementById('confirmMessage');
            const confirmYesButton = document.getElementById('confirmYesButton');

            if (actionType === 'delete') {
                confirmMessage.textContent = "Bạn có chắc chắn muốn xóa món ăn này không?";
                confirmDialog.classList.add('delete');
                confirmYesButton.textContent = "Xóa";
            } else if (actionType === 'order') {
                confirmMessage.textContent = "Bạn có chắc chắn muốn đặt hàng không?";
                confirmDialog.classList.remove('delete');
                confirmYesButton.textContent = "Đặt";
            }

            document.getElementById('confirmOverlay').classList.add('active');
            confirmDialog.classList.add('active');
        }

        function closeConfirmDialog() {
            document.getElementById('confirmDialog').classList.remove('active');
            document.getElementById('confirmOverlay').classList.remove('active');
        }

        document.getElementById('confirmYesButton').addEventListener('click', function () {
            closeConfirmDialog();
            window.location.href = confirmLink;
        });
    </script>
</html>