<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPEhtml>
<html>
<head>
    <title>${title}</title>
    <link href="${pageContext.request.contextPath}/assets/css/style.css"
rel="stylesheet">
</head>
<body>
<div id="header">
    <h1>${title}</h1>
</div>
<div class="container">
<jsp:include page="/WEB-INF/view/layouts/nav.jsp"/>
<form action="${pageContext.request.contextPath}/furniture/${furniture.id}/store/add" method="post">
    <table class="table-bordered">
        <thead>
        <tr>
            <th>รหัสร้านเฟอร์นิเจอร์</th>
            <th>ชื่อร้านเฟอร์นิเจอร์</th>
            <th>ชื่อเจ้าของ</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="store" items="${stores}">
            <tr>
                <td class="center"><a href="${pageContext.request.contextPath}/store/${store.id}/update">${store.code}</a>
                </td>
                <td>${store.name}</td>
                <td>${store.owner}</td>
                <td class="center"><button type="submit" name="store" value="${store.id}">เพิ่ม</button></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>
</div>
</body></html>