<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>食堂点餐系统</title>
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <!-- 页面meta /-->
    <c:set var="ctx" value="${pageContext.request.contextPath}" scope="page"/>
    <jsp:include page="/resource/include/top.jsp"/>
</head>

<body class="hold-transition skin-purple sidebar-mini">

    <div class="wrapper">

        <jsp:include page="/resource/include/header.jsp"/>

        <jsp:include page="/resource/include/left.jsp"/>

        <!-- 内容区域 -->
        <div class="content-wrapper">
            <div class="col-md-2">食堂金额：</div>
            <div class="col-md-2">${amounts}</div>
        </div>
    </div>
</body>
</html>
