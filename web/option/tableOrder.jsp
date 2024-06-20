<%-- 
    Document   : tableOrder
    Created on : Jun 14, 2024, 10:56:30 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>


<table border="1">
    <thead>
        <tr>
            <th>Product Name</th>
            <th>Quantity</th>
            <th>Note</th>
            <th>Time</th>
            <th>Table</th>
            <th>Status</th>
        </tr>
    </thead>
    <c:forEach items="${sessionScope.allListOrderLine}" var="o">
        <c:if test="${o.sid.id!=1}">
            <tbody>
            <td>${o.pid.name}</td>
            <td>${o.quantity}</td>
            <td>lskdfjlskdf</td>
            <td>${o.dateOrderline}</td>
            <td>${o.tid.nameTable}</td>
            <td>
                <c:if test="${o.sid.id==2}">
                    <a href="ConfirmOrder<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>


<table border="1">
    <thead>
        <tr>
            <th>Product Name</th>
            <th>Quantity</th>
            <th>Time</th>
            <th>Table</th>
            <th>Status</th>
        </tr>
    </thead>
    <c:forEach items="${sessionScope.allListOrderLine}" var="o">
        <c:if test="${o.sid.id!=1}">
            <tbody>
            <td>${o.pid.name}</td>
            <td>${o.quantity}</td>
            <td>${o.dateOrderline}</td>
            <td>${o.tid.nameTable}</td>
            <td>
                <c:if test="${o.sid.id==2}">
                    <a href="ConfirmOrderByCashier?id=${o.id}">Confirm</a>
                </c:if>
                <c:if test="${o.sid.id==3}">
                    Done
                </c:if>
            </td>
            </tbody>
        </c:if>
    </c:forEach>
</table>