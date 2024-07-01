<%-- 
    Document   : homeMobile
    Created on : Jun 12, 2024, 11:43:41 PM
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
                .headerPhone1 {
                    display: none;
                }
                .headerPhone2 {
                    padding: 5%;
                }
                .headerPhone2 img {
                    width: 100%;
                    height: 200px;
                    border-radius: 20px;
                }
                .headerPhone2 h5 {
                    font-weight: bold;
                }
                .headerPhone2 i {
                    color: black;
                }
                .headerPhone2-menu{
                    margin-top: 10%;
                    text-align: center;
                }
                .headerPhone2-menu a {
                    color: white;
                    font-size: 20px;
                    text-decoration: none;
                    background-color: rgb(251, 62, 62);
                    padding: 28px;
                    border-radius: 16px;
                }
                .headerPhone2-menu a:hover {
                    text-decoration: none;
                    color: rgb(204, 204, 204);
                }
                .headerPhone2-menu a i {
                    color: white;
                    margin-right: 40px;
                }
                .headerPhone2-table {
                    font-weight: bold;
                    font-size: 20px;
                    margin-top: 30px;
                    text-align: center;
                }
                .headerPhone2-table p {
                    margin: 0;
                }
                .contactWithCashier {
                    display: flex;
                    justify-content: center;
                    height: 100px;
                    text-align: center;
                }
                .contactWithCashier img{
                    height: 50px;
                    width: 50px;
                    border: 0;
                }
                .modal img{
                    display: inline;
                    height: 20px;
                    width: 20px;
                    border: 0;
                }
                .modal p {
                    display: inline;
                }
                .contactWithCashier > div{
                    width: calc(50% - 20px);
                    margin: 10px;
                    background-color: white;
                    border-radius: 8px;
                    border: 0;
                }

                .modal {
                    display: none;
                    position: fixed;
                    z-index: 2;
                    left: 0;
                    bottom: 0;
                    width: 100%;
                    height: 100%;
                    overflow: auto;
                    background-color: rgba(0, 0, 0, 0.5);
                }

                .modal-content {
                    margin: 0 auto;
                    margin-top: 80%;
                    padding: 20px;
                    background-color: white;
                    width: 100%; /* Nửa kích thước trang A */
                    height: 100%;
                    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
                    border-radius: 10px;
                }

                .close {
                    position: absolute;
                    top: 10px;
                    right: 20px;
                    font-size: 30px;
                    cursor: pointer;
                }

                .modal-open .container {
                    filter: blur(5px);
                }
                .paymentItem {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    height: 50px;
                    background-color: rgb(245, 245, 245);
                    border-radius: 8px;
                    padding: 10px;
                    margin-bottom: 10px;
                }
                #PaymentSubmit {
                    width: 100%;
                    height: 50px;
                    border-radius: 8px;
                    background-color: rgb(247, 148, 30);
                    border: 0;
                    color: white
                }
                
                .modal2 {
                    display: none;
                    position: fixed;
                    z-index: 2;
                    left: 0;
                    bottom: 0;
                    width: 100%;
                    height: 100%;
                    overflow: auto;
                    background-color: rgba(0, 0, 0, 0.5);
                }

                .modal-content2 {
                    margin: 0 auto;
                    margin-top: 100%;
                    padding: 20px;
                    background-color: white;
                    width: 100%; /* Nửa kích thước trang A */
                    height: 100%;
                    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
                    border-radius: 10px;
                }

                .modal-open2 .container2 {
                    filter: blur(5px);
                }
            }
        </style>
    </head>
    <body>
        <div class="mobile">
            <div class="headerPhone2">
                <h5>STEAK HOUSE</h5>
                <p><i class="fas fa-map-marker-alt"></i> Khu Công nghệ cao Hòa Lac</p>
                <img src="images/banner.jpg" alt="images">
                <div class="headerPhone2-table">
                    <p>Bạn đang ngồi bàn</p>
                    <p style="color: brown;">${sessionScope.tableNumber}</p>
                </div>
                <div class="contactWithCashier">
                    <div id="openModalDiv" class="clickable-div">
                        <img src="images/Mobile1.png" alt="alt"/>
                        <p>Gọi thanh toán</p>
                    </div>
                    <div id="openModalDiv2" class="clickable-div2">
                        <img src="images/Mobile2.png" alt="alt"/>
                        <p>Gọi nhân viên</p>
                    </div>
                </div>
                <div class="headerPhone2-menu">
                    <a href="Action?check=store">
                        <i class="fas fa-utensils"></i>
                        Xem Menu - Gọi món
                    </a>
                </div>
            </div>
        </div>
        <div id="modal" class="modal">
            <div class="modal-content">
                <span id="closeModalBtn" class="close">&times;</span>
                <h2>Gọi thanh toán</h2>
                <p>Bạn muốn thanh toán bằng ?</p>
                <form action="paymentRequest">
                    <div class="paymentItem">
                        <div>
                            <img src="images/payment1.png" alt="alt"/>
                            <p>Tiền mặt</p>
                        </div>
                        <div>
                            <input type="radio" name="ChoosePayment" value="1"/>
                        </div>
                    </div>
                    <div class="paymentItem">
                        <div>
                            <img src="images/payment2.png" alt="alt"/>
                            <p>Thẻ ngân hàng</p>
                        </div>
                        <div>
                            <input type="radio" name="ChoosePayment" value="2"/>
                        </div>
                    </div>
                    <div class="paymentItem">
                        <div>
                            <img src="images/payment3.png" alt="alt"/>
                            <p>Ứng dụng điện thoại</p>
                        </div>
                        <div>
                            <input type="radio" name="ChoosePayment" value="3"/>
                        </div>
                    </div>

                    <input type="submit" value="Gửi yêu cầu" id="PaymentSubmit"/>
                </form>
            </div>
        </div>
        <div id="modal2" class="modal2">
            <div class="modal-content2">
                <span id="closeModalBtn2" class="close">&times;</span>
                <h2>Gọi nhân viên</h2>
                <p>Bạn muốn yêu cầu nhân viên làm gì ?</p>
                <form action="paymentRequest">
                    <input type="text" name="request" style="width: 100%; 
                           height: 50px;border-radius: 8px; 
                           margin-bottom: 20px; font-size: 20px; padding: 0 10px;">
                    <input type="submit" value="Gửi yêu cầu" id="PaymentSubmit"/>
                </form>
            </div>
        </div>
    </body>
    <script type="text/javascript">
        (function (d, m) {
            var kommunicateSettings =
                    {"appId": "318166b3922cf64a7a043ecb1d952dc72", "popupWidget": true, "automaticChatOpenOnNavigation": true};
            var s = document.createElement("script");
            s.type = "text/javascript";
            s.async = true;
            s.src = "https://widget.kommunicate.io/v2/kommunicate.app";
            var h = document.getElementsByTagName("head")[0];
            h.appendChild(s);
            window.kommunicate = m;
            m._globals = kommunicateSettings;
        })(document, window.kommunicate || {});
        /* NOTE : Use web server to view HTML files as real-time update will not work if you directly open the HTML file in the browser. */
    </script>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var modal = document.getElementById("modal");
            var openModalDiv = document.getElementById("openModalDiv");
            var closeModalBtn = document.getElementById("closeModalBtn");
            var container = document.querySelector(".contactWithCashier");

            openModalDiv.onclick = function () {
                modal.style.display = "block";
                container.classList.add("modal-open");
            }

            closeModalBtn.onclick = function () {
                modal.style.display = "none";
                container.classList.remove("modal-open");
            }

            window.onclick = function (event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                    container.classList.remove("modal-open");
                }
            }
        });
        
    </script>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var modal = document.getElementById("modal2");
            var openModalDiv = document.getElementById("openModalDiv2");
            var closeModalBtn = document.getElementById("closeModalBtn2");
            var container = document.querySelector(".contactWithCashier2");

            openModalDiv.onclick = function () {
                modal.style.display = "block";
                container.classList.add("modal-open2");
            }

            closeModalBtn.onclick = function () {
                modal.style.display = "none";
                container.classList.remove("modal-open2");
            }

            window.onclick = function (event) {
                if (event.target == modal2) {
                    modal.style.display = "none";
                    container.classList.remove("modal-open2");
                }
            }
        });

    </script>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var radioContainers = document.querySelectorAll(".paymentItem");

            radioContainers.forEach(function (container) {
                container.addEventListener("click", function () {
                    var radio = container.querySelector('input[type="radio"]');
                    radio.checked = true;
                });
            });
        });
    </script>
</html>
