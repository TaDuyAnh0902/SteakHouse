<%-- 
    Document   : searchProduct
    Created on : May 25, 2024, 11:09:02 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
            <div>
                <form id="searchForm" action="search">
                    <input type="text" id="search" name="search" placeholder="Search" value="${requestScope.searchContent}"><br>
                    <button type="submit" hidden>Login</button>
                </form>
            </div>
            
            <div>
                <c:set var="sortItem" value="${requestScope.sortItem}"/>
                <select name="sort" onchange="search(this.value)">
                    <option value="sort0"}>Thứ tự mặc định</option>
                    <option value="sort1" ${(sortItem == 1)?'selected':''}>Tên a-z</option>
                    <option value="sort2" ${(sortItem == 2)?'selected':''}>Giá giảm dần</option>
                    <option value="sort3" ${(sortItem == 3)?'selected':''}>Giá tăng dần</option>
                </select><br>
            </div>
            
        </div>

        <script>
            function search(id) {
                window.location.href = "search?sort=" + id;
            }
            
            function handleEnter(event) {
                if (event.key === 'Enter') {
                    event.preventDefault(); // Prevent default action
                    document.getElementById('searchForm').submit(); // Submit the form
                }
            }

            window.onload = function() {
                document.getElementById('search').addEventListener('keydown', handleEnter);
            }
        </script>

    </body>
</html>

