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
            }
            .productInfo > div {
                width: 50%;
            }

            .productInfo img {
                width: 80%;
                height: 90%;
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

            @media only screen and (max-width: 500px) {
                body {
                    background: none;
                }
                .header {
                    display: none;
                }
                .nav ul li:nth-child(2) {
                    display: none;
                }
                .productById {
                    padding: 5% 5% 0 5%; 
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
                .productInfo img,
                .productByCid img{
                    border-radius: 8px;
                }
                .productByCid > div {
                    width: calc(50% - 40px);
                    margin: 20px;
                }
                .product a {
                    font-size: 16px;
                }
                .BuyProduct {
                    position: relative;
                    align-items: center;
                    bottom:  50px;
                }
                .buttonShop {
                    position: absolute;
                    left: 10px;
                    top: 0;
                }
                .actions {
                    position: absolute;
                    left: 120px;
                    top: 0;
                }
                .note {
                    font-size: 20px;
                    position: absolute;
                    top: 60px;
                }
                .actions input {
                    width: 50px;
                    height: 30px;
                    border-radius: 8px;
                    background-color: #FF0;
                    color: white;
                }
                .actions input:active {
                    background-color: rgb(170, 170, 0);
                }
                button {
                    border: 1px solid black;
                    border-radius: 50%;
                    height: 28px;
                    width: 28px;
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
                    <h3>${p.price}00 vnđ</h3><br><br>
                    <c:if test="${sessionScope.tableNumber!=null}">
                        <div class="BuyProduct">
                            <form action="BuyProduct">

                                <div class="buttonShop">
                                    <button type="button" onclick="decrement()">-</button>
                                    <input type="text" id="quantity" value="1" name="quantity" style="width: 24px; height: 28px; border-radius: 4px;" >
                                    <button type="button" onclick="increment()">+</button><br>
                                </div>


                                <h3 style="color: red"><c:out value="${requestScope.quantityFail}"/></h3>
                                
                                <input type="hidden" name="id" value="${p.id}">     
                                <input type="hidden" value="${sessionScope.tableNumber}" name="tableNumber">
                                <input type="hidden" value="${sessionScope.userByMobile}" name="userByMobile">
                                <c:set var="q" value="${param.quantity}"/>

                                <c:if test="${p.quantity > 0}">
                                    <div class="actions">
                                        <div class="action">
                                            <input type="submit" value="🛒">
                                        </div>
                                    </div>
                                </c:if>
                                <c:if test="${p.quantity == 0}">
                                    <h3 style="color: red">Hết hàng</h3>
                                </c:if>
                            
                                    <div class="note">
                                        <input tyle="text" placeholder="vd: giảm cay"/>
                                    </div>

                            </form> 
                        </div>
                    </c:if>
                    
                </div>
                
            </div>
            <div>
                <p>${p.describe}</p>
            </div>
            
            <h3>Sản Phẩm Tương Tự<h3>

            <div class="productByCid">
                <c:forEach items="${requestScope.productByCid}" var="p">
                    <c:if test="${p.sid.id==1}">
                        <div class="product">
                            <a href="productInfo?id=${p.id}&cid=${p.category.id}"><img src="${p.image}" alt="${p.image}"/></a>
                            <h6>${p.name}</h6>
                            <h6 style="font-weight: bold;">${p.price}00 vnđ</h6>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
        </div>
    </body>
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
            document.getElementById("quantity").value = quantity;
        }
    </script>
</html>
