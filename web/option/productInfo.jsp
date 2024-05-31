<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .productById {
                margin: 30px 0;
                padding: 0 15%;
            }

            .productInfo {
                display: flex;
                justify-content: center;
                margin-bottom: 50px;
            }

            .productInfo p {
                font-size: 18px;
                margin: 40px 0;
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
            .product a {
                font-size: 18px;
                color: black;
            }
            .product img {
                width: 100%;
                height: 60%;
            }

            .actions {
                width: 100%;
                display: flex;
                justify-content: space-evenly;

            }

            .action {
                display: flex;
                width: 80px;
                height: 40px;
                border: 1px solid black;
                border-radius: 8px;
                background-color: var(--dark-green-color);
                align-items: center;
            }

            .action:hover{
                background-color: var(--green-color);
            }

            .action a{
                margin: 0 auto;
                text-decoration: none;
                color: white;
            }
            .actions {
                display: none;
            }
            @media only screen and (max-width: 500px) {
                body {
                    background: none;
                }
                .nav ul li:nth-child(2) {
                    display: none;
                }
                .productById {
                    padding: 0 5%;
                    margin: 0;
                }
                .productInfo h2 {
                    font-size: 20px;
                    font-weight: bold;
                }
                .productInfo p {
                    font-size: 16px;
                    margin: 20px 0;
                }
                .productInfo h3 {
                    font-size: 16px;
                    font-weight: bold;
                }
                .productByCid > div {
                    width: calc(50% - 40px);
                    margin: 20px;
                }
                .product a {
font-size: 16px;
                }
            }
        </style>
    </head>
    <body>
        <c:set var="p" value="${requestScope.productById}"/>
        <div class="productById">
            <div class="productInfo">
                <div>
                    <img src="${p.image}" alt="image"/>
                </div>
                <div>
                    <h2>${p.name}</h2>
                    <p>${p.describe}</p>
                    <h3>${p.price}00 vnđ</h3><br><br>
                    <div class="actions" style="justify-content: left">
                        <div class="action" style="margin-right: 20px;">
                            <a href="">+<i class="fas fa-shopping-basket"></i></a>
                        </div>
                        <div class="action">
                            <a href="bill?id=${p.id}">Buy</a>
                        </div>
                    </div>
                </div>
            </div>

            <h3>Sản Phẩm Tương Tự<h3>

            <div class="productByCid">
                <c:forEach items="${requestScope.productByCid}" var="p">
                    <div class="product">
                        <img src="${p.image}" alt="${p.image}"/>
                        <a href="productInfo?id=${p.id}&cid=${p.category.id}">${p.name}</a>
                        <h6 style="font-weight: bold;">${p.price}00 vnđ</h6>
                    </div>
                </c:forEach>
            </div>
        </div>
    </body>
</html>