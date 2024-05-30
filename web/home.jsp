<%-- 
    Document   : home
    Created on : May 25, 2024, 4:39:58 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css"
              integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" 
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }
            body {
                width: 100%;
                min-width: 1200px;
            }
        </style>
    </head>
    <body>
        <div>
            <%@include file="header.jsp" %>
            
            
            <c:if test="${requestScope.main!=null}"> <%@include file="option/main.jsp" %> </c:if>
            
            <c:if test="${requestScope.introduction!=null}"> <%@include file="option/introduction.jsp" %> </c:if>
            
            <c:if test="${requestScope.store!=null}"> <%@include file="option/store.jsp" %> </c:if>
                <c:if test="${requestScope.productInfo!=null}"> <%@include file="option/productInfo.jsp" %> </c:if>
                
            <c:if test="${requestScope.blogList!=null}"> <%@include file="option/blog.jsp" %> </c:if>    
                <c:if test="${requestScope.sourceBlog!=null}"> <jsp:include page="${requestScope.sourceBlog}" /> </c:if> 
            
            <c:if test="${sessionScope.manageOption!=null}"> <%@include file="option/manageOption.jsp" %> </c:if>
                <c:if test="${sessionScope.manage!=null}"> <%@include file="option/manage.jsp" %> </c:if>
                <c:if test="${sessionScope.productAdd!=null}"> <%@include file="option/productAdd.jsp" %> </c:if>
                <c:if test="${requestScope.productUpdate!=null}"> <%@include file="option/productUpdate.jsp" %> </c:if>
                
                <c:if test="${requestScope.tableAdd!=null}"> <%@include file="option/tableAdd.jsp" %> </c:if>
                <c:if test="${requestScope.tableUpdate!=null}"> <%@include file="option/tableUpdate.jsp" %> </c:if>
                
                <c:if test="${requestScope.blogAdd!=null}"> <%@include file="option/blogAdd.jsp" %> </c:if>
                <c:if test="${requestScope.blogUpdate!=null}"> <%@include file="option/blogUpdate.jsp" %> </c:if>
            <%@include file="footer.jsp" %>
        </div>
        
    </body>
</html>
