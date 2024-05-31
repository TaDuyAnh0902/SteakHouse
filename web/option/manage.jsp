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
        <title>JSP Page</title>
        <style>
            :root {
                --green-color: rgb(139, 197, 63);
                --dark-green-color: rgb(19, 149, 79);
            }
            #wrapperrr{
                font-family: arial;
                /*padding: 0 10px;*/
                /*width: 80%;*/
                margin-bottom: 100px;
            }
            .clr {
                clear: both;
            }
            #menu_tab {
                width: 100%;
            }
            ul.menu{
                float: left;
                background-color: var(--dark-green-color);
                /*display: block;*/
                list-style-type: none;
                font-weight: bold;
                height: 50px;
                padding: 12px;
                width: 100%;
            }
            ul.menu li {
                display: inline;
                font-size: 14px;
                padding-top: 15px;
                text-align: center;
                line-height: 30px;
                color: #E2D9BC;
            }
            ul.menu li a {
                margin: 30px;
                padding-left: 0px;
                text-decoration: none;
                text-align: center;
                color: #E2D9BC;
                position: relative;
            }
            ul.menu li a img {
                float: left;
                margin-left: 10px;
            }
            ul.menu li a:hover {
                color: #F90;
            }
            ul.menu li a:active {
                color:#FF0;
            }
            ul.meny li a:focus {
                color: #96F;
            }
            #content{
                margin: 0 30px;
            }
            table{
                border-collapse: collapse;
            }
            td{
                text-align: center;
            }
            a {
                text-decoration: none;
                color: var(--green-color);
                font-weight: bold;
            }
            .add {
                background-color: var(--dark-green-color);
                color: white;
                margin: 10px;
                height: 40px;
                border-radius: 4px;
            }

            .add:hover {
                background-color: var(--green-color);
            }
            #wrapperrr table{
                width: 60%;
            }
        </style>
    </head>
    <body>
        <div id="wrapperrr">
            <c:if test="${sessionScope.productsManagement!=null}">

                <div id="menu_tab">
                    <ul class="menu">
                        <c:forEach var="c" items="${sessionScope.data}">
                            <li><a href="manage?cid=${c.id}">${c.name}</a></li>
                            </c:forEach>
                    </ul>
                </div>
                <div class="clr"></div>
                <div id="content">
                    <table border="1">
                        <c:if test="${requestScope.products!=null}">
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Image</th>
                                <th>Quantity</th>
                                <th>Price</th>
                                <th>Describe</th>
                                <th>Category Name</th>
                                <th colspan="2">Action</th>
                            </tr>
                        </c:if>

                        <c:set var="cid" value="${null}"/>
                        <!--Products-->
                        <c:forEach items="${requestScope.products}" var="p">
                            <c:set var="cid" value="${p.category.id}"/>
                            <tr>
                                <td>${p.id}</td>
                                <td>${p.name}</td>
                                <td><img src="${p.image}" alt="${p.image}" width="80px" height="80px"/></td>
                                <td>${p.quantity}</td>
                                <td>${p.price}</td>
                                <td>${p.describe}</td>
                                <td>${p.category.name}</td>
                                <td><a href="productAction?action=edit&id=${p.id}&cid=${p.category.id}">Edit</a></td>
                                <td><a href="productAction?action=delete&id=${p.id}" onclick="return confirmDeleteProduct(${p.id});">Delete</a></td>
                            </tr>
                        </c:forEach>
                        <c:if test="${cid!=null}">
                            <form action="checkAdd">
                                <input type="hidden" name="cid" value="${cid}">
                                <input type="submit" value="+ Thêm sản phẩm" class="add">
                            </form>
                        </c:if>

                    </table>
                </div>
            </c:if>

            <c:if test="${requestScope.accountManagement!=null}">

                <div>
                    <h2>Danh Sách Tài Khoản</h2>
                    <div class="content">
                        <table border="1">
                            <tr>
                                <th>Username</th>
                                <th>Password</th>
                                <th>role</th>
                                <th>Action</th>
                                <!--<th colspan="2">Action</th>-->
                            </tr>

                            <c:forEach items="${sessionScope.accountManage}" var="a">
                                <tr>
                                    <td>${a.username}</td>
                                    <td>${a.passWord}</td>
                                    <td>${a.role}</td>
<!--                                    <td><a href="accountAction?action=edit&user=${a.username}">Edit</a></td>-->
                                    <td><a href="accountAction?action=delete&username=${a.username}" onclick="return confirmDeleteAccount('${a.username}');">Delete</a></td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </c:if>

            <c:if test="${requestScope.tableManagement!=null}">
                <form action="tableAction">
                    <input type="submit" value="add" class="add" name="action">
                </form>
                <div>
                    <h2>Danh Sách Bàn</h2>
                    <div class="content">
                        <table border="1">
                            <tr>
                                <th>Id</th>
                                <th>Name</th>
                                <th colspan="2">Action</th>
                            </tr>

                            <c:forEach items="${sessionScope.tableManage}" var="t">
                                <tr>
                                    <td>${t.id}</td>
                                    <td>${t.nameTable}</td>
                                    <td><a href="tableAction?action=edit&id=${t.id}">Edit</a></td>
                                    <td><a href="tableAction?action=delete&id=${t.id}" onclick="return confirmDeleteTable(${t.id});">Delete</a></td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </c:if>

            <c:if test="${requestScope.blogManagement!=null}">
                <form action="blogAction">
                    <input type="submit" value="add" class="add" name="action">
                </form>
                <div>
                    <h2>Danh Sách Blog</h2>
                    <div class="content">
                        <table border="1">
                            <tr>
                                <th>Id</th>
                                <th>Title</th>
                                <th>image</th>
                                <th>source</th>
                                <th colspan="2">Action</th>
                            </tr>

                            <c:forEach items="${sessionScope.blogManage}" var="b">
                                <tr>
                                    <td>${b.id}</td>
                                    <td>${b.title}</td>
                                    <td><img src="${b.image}" alt="${p.image}" width="80px" height="80px"/></td>
                                    <td><a href="${b.source}">${b.source}</a></td>
                                    <td><a href="blogAction?action=edit&id=${b.id}">Edit</a></td>
                                    <td><a href="blogAction?action=delete&id=${b.id}" onclick="return confirmDeleteBlog(${b.id});">Delete</a></td>
                                </tr>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </c:if>                

        </div>
      
        
        <script>
        function confirmDeleteProduct(id) {
            var confirmation = confirm("Are you sure you want to delete your Product?");
            if (confirmation === true) {
                return true;
            } else {
                alert("Product deletion canceled.");
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
        
        function confirmDeleteBlog(id) {
            var confirmation = confirm("Are you sure you want to delete this blog post?");
            if (confirmation === true) {
                return true;
            } else {
                alert("Blog post deletion canceled.");
                return false;
            }
        }
        
        function confirmDeleteTable(id) {
            var confirmation = confirm("Are you sure you want to delete Table ");
            if (confirmation === true) {
                return true;
            } else {
                alert("Table deletion canceled.");
                return false;
            }
        }
    </script>
    </body>
</html>
