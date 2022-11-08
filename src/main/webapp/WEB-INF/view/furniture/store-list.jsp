<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPEhtml>
<html>
<head>
    <title>${title}</title>
    <link href="${pageContext.request.contextPath}/assets/css/style.css"
rel="stylesheet">
</head>
<body style="font-family: Mitr">
<h1 class="h1-pro-add-store">${title}</h1>

<div class="area-pro-add-store">
<form action="${pageContext.request.contextPath}/furniture/${furniture.id}/store/add" method="post">
    <table class="table-bordered">
        <thead>
        <tr>
            <td style="width: 100px">รหัสร้าน</td>
            <td style="width: 186px">ชื่อร้าน</td>
            <td style="width: 172px">ชื่อเจ้าของ</td>
            <td style="width: 100px">Action</td>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="store" items="${stores}">
            <tr>
                <td class="center"><a href="${pageContext.request.contextPath}/store/${store.id}/update">${store.code}</a>
                </td>
                <td>${store.name}</td>
                <td>${store.owner}</td>
                <td class="center"><button type="submit" class="bt-pro-add-store"  name="store" value="${store.id}">เพิ่ม</button></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>
</div>
</body></html>