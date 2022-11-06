<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<form:form action="${pageContext.request.contextPath}/logout" method="POST" name="frmLogout"></form:form>

<head>
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet" type="text/css">
</head>
<nav>
    <ul>
        <li><a href="${pageContext.request.contextPath}">หน้าหลัก</a></li>
        <%--    <security:authorize access="hasRole('MANAGER')">--%>
        <li><a href="${pageContext.request.contextPath}/furniture/list">เฟอร์นิเจอร์</a></li>
        <%--    </security:authorize>--%>
<%--        <security:authorize access="hasRole('ADMIN')">--%>
        <li><a href="${pageContext.request.contextPath}/store/list">ร้านเฟอร์นิเจอร์</a></li>
<%--        </security:authorize>--%>
    </ul>
</nav>
<hr>
