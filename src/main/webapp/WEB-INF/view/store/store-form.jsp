<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>${title}</title>
</head>
<body>
<div id="header"><h1>${title}</h1></div>
<div class="container">
    <jsp:include page="/WEB-INF/view/layouts/nav.jsp"/>
    <div id="container">
        <i>กรอกข้อมูลในฟอร์ม. เครื่องหมายดอกจัน (*) หมายถึงห้ามว่าง</i><br><br>
        <form:form action="${pageContext.request.contextPath}/store/save " modelAttribute="store" method="POST">
            <form:hidden path="id"/>
            <table>
                <colgroup>
                    <col style="width: 160px;">
                    <col style="width: auto;">
                </colgroup>
                <tbody>
                <tr>
                    <td><label>รหัสร้านเฟอร์นิเจอร์:</label></td>
                    <td><form:input path="code"/>
                        <form:errors path="code" cssClass="error" style="color:red"/>
                    </td>
                </tr>
                <tr>
                    <td><label>ชื่อร้านเฟอร์นิเจอร์:</label></td>
                    <td><form:input path="name"/>
                        <form:errors path="name" cssClass="error" style="color:red"/>
                    </td>
                </tr>
                <tr>
                    <td><label>ชื่อเจ้าของร้าน:</label></td>
                    <td><form:input path="owner"/>
                        <form:errors path="owner" cssClass="error" style="color:red"/>
                    </td>
                </tr>
                <tr>
                    <td><label>Latitude:</label></td>
                    <td><form:input path="latitude" cssClass="number"/>
                        <form:errors path="latitude" cssClass="error" style="color:red"/>
                    </td>
                </tr>
                <tr>
                    <td><label>Longitude:</label></td>
                    <td><form:input path="longitude" cssClass="number"/>
                        <form:errors path="longitude" cssClass="error" style="color:red"/>
                    </td>
                </tr>
                <tr>
                    <td><label>ที่อยุ่:</label></td>
                    <td><form:textarea path="address"
                                       cols="50" rows="5"></form:textarea>
                        <form:errors path="address" cssClass="error"/>
                    </td>
                </tr>
                <tr>
                    <td><label></label></td>
                    <td>
                        <input type="submit" value="บันทึก" class="save-button"/>
                        <input type="button" value="ลบ"
                               onclick="if((confirm('คูณแน่ใจหรือว่าต้องการลบสินค้านี้ ?'))) {
                                       window.location.href='${pageContext.request.contextPath}/store/${store.id}/delete'; return false; }"
                               class="cancel-button"
                        />
                        <input type="button" value="ยกเลิก"
                               onclick="window.location.href='${pageContext.request.contextPath}/store/list'; return false;"
                               class="cancel-button"
                        />
                        <c:if test="${store.id > 0}">
                            <input type="button" value="แสดงร้านค้า"
                                   onclick="window.location.href=
                                           '${pageContext.request.contextPath}/store/${store.id}/view-furnitures';
                                           return false;"
                                   class="add-button"
                            />
                        </c:if>
                    </td>
                </tr>
                </tbody>
            </table>
        </form:form>
    </div>
</div>
</body>
</html>
