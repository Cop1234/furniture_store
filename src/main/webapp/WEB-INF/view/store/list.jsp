<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>${title}</title>
    <link href="https://fonts.googleapis.com/css2?family=Mitr:wght@300&display=swap" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">
</head>
<body>
<h1 class="list_s_h1">${title}</h1>

<div class="container">
    <input type="button" value="เพิ่มร้านเฟอร์นิเจอร์"
           onclick="window.location.href='${pageContext.request.contextPath}/store/create'; return false;" class="add-button-fur"/>

    <table class="tb_list_fur">
        <thead>
        <tr>
            <th style="width: 225px;">รหัสเฟอร์นิเจอร์</th>
            <th style="width: 225px;">ชื่อเฟอร์นิเจอร์</th>
            <th style="width: 225px;">เจ้าของร้าน</th>
            <th style="width: 225px;">Latitude</th>
            <th style="width: 225px;">Longitude</th>
            <th style="width: 225px;">จำนวนสินค้า</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="store" items="${stores}">
            <tr>
                <td>
                    <p style="margin-left: 70px"><a href="${pageContext.request.contextPath}/store/${store.id}/update">${store.code}</a></p>
                </td>
                <td><p style="margin-left: 47px">${store.name}</p></td>
                <td><p style="margin-left: 76px">${store.owner}</p></td>
                <td><p style="margin-left: 70px">${store.latitude}</p></td>
                <td><p style="margin-left: 70px">${store.longitude}</p></td>
                <td><p style="margin-left: 100px">${fn:length(store.furnitures)}</p></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
