<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<form:form action="${pageContext.request.contextPath}/logout" method="POST" name="frmLogout"></form:form>

<head>
<%--    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet" type="text/css">--%>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Mitr:wght@300&display=swap" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">
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
                <img src="${pageContext.request.contextPath}/assets/image/user1.png" class="chair_home3"> <security:authentication property="principal.username" />
            </li>
            <li><a href="#" onclick="javascript: frmLogout.submit();">ออกจากระบบ</a></li>
        </security:authorize>
    </ul>
</nav>
