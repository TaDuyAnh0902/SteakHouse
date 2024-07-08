<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .content1{
                display: flex;
                justify-content: center;
            }
            .content1 div,
            .content2 div{
                background-color: white;
                padding: 10px;
                margin: 5px;
            }
            .content1 div:nth-child(1){
                width: calc(40% - 5px);
            }
            .content1 div:nth-child(2){
                width: calc(60% - 5px);
            }
            .content2{
                display: flex;
                justify-content: center;
            }
            .content2 div:nth-child(1){
                width: calc(70% - 5px);
            }
            .content2 div:nth-child(2){
                width: calc(30% - 5px);
            }
            .revenue-details p {
                margin: 30px auto;
            }
            .menuSort {
                position: relative;
            }
            .ulSort{
                position: absolute;
                right: -30px;
                top: 30px;
                opacity: 0;
                pointer-events: none;
                list-style: none;
                background-color: #E2D9BC;
            }
            .ulSort a{
                text-decoration: none;
                color: brown;
                width: 100%;
                display: block;
                padding: 5px 10px;
            }
            .ulSort a:hover{
                background-color: brown;
                color: #E2D9BC;
            }
            .menuSort{
                cursor: pointer;
            }
            .menuSort:hover .ulSort{
                opacity: 1;
                pointer-events: visible;
            }
        </style>
    </head>
    <body>
        <div style="margin: 20px;">
            <div class="row" style="padding: 0;">
                <div class="col-sm-3">
                    <div class="card bg-light border-0">
                        <i class="fa fa-users  mb-2" style="font-size: 30px; padding-top: 25px"></i>
                        <h5 class="card-title text-center">Total Users: ${sessionScope.totalUser}</h5>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="card bg-light border-0">
                        <i class="fa fa-th-large mb-2" style="font-size: 30px; padding-top: 25px"></i>
                        <h5 class="card-title text-center">Total Categories: ${sessionScope.totalCategory}</h5>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="card bg-light border-0">
                        <i class="fa fa-th mb-2" style="font-size: 30px; padding-top: 25px"></i>
                        <h5 class="card-title text-center">Total Products: ${sessionScope.totalProduct}</h5>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="card bg-light border-0">
                        <i class="fa fa-list mb-2" style="font-size: 30px; padding-top: 25px"></i>
                        <h5 class="card-title text-center">Total Orders: ${sessionScope.totalOrder}</h5>
                    </div>
                </div>
            </div>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>

            <div class="content1">
                <div>
                    <div style="float: right; width: 32px;" class="menuSort" >
                        <i class="fas fa-bars" style="float: right;"></i>
                        <ul class="ulSort">
                            <li><a href="adminSort?check=bestSelling&action=day">Day</a></li>
                            <li><a href="adminSort?check=bestSelling&action=week">Week</a></li>
                            <li><a href="adminSort?check=bestSelling&action=month">Month</a></li>
                        </ul>
                    </div>

                    <c:set var="labels" value="" />
                    <c:set var="data" value="" />
                    <c:forEach var="entry" items="${sessionScope.getStatisticsBestSellings}" varStatus="loop">
                        <c:set var="key" value="${entry.key}" />
                        <c:set var="value" value="${entry.value}" />
                        <c:set var="labels" value="${labels}'${key}'${not loop.last ? ',' : ''}" />
                        <c:set var="data" value="${data}${value}${not loop.last ? ',' : ''}" />
                    </c:forEach>
                    <c:if test="${sessionScope.type eq 'cate'}">
                        <div style="width: 100%;">
                            <img src="https://quickchart.io/chart?c={
                                 type:'pie',data:{labels:[${labels}], 
                                 datasets:[{data:[${data}]}]}}" 
                                 alt="alt" style="height: 300px;width: 100%;"/>
                            <p style="text-align: center;">Best-selling</p>          
                        </div>

                    </c:if>
                </div>
                <div>
                    <div style="float: right; width: 32px;" class="menuSort" >
                        <i class="fas fa-bars" style="float: right;"></i>
                        <ul class="ulSort">
                            <li><a href="adminSort?check=order&action=week">Week</a></li>
                            <li><a href="adminSort?check=order&action=month">Month</a></li>
                        </ul>
                    </div>
                    <canvas id="myLineChart" style="width:100%; height: 300px;"></canvas>
                        <c:forEach var="entry2" items="${sessionScope.graph}" varStatus="loop2">
                            <c:set var="key2" value="${entry2.key}" />
                            <c:set var="value2" value="${entry2.value}" />
                            <c:set var="labels2" value="${labels2}'${key2}'${not loop2.last ? ',' : ''}" />
                            <c:set var="data2" value="${data2}${value2}${not loop2.last ? ',' : ''}" />
                        </c:forEach>
                    <script>
                        const reversedYValues = [${labels2}];
                        const xValues = reversedYValues.slice().reverse();

                        const reversedXValues = [${data2}];
                        const yValues = reversedXValues.slice().reverse();

                        new Chart("myLineChart", {
                            type: "line",
                            data: {
                                labels: xValues,
                                datasets: [{
                                        fill: false,
                                        lineTension: 0,
                                        backgroundColor: "rgba(0,0,255,1.0)",
                                        borderColor: "rgba(0,0,255,0.1)",
                                        data: yValues
                                    }]
                            },
                            options: {
                                legend: {display: false},
                                scales: {
                                    yAxes: [{ticks: {min: 1, max: 10}}],
                                }
                            }
                        });
                    </script>
                    <p style="text-align: center;">Order statistics</p>    
                </div>
            </div>

            <div class="content2">
                <div>
                    <div style="float: right; width: 32px;" class="menuSort" >
                        <i class="fas fa-bars" style="float: right;"></i>
                        <ul class="ulSort">
                            <li><a href="adminSort?check=revenue&action=week">Week</a></li>
                            <li><a href="adminSort?check=revenue&action=month">Month</a></li>
                        </ul>
                    </div>
                    <canvas id="myBarChart"></canvas>
                        <c:forEach var="entry2" items="${sessionScope.money}" varStatus="loop2">
                            <c:set var="key2" value="${entry2.key}" />
                            <c:set var="value2" value="${entry2.value}" />
                            <c:set var="labels3" value="${labels3}'${key2}'${not loop2.last ? ',' : ''}" />
                            <c:set var="data3" value="${data3}${value2}${not loop2.last ? ',' : ''}" />
                        </c:forEach>
                    <script>
                        const reversedX = [${labels3}];
                        const labels = reversedX.slice().reverse();

                        const reversedY = [${data3}];
                        const datas = reversedY.slice().reverse();

                        const data = {
                            labels: labels,
                            datasets: [{
                                    label: 'My First Dataset',
                                    data: datas,
                                    backgroundColor: [
                                        'rgba(255, 99, 132, 0.2)',
                                        'rgba(255, 159, 64, 0.2)',
                                        'rgba(255, 205, 86, 0.2)',
                                        'rgba(75, 192, 192, 0.2)',
                                        'rgba(54, 162, 235, 0.2)',
                                        'rgba(153, 102, 255, 0.2)',
                                        'rgba(201, 203, 207, 0.2)'
                                    ],
                                    borderColor: [
                                        'rgb(255, 99, 132)',
                                        'rgb(255, 159, 64)',
                                        'rgb(255, 205, 86)',
                                        'rgb(75, 192, 192)',
                                        'rgb(54, 162, 235)',
                                        'rgb(153, 102, 255)',
                                        'rgb(201, 203, 207)'
                                    ],
                                    borderWidth: 1
                                }]
                        };

                        const config = {
                            type: 'bar',
                            data: data,
                            options: {
                                scales: {
                                    y: {beginAtZero: true}
                                }
                            }
                        };

                        var ctx = document.getElementById('myBarChart').getContext('2d');
                        var myChart = new Chart(ctx, config);
                    </script>
                    <p style="text-align: center;">Revenue statistics</p> 
                </div>
                <div class="revenue-details">
                    <h3 style="text-align: center;">Revenue details</h3>
                    <p>Today: ${sessionScope.totalMoneyToDay} vnđ</p>
                    <p>
                        <c:if test="${sessionScope.compareTwoDatesNegative!=null}">
                            Compared to yesterday: <i class="fas fa-long-arrow-alt-down" style="color: #ff0000;"></i> ${sessionScope.compareTwoDatesNegative} vnđ 
                        </c:if>
                        <c:if test="${sessionScope.compareTwoDatesPositive!=null}">
                            Compared to yesterday: <i class="fas fa-long-arrow-alt-up" style="color: #00ff33;"></i> ${sessionScope.compareTwoDatesPositive} vnđ
                        </c:if>
                    </p>
                    <p>This Week: ${sessionScope.totalMoneyThisWeek} vnđ</p>
                    <p>
                        <c:if test="${sessionScope.compareTwoWeeksNegative!=null}">
                            Compared to last week: <i class="fas fa-long-arrow-alt-down" style="color: #ff0000;"></i> ${sessionScope.compareTwoWeeksNegative} vnđ
                        </c:if>
                        <c:if test="${sessionScope.compareTwoWeeksPositive!=null}">
                            Compared to last week: <i class="fas fa-long-arrow-alt-up" style="color: #00ff33;"></i> ${sessionScope.compareTwoWeeksPositive} vnđ
                        </c:if>
                    </p>
                    <p>This Month: ${sessionScope.totalMoneyThisMonth} vnđ</p>
                    <p>
                        <c:if test="${sessionScope.compareTwoMonthsNegative!=null}">
                            Compared to last month: <i class="fas fa-long-arrow-alt-down" style="color: #ff0000;"></i> ${sessionScope.compareTwoMonthsNegative} vnđ
                        </c:if>
                        <c:if test="${sessionScope.compareTwoMonthsPositive!=null}">
                            Compared to last month: <i class="fas fa-long-arrow-alt-up" style="color: #00ff33;"></i> ${sessionScope.compareTwoMonthsPositive} vnđ
                        </c:if>
                    </p>
                </div>
            </div>
        </div>
    </body>
</html>
