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
    <c:forEach var="furniture" items="${furnitures}">
    <table class="table-bordered">
        <tbody><%--<a href="${pageContext.request.contextPath}/member-show/${furniture.id}/result">${furniture.code}</a>--%>
            <tr>
                <td rowspan="3">${furniture.code}</td></td>
                <td>${furniture.name}</td>
            </tr>

            <tr>
                <td class="number">
                    <fmt:formatNumber type="number" pattern="###,###.00"
                    value="${furniture.price}"/>
                </td>
            </tr>

            <tr>
                <td>${furniture.description}</td>
            </tr>
        </tbody>
        <tfoot>
            <tr>
                <td rowspan="2">
                    <input type="button" value="ซื้อ"
                           onclick="window.location.href='${pageContext.request.contextPath}/member-show/${furniture.id}/result'; return false;"
                           class="add-button"
                    />
                </td>
            </tr>
        </tfoot>
    </table>
        <br><br>
    </c:forEach>
</div>
</body>
</html>
