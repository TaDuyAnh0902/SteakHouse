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
        <style>
            .contact{
                margin: 30px 0 20px;
                padding: 0 15%;
            }

            .contact input {
                line-height: 40px;
            }

            .contact input ,
            .contact textarea{
                width: 100%;
                margin-bottom: 30px;
                font-size: 18px;
                font-weight: 500;
                padding-left: 10px;
            }

            .contact label {
                font-weight: bold;
                font-size: 20px;
            }

            .send button{
                width: 100px;
                height: 40px;
                text-align: center;
                border: 1px solid black;
                border-radius: 4px;
                background-color: var(--dark-green-color);
                color: white;
                font-weight: 700;
            }

            .send button:hover {
                cursor: pointer;
                background-color: var(--green-color);
            }
        </style>
    </head>
    <body>
        <c:set var="contact" value="${requestScope.contact}"/>
            <c:if test="${contact!=null}">
                <div class="contact">
                    <form>
                        <div>
                            <label for="name">Your name</label><br>
                            <input type="text" name="name" id="name">

                        </div>
                        <div>
                            <label for="title">Title</label><br>
                            <input type="text" name="title" id="title">

                        </div>
                        <div>
                            <label for="message">Your message</label><br>
                            <textarea name="message" id="message" rows="10"></textarea>

                        </div>

                        <div class="send">
                            <button type="button" onclick="sendFeedback()">GỬI</button>
                        </div>

                    </form>
                </div>
            </c:if>
            
            
            <script>
            function sendFeedback() {
                var nameValue = document.getElementById('name').value;
                var titleValue = document.getElementById('title').value;
                var messageValue = document.getElementById('message').value;
                var mailtoLink = 'mailto:anhtdhe172879@fpt.edu.vn?subject=' + encodeURIComponent(titleValue) + '&body=Tôi là ' + encodeURIComponent(nameValue + '\n') + encodeURIComponent(messageValue);
                window.location.href = mailtoLink;
            }
        </script>    
    </body>
</html>
