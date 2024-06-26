<%-- 
    Document   : store
    Created on : May 25, 2024, 11:00:32 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Store</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css"
              integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" 
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f5f5f5;
                color: #333;
            }
            .store {
                padding: 2% 5%;
            }
            .menu {
                padding: 0;
                list-style: none;
                font-size: 20px;
            }
            .menu a {
                text-decoration: none;
                color: #333;
                transition: color 0.3s, transform 0.2s;
                display: inline-block;
                padding: 5px 0;
            }
            .menu a:hover {
                color: #04AA6D;
            }

            .menu a {
                padding: 10px;
                cursor: pointer;
            }
            .menu a:not(.highlight):hover {
                background-color: #f0f0f0; /* Màu nền khi di chuột qua */
            }

            .menu a:active {
                transform: translateY(-3px);
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                transition: transform 0.2s, box-shadow 0.2s;
            }
            .right-store {
                display: flex;
                flex-wrap: wrap;
            }
            .right-store > div {
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
                margin: 20px ;
                width: calc(24% - 40px);
                padding: 10px;
                transition: transform 0.3s;

            }
            .right-store > div:hover {
                transform: translateY(-10px);
            }
            .product {
                overflow: hidden;
                position: relative;
            }
            .product img {
                border-radius: 8px;
                width: 100%;
                height: auto;
                transition: transform 0.3s;
            }
            .product-details {
                padding: 10px 0;
            }
            .product-details h5 {
                font-weight: bold;
                color: red;
            }
            .actions {
                display: flex;
                justify-content: center;
                align-items: center;
                margin-top: 10px;
            }
            .actions button {
                border: 1px solid #007BFF;
                background-color: #007BFF;
                color: #fff;
                border-radius: 8px;
                height: 28px;
                width: 28px;
                margin: 0 5px;
                cursor: pointer;
                transition: background-color 0.3s;
            }
            .actions button:hover {
                background-color: #0056b3;
            }
            .productById {
                margin: 30px 0;
                padding: 0 15%;
            }
            .productInfo {
                display: flex;
                justify-content: center;
                margin-bottom: 50px;
            }
            .productInfo > div {
                width: 50%;
            }
            .productInfo img {
                width: 90%;
            }
            .productByCid {
                display: flex;
                flex-wrap: wrap;
            }
            .productByCid > div {
                width: calc(33.33% - 40px);
                margin: 20px;
            }
            #page {
                text-decoration: none;
                color: #04AA6D;
                margin: 5px;
                font-size: 24px;
                border: 1px solid #04AA6D;
                border-radius: 8px;
                padding: 0 10px;
                transition: color 0.3s, border-color 0.3s;
            }
            #page:hover {
                color: #04AA6D;
                border-color: #04AA6D;
            }
            @media only screen and (max-width: 500px), only screen and (max-height: 400px) {
                body {
                    min-width: 100vw;
                    background: none;
                }
                .store {
                    padding: 0;
                    margin: 0;
                }
                .store h4 {
                    display: none;
                }
                .right-store {
                    display: flex;
                    text-align: center;
                    flex-wrap: wrap;
                }
                .right-store > div {
                    margin: 10px;
                    width: calc(50% - 20px);
                    height: 300px;
                }
                .left-store {
                    height: 32px;
                    position: relative;
                    background-color: #E2D9BC;
                }
                .menu {
                    position: absolute;
                    top: 0;
                    left: 0;
                    right: 0;
                    width: 100%;
                    display: flex;
                    text-align: center;
                }
                #productName {
                    position: absolute;
                    top: -50px;
                    left: 0;
                    right: 0;
                }
                .header {
                    display: none;
                }
                .menu li {
                    width: 50%;
                }
                .menu a {
                    font-size: 12px;
                }
                .nav ul li:nth-child(2) {
                    display: none;
                }
                .categoryName {
                    display: none;
                }
                .product h5 {
                    font-weight: normal;
                    font-size: 16px;
                }
                .BuyProduct {
                    position: relative;
                    align-items: center;
                }
                .buttonShop {
                    position: absolute;
                    left: 10px;
                    top: 0;
                }
                .actions {
/*                    position: absolute;
                    right: 50%;
                    left: 50%;*/
                    display: none;
                }
                button {
                    border: 1px solid black;
                    border-radius: 50%;
                    height: 28px;
                    width: 28px;
                }
                .product > div {
                    position: absolute;
                    top: 230px;
                    left: 0;
                    right: 0;
                }
            }
        </style>
        
    </head>
    <body>
        <c:if test="${sessionScope.tableNumber==null}">
            <%@include file="searchProduct.jsp" %>
        </c:if>
        <c:set var="store" value="${requestScope.store}"/>
        <div class="row store">
            <div class="left-store col-md-3">
                <h4>Browse</h4><br>
                <ul class="menu">
                    <li><a href="Products?cid=0">Sản Phẩm</a></li>
                    <hr>
                    <c:forEach var="c" items="${sessionScope.data}">
                        <li><a href="Products?cid=${c.id}">${c.name}</a></li><hr>
                        </c:forEach>
                </ul>
            </div>
            <div class="right-store col-md-9">
                <c:forEach items="${requestScope.products}" var="p">
                    <c:if test="${p.sid.id==1}">
                        <c:set var="quan" value="${p.id}"/>
                        <c:set var="cid" value="${p.category.id}"/>
                        <div class="product" onclick="productInfo('${quan}','${cid}')">
                            <img src="${p.image}" alt="${p.image}"/>
                            <div class="product-details">
                                <p class="categoryName">${p.category.name}</p>
                                <p id="productName">${p.name}</p>
                                <div>
                                    <h5>${p.price}00 vnđ</h5>
                                    <c:if test="${sessionScope.tableNumber!=null}">
                                        <div class="BuyProduct">
                                            <c:set var="q" value="${param.quantity}"/>
                                            <c:if test="${p.quantity > 0}">
                                                <div class="actions">
                                                    <button type="button" onclick="decrement('${quan}')">-</button>
                                                    <input type="text" id="quantity-${quan}" value="1" name="quantity" style="width: 24px; height: 28px; border-radius: 4px; text-align: center;">
                                                    <button type="button" onclick="increment('${quan}')">+</button>
                                                    <a href="productInfo?id=${p.id}&cid=${p.category.id}" style="color: black; "><i class="fas fa-shopping-cart"></i></a>
                                                </div>
                                            </c:if>
                                            <c:if test="${p.quantity == 0}">
                                                <h3 style="color: red">Hết hàng</h3>
                                            </c:if>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
        </div>
    <center>
        <c:set var="Cid" value="${requestScope.Cid}"/>
        <c:if test="${num>1}">
            <c:forEach begin="1" end="${requestScope.num}" var="i">
                <a href="Products?page=${i}&&cid=${Cid}" id="page">${i}</a>
            </c:forEach>
        </c:if>
    </center>
    <script>
        function increment(id) {
            var quantity = document.getElementById('quantity-' + id).value;
            quantity++;
            document.getElementById('quantity-' + id).value = quantity;
        }
        function decrement(id) {
            var quantity = document.getElementById('quantity-' + id).value;
            if (quantity > 1) {
                quantity--;
                document.getElementById('quantity-' + id).value = quantity;
            }
        }
        function productInfo(id, cid) {
            window.location.href = "productInfo?id=" + id + "&cid=" + cid;
        }
    </script>
</body>
</html>
