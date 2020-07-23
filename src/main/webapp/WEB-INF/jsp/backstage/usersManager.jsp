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
                    <small>数据列表</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="/backstage/index"><i class="fa fa-dashboard"></i> 首页</a></li>
                    <li><a href="/backstage/user">用户信息管理</a></li>
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
                                        <button type="button" id="add" class="btn btn-default" title="添加"><i class="fa fa-file-o"></i> 添加</button>
                                        <button type="button" class="btn btn-default" onclick="location.reload();" title="刷新"><i class="fa fa-refresh"></i> 刷新</button>
                                    </div>
                                </div>
                            </div>
                            <!--工具栏/-->

                            <!--数据列表-->
                            <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
                                <thead>
                                <tr>
                                    <th class="sorting_asc sorting_asc_disabled">用户名</th>
                                    <th class="sorting_desc sorting_asc_disabled">姓名</th>
                                    <th class="sorting_asc sorting_asc_disabled">密码</th>
                                    <th class="sorting_desc sorting_desc_disabled">金额</th>
                                    <th class="text-center">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${users}" var="users">
                                <tr>
                                    <td>${users.userId}</td>
                                    <td>${users.userName}</td>
                                    <td>${users.userPassword}</td>
                                    <td>${users.money}</td>
                                    <td class="text-center">
                                        <button type="button" class="btn bg-olive btn-xs" onclick="editUser('${users.userId}')">编辑</button>
                                        <button type="button" class="btn bg-olive btn-xs" onclick="delUser('${users.userId}')">删除</button>
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
        <input type="hidden" name="userId" id="userId">
    </form>
    <script>
        <c:if test="${not empty success}">
            alert("${success}");
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

        $('#add').click(function () {
            addUser();
        });

        function addUser() {
            $("#forwordFrom").attr('action','<c:url value="/backstage/userManager" />')
            $("#forwordFrom").submit();
        }

        function editUser(userId) {
            $("#userId").val(userId);
            $("#forwordFrom").attr('action','<c:url value="/backstage/userManager" />');
            $("#forwordFrom").submit();
        }

        function delUser(stuId) {
            if (confirm("确认删除该名用户？")){
                $("#userId").val(stuId);
                $("#forwordFrom").attr('action','<c:url value="/backstage/delUser" />');
                $("#forwordFrom").submit();
            };
        }
    </script>
</body>
</html>