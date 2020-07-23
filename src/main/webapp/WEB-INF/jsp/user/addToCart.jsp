<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>菜品已成功加入购物车</title>
    <c:set var="ctx" value="${pageContext.request.contextPath}" scope="page"/>
    <meta name="viewport" content="width=device-width, maximum-scale=1, initial-scale=1, user-scalable=0" />
    <jsp:include page="/resource/include/top.jsp"/>
</head>
<body>
<div class="container">
    <jsp:include page="/resource/include/StuHeader.jsp"/>
    <div class="row">
        <div class="col-lg-6">
            <img src="${root}/${dish.img}" width="50%" height="50%" class="img-rounded"/>
            <p>${dish.dishName}</p>
            <p>X${num}</p>
        </div>

        <div class="col-lg-6">
            <button id="addToCart" class="btn-primary">进入购物车</button>
        </div>
    </div>
</div>


<script>
    var num = $("#number");
    $("#plus").click(function () {
        // 当按加1时，解除$("#minus")不可读状态
        if (parseInt(num.val())>5){
            $("#plus").attr({"disabled":"disabled"});
        }else if (parseInt(num.val())<=5) {
            $("#minus").removeAttr("disabled");
            num.val(parseInt(num.val())+1);
        }
    });

    $("#minus").click(function () {
        // 判断数量值大于1时才可以减少
        if (parseInt(num.val())>1){
            num.val(parseInt(num.val())-1)
        }else {
            //当$("#minus")为1时，$("#minus")不可读状态
            $("#minus").attr("disabled","disabled")
        }
    });

    $("#addToCart").click(function () {
        if (confirm("添加成功！")) {
            window.location.href = "/user/shopCart";
        }
    });
</script>
</body>
</html>
