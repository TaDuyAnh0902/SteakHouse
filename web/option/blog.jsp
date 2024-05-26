<%-- 
    Document   : blog
    Created on : May 26, 2024, 4:25:01 PM
    Author     : Admin
--%>

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
            .Blog h1 {
                text-align: center;
                color: var(--green-color);
            }
            .BlogContainer {
                padding: 0 100px;
                margin-top: 50px;
                display: flex;
                flex-wrap: wrap;
                gap: 50px;
            }
            .BlogItem {
                width: calc(50% - 50px);
                display: flex;
                gap: 20px;
            }
        </style>
    </head>
    <body>
        <div class="Blog">
            <h1>Blog</h1>
            
            <div class="BlogContainer">
                <c:forEach var="blog" items="${requestScope.blogList}">
                    <div class="BlogItem">
                        <div>
                            <a href="choiceBlog?id=${blog.id}"><img src="${blog.image}" alt="alt"/></a>
                        </div>
                        <div>
                            <h5>${blog.title}</h5>
                            <p>${blog.date}</p>
                            <p>Posted By ${blog.aid.name}</p>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </body>
</html>
