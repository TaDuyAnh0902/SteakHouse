<%-- 
    Document   : home
    Created on : May 25, 2024, 4:39:58 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css"
              integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" 
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }
            body {
                width: 100%;
                min-width: 1200px;
                background: url(images/background.jpg);
            }

            #backToTopBtn {
                display: none; /* Ẩn nút ban đầu */
                position: fixed; /* Định vị nút cố định */
                bottom: 20px; /* Cách mép dưới 20px */
                right: 20px; /* Cách mép phải 20px */
                z-index: 99; /* Đảm bảo nút ở phía trên các phần tử khác */
                border: none; /* Bỏ viền */
                outline: none; /* Bỏ viền khi focus */
                background-color: #555; /* Màu nền */
                color: white; /* Màu chữ */
                cursor: pointer; /* Con trỏ chuột khi hover */
                padding: 15px; /* Đệm trong */
                border-radius: 10px; /* Bo góc */
            }

            #backToTopBtn:hover {
                background-color: #000; /* Màu nền khi hover */
            }

            .echbay-sms-messenger div.phonering-alo-zalo,
            .echbay-sms-messenger div.phonering-alo-alo {
                background-color:#0084ff
            }
            .echbay-sms-messenger div.phonering-alo-sms {
                background-color:#f60
            }
            .echbay-sms-messenger div.phonering-alo-messenger {
                background-color:#e60f1e
            }

            .echbay-sms-messenger {
                width:45px
            }
            .echbay-sms-messenger a {
                line-height:45px;
                color: transparent;
                display:block;
            }
            .echbay-sms-messenger {
                display:block
            }
            .echbay-sms-messenger div.phonering-alo-zalo {
                display: block
            }

            .echbay-sms-messenger div.phonering-alo-alo {
                background-image: url(https://webantam.com/wp-content/uploads/2023/04/messenger_1.webp);
            }

            .echbay-sms-messenger div.phonering-alo-zalo {
                background-image: url(https://webantam.com/wp-content/uploads/2023/04/zalo_1.webp);
            }
            .echbay-sms-messenger div.phonering-alo-messenger {
                background-image: url(https://webantam.com/wp-content/uploads/2023/04/call.webp);
                background-color: #e60f1e;
            }
            .echbay-sms-messenger div {
                margin: 14px 0;
                background: #0084FF center no-repeat;
                background-size: 70%;
                border-radius: 50%;
                box-shadow: 0 3px 10px #888;
            }

            .echbay-sms-messenger {
                text-align: center;
                right:20px;
                position: fixed;
                bottom: 150px;
                z-index: 999;
            }
            .echbay-sms-messenger div.phonering-alo-messenger{

                animation:2s ease-in-out 0s normal none infinite running ring-alo-circle-img-anim;

            }

            .echbay-sms-messenger div.phonering-alo-alo{

                animation:2s ease-in-out 0s normal none infinite running ring-alo-circle-img-anim;
            }

            .echbay-sms-messenger div.phonering-alo-zalo{

                animation:2s ease-in-out 0s normal none infinite running ring-alo-circle-img-anim;
            }

            @keyframes ring-alo-circle-img-anim {
                0% {
                    transform:rotate(0deg) scale(1) skew(1deg);
                }
                10% {
                    transform:rotate(-25deg) scale(1) skew(1deg);
                }
                20% {
                    transform:rotate(25deg) scale(1) skew(1deg);
                }
                30% {
                    transform:rotate(-25deg) scale(1) skew(1deg);
                }
                40% {
                    transform:rotate(25deg) scale(1) skew(1deg);
                }
                50% {
                    transform:rotate(0deg) scale(1) skew(1deg);
                }
                100% {
                    transform:rotate(0deg) scale(1) skew(1deg);
                }
            }

            @media only screen and (max-width: 500px) {
                body {
                    min-width: 100vw;
                    background: url(images/background.jpg);
                }
                .footer {
                    display: none;
                }
                .main{
                    display: none;
                }
                #container {
                    display: none;
                }
                .selling {
                    display: none;
                }
                .headerPhone1 {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    background-color: #E2D9BC;
                    padding: 0 10%;
                    color: brown;
                }
                .headerPhone1 a {
                    color: brown;
                }
                #back {
                    color: gray;
                    padding: 5px 10px;
                    background-color: white;
                    border-radius: 16px;
                    margin-left: -30px;
                }

                .echbay-sms-messenger style-for-position-br{
                    display: none;
                }

            </style>
        </head>
        <body>
            <div class="wrapper">


                <c:if test="${sessionScope.tableNumber!=null && requestScope.homeMobile==null}">
                    <div class="mobile">
                        <div class="headerPhone1">
                            <div>
                                <i class="fas fa-chevron-left" onclick="goBack()" id="back"></i>
                                <a href="homeMobile">
                                    <i class="fas fa-home"></i>
                                </a>
                            </div>
                            <div>
                                <h2>Bàn <c:out value="${sessionScope.tableNumber}"/></h2>
                            </div>
                            <div>
                                <a href="Action?check=ListOrderLine" title="shopping cart">
                                    <i class="fas fa-shopping-cart"></i>(${sessionScope.totalProductByTable})
                                </a>
                            </div>
                        </div>

                    </div>
                </c:if>

                <c:if test="${requestScope.homeMobile!=null}"> <%@include file="homeMobile.jsp" %></c:if>
                <%@include file="header.jsp" %>

                <c:if test="${requestScope.main!=null}"> <%@include file="option/main.jsp" %> </c:if>

                <c:if test="${requestScope.profile!=null}"> <%@include file="user/profile.jsp" %> </c:if>
                <c:if test="${requestScope.profileChange!=null}"> <%@include file="user/profileChange.jsp" %> </c:if>

                <c:if test="${requestScope.store!=null}"> <%@include file="option/store.jsp" %> </c:if>
                <c:if test="${requestScope.productInfo!=null}"> <%@include file="option/productInfo.jsp" %> </c:if>


                <c:if test="${requestScope.blogList!=null}"> <%@include file="option/blog.jsp" %> </c:if>    
                <c:if test="${requestScope.sourceBlog!=null}"> <jsp:include page="${requestScope.sourceBlog}" /> </c:if> 


                <c:if test="${requestScope.introduction!=null}"> <%@include file="option/introduction.jsp" %> </c:if>                        

                <c:if test="${requestScope.contact!=null}"> <%@include file="option/contact.jsp" %> </c:if> 

                <c:if test="${sessionScope.manage!=null}"> <%@include file="option/manage.jsp" %> </c:if>

                <c:if test="${requestScope.ListOrderLine!=null}"> <%@include file="option/ListOrderLine.jsp" %> </c:if>

                <c:if test="${sessionScope.manageOrder!=null}"> <%@include file="option/manageOrder.jsp" %> </c:if>

                <c:if test="${sessionScope.manageOrder==null && sessionScope.manage==null}">
                    <%@include file="footer.jsp" %>
                </c:if>
            </div>

                <c:if test="${sessionScope.role==3 && sessionScope.tableNumber==null}">
                <div class="echbay-sms-messenger style-for-position-br">
                    <div class="phonering-alo-alo">
                        <a href="https://www.messenger.com/t/366526929875352" target="_blank" rel="nofollow" class="echbay-phonering-messenger-event">.</a>
                    </div>

                    <div class="phonering-alo-messenger">
                        <a href="https://www.facebook.com/thegioisteak" target="_blank" rel="nofollow" class="echbay-phonering-messenger-event">.</a>
                    </div>
                    <div class="phonering-alo-zalo">
                        <a href="https://zalo.me/0865448856" target="_blank" rel="nofollow" class="echbay-phonering-zalo-event">.</a>
                    </div>
                </div>
            </c:if>

            <button id="backToTopBtn" title="Go to top"><i class="fa-solid fa-arrow-up"></i></button>

        </body>
        <script>
            var quantity = 1;

            function increment() {
                quantity++;
                updateQuantity();
            }

            function decrement() {
                if (quantity > 1) {
                    quantity--;
                    updateQuantity();
                }
            }

            function updateQuantity() {
                document.getElementById("quantity").value = quantity;
            }

            function goBack() {
                window.history.back();
            }
        </script>

        <script>
            // Lấy phần tử nút
            let mybutton = document.getElementById("backToTopBtn");

            // Khi người dùng cuộn xuống 20px từ đầu tài liệu, hiển thị nút
            window.onscroll = function () {
                scrollFunction()
            };

            function scrollFunction() {
                if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
                    mybutton.style.display = "block";
                } else {
                    mybutton.style.display = "none";
                }
            }

            // Khi người dùng nhấp vào nút, cuộn lên đầu tài liệu với hiệu ứng mượt mà
            mybutton.onclick = function () {
                window.scrollTo({top: 0, behavior: 'smooth'});
            }
        </script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                function updateContent() {
                    var currentUrl = window.location.href;
                    var baseUrlHome = "http://localhost:8080/SWP391-SteakHouse/manageOrderAction?check=viewOrder";
                    var baseUrlConfirmOrder = "http://localhost:8080/SWP391-SteakHouse/ConfirmOrderByCashier?id=";
                    var baseUrlSort = "http://localhost:8080/SWP391-SteakHouse/orderSort?check=";
                    if (currentUrl === baseUrlHome || currentUrl.startsWith(baseUrlConfirmOrder) || currentUrl.startsWith(baseUrlSort)) {
                        $.ajax({
                            url: currentUrl,
                            success: function (data) {
                                $('#table-container').html($(data).find('#table-container').html());
                                $('#RequestPayment-content').html($(data).find('#RequestPayment-content').html());
                            }
                        });
                    }
                }

                setInterval(updateContent, 5000);
            });
        </script>
    </html>
