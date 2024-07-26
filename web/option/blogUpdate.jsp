<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            :root {
                --green-color: rgb(139, 197, 63);
                --dark-green-color: rgb(19, 149, 79);
            }
            .blogUpdate {
                padding: 0 20%;
            }
            h1 {
                color: #333;
                text-align: center;
            }
            form {
                margin: 20px;
                padding: 20px;
                background-color: #fff;
                border: 1px solid #ddd;
                border-radius: 5px;
            }

            input[type="text"],
            input[type="number"] {
                width: calc(100% - 20px);
                padding: 10px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 3px;
                font-size: 16px;
            }
            input[type="submit"] {
                background-color: var(--dark-green-color);
                color: #fff;
                border: none;
                padding: 10px 20px;
                border-radius: 3px;
                cursor: pointer;
            }
            input[type="submit"]:hover {
                background-color: var(--green-color);
            }
        </style>
    </head>
    <body>
        <div class="blogUpdate">
            <h1>Update Blog</h1>
            <c:set var="b" value="${requestScope.blogUpdate}"/>
            <form action="blogAction" method="post" name="blogUpdate" onsubmit="return validateBlogUpdate()">
                <input type="hidden" name="id" value="${b.id}">
                Title: <input type="text" name="newTitle" value="${b.title}" required><br>
                Image: <input type="text" name="newImage" value="${b.image}" required><br>
                Source: <input type="text" name="newSource" value="${b.source}" required><br>

                <input type="submit" value="Update" onclick="return confirmUpdateBlog();">
            </form>
            <script src="option/Validate.js"></script>
        </div>

    </body>

    <script>
                    function confirmUpdateBlog() {
                        var confirmation = confirm("Are you sure you want to update Blog?");
                        if (confirmation === true) {
                            return true;
                        } else {
                            alert("Blog deletion canceled.");
                            return false;
                        }
                    }
    </script>
</html>