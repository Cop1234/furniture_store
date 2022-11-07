<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<form:form action="${pageContext.request.contextPath}/logout" method="POST" name="frmLogout"></form:form>

<head>
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet" type="text/css">
</head>
<nav>

    <ul class="navbar">
        <li><a href="${pageContext.request.contextPath}" style="color: #3198da;">Home</a></li>

        <security:authorize access="hasRole('MANAGER')">
            <li><a href="${pageContext.request.contextPath}/furniture/list" style="color: #3198da;">Product</a></li>
        </security:authorize>

        <security:authorize access="hasRole('ADMIN')">
            <li><a href="${pageContext.request.contextPath}/store/list" style="color: #3198da;">Store</a></li>
        </security:authorize>

        <li><a href="#about" style="color: #3198da;">About</a></li>

        <security:authorize access="!isAuthenticated()">
            <li><a href="${pageContext.request.contextPath}/login" style="color: #3198da;">Login</a></li>
        </security:authorize>

        <security:authorize access="isAuthenticated()">
            <li>
                User: <security:authentication property="principal.username" />
                Role: <security:authentication property="principal.authorities" />
            </li>
            <li><a href="#" onclick="javascript: frmLogout.submit();">ลงชื่อออกจากระบบ</a></li>
        </security:authorize>
    </ul>

</nav>
<hr>
