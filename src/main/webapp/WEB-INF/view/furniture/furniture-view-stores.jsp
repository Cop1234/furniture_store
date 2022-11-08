<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPEhtml>
<html>
<head>
    <title>${title}</title>
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">
</head>
<body>
<div id="header">
    <h1 style="margin-left: 562px;">${title}</h1>
</div>
<div class="container">
    <input type="button" value="เพิ่มร้านเฟอร์นิเจอร์"onclick="window.location.href='${pageContext.request.contextPath}/furniture/${furniture.id}/store/add';return false;"class="add-view-store"/>
    <table class="table-view-store">
        <thead>
        <tr>
            <th style="width: 240px;">รหัสร้านเฟอร์นิเจอร์</th>
            <th style="width: 240px;">ชื่อร้านเฟอร์นิเจอร์</th>
            <th style="width: 240px;">ชื่อเจ้าของ</th>
            <th style="width: 240px;">Action</th>
        </tr>
        </thead>
        <tbody><c:forEach var="store" items="${stores}">
            <tr>
                <td class="center">
                    <p style="margin-left: 73px"><a href="${pageContext.request.contextPath}/store/${store.id}/update">${store.code}</a></p>

                </td>
                <td><p style="margin-left: 65px">${store.name}</p></td>
                <td><p style="margin-left: 94px">${store.owner}</p></td>
                <td class="center">
                    <p style="margin-left: 104px"><a href="${pageContext.request.contextPath}/furniture/${furniture.id}/store/${store.id}/remove">ลบ</a></p>
                </td>
            </tr>
        </c:forEach></tbody>
    </table>
</div>
</body></html>
