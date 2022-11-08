<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Mitr:wght@300&display=swap" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">
    <title>Document</title>
</head>
<body class="bg_page">
<div class="div_white">
    <p class="h1_f"><b>F</b></p>
    <p class="h1_ture"><b>urniture</b></p>

    <p class="h1_h"><b>H</b></p>
    <p class="h1_ome"><b>ome</b></p>

    <div class="div_blue_s">
        <p class="more">More species</p>
        <hr class="line_home">
    </div>

    <div class="div_prod1">
        <p class="home_prod1">Leisure chair</p>
        <p class="home_price1">฿990</p>
        <img src="${pageContext.request.contextPath}/assets/image/h_chair_1.png" class="chair_home1">
    </div>

    <div class="div_prod2">
        <p class="home_prod2">Simple chair</p>
        <p class="home_price2">฿1200</p>
        <img src="${pageContext.request.contextPath}/assets/image/h_chair_2.png" class="chair_home2">
    </div>

    <div class="div_prod3">
        <p class="home_prod3">Fashion chai</p>
        <p class="home_price3">฿1590</p>
        <img src="${pageContext.request.contextPath}/assets/image/h_chair_3.png" class="chair_home3">
    </div>
</div>
<a href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath}/assets/image/logo_icon.png" class="logo_icon"></a>
<img src="${pageContext.request.contextPath}/assets/image/chair.png" class="chair_home">
<hr class="line_vertical_home">


<div class="container">
    <jsp:include page="/WEB-INF/view/layouts/nav.jsp"/>
</div>

</body>
</html>
