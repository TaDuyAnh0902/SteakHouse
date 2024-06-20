<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div>
            <a href="resetAccount?action=deleteAccountRole4">Reset account</a>
            <div class="row" style="padding: 0;">
                <div class="col-sm-3">
                    <div class="card bg-light border-0">
                        <i class="fa fa-users  mb-2" style="font-size: 50px; padding-top: 25px"></i>
                        <div class="card-body">
                            <h4 class="card-title text-center">Total Users: ${requestScope.totalUser}</h4>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="card bg-light border-0">
                        <i class="fa fa-th-large mb-2" style="font-size: 50px; padding-top: 25px"></i>
                        <div class="card-body">
                            <h4 class="card-title text-center">Total Categories: ${requestScope.totalCategory}</h4>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="card bg-light border-0">
                        <i class="fa fa-th mb-2" style="font-size: 50px; padding-top: 25px"></i>
                        <div class="card-body">
                            <h4 class="card-title text-center">Total Products: ${requestScope.totalProduct}</h4>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="card bg-light border-0">
                        <i class="fa fa-list mb-2" style="font-size: 50px; padding-top: 25px"></i>
                        <div class="card-body">
                            <h4 class="card-title text-center">Total Orders: ${requestScope.totalOrder}</h4>
                        </div>
                    </div>
                </div>
            </div>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
            <div style="width: 70%; margin: 0 auto;">
                <canvas id="myBarChart"></canvas>
                <c:forEach var="entry2" items="${requestScope.money}" varStatus="loop2">
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
            <div class="row">
                <div class="graph col-sm-6">
                    <c:set var="labels" value="" />
                    <c:set var="data" value="" />
                    <c:forEach var="entry" items="${requestScope.chart}" varStatus="loop">
                        <c:set var="key" value="${entry.key}" />
                        <c:set var="value" value="${entry.value}" />
                        <c:set var="labels" value="${labels}'${key}'${not loop.last ? ',' : ''}" />
                        <c:set var="data" value="${data}${value}${not loop.last ? ',' : ''}" />
                    </c:forEach>
                    <c:if test="${requestScope.type eq 'cate'}">
                        <div>
                            <img src="https://quickchart.io/chart?c={
                                 type:'pie',data:{labels:[${labels}], 
                                 datasets:[{data:[${data}]}]}}"
alt="alt" style="height: 300px;width: 100%;"/>
                            <p style="text-align: center;">Products for each Category</p>          
                        </div>

                    </c:if>
                </div>
                <div class="graph col-sm-6">
                    <canvas id="myLineChart" style="width:100%;max-width:600px"></canvas>
                        <c:forEach var="entry2" items="${requestScope.graph}" varStatus="loop2">
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
        </div>
    </body>
</html>