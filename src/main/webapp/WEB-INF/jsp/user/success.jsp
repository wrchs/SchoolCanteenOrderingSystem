<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="root" value="${pageContext.request.contextPath}" scope="page"/>
<html>
<head>
    <title>订餐页面</title>
    <meta name="viewport"
          content="width=device-width, maximum-scale=1, initial-scale=1, user-scalable=0" />
    <meta name="viewport" content="width=device-width, maximum-scale=1, initial-scale=1, user-scalable=0" />
    <jsp:include page="/resource/include/top.jsp"/>
</head>
<body>
    <div class="container">

        <jsp:include page="/resource/include/StuHeader.jsp"/>
        <!-- 内容区域 -->
        <div>
            <div class="lunbotu col-md-12">
                <img id="lunbotu" src=""/>
            </div>
            <div class="col-md-2 mainLeft">
                <h5>菜品类别</h5>
                <c:forEach items="${types}" var="types">
                    <div class="dishType">${types.dishType}</div>
                </c:forEach>
            </div>
            <div class="col-md-10">

                <c:forEach items="${dishes}" var="dishes">
                    <div class="col-sm-4 col-md-3 dish" style="cursor: pointer" onclick="addCart('${dishes.dishId}','${dishes.dishName}','${dishes.money}','${dishes.number}','${dishes.img}')">
                        <div class="thumbnail text-center icList" id="${dishes.dishId}">
                            <div class="caption">
                                <img src="${root}/${dishes.img}" width="100%" height="30%" class="img-rounded"/>
                                <p class="bg-teal color-palette" style="margin: 0px">${dishes.dishId}</p>
                                <h4 class="bg-teal color-palette" style="margin: 0px">${dishes.dishName}</h4>
                                <p class="bg-teal color-palette" style="margin: 0px">金额：${dishes.money}元</p>
                                <p class="bg-green-active color-palette" style="margin: 0px">剩余：${dishes.number}份</p>
                                <input class="diTy" type="hidden" value="${dishes.type}">
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <!-- 内容区域 -->

    </div>
    <form id="forwordFrom" action="<c:url value="/user/detailController"/>" method="post">
        <input type="hidden" id="studentId" name="studentId">
        <input type="hidden" id="dishId" name="dishId" />
        <input type="hidden" id="dishName" name="dishName" />
        <input type="hidden" id="money" name="money" />
        <input type="hidden" id="number" name="number" />
        <input type="hidden" id="img" name="img">
    </form>
    <script>
        function addCart(dishId,dishName,money,number,img) {
            $("#dishId").val(dishId);
            $("#dishName").val(dishName);
            $("#money").val(money);
            $("#number").val(number);
            $("#img").val(img);
            $("#forwordFrom").attr('action','<c:url value="/user/detailController"/>');
            $("#forwordFrom").submit();
        }

        $(".dishType").click(function () {
           $(".dish").removeClass("hidden");
           const type  = $(this).text();
           $(".caption input[type='hidden']").each(function () {
                const val = $(this).val();
                if (type != val){
                    $(this).parent().parent().parent().addClass("hidden");
                }
           })
        });

        function lunbo() {
            if (i<len){
                $("#lunbotu").attr("src", imgarr[i++]);
                    setTimeout("lunbo()", 3000);
            }else {
                i = 0;
                setTimeout("lunbo()", 3000);
            }
        }

        var imgarr = [
            "${root}/resource/img/1.jpg",
            "${root}/resource/img/2.jpg",
            "${root}/resource/img/3.jpg",
            "${root}/resource/img/4.jpg",
        ];

        var i = 0;
        var len = imgarr.length;
        $(document).ready(function () {
            $("#lunbotu").attr("src","${root}/resource/img/1.jsp");
            lunbo();
        });

    </script>
</body>