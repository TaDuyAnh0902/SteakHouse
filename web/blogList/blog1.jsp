<%-- 
    Document   : blog1
    Created on : May 27, 2024, 2:04:12 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hướng Dẫn Chọn Thịt Bò Mỹ Ngon</title>
        <style>
            body {
                font-family: 'Helvetica Neue', Arial, sans-serif;
                line-height: 1.6;
                margin: 0;
                padding: 0;
                background-color: #f0f8ff;
                color: #333;
            }
            .container {
                max-width: 900px;
                margin: 30px auto;
                padding: 20px;
                background-color: #fff;
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
                border-radius: 10px;
                overflow: hidden;
            }
            .container:hover {
                box-shadow: 0 0 25px rgba(0, 0, 0, 0.4);
            }
            img {
                width: 40%;
                height: auto;
                display: block;
                margin: 20px auto; /* Căn giữa theo chiều ngang */
                border-radius: 10px;
            }
            h2 {
                color: #669900;
                font-size: 28px;
                text-align: center;
                margin-top: 20px;
                text-transform: uppercase;
                animation: fadeIn 2s;
            }
            h4 {
                color: #b22222;
                font-size: 22px;
                margin-top: 20px;
                animation: fadeInUp 2s;
            }
            p {
                font-size: 18px;
                text-align: justify;
                margin-top: 20px;
                animation: fadeInUp 2s;
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
            .button {
                display: inline-block;
                padding: 10px 20px;
                margin-top: 20px;
                color: #fff;
                background-color: #007BFF;
                border: none;
                border-radius: 5px;
                text-align: center;
                cursor: pointer;
                transition: background-color 0.3s;
                animation: fadeInUp 2s;
                text-decoration: none;
            }
            .button:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h2>Cách Chọn Thịt Bò Mỹ Ngon Và Chuẩn</h2>
            <h4>Cách Chọn Thịt Bò Mỹ Ngon Và Chuẩn</h4>
            <p>
                Bò Mỹ được yêu thích bởi chất lượng thịt tuyệt vời, được các nhà hàng nổi tiếng lựa chọn. Đa dạng các phần thịt theo nhu cầu của khách hàng.
                Thịt Bò Mỹ được xem là một loại thịt hảo hạng, thịt bò không chỉ có hương vị thơm ngon mà còn rất bổ dưỡng bởi thành phần chứa nhiều chất sắt, 
                protein, kali, axit amin… Thịt bò Bỹ được sử dụng phổ biến trong bữa ăn hằng ngày với nhiều phương pháp chế biến khác nhau. Thế nhưng, nhiều người 
                do không chọn đúng phần thịt và không biết cách chế biến dẫn tới thịt bò bị dai, cứng khi nấu ăn và giảm đi hương vị thơm ngon đặc trưng. Sau đây, 
                chúng tôi sẽ hướng dẫn bạn một số mẹo nhỏ để chọn được thịt bò mềm, tươi ngon, làm steak chuẩn âu cho món ăn tròn vị đậm chất phương tây.
            </p>
            <img src="blogImages/blog1.jpg" alt="Thịt bò Mỹ ngon">
            <p>
                Cách chọn thịt bò đông lạnh:
                Thịt bò ngon có màu đỏ tươi, mỡ màu trắng nhiều vân mỡ trắng xen kẽ với nhau nhiều, nếu ít mỡ trắng dễ cứng và khô miếng thịt. Làm steak nên dùng 
                topblade, ribeye, tenderloin, Tbone để cho món steak của bạn tròn vị.
            </p>
        </div>
    </body>
</html>
