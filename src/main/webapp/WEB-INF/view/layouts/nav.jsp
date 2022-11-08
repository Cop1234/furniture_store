<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<form:form action="${pageContext.request.contextPath}/logout" method="POST" name="frmLogout"></form:form>

<head>
<%--    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet" type="text/css">--%>
</head>
<nav>
    <ul class="navbar">
        <li><a href="${pageContext.request.contextPath}" style="color: #3198da;">Home</a></li>

        <security:authorize access="!isAuthenticated()">
            <li><a href="${pageContext.request.contextPath}/guest-show/list" style="color: #3198da;">Products</a></li>
        </security:authorize>

        <security:authorize access="hasRole('MEMBER')">
            <li><a href="${pageContext.request.contextPath}/member-show/list" style="color: #3198da;">Products</a></li>
        </security:authorize>

        <security:authorize access="hasRole('MANAGER')">
            <li><a href="${pageContext.request.contextPath}/furniture/list" style="color: #3198da;">Furniture</a></li>
        </security:authorize>

        <security:authorize access="hasRole('ADMIN')">
            <li><a href="${pageContext.request.contextPath}/store/list" style="color: #3198da;">Store</a></li>
        </security:authorize>

        <security:authorize access="!isAuthenticated()">
            <li><a href="${pageContext.request.contextPath}/login" style="color: #3198da;">Login</a></li>
        </security:authorize>

        <security:authorize access="isAuthenticated()">
            <li>
                User: <security:authentication property="principal.username" />
            </li>
            <li><a href="#" onclick="javascript: frmLogout.submit();">ออกจากระบบ</a></li>
        </security:authorize>
    </ul>
</nav>
