<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .introduction {
                margin-top: 50px;
                padding: 0 15%;
                font-size: 20px;
            }
            .introduction h2 {
                text-align: center;
                animation: fadeIn 2s;
            }
            .introduction-content p {
                text-indent: 50px;
                text-align: justify;
            }
            .introduction img {
                display: block;
                margin: 50px auto;
                width: 80%;
                animation: fadeInUp 2s;
            }
            .introduction-content ul {
                list-style-type: none;
                padding: 0;
            }
            .introduction-content ul li {
                margin-bottom: 15px;
            }
            .introduction-content ul li p {
                text-indent: 0;
            }
            @keyframes fadeIn {
                from {
                    opacity: 0;
                }
                to {
                    opacity: 1;
                }
            }
            @keyframes fadeInUp {
                from {
                    opacity: 0;
                    transform: translateY(20px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }
        </style>
    </head>
    <body>
        <div class="introduction">
            <section class="introduction-content1">
                <h2>VỀ CHÚNG TÔI</h2>
                <hr>
                <p>Ẩm thực phương Tây vô cùng phong phú và hấp dẫn thị giác vì vậy đã chiếm được cảm tình của nhiều người Việt sành ăn. 
                    Ở Sài Gòn, bạn có thể dễ dàng khám phá nét tinh tế, quyến rũ của ẩm thực Âu Châu ngay tại Thế Giới Steak. 
                    Đến với Thế Giới Steak, các món Âu xa xỉ cũng trở nên bình dị và gần gũi với mọi thực khách Việt. 
                    Trong số các món Âu được nhiều người Việt ưa chuộng, món bít tết phổ biến hơn cả. Nếu trước kia, 
                    thực khách từng quen thuộc với món bít tết bò thì giờ đây, đến với Thế Giới Steak, 
                    các bạn còn có thể lựa chọn steak cừu, đà điểu, gà hoặc thịt cá sấu… để thay đổi khẩu vị thường xuyên.
                    Steak ăn kèm với bánh mì tươi, salad, khoai tây chiên cùng 9 loại sốt chế biến tươi hàng ngày chắn sẽ làm hài lòng quý khách.
                </p>
                <img src="images/intro1.jpg" alt="Hình ảnh giới thiệu Thế Giới Steak">
                <p>
                    Ngay từ tên gọi, Thế Giới Steak đã khiến thực khách bồn chồn bao tử khi liên tưởng đến các món steak hảo hạng, kèm nước sốt đậm đà, 
                    hương thơm lừng và kích thích vị giác. Lấy sự hài lòng của thực khách làm tiêu chí hàng đầu, Thế Giới Steak luôn chú trọng đến việc 
                    đa dạng hóa và mở rộng thực đơn các món steak nhằm đáp ứng nhu cầu đa dạng của nhiều đối tượng khách hàng. Nếu là tín đồ của các món 
                    bít tết bò quen thuộc, ắt hẳn bạn sẽ phải “ồ!” lên thích thú khi lần đầu nếm qua hương vị mới mẻ từ các món steak thịt cừu, cá sấu, 
                    đà điểu, cá hồi hoặc vịt xông khói.
                </p>
                <img src="images/intro2.jpg" alt="Hình ảnh các món steak đa dạng tại Thế Giới Steak">
            </section>
            <section class="introduction-content2">
                <h2>VÌ SAO BẠN NÊN CHỌN THẾ GIỚI STEAK?</h2>
                <ul>
                    <li>
                        <p>Thế Giới Steak là điểm đến lý tưởng khi bạn muốn thay đổi khẩu vị cùng gia đình, bạn bè.</p>
                    </li>
                    <li>
                        <p>Nguyên liệu tươi ngon, hàm lượng dinh dưỡng cao, quy trình chế biến công phu, tỉ mỉ, hợp vệ sinh, đảm bảo sức khỏe người dùng.</p>
                    </li>
                    <li>
                        <p>Món ăn được chế biến bởi đầu bếp lành nghề, giàu kinh nghiệm, mang đến cho thực khách những trải nghiệm ẩm thực lý thú và độc đáo.</p>
                    </li>
                    <li>
                        <p>Không gian Thế Giới Steak khá rộng rãi, lối bày trí ấm cúng và lịch sự, tinh tế.</p>
                    </li>
                    <li>
                        <p>Cung cách phục vụ chu đáo, lịch sự.</p>
                    </li>
                </ul>
            </section>
        </div>    
    </body>
</html>