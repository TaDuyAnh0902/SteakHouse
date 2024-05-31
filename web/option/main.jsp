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
            .main {
                margin-top: 30px;
            }

            .banner {
                text-align: center;
            }

            .selling {
                margin: 30px 0;
                padding: 0 15%;
            }

            .hot-selling-title p {
                font-size: 36px;
                font-weight: bold;
                color: var(--dark-green-color);
                text-align: center;
            }

            .hot-selling {
                display: flex;
                text-align: center;
                flex-wrap: wrap;
            }

            .newProducts {
                width: calc(33.33% - 40px);
                margin: 20px;
            }
            
            .newProducts img {
                width: 100%;
                height: 70%;
            }
            .divided {
                padding: 0 10%;
                text-align: center;
                height: auto;
                font-size: 18px;
                font-weight: 600;
                line-height: 30px;
                color: gray;
            }

            .divided img,
            .divided h3{
                color: black;
                margin-bottom: 20px;
            }

            .divided div:nth-child(2) {
                border-left: 1px solid rgb(192, 192, 192);
                border-right: 1px solid rgb(192, 192, 192);
            }
            .banner img {
                transition: opacity 0.3s ease-in-out;
                opacity: 1;
            }

            .fade-out {
                opacity: 0;
            }
        </style>
    </head>
    
    <body>
        <c:set var="main" value="${requestScope.main}"/>
        <div class="main">
            <div class="banner">
                <img id="img" src="images/banner.jpg" alt="images" onclick="changeImage()" width="80%" height="700px">
            </div>
            <div class="selling">
                <div class="hot-selling-title">
                    <hr>
                    <p>SẢN PHẨM MỚI</p>
                    <hr>
                </div>
                <div class="hot-selling">
                    <c:forEach items="${requestScope.getNewProduct}" var="p">
                        <div class="newProducts">
                            <img src="${p.image}" alt="${p.image}"/>
                            <p>${p.category.name}</p>
                            <a href="productInfo?id=${p.id}&cid=${p.category.id}" style="color: black; ">${p.name}</a>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>

        <div id="container">
            <div id="content">
                <!-- Nội dung bạn muốn chuyển trái/phải -->
                <div class="row divided">
                    <div class="col-md-4">
                        <img src="images/trolley.png" alt="images" width="100px" height="100px">
                        <h3>Miễn phí giao hàng</h3>
                        <p>Miễn phí giao hàng cho đơn hàng từ 300.000VNĐ. Giao hàng toàn quốc</p>
                    </div>
                    <div class="col-md-4">
                        <img src="images/easy-return.png" alt="images" width="100px" height="100px">
                        <h3>Hỗ trợ đổi trả</h3>
                        <p>Đổi trả trong trường hợp hàng lỗi hoặc nhầm sản phẩm. Hỗ trợ đổi trả tối đa 7 ngày kể từ ngày mua
                        </p>
                    </div>
                    <div class="col-md-4">
                        <img src="images/living-room.png" alt="images" width="100px" height="100px">
                        <h3>Hỗ trợ 24/7</h3>
                        <p>Dịch vụ tư vấn 24/7 của chúng tôi đem lại sự hỗ trợ chuyên nghiệp và tiện lợi cho bạn, bất kể
                            thời gian
                            hay nơi đâu</p>
                    </div>
                </div>
            </div>
        </div>
    </body>
    
    <script>
        var index = 1;
        var imgs = ["images/banner.jpg",  "images/banner12.jpg","images/banner10.jpg"];

        function changeImage() {
            document.getElementById('img').src = imgs[index];
            index++;
            if (index == imgs.length) {
                index = 0;
            }
        }

        setInterval(changeImage, 3000);
    </script>
</html>