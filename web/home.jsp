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
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
                background: url(images/background.jpg);
            }



            @media only screen and (max-width: 500px) {
                body {
                    min-width: 100vw;
                    background: url(images/background.jpg);
                }
                .footer {
                    display: none;
                }
                .main{
                    display: none;
                }
                #container {
                    display: none;
                }
                .selling {
                    display: none;
                }
                .headerPhone1 {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    background-color: #E2D9BC;
                    padding: 0 10%;
                    color: brown;
                }
                .headerPhone1 a {
                    color: brown;
                }

            }
        </style>
    </head>
    <body>
        <div class="wrapper">


            <c:if test="${sessionScope.tableNumber!=null && requestScope.homeMobile==null}">
                <div class="mobile">
                    <div class="headerPhone1">
                        <div>
                            <a href="Action?check=store">
                                <i class="fab fa-elementor"></i>
                            </a>
                        </div>
                        <div>
                            <h2>Bàn <c:out value="${sessionScope.tableNumber}"/></h2>
                        </div>
                        <div>
                            <a href="Action?check=ListOrderLine" title="shopping cart">
                                <i class="fas fa-shopping-cart"></i>
                            </a>
                        </div>
                    </div>

                </div>
            </c:if>

            <c:if test="${requestScope.homeMobile!=null}"> <%@include file="homeMobile.jsp" %></c:if>
            <%@include file="header.jsp" %>

            <c:if test="${requestScope.main!=null}"> <%@include file="option/main.jsp" %> </c:if>

            <c:if test="${requestScope.store!=null}"> <%@include file="option/store.jsp" %> </c:if>
            <c:if test="${requestScope.productInfo!=null}"> <%@include file="option/productInfo.jsp" %> </c:if>


            <c:if test="${requestScope.blogList!=null}"> <%@include file="option/blog.jsp" %> </c:if>    
            <c:if test="${requestScope.sourceBlog!=null}"> <jsp:include page="${requestScope.sourceBlog}" /> </c:if> 


            <c:if test="${requestScope.introduction!=null}"> <%@include file="option/introduction.jsp" %> </c:if>                        

            <c:if test="${requestScope.contact!=null}"> <%@include file="option/contact.jsp" %> </c:if> 

            <c:if test="${sessionScope.manage!=null}"> <%@include file="option/manage.jsp" %> </c:if>

            <c:if test="${requestScope.ListOrderLine!=null}"> <%@include file="option/ListOrderLine.jsp" %> </c:if>
            
            <%@include file="footer.jsp" %>
        </div>
    </body>
</html>
