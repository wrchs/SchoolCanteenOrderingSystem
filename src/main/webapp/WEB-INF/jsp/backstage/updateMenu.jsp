<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
    <head>
        <title>食堂系统后台</title>
        <meta name="viewport"
              content="width=device-width, maximum-scale=1, initial-scale=1, user-scalable=0" />
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
                    <small>管理菜品</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="/backstage/index"><i class="fa fa-dashboard"></i> 首页</a></li>
                    <li><a href="/backstage/menu">菜品信息管理</a></li>
                    <li class="active">管理菜品</li>
                </ol>
            </section>
            <!-- 内容头部 /-->

            <!-- 正文区域 -->
            <form action="/backstage/saveDish" method="post" class="content" enctype="multipart/form-data">

                <!--菜品信息-->
                <div class="panel panel-default">
                    <div class="panel-heading">菜品信息</div>
                    <div class="row data-type">
                        <div class="col-md-2 title">编号</div>
                        <div class="col-md-4 data text" >
                            <input type="text" class="form-control" name="dishId" value="${dish.dishId}">
                        </div>

                        <div class="col-md-2 title">菜名</div>
                        <div class="col-md-4 data text">
                            <input type="text" class="form-control" name="dishName" value="${dish.dishName}"/>
                        </div>

                        <div class="col-md-2 title">类型</div>
                        <div class="col-md-4 data">
                            <select class="form-control select2" name="type" style="width: 100%;">
                                <option selected="selected"></option>
                                <c:forEach items="${dishTypes}" var="dishTypes">
                                    <option>${dishTypes.dishType}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="col-md-2 title">金额</div>
                        <div class="col-md-4 data text">
                            <input type="text" class="form-control" name="money" value="${dish.money}"/>
                        </div>

                        <div class="col-md-2 title">份数</div>
                        <div class="col-md-4 data text">
                            <input type="text" class="form-control" name="number" value="${dish.number}"/>
                        </div>

                        <div class="col-md-2 title">图片</div>
                        <div class="col-md-4 data">
                            <input type="file" class="form-control" name="image" value="${dish.img}"/>
                        </div>
                    </div>
                </div>
                <!--菜品信息/-->

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
            window.location.href="/backstage/menu";
        </c:if>

        <c:if test="${not empty update}">
        alert("${update}");
            window.location.href="/backstage/menu";
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

    </script>
    </body>
</html>
