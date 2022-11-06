<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>หน้าหลัก </title>
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">
</head>
<body>
<h1>Spring MVC Hibernate - หน้าหลัก</h1>
<div class="container">
    <jsp:include page="/WEB-INF/view/layouts/nav.jsp"/>
</div>
    <jsp:include page="/WEB-INF/view/layouts/footer.jsp"/>
    <h1>This is Home-page Area</h1>
</body>
</html>
