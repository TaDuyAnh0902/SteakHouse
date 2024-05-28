<%-- 
    Document   : searchProduct
    Created on : May 25, 2024, 11:09:02 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style>
            :root {
                --green-color: rgb(139, 197, 63);
                --dark-green-color: rgb(19, 149, 79);
            }
            .slidecontainer {
                width: 100%;
                margin-bottom: 50px;
            }

            .slider {
                width: 100%;
                height: 30px;
                background: #d3d3d3;
                outline: none;
                opacity: 0.7;
                -webkit-transition: .2s;
                transition: opacity .2s;
            }

            .slider:hover {
                opacity: 1;
            }

            .slider::-webkit-slider-thumb {
                -webkit-appearance: none;
                appearance: none;
                width: 25px;
                height: 25px;
                background: #04AA6D;
                cursor: pointer;
            }

            .slider::-moz-range-thumb {
                width: 25px;
                height: 25px;
                background: #04AA6D;
                cursor: pointer;
            }

            #search {
                height: 35px;
                border-radius: 8px;
                padding: 0 8px;
            }
            
            input, select {
                width: 100%;
                margin-top: 20px;
            }

            .submit {
                height: 35px;
                background-color: var(--dark-green-color);
                color: white;
                border: 0;
                border-radius: 8px; 
            }
            
            .submit:hover{
                background-color: var(--green-color);
            }
        </style>
    </head>
    <body>
        <form action="search" class="slidecontainer" method="post">
            <input type="text" name="search" id="search">

            <input type="range" min="1" max="500" name="price" value="${param.price}" class="slider" id="myRange">
            <p>Price: <span id="demo"></span>k to 500k</p>
            
            <input type="submit" value="Search" style="margin-top: 0;" class="submit"><br><br>
            <h4>Sắp xếp theo:</h4>
            <select name="sort">
                <option value="0">Chọn</option>
                <option value="sort1">Tên a-z</option>
                <option value="sort2">Giá giảm dần</option>
                <option value="sort3">Giá tăng dần</option>
            </select><br>
            <input type="submit" value="Sort" class="submit">
        </form>

        <script>
            var slider = document.getElementById("myRange");
            var output = document.getElementById("demo");
            output.innerHTML = slider.value;

            slider.oninput = function () {
                output.innerHTML = this.value;
            };
        </script>

    </body>
</html>