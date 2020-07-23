<%@ page import="com.ordering.pojo.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
    <title>个人中心</title>
    <meta name="viewport"
          content="width=device-width, maximum-scale=1, initial-scale=1, user-scalable=0" />
    <meta name="viewport" content="width=device-width, maximum-scale=1, initial-scale=1, user-scalable=0" />
    <jsp:include page="/resource/include/top.jsp"/>
    <style>
        body {
            font-family: "微软雅黑";
        }
        .container {
            text-align: center;
        }
        .row div:first-of-type {
            margin-top: 1%;
            font-size: 25px;
            font-weight: 200;
        }
        .row div:nth-child(2) {
            margin-top: 1%;
            font-size: 25px;
            font-weight: 200;
            text-align: left;
        }
        .row div:last-of-type {
            margin-top: 1%;
            font-size: 18px;
            text-align: left;
            font-weight: 200;
        }

        .row div:nth-child(2) {
            margin-top: 7%;
            font-size: 18px;
            text-align: left;
        }

        table tr:first-of-type{
            background-color: #337AB7;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row">
            <div>个人中心</div>
            <%
                User user = (User) request.getSession().getAttribute("user");
            %>
            <div>welcome <%=user.getUserName()%>!</div>
            <div>我的订单：</div>
            <table class="table table-bordered">
                <c:choose>
                    <c:when test="${orderList != null}">
                        <tr>
                            <td>订单号</td>
                            <td>菜单</td>
                            <td>取餐时间</td>
                            <td>操作</td>
                        </tr>
                        <c:forEach items="${orderList}" var="orderList">
                            <tr>
                                <td>${orderList.orderId}</td>
                                <td>${orderList.dishList}</td>
                                <td><fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${orderList.time}" /></td>
                                <td><button type="button" class="btn bg-olive btn-xs" onclick="del('${orderList.orderId}')">删除</button></td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:when test="${orderList == null}">
                        <p>无</p>
                    </c:when>
                </c:choose>
            </table>
            <div>我的余额：<%=user.getMoney()%></div>
        </div>

    </div>
    <form id="forwordFrom" action="<c:url value="/user/personalDel" />" method="post">
        <input type="hidden" name="orderId" id="orderId">
    </form>
    <script>
        <c:if test="${not empty delete}">
            alert("${delete}");
        </c:if>

        function del(orderId) {
            if (confirm("确认删除该项？")){
                $("#orderId").val(orderId);
                $("#forwordFrom").attr('action','<c:url value="/user/personalDel" />');
                $("#forwordFrom").submit();
            };
        }
    </script>
</body>
</html>
