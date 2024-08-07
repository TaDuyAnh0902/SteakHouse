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
            .blogAdd {
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
        <div class="blogAdd">
            <h1>Add Blog</h1>
            <form action="blogAction" method="post" name="blogAdd" onsubmit="return validateBlog()" >
                Title: <input type="text" name="title" required><br>
                Image: <input type="file" name="image" required><br>
                Source: <input type="file" name="source" required><br>
                <input type="submit" value="Add" onclick="return confirmBlogAdd();">
            </form>
            <script src="option/Validate.js"></script>
        </div>
    </body>

    <script>
                    function confirmBlogAdd() {
                        var confirmation = confirm("Are you sure you want to add Blog?");
                        if (confirmation === true) {
                            return true;
                        } else {
                            alert("Blog deletion canceled.");
                            return false;
                        }
                    }
    </script>
</html>