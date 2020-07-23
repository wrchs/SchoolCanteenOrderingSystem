<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                订单信息管理
                <small>数据列表</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li><a href="#">订单信息管理</a></li>
                <li class="active">数据列表</li>
            </ol>
        </section>
        <!-- 内容头部 /-->

        <!-- 正文区域 -->
        <section class="content">

            <!-- .box-body -->
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">列表</h3>
                </div>

                <div class="box-body">

                    <!-- 数据表格 -->
                    <div class="table-box">

                        <!--工具栏-->
                        <div class="pull-left">
                            <div class="form-group form-inline">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-default" onclick="location.reload();" title="刷新"><i class="fa fa-refresh"></i> 刷新</button>
                                </div>
                            </div>
                        </div>
                        <!--工具栏/-->

                        <!--数据列表-->
                        <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
                            <thead>
                            <tr>
                                <th class="sorting_asc sorting_asc_disabled">订单号</th>
                                <th class="sorting_asc sorting_asc_disabled">用户名</th>
                                <th class="sorting_desc sorting_asc_disabled">菜单列表</th>
                                <th class="sorting_desc sorting_desc_disabled">取餐时间</th>
                                <th class="text-center">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${orders}" var="orders">
                                <tr>
                                    <td>${orders.orderId}</td>
                                    <td>${orders.userId}</td>
                                    <td>${orders.dishList}</td>
                                    <td><fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${orders.time}" /></td>
                                    <td class="text-center">
                                        <button type="button" class="btn bg-olive btn-xs" onclick="success('${orders.orderId}')">完成</button>
                                        <button type="button" class="btn bg-olive btn-xs" onclick="del('${orders.orderId}')">删除</button>
                                    </td>
                                </tr>
                            </c:forEach>

                            </tbody>

                        </table>
                        <!--数据列表/-->

                    </div>
                    <!-- 数据表格 /-->

                </div>
                <!-- /.box-body -->

            </div>

        </section>
        <!-- 正文区域 /-->

    </div>
    <!-- 内容区域 /-->

    <jsp:include page="/resource/include/footer.jsp"/>

</div>
    <form id="forwordFrom" action="<c:url value="/backstage/userManager" />" method="post">
        <input type="hidden" name="orderId" id="orderId">
        <input type="hidden" name="id" id="id">
    </form>
<script>
    <c:if test="${not empty success}">
        alert("${success}");
    </c:if>

    <c:if test="${not empty delete}">
        alert("${delete}");
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
        $("ul li:eq(4)").attr('id','admin-index');
        // 激活导航位置
        setSidebarActive("admin-index");
    });

    function success(orderId) {
        $("#orderId").val(orderId);
        $("#id").val(1);
        $("#forwordFrom").attr('action','<c:url value="/backstage/updateOrder" />');
        $("#forwordFrom").submit();
    }

    function del(orderId) {
        if (confirm("确认删除该项？")){
            $("#orderId").val(orderId);
            $("#id").val(2);
            $("#forwordFrom").attr('action','<c:url value="/backstage/updateOrder?id=2" />');
            $("#forwordFrom").submit();
        };
    }

</script>
</body>

</html>
<!---->