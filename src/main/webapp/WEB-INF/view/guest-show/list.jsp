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
    <jsp:include page="/WEB-INF/view/layouts/nav.jsp"/>
    <c:forEach var="furniture" items="${furnitures}">
        <table class="table-bordered">
            <tbody>
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
        </table>
        <br><br>
    </c:forEach>
</div>
</body>
</html>
