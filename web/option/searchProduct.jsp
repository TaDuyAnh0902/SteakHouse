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
                display: flex;
                justify-content: center;
                align-items: center;
                margin: 0 0 -60px 0;
                padding-left: 60%;
                background-color: #E2D9BC;
                height: 60px;
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
            
            select, input {
                border: none;
                width: 200px;
                height: 32px;
                border-radius: 8px;
            }
            #search {
                margin-right: 20px;
            }
        </style>
    </head>
    <body>
        <div action="search" class="slidecontainer">

<!--            <input type="range" min="1" max="500" name="price" value="${param.price}" class="slider" id="myRange">
            <p>Price: <span id="demo"></span>k to 500k</p>-->
            
            <!--<input type="submit" value="Search" style="margin-top: 0;" class="submit"><br><br>-->
            <!--<h4>Sắp xếp theo:</h4>-->
            <div>
                <form id="searchForm" action="search">
                    <input type="text" id="search" name="search" placeholder="Search"><br>
                    <button type="submit" hidden>Login</button>
                </form>
            </div>
            
            <div>
                <select name="sort" onchange="search(this.value)">
                    <option value="0">Thứ tự mặc định</option>
                    <option value="sort1">Tên a-z</option>
                    <option value="sort2">Giá giảm dần</option>
                    <option value="sort3">Giá tăng dần</option>
                </select><br>
            </div>
            
        </div>

        <script>
//            var slider = document.getElementById("myRange");
//            var output = document.getElementById("demo");
//            output.innerHTML = slider.value;
//
//            slider.oninput = function () {
//                output.innerHTML = this.value;
//            }
            
            function search(id) {
                window.location.href = "search?sort=" + id;
            }
            
            function handleEnter(event) {
                if (event.key === 'Enter') {
                    event.preventDefault(); // Prevent default action
                    document.getElementById('searchForm').submit(); // Submit the form
                }
            }

            // Adding event listener to the input field
            window.onload = function() {
                document.getElementById('search').addEventListener('keydown', handleEnter);
            }
        </script>

    </body>
</html>

