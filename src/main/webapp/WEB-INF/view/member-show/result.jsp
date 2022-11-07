<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>${title}</title>
</head>
<body>
<div id="header"><h1>${title}</h1></div>
<div class="container">
    <jsp:include page="/WEB-INF/view/layouts/nav.jsp"/>
        <div id="container">
            <form:form action="${pageContext.request.contextPath}/furniture/save " modelAttribute="furniture" method="POST">
                <form:hidden path="id"/>
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
            </form:form>

</body>
</html>
