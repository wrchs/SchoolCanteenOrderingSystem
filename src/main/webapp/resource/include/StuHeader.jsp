<%@ page import="com.ordering.pojo.User" %>
<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!-- 导航栏 -->
<nav class="navbar-default bg-success justify-content-center">
    <div class="row userTop">
        <%
            User stu = (User) session.getAttribute("user");
        %>
        <h4 class="col-md-8">欢迎您，<%=stu.getUserName() %></h4>
        <div class="col-md-2"><a href="/user/shopCart">进入购物车</a></div>
        <div class="col-md-2"><a href="/user/personalCart">个人中心</a></div>
    </div>
</nav>
<!-- 导航栏 -->