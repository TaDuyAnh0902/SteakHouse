<%-- 
    Document   : manage
    Created on : May 28, 2024, 2:06:48 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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

            body {
                font-family: Arial, sans-serif;
                background-color: var(--background-color);
                color: var(--text-color);
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            .manageContent {
                display: flex;
                justify-content: center;
                /*min-height: 100vh;*/
                margin: 0 auto;
            }

            .manageOption {
                width: 20%;
                font-size: 20px;
                min-height: 500px;
            }

            .manageOption > ul {
                list-style: none;
                display: block;
                height: 100%;
                min-height: 100vh;
                /*height: 100%;*/
                background: #E2D9BC;
                padding: 0;
                margin: 0;
                border-radius: 5px;
                overflow: hidden;
            }

            .manageOption ul li {
                cursor: pointer;
                padding: 16px;
                padding-left: 16%;
                border-bottom: 1px solid rgb(179, 179, 179);
                transition: background-color 0.3s ease, color 0.3s ease;
            }

            .manageOption ul li:hover {
                color: var(--hover-color);
                background-color: var(--background-color);
            }

            #wrapperrr {
                width: 80%;
                font-family: Arial, sans-serif;
                margin-bottom: 100px;
                background-color: white;
                border-radius: 5px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            .imgProduct {
                width: 80px;
                height: 80px;
                object-fit: cover;
            }

            .clr {
                clear: both;
            }

            #menu_tab {
                width: 100%;
            }

            ul.menu {
                display: flex;
                background-color: var(--secondary-color);
                list-style-type: none;
                font-weight: bold;
                padding: 0;
                margin: 0;
                height: 50px;
                align-items: center;
            }

            ul.menu li {
                flex: 1;
                text-align: center;
                line-height: 50px;
                color: #E2D9BC;
            }

            ul.menu li a {
                text-decoration: none;
                color: #E2D9BC;
                display: block;
                width: 100%;
                height: 100%;
                transition: color 0.3s ease;
            }

            ul.menu li a:hover {
                color: var(--hover-color);
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
            }

            th, td {
                padding: 12px;
                border: 1px solid #ddd;
                text-align: center;
                vertical-align: middle;
            }

            th {
                background-color: var(--primary-color);
                color: white;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            tr:hover {
                background-color: #ddd;
            }

            th:hover {
                cursor: pointer;
            }

            a {
                text-decoration: none;
                color: var(--primary-color);
                font-weight: bold;
                transition: color 0.3s ease;
            }

            a:hover {
                color: var(--hover-color);
            }

            .add {
                background-color: var(--primary-color);
                color: white;
                margin: 10px;
                height: 40px;
                border-radius: 4px;
                border: none;
                padding: 0 20px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .add:hover {
                background-color: var(--hover-color);
            }

            .confirmation-dialog {
                display: none;
                position: fixed;
                left: 50%;
                top: 50%;
                transform: translate(-50%, -50%);
                background-color: white;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                z-index: 1000;
            }

            .confirmation-dialog p {
                margin: 0 0 20px 0;
            }

            .confirmation-dialog button {
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .confirmation-dialog .confirm {
                background-color: var(--danger-color);
                color: white;
            }

            .confirmation-dialog .confirm:hover {
                background-color: #c82333;
            }

            .confirmation-dialog .cancel {
                background-color: var(--warning-color);
                color: black;
            }

            .confirmation-dialog .cancel:hover {
                background-color: #e0a800;
            }
            .searchProduct {
                margin: 10px;
                height: 40px;
                border-radius: 4px;
                padding: 5px;
                font-size: 16px;
            }
        </style>
    </head>
    <body>
        <div class="manageContent">
            <div class="manageOption">
                <ul>
                    <li onclick="ac('statistics')">Dashboard</li>
                    <li onclick="ac('productsManagement')">Product Management</li>
                    <li onclick="ac('accountManagement')">Account Management</li>
                    <li onclick="ac('blogManagement')">Blog Management</li>
                    <li onclick="ac('tableManagement')">Table Management</li>
                </ul>
            </div>

            <div id="wrapperrr">


                <c:if test="${sessionScope.statistics!=null}">
                    <%@include file="admin.jsp" %>
                </c:if>



                <c:if test="${sessionScope.productsManagement!=null}">

                    <div id="menu_tab">
                        <ul class="menu">
                            <c:forEach var="c" items="${sessionScope.data}">
                                <li><a href="manage?cid=${c.id}">${c.name}</a></li>
                                </c:forEach>
                        </ul>
                    </div>
                    <div class="clr"></div>
                    <div class="content">
                        <table border="1">
                            <c:if test="${requestScope.productSize > 0}">
                                <tr>
                                    <th>No.</th>
                                    <th onclick="productSort('name')">Name</th>
                                    <th>Image</th>
                                    <th onclick="productSort('quantity')">Quantity</th>
                                    <th onclick="productSort('price')">Price</th>
                                    <th>Describe</th>
                                    <th>Status</th>
                                    <th colspan="2">Action</th>
                                </tr>
                            </c:if>
                            <c:if test="${requestScope.productSize == 0}">
                                <p style="text-align: center; font-size: 32px;">Product not found</p>
                            </c:if>
                            <c:set var="cid" value="${null}"/>

                            <c:forEach items="${requestScope.products}" var="p">
                                <c:set var="cid" value="${p.category.id}"/>
                                <tr>
                                    <td>${p.id}</td>
                                    <td>${p.name}</td>
                                    <td><img src="${p.image}" alt="${p.image}" class="imgProduct"/></td>
                                    <td>${p.quantity}</td>
                                    <td>${p.price}</td>
                                    <td>${p.describe}</td>
                                    <c:if test="${p.sid.id==1}">
                                        <td><i class="fas fa-check" style="color:green;"></i></td>
                                    </c:if>
                                    <c:if test="${p.sid.id==2}">
                                        <td><i class="fas fa-times" style="color:red;"></i></td>
                                    </c:if>
                                    <td><a href="productAction?action=edit&id=${p.id}"><i class="fas fa-edit"></i></a></td>
                                            <c:if test="${p.sid.id==1}">
                                        <td><a href="productAction?action=delete&id=${p.id}&cid=${p.category.id}" onclick="return confirmDeleteProduct(${p.id});"><i class="fas fa-trash"></i></a></td>
                                            </c:if>
                                            <c:if test="${p.sid.id==2}">
                                        <td><a href="productAction?action=restore&id=${p.id}&cid=${p.category.id}" onclick="return confirmRestoreProduct(${p.id});"><i class="fas fa-recycle"></i></a></td>
                                            </c:if>
                                </tr>
                            </c:forEach>
                            <c:if test="${cid!=null}">
                                <div style="display: flex;">
                                    <form action="checkAdd">
                                        <input type="hidden" name="cid" value="${cid}">
                                        <input type="submit" value="Add Product" class="add">
                                    </form>
                                    <form action="adminSearch">
                                        <input type="hidden" name="cid" value="${cid}">
                                        <input type="text" placeholder="Search" name="productSearch" class="searchProduct" value="${requestScope.productSearchContent}">
                                    </form>
                                </div>
                            </c:if>

                        </table>
                    </div>
                    <c:if test="${requestScope.productAdd!=null}"> 
                        <%@include file="productAdd.jsp" %> 
                    </c:if>

                    <c:if test="${requestScope.productUpdate!=null}"> 
                        <%@include file="productUpdate.jsp" %> 
                    </c:if>
                </c:if>



                <c:if test="${sessionScope.accountManagement!=null}">

                    <div>

                        <div>
                            <form action="adminSearch">
                                <input type="text" placeholder="Search" name="accountSearch" class="searchProduct" value="${requestScope.accountSearchContent}">
                            </form>
                        </div>
                        <div class="content">
                            <table border="1">
                                <c:if test="${requestScope.accountSize > 0}">
                                    <tr>
                                        <th onclick="accountSort('username')">Username</th>
                                        <th onclick="accountSort('name')">Name</th>
                                        <th>Email</th>
                                        <th>Phone</th>
                                        <th onclick="accountSort('status')">Status</th>
                                        <th colspan="2">Action</th>
                                    </tr>
                                </c:if>
                                <c:if test="${requestScope.accountSize == 0}">
                                    <p style="text-align: center; font-size: 32px;">Account not found</p>
                                </c:if>

                                <c:forEach items="${sessionScope.accountManage}" var="a">
                                    <c:if test="${a.role==3}">
                                        <tr>
                                            <td>${a.username}</td>
                                            <td>${a.name}</td>
                                            <td>${a.email}</td>
                                            <td>${a.phoneNumber}</td>
                                            <c:if test="${a.sid.id==1}">
                                                <td><i class="fas fa-check" style="color:green;"></i></td>
                                            </c:if>
                                            <c:if test="${a.sid.id==2}">
                                                <td><i class="fas fa-times" style="color:red;"></i></td>
                                            </c:if>
                                            <c:if test="${a.sid.id==1}">
                                                <td><a href="accountAction?action=delete&username=${a.username}" onclick="return confirmDeleteAccount('${a.username}');"><i class="fas fa-trash"></i></a></td>
                                                    </c:if>
                                                    <c:if test="${a.sid.id==2}">
                                                <td><a href="accountAction?action=restore&username=${a.username}" onclick="return confirmRestoreAccount('${a.username}');"><i class="fas fa-recycle"></i></a></td>
                                                    </c:if>
                                        </tr>
                                    </c:if>

                                </c:forEach>
                            </table>
                        </div>
                    </div>
                </c:if>

                <c:if test="${sessionScope.blogManagement!=null}">
                    <c:if test="${requestScope.blogAdd!=null}"> 
                        <%@include file="blogAdd.jsp" %> 
                    </c:if>
                    <c:if test="${requestScope.blogUpdate!=null}"> 
                        <%@include file="blogUpdate.jsp" %> 
                    </c:if>
                    <c:if test="${requestScope.blogAdd==null && requestScope.blogUpdate==null}">
                        <form action="blogAction">
                            <input type="submit" value="Add blog" class="add" name="action">
                        </form>
                    </c:if>
                    <div>
                        <div class="content">
                            <table border="1">
                                <c:if test="${sessionScope.blogManage!=null}">
                                    <tr>
                                        <th>No.</th>
                                        <th style="width: 35%;">Title</th>
                                        <th>Image</th>
                                        <th>Date</th>
                                        <th>Source</th>
                                        <th>Status</th>
                                        <th colspan="2">Action</th>
                                    </tr>
                                </c:if>
                                <c:forEach items="${sessionScope.blogManage}" var="b">
                                    <tr>
                                        <td>${b.id}</td>
                                        <td>${b.title}</td>
                                        <td><img src="${b.image}" alt="${p.image}" class="imgProduct"/></td>
                                        <td>${b.date}</td>
                                        <td><a href="${b.source}">${b.source}</a></td>
                                        <c:if test="${b.sid.id==1}">
                                            <td><i class="fas fa-check" style="color:green;"></i></td>
                                        </c:if>
                                        <c:if test="${b.sid.id==2}">
                                            <td><i class="fas fa-times" style="color:red;"></i></td>
                                        </c:if>
                                        <td><a href="blogAction?action=edit&id=${b.id}"><i class="fas fa-edit"></i></a></td>
                                                <c:if test="${b.sid.id==1}">
                                            <td><a href="blogAction?action=delete&id=${b.id}" onclick="return confirmDeleteBlog(${t.id});"><i class="fas fa-trash"></i></a></td>
                                                </c:if>
                                                <c:if test="${b.sid.id==2}">
                                                <td><a href="blogAction?action=restore&id=${b.id}" onclick="return confirmRestoreBlog(${t.id});"><i class="fas fa-recycle"></i></a></td>
                                                </c:if>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                    </div>

                </c:if>



                <c:if test="${sessionScope.tableManagement!=null}">
                    <c:if test="${requestScope.tableAdd==null && requestScope.tableUpdate==null}">
                        <form action="tableAction">
                            <input type="submit" value="Add table" class="add" name="action">
                        </form>
                    </c:if>

                    <div>
                        <div class="content">
                            <table border="1">
                                <tr>
                                    <th>No.</th>
                                    <th>Name</th>
                                    <th>QR code</th>
                                    <th>Status</th>
                                    <th colspan="2">Action</th>
                                </tr>

                                <c:forEach items="${sessionScope.tableManage}" var="t">
                                    <tr>
                                        <td>${t.id}</td>
                                        <td>${t.nameTable}</td>
                                        <td><a href="https://quickchart.io/qr?text=http://10.33.15.246:8080/SWP391-SteakHouse/home?idTable=${t.id}&caption=Table${t.id}" target="_blank"><i class="fas fa-eye"></i></a></td>
                                        <c:if test="${t.sid.id==1}">
                                            <td><i class="fas fa-check" style="color:green;"></i></td>
                                        </c:if>
                                        <c:if test="${t.sid.id==2}">
                                            <td><i class="fas fa-times" style="color:red;"></i></td>
                                        </c:if>
                                        <td><a href="tableAction?action=edit&id=${t.id}"><i class="fas fa-edit"></i></a></td>
                                                <c:if test="${t.sid.id==1}">
                                            <td><a href="tableAction?action=delete&id=${t.id}" onclick="return confirmDeleteTable(${b.id});"><i class="fas fa-trash"></i></a></td>
                                                </c:if>
                                                <c:if test="${t.sid.id==2}">
                                                <td><a href="tableAction?action=restore&id=${t.id}" onclick="return confirmRestoreTable(${b.id});"><i class="fas fa-recycle"></i></a></td>
                                                </c:if>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                    </div>
                    <c:if test="${requestScope.tableAdd!=null}"> 
                        <%@include file="tableAdd.jsp" %> 
                    </c:if>
                    <c:if test="${requestScope.tableUpdate!=null}"> 
                        <%@include file="tableUpdate.jsp" %> 
                    </c:if>
                </c:if>


            </div>
        </div>
    </body>



    <script>
        function togglePassword(username) {
            var passwordField = document.getElementById("password-" + username);
            var showButton = passwordField.nextElementSibling;

            if (passwordField.type === "password") {
                passwordField.type = "text";
                showButton.textContent = "Hide";
            } else {
                passwordField.type = "password";
                showButton.textContent = "Show";
            }
        }
        function ac(id) {
            window.location.href = "manageOption?check=" + id;
        }

        function confirmDeleteProduct(id) {
            var confirmation = confirm("Are you sure you want to delete your Product?");
            if (confirmation === true) {
                return true;
            } else {
                alert("Product deletion canceled.");
                return false;
            }
        }

        function confirmRestoreProduct(id) {
            var confirmation = confirm("Are you sure you want to restore your Product?");
            if (confirmation === true) {
                return true;
            } else {
                alert("Product restore canceled.");
                return false;
            }
        }

        function confirmDeleteAccount(username) {
            var confirmation = confirm("Are you sure you want to delete the Account : " + username + "?");
            if (confirmation === true) {
                return true;
            } else {
                alert("Account deletion canceled.");
                return false;
            }
        }

        function confirmRestoreAccount(username) {
            var confirmation = confirm("Are you sure you want to restore the Account : " + username + "?");
            if (confirmation === true) {
                return true;
            } else {
                alert("Account restore canceled.");
                return false;
            }
        }

        function confirmDeleteBlog(id) {
            var confirmation = confirm("Are you sure you want to delete this blog post?");
            if (confirmation === true) {
                return true;
            } else {
                alert("Blog post deletion canceled.");
                return false;
            }
        }

        function confirmRestoreBlog(id) {
            var confirmation = confirm("Are you sure you want to restore your Blog?");
            if (confirmation === true) {
                return true;
            } else {
                alert("Blog restore canceled.");
                return false;
            }
        }

        function confirmDeleteTable(id) {
            var confirmation = confirm("Are you sure you want to delete Table?");
            if (confirmation === true) {
                return true;
            } else {
                alert("Table deletion canceled.");
                return false;
            }
        }

        function confirmRestoreTable(id) {
            var confirmation = confirm("Are you sure you want to restore your Table?");
            if (confirmation === true) {
                return true;
            } else {
                alert("Table restore canceled.");
                return false;
            }
        }
    </script>
    <script>
        function productSort(id) {
            var currentUrl = window.location.href;
            if (id === "name") {
                var baseUrlHome = "http://localhost:9999/SWP391-SteakHouse/productSort?check=name&cid=${cid}&action=NameDESC";
                if (currentUrl === baseUrlHome) {
                    window.location.href = "productSort?check=name&cid=${cid}&action=NameASC";
                } else {
                    window.location.href = "productSort?check=name&cid=${cid}&action=NameDESC";
                }
            }
            if (id === "quantity") {
                var baseUrlHome = "http://localhost:9999/SWP391-SteakHouse/productSort?check=quantity&cid=${cid}&action=QuantityDESC";
                if (currentUrl === baseUrlHome) {
                    window.location.href = "productSort?check=quantity&cid=${cid}&action=QuantityASC";
                } else {
                    window.location.href = "productSort?check=quantity&cid=${cid}&action=QuantityDESC";
                }
            }
            if (id === "price") {
                var baseUrlHome = "http://localhost:9999/SWP391-SteakHouse/productSort?check=price&cid=${cid}&action=PriceDESC";
                if (currentUrl === baseUrlHome) {
                    window.location.href = "productSort?check=price&cid=${cid}&action=PriceASC";
                } else {
                    window.location.href = "productSort?check=price&cid=${cid}&action=PriceDESC";
                }
            }
        }
    </script>
    <script>
        function accountSort(id) {
            var currentUrl = window.location.href;
            if (id === "username") {
                var baseUrlHome = "http://localhost:9999/SWP391-SteakHouse/accountSort?check=username&action=UsernameDESC";
                if (currentUrl === baseUrlHome) {
                    window.location.href = "accountSort?check=username&action=UsernameASC";
                } else {
                    window.location.href = "accountSort?check=username&action=UsernameDESC";
                }
            }
            if (id === "name") {
                var baseUrlHome = "http://localhost:9999/SWP391-SteakHouse/accountSort?check=name&action=NameDESC";
                if (currentUrl === baseUrlHome) {
                    window.location.href = "accountSort?check=name&action=NameASC";
                } else {
                    window.location.href = "accountSort?check=name&action=NameDESC";
                }
            }
            if (id === "status") {
                var baseUrlHome = "http://localhost:9999/SWP391-SteakHouse/accountSort?check=status&action=StatusDESC";
                if (currentUrl === baseUrlHome) {
                    window.location.href = "accountSort?check=status&action=StatusASC";
                } else {
                    window.location.href = "accountSort?check=status&action=StatusDESC";
                }
            }
        }
    </script>
</html>
