<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>${title}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<h1>${title}</h1>
<div class="container">

    <c:if test="${param.error != null}">ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง</c:if>
    <c:if test="${param.logout != null}">คุณออกจากระบบแล้ว</c:if>
    <form:form action="${pageContext.request.contextPath}/authenticate" method="POST">
        <table>
            <tr>
                <td><p>ชื่อผู้ใช้</p></td>

                <td><input type="text" name="username" class="form-control"/></td>
            </tr>

            <tr>
                <td><p>รหัสผ่าน</p></td>
                <td><input type="password" name="password" class="form-control"/></td>
            </tr>

            <tr>
                <td><input type="submit" value="เข้าสู่ระบบ" class="btn btn-outline-dark"/></td>
            </tr>
        </table>
    </form:form>

</div>
<jsp:include page="/WEB-INF/view/layouts/footer.jsp"/>
</body>
</html>
