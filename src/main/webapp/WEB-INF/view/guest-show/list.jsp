<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>${title}</title>
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">
</head>
<body style="margin: 0">
<a href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath}/assets/image/logo_icon.png" class="logo_icon"></a>
<h1 class="h_list_fur">${title}</h1>
<div class="container">
    <table class="table-bordered">
        <tr>
            <td style="width: 140px;">รหัสสินค้า</td>
            <td style="width: 300px;">ชื่อสินค้า</td>
            <td style="width: 150px;">ราคา</td>
            <td style="width: 400px;">รายละเอียด</td>
        </tr>
    </table>
    <c:forEach var="furniture" items="${furnitures}">
        <table class="table-bordered">
            <tbody>
            <tr>
                <td style="width: 140px; font-weight: 200;">${furniture.code}</td></td>
                <td style="width: 300px; font-weight: 200;">${furniture.name}</td>
                <td style="width: 150px; font-weight: 200;"><fmt:formatNumber type="number" pattern="###,###.00" value="${furniture.price}"/></td>
                <td style="width: 400px; font-weight: 200;">${furniture.description}</td>
            </tr>
            </tbody>
        </table>
    </c:forEach>
</div>
</body>
</html>
