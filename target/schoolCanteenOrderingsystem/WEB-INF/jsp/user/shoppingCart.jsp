<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.ordering.pojo.Car" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<html>
<head>
    <title>购物车</title>
    <meta name="viewport" content="width=device-width, maximum-scale=1, initial-scale=1, user-scalable=0" />
    <jsp:include page="/resource/include/top.jsp"/>
</head>
<body>
    <div class="container">
        <jsp:include page="/resource/include/StuHeader.jsp"/>
        <!-- 正文区域 -->
        <section class="content">

            <!-- .box-body -->
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">购物车列表</h3>
                </div>

                <div class="box-body">

                    <!-- 数据表格 -->
                    <div class="table-box">

                        <!--工具栏-->
                        <div class="pull-left">
                            <div class="form-group form-inline">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-default" title="刷新" onclick="window.location.reload();"><i class="fa fa-refresh"></i> 刷新</button>
                                </div>
                            </div>
                        </div>
                        <!--工具栏/-->

                        <!--数据列表-->
                        <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
                            <thead>
                                <tr>
                                    <th class="text-center">商品</th>
                                    <th class="text-center">单价</th>
                                    <th class="text-center">数量</th>
                                    <th class="text-center">小计</th>

                                </tr>
                            </thead>
                            <tbody id="Cartlist">
                            <%
                                List<Car> list = (List)session.getAttribute("car");
                                if (list != null){
                                    for (Car car : list) {
                            %>
                                <tr>
                                    <td><%=car.getDishName() %></td>
                                    <td><%=car.getMoney() %></td>
                                    <td><%=car.getNumber() %></td>
                                    <td><%=car.getTotal() %></td>

                                </tr>
                            <%
                                    }
                                }else if (list == null){
                                    out.println("您的购物车为空！<br>");
                                }
                            %>
                            </tbody>
                    <!-- 数据表格 /-->
                        </table>
                <!-- /.box-body -->
                    </div>
                    <div class="pull-right">
                        <h4>总金额：</h4><h5 id="total"></h5>
                    </div>
                    <a href="/user/delCart"><button id="ClearCart">清空购物车</button></a>
                    <div class="col-md-2 title">取餐日期：</div>
                    <div class="col-md-4 data">
                        <div class="input-group date">
                            <div class="input-group-addon">
                                <i class="fa fa-calendar"></i>
                            </div>
                            <input type="text" class="form-control pull-right" id="dateTimePicker"/>
                        </div>
                    </div>
                    <button id="balance" class="btn-success">结算</button>
                </div>
            </div>
        </section>
        <!-- 正文区域 /-->
    </div>
    <form id="forwordFrom" action="<c:url value="/user/balance"/>">
        <input type="hidden" id="totalMoney" name="totalMoney"/>
        <input type="hidden" id="time" name="time"/>
    </form>

    <script>
        <c:if test="${not empty success}">
            alert("${success}");
        </c:if>
        <c:if test="${not empty errorMoney}">
            alert("${errorMoney}");
        </c:if>
        var money = 0;
        var arr = [];

        $('#Cartlist tr').each(function () {
            let res = $(this).find('td:eq(3)').text();
            arr.push(res);
        });

        for(var i = 0;i<arr.length;i++){
            const result = arr[i];
            money += parseFloat(result);
        }

        $("#total").text(money);
        $(document).ready(function() {
            // datetime picker
            $('#dateTimePicker').datetimepicker({
                format: "mm/dd/yyyy - hh:ii",
                autoclose: true,
                todayBtn: true,
                language: 'zh-CN'
            });

        });


        $("#balance").click(function () {
            const detatime = $("#dateTimePicker").val();
            const month = detatime.substring(0,2);
            const day = detatime.substring(3,5);
            const year = detatime.substring(6,10);
            const hours = detatime.substring(10,18);
            const toTime = year+"/"+month+"/"+day+hours;
            var date = new Date();
            var y = date.getFullYear();
            var m = date.getMonth()+1;
            var d = date.getDate();
            var h = date.getHours();
            var min = date.getMinutes();
            var str=y+'/'+(m<10?('0'+m):m)+'/'+(d<10?('0'+d):d)+' - '+(h<10?('0'+h):h)+':'+(min<10?('0'+min):min);
            var start=new Date(toTime.replace("-", "/").replace("-", "/"));
            var end=new Date(str.replace("-", "/").replace("-", "/"));
            if(start<end){
                alert("您选择的时间小于当前时间，请重新输入时间！");
            }else {
                $("#totalMoney").val(money);
                $("#time").val(toTime);
                $("#forwordFrom").attr("action","<c:url value="/user/balance"/>");
                $("#forwordFrom").submit();
            }
        });
    </script>
</body>
</html>