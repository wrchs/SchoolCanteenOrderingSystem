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

        <!-- 内容头部 -->
        <section class="content-header">
            <h1>
                用户信息管理
                <small>管理用户</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="/backstage/index"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li><a href="/backstage/user">用户信息管理</a></li>
                <li class="active">管理用户</li>
            </ol>
        </section>
        <!-- 内容头部 /-->

        <!-- 正文区域 -->
        <form action="/backstage/saveUser" method="post" class="content">

            <!--用户信息-->
            <div class="panel panel-default">
                <div class="panel-heading">用户信息</div>
                <div class="row data-type">
                        <div class="col-md-2 title">用户名</div>
                        <div class="col-md-4 data text" >
                            <input type="text" class="form-control" name="id" value="${user.userId}">
                        </div>

                        <div class="col-md-2 title">姓名</div>
                        <div class="col-md-4 data text">
                            <input type="text" class="form-control" name="name" value="${user.userName}"/>
                        </div>

                        <div class="col-md-2 title">密码</div>
                        <div class="col-md-4 data text">
                            <input type="text" class="form-control" name="pwd" value="${user.userPassword}"/>
                        </div>

                        <div class="col-md-2 title">金额</div>
                        <div class="col-md-4 data text">
                            <input type="text" class="form-control" name="rmb" value="${user.money}"/>
                        </div>
                </div>
            </div>
            <!--用户信息/-->

            <!--工具栏-->
            <div class="box-tools text-center">
                <button type="submit" class="btn bg-maroon">保存</button>
                <button type="button" class="btn bg-default" onclick="history.back(-1);">返回</button>
            </div>
            <!--工具栏/-->

        </form>
        <!-- 正文区域 /-->

    </div>
    <!-- 内容区域 /-->

    <jsp:include page="/resource/include/footer.jsp"/>

</div>
    <script>
        <c:if test="${not empty insert}">
            alert("${insert}");
            window.location.href="/backstage/user";
        </c:if>

        <c:if test="${not empty update}">
            alert("${update}");
            window.location.href="/backstage/user";
        </c:if>
        $(document).ready(function() {
            // 选择框
            $(".select2").select2();

            // WYSIHTML5编辑器
            $(".textarea").wysihtml5({
                locale: 'zh-CN'
            });
        });

        // 设置激活菜单
        function setSidebarActive(tagUri) {
            var liObj = $("#" + tagUri);
            if (liObj.length > 0) {
                liObj.parent().parent().addClass("active");
                liObj.addClass("active");
            }
        }

        $(document).ready(function() {
            $("ul li:eq(2)").attr('id','admin-index');
            // 激活导航位置
            setSidebarActive("admin-index");
        });

    </script>
</body>
</html>