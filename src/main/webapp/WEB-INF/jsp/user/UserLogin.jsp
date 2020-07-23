<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
    <title>登陆页面</title>
    <meta name="viewport"
          content="width=device-width, maximum-scale=1, initial-scale=1, user-scalable=0" />
    <c:set var="ctx" value="${pageContext.request.contextPath}" scope="page"/>
    <jsp:include page="/resource/include/top.jsp"/>
</head>
<body class="hold-transition login-page">
<div class="login-box">
    <div class="login-logo">

        <a href="#">食堂订餐系统</a>

    </div>
    <!-- /.login-logo -->
    <div class="login-box-body">
        <p class="login-box-msg">登录系统</p>

        <form action="/user/login" method="post">
            <div class="form-group has-feedback">
                <input name="userId" type="text" class="form-control" placeholder="用户名">
                <span class="glyphicon glyphicon glyphicon-user form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input name="userPassword" type="password" class="form-control" placeholder="密码">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="row">
                <!-- /.col -->
                <div class="col-xs-4 pull-right">
                    <button type="submit" class="btn btn-primary btn-block btn-flat">登录</button>
                </div>
                <!-- /.col -->
            </div>
        </form>

    </div>
    <!-- /.login-box-body -->
</div>
<!-- /.login-box -->


<script>
    var user = $('#user').text();
    var pwd = $('#password').text();
    $(function() {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // optional
        });
    });

</script>
</body>
</html>
