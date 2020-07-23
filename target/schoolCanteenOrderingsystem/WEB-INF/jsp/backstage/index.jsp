<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
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

        <img src="${ctx}/resource/img/houtaiIndex.jpg" width="100%" height="520px" />

    </div>
    <!-- 内容区域 /-->

    <jsp:include page="/resource/include/footer.jsp"/>

</div>

<script>
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
        $("ul li:eq(1)").attr('id','admin-index');
        // 激活导航位置
        setSidebarActive("admin-index");
    });
</script>
</body>

</html>
<!---->