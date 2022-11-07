<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>${title}</title>
</head>
<body>
<h1>${title}</h1>

<div class="container">
    <input type="button" value="เพิ่มร้านเฟอร์นิเจอร์"
           onclick="window.location.href='${pageContext.request.contextPath}/store/create'; return false;"
           class="add-button"/>
    <table>
        <thead>
        <tr>
            <th>รหัสสินค้า</th><th>ชื่อสินค้า</th><th>เจ้าของร้าน</th><th>Latitude</th><th>Longitude</th><th>จำนวนสินค้า</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="store" items="${stores}">
            <tr>
                <td><a href="${pageContext.request.contextPath}/store/${store.id}/update">
                        ${store.code}</a></td>
                <td>${store.name}</td>
                <td>${store.owner}</td>
                <td>${store.latitude}</td>
                <td>${store.longitude}</td>
                <td>${fn:length(store.furnitures)}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
