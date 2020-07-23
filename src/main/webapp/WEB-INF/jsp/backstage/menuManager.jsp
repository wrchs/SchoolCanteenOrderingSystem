<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>菜单管理页面</title>
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
                    菜单信息管理
                    <small>数据列表</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
                    <li><a href="#">菜单信息管理</a></li>
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
                                        <button type="button" class="btn btn-default" id="add" title="添加"><i class="fa fa-file-o"></i> 添加</button>
                                        <button type="button" class="btn btn-default" onclick="location.reload();" title="刷新"><i class="fa fa-refresh"></i> 刷新</button>
                                    </div>
                                </div>
                            </div>
                            <!--工具栏/-->

                            <!--数据列表-->
                            <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
                                <thead>
                                <tr>
                                    <th class="sorting_asc sorting_asc_disabled">菜单号</th>
                                    <th class="sorting_desc sorting_asc_disabled">菜单名</th>
                                    <th class="sorting_desc sorting_asc_disabled">类型</th>
                                    <th class="sorting_asc sorting_asc_disabled">金额</th>
                                    <th class="sorting_desc sorting_desc_disabled">份数</th>
                                    <th class="text-center">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${dishes}" var="dishes">
                                    <tr>
                                        <td>${dishes.dishId}</td>
                                        <td>${dishes.dishName}</td>
                                        <td>${dishes.type}</td>
                                        <td>${dishes.money}</td>
                                        <td>${dishes.number}</td>
                                        <td class="text-center">
                                            <button type="button" class="btn bg-olive btn-xs" onclick="editDish('${dishes.dishId}')">编辑</button>
                                            <button type="button" class="btn bg-olive btn-xs" onclick="delDish('${dishes.dishId}')">删除</button>
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
    <form id="forwordFrom" action="<c:url value="/backstage/menuManager" />" method="post">
        <input type="hidden" name="dishId" id="dishId">
    </form>
    <script>
        <c:if test="${not empty success}">
            alert("${success}");
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
            $("ul li:eq(3)").attr('id','admin-index');
            // 激活导航位置
            setSidebarActive("admin-index");
        });

        $('#add').click(function () {
            addDish();
        });

        function addDish() {
            $("#forwordFrom").attr('action','<c:url value="/backstage/menuManager" />')
            $("#forwordFrom").submit();
        }

        function editDish(dishId) {
            $("#dishId").val(dishId);
            $("#forwordFrom").attr('action','<c:url value="/backstage/menuManager" />');
            $("#forwordFrom").submit();
        }

        function delDish(dishId) {
            if (confirm("确认删除这个菜品？")){
                $("#dishId").val(dishId);
                $("#forwordFrom").attr('action','<c:url value="/backstage/delDish" />');
                $("#forwordFrom").submit();
            };
        }
    </script>
</body>
</html>
