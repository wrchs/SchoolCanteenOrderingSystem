<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <title>详情页面</title>
        <c:set var="ctx" value="${pageContext.request.contextPath}" scope="page"/>
        <meta name="viewport" content="width=device-width, maximum-scale=1, initial-scale=1, user-scalable=0" />
        <jsp:include page="/resource/include/top.jsp"/>
        <style>
            .disabled {
                pointer-events: none;
            }

            #number {
                text-align: center;
                width: 30px;
            }
        </style>
    </head>
<body>
    <div class="container">
        <jsp:include page="/resource/include/StuHeader.jsp"/>
        <div class="row">
            <div class="col-md-6">
                <img src="${root}/${dish.img}" width="100%" height="70%" class="img-rounded"/>
            </div>

            <div class="col-md-6">
                <div class="col-md-2 title">菜名：</div>
                <div class="col-md-4">${dish.dishName}</div>
                <p>价格：${dish.money}</p>

                <div>
                    <input id="number" type="text" readonly="readonly" value="1">
                    <button id="plus">+</button>
                    <button id="minus" disabled="disabled">-</button>
                </div>

                <button id="addCart" class="btn bg-maroon">加入购物车</button>
            </div>
        </div>
    </div>

    <form id="forwordFrom" action="<c:url value="/user/addCart" />" method="post">
        <input type="hidden" id="dishId" name="dishId" />
        <input type="hidden" id="num" name="num">
        <input type="hidden" id="total" name="total" />
    </form>
    <script>
        <c:if test="${not empty msg}">
            alert("${msg}");
        </c:if>
        var num = $("#number");
        $("#plus").click(function () {
            // 当按加1时，解除$("#minus")不可读状态
            if (parseInt(num.val())>4){
                $("#plus").attr({"disabled":"disabled"});
            }else if (parseInt(num.val())<5) {
                $("#minus").removeAttr("disabled");
                $("#plus").removeAttr("disabled");
                num.val(parseInt(num.val())+1);
            }
        });

        $("#minus").click(function () {
            // 判断数量值大于1时才可以减少
            if (parseInt(num.val())>1){
                $("#plus").removeAttr("disabled");
                num.val(parseInt(num.val())-1)
            }else {
                //当$("#minus")为1时，$("#minus")不可读状态
                $("#plus").removeAttr("disabled");
                $("#minus").attr("disabled","disabled")
            }
        });

        $("#addCart").click(function () {
            let money = parseFloat(${dish.money});
            let sum = parseInt(num.val());
            let total = money * sum;

            $("#dishId").val(${dish.dishId});
            $("#total").val(total);
            $("#num").val(sum);
            $("#forwordFrom").attr('action','<c:url value="/user/addCart"/>');
            $("#forwordFrom").submit();
        });
    </script>
</body>
</html>
