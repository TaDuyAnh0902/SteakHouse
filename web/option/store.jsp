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
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css"
              integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" 
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <style>
            .store{
                padding-top: 0;
                padding-left:15%;
                padding-right: calc(15% - 20px);
                margin: 50px 0;
            }

            .menu {
                padding: 0;
                list-style: none;
                font-size: 20px;
            }

            .menu a {
                text-decoration: none;
                color: black;
            }

            .menu a:hover {
                color: gray;
            }

            .right-store {
                display: flex;
                text-align: center;
                flex-wrap: wrap;
            }

            .right-store > div {
                margin: 20px;
                width: calc(33.33% - 40px);
                height: 450px;
            }

            .product img {
                width: 100%;
                height: 60%;
            }

            .actions {
                display: flex;
                justify-content: center;

            }

            .action input{
                width: 80px;
                height: 35px;
                border: 1px solid black;
                border-radius: 8px;
                background-color: var(--dark-green-color);
                align-items: center;
            }
            .action input:hover{
                background-color: var(--green-color);
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

            .productByCid{
                display: flex;
                flex-wrap: wrap;
            }

            .productByCid > div {
                width: calc(33.33% - 40px);
                margin: 20px;
            }
            #page{
                text-decoration: none;
                color: black;
                margin: 5px;
                font-size: 24px;
                border: 1px solid black;
                border-radius: 8px;
                padding: 0 10px;
            }
            .product button,
            #quantity{
                width: 30px;
                border: 1px solid black;
                height: 30px;
                text-align: center;
            }
            @media only screen and (max-width: 500px) {
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
                    gap: 20px;
                    width: calc(50% - 40px);
                    height: 300px;
                }
                .left-store {
                    background-color: #E2D9BC;
                }
                .menu {
                    width: 100%;
                    display: flex;
                    text-align: center;
                }

                .menu li {
                    width: 20%;
                }
                .menu a {
                    font-size: 12px;
                }
                .nav ul li:nth-child(2) {
                    display: none;
                }
                .header {
                    display: none;
                }
                .product p {
                    display: none;
                }
                .product h5 {
                    font-weight: normal;
                    font-size: 16px;
                }
                center {
                    margin-top: 0;
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
                .actions{
                    position: absolute;
                    right: 10px;
                }
                button {
                    border: 1px solid black;
                    border-radius: 8px;
                    height: 32px;
                    width: 20px;
                }
            }
                    @media only screen and (max-width: 500px) {
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
                    gap: 20px;
                    width: calc(50% - 40px);
                    height: 300px;
                }
                .left-store {
                    background-color: #E2D9BC;
                }
                .menu {
                    width: 100%;
                    display: flex;
                    text-align: center;
                }

                .menu li {
                    width: 20%;
                }
                .menu a {
                    font-size: 12px;
                }
                .nav ul li:nth-child(2) {
                    display: none;
                }
                .header {
                    display: none;
                }
                .product p {
                    display: none;
                }
                .product h5 {
                    font-weight: normal;
                    font-size: 16px;
                }
                center {
                    margin-top: 0;
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
                .actions{
                    position: absolute;
                    right: 10px;
                }
                button {
                    border: 1px solid black;
                    border-radius: 8px;
                    height: 32px;
                    width: 20px;
                }
            }
        </style>
    </head>
    <body>

        <c:set var="store" value="${requestScope.store}"/>
        <div class="row store">
            <div class="left-store col-md-3">
                <h4>Browse</h4><br>
                <ul class="menu">
                    <li><a href="Products?cid=0">Tất Cả Sản Phẩm</a></li>
                    <hr>
                    <c:forEach var="c" items="${sessionScope.data}">
                        <li><a href="Products?cid=${c.id}">${c.name}</a></li><hr>
                        </c:forEach>
                </ul>
                <h4>Search</h4>
                <%@include file="searchProduct.jsp" %>

            </div>

            <div class="right-store col-md-9">
                <c:forEach items="${requestScope.products}" var="p">
                    <div class="product">
                        <img src="${p.image}" alt="${p.image}"/>
                        <p>${p.category.name}</p>
                        <a href="productInfo?id=${p.id}&cid=${p.category.id}" style="color: black; ">${p.name}</a>
                        <h5 style="font-weight: bold;">Price: ${p.price}00 vnđ</h5>

                        <c:if test="${sessionScope.tableNumber!=null}">
                            <div class="BuyProduct">
                                <form action="BuyProduct">

                                    <div class="buttonShop">
                                        <button type="button" onclick="decrement()">-</button>
                                        <input type="text" id="quantity" value="1" name="quantity" style="width: 24px; height: 28px;" >
                                        <button type="button" onclick="increment()">+</button><br>
                                    </div>
                                    

                                    <h3 style="color: red"><c:out value="${requestScope.quantityFail}"/></h3>

                                    <input type="hidden" name="id" value="${p.id}">     
                                    <c:set var="q" value="${param.quantity}"/>

                                    <c:if test="${p.quantity > 0}">
                                        <div class="actions">
                                            <div class="action">
                                                <input type="submit" value="+ Giỏ">
                                            </div>
                                        </div>
                                    </c:if>
                                    <c:if test="${p.quantity == 0}">
                                        <h3 style="color: red">Hết hàng</h3>
                                    </c:if>


                                </form> 
                            </div>
                        </c:if>
                    </div>

                </c:forEach>
            </div>
        </div>
    <center style="margin-top: 100px;">
        <c:set var="Cid" value="${requestScope.Cid}"/>
        <%--<c:set var="page" value="${requestScope.page}"/>--%>
        <c:if test="${num>1}">
            <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                <a href="Products?page=${i}&&cid=${Cid}" id="page">${i}</a>
            </c:forEach>
        </c:if>

    </center>

    <script>
        var quantity = 0;

        function increment() {
            quantity++;
            updateQuantity();
        }

        function decrement() {
            if (quantity > 0) {
                quantity--;
                updateQuantity();
            }
        }

        function updateQuantity() {
            document.getElementById('quantity').value = quantity;
        }
    </script>
</body>
</html>