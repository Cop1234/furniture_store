<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head><title>${title}</title>
    <link href="${pageContext.request.contextPath}/assets/css/login.css" rel="stylesheet">
</head>
<body>
<h1>${title}</h1>
<div class="container">

    <c:if test="${param.error != null}">ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง</c:if>
    <c:if test="${param.logout != null}">คุณออกจากระบบแล้ว</c:if>
    <form:form action="${pageContext.request.contextPath}/authenticate" method="POST">
        <table>
            <tr>
                <td><p class="font1">ชื่อผู้ใช้</p></td>
                <td><input class="box1" type="text" name="username"/></td>
            </tr>

            <tr>
                <td><p class="font1">รหัสผ่าน</p></td>
                <td><input class="box1" type="password" name="password"/></td>
            </tr>

            <tr>
                <td><input class="box2" type="submit" value="เข้าสู่ระบบ"/></td>
            </tr>
        </table>
    </form:form>

</div>


</body>
</html>
