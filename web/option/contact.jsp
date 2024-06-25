<%-- 
    Document   : contact
    Created on : Jun 20, 2024, 11:32:46 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="option/Validate.js"></script>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                background-color: #f9f9f9;
            }


            .contact-container {
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
                padding: 10px;
                background-color: #fff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
                margin: 30px 15%;
            }

            .contact-left, .contact-right {
                flex: 1 1 300px;
                margin: 20px;
                padding: 10px;
                box-sizing: border-box;
                font-weight: bold;
            }

            .contact-left h3{
                color: #3a6d2f;
            }

            .contact-right input,
            .contact-right textarea {
                width: 100%;
                margin-bottom: 20px;
                font-size: 18px;
                font-weight: 500;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }

            .contact-right input:focus,
            .contact-right textarea:focus {
                border-color: #467E37;
                outline: none;
            }

            .contact-right label {
                font-weight: bold;
                font-size: 20px;
                display: block;
                margin-bottom: 10px;
                color: #333;
            }

            .send {
                text-align: center;
            }

            .send button {
                width: 100px;
                height: 40px;
                text-align: center;
                border: 2px solid ;
                border-radius: 4px;
                background-color: #467E37;
                color: white;
                font-weight: 700;
                transition: background-color 0.3s ease;
            }

            .send button:hover {
                cursor: pointer;
                background-color: #04AA6D;
            }
        </style>
    </head>
    <body>
        <c:set var="contact" value="${requestScope.contact}"/>
        <c:if test="${contact!=null}">

            <div class="contact-container">
                <div class="contact-left">
                    <!-- Add content for the left side here -->
                    <h3>Thông tin liên hệ</h3>
                    <p>Địa chỉ: Đại học FPT Hà Nội</p>
                    <p>Email: anhtdhe172879@fpt.edu.vn</p>
                    <p>Điện thoại: 0979 735 203</p>
                    <img src="images/contact.jpg" alt="Contact Image" width="400px" height="300px">
                </div>

                <div class="contact-right">
                    <form name="Contact" onsubmit="return validateContactAndSendFeedback()">
                        <div>
                            <label for="name">Your name</label>
                            <input type="text" name="name" id="name" placeholder="Họ và tên của bạn" required>
                        </div>
                        <div>
                            <label for="title">Title</label>
                            <input type="text" name="title" id="title" placeholder="Tiêu đề" required>
                        </div>
                        <div>
                            <label for="phone">Phone</label>
                            <input type="text" name="phone" id="phone" placeholder="Số điện thoại của bạn" required>
                        </div>
                        <div>
                            <label for="message">Your message</label>
                            <textarea name="message" id="message" rows="10" required></textarea>
                        </div>
                        <div class="send">
                            <button type="submit">GỬI</button>
                        </div>
                    </form>
                </div>
            </div>
        </c:if>

        <script>
            function sendFeedback() {
                var nameValue = document.getElementById('name').value;
                var titleValue = document.getElementById('title').value;
                var phoneValue = document.getElementById('phone').value;
                var messageValue = document.getElementById('message').value;
                var mailtoLink = 'mailto:anhtdhe172879@fpt.edu.vn?subject=' + encodeURIComponent(titleValue) + '&body=Tôi là ' + encodeURIComponent(nameValue + '\n') + 'Phone: ' + encodeURIComponent(phoneValue + '\n') + 'Message: ' + encodeURIComponent(messageValue);
                window.location.href = mailtoLink;
            }
        </script>
    </body>
</html>
