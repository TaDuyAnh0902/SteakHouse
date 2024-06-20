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
                    margin-top: 20%;
                    text-align: center;
                }
                .headerPhone2-menu a {
                    color: white;
                    font-size: 24px;
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
            }
        </style>
    </head>
    <body>
        <div class="mobile">
            <div class="headerPhone2">
                <h5>STEAK HOUSE</h5>
                <p><i class="fas fa-map-marker-alt"></i> Khu Công nghệ cao Hòa Lac, Km29 Đại lộ Thăng Long</p>
                <img src="images/banner.jpg" alt="images">
                <div class="headerPhone2-table">
                    <p>Bạn đang ngồi bàn</p>
                    <p>${sessionScope.tableNumber}</p>
                </div>
                <div class="headerPhone2-menu">
                    <a href="Action?check=store">
                        <i class="fas fa-utensils"></i>
                        Xem Menu - Gọi món
                    </a>
                </div>
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
            </div>
        </div>
    </body>
</html>
