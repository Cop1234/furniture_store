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
<h1 class="h_list_fur">${title}</h1>
<div class="container">
    <table class="table-list-member">
        <tr>
            <td style="width: 140px;">รหัสสินค้า</td>
            <td style="width: 300px;">ชื่อสินค้า</td>
            <td style="width: 150px;">ราคา</td>
            <td style="width: 400px;">รายละเอียด</td>
            <td style="width: 400px;">คำสั่งซื้อ</td>
        </tr>

        <c:forEach var="furniture" items="${furnitures}">
        <tr style="font-weight: 200">
            <td><p>${furniture.code}</p></td></td>
            <td><p style="margin-left: 3px">${furniture.name}</p></td>
            <td><p style="margin-left: -10px"><fmt:formatNumber type="number" pattern="###,###.00" value="${furniture.price}"/></p></td>
            <td><p style="margin-left: 2px">${furniture.description}</p></td>
            <td>
                <p style="margin-left: -679px;">
                    <input type="button" value="ซื้อ" onclick="window.location.href='${pageContext.request.contextPath}/member-show/${furniture.id}/result'; return false;" class="add-button" style="font-weight: 400"/></p>
            </td>
        </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
