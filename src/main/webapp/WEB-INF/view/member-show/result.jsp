<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>${title}</title>
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">
    <script language="javascript">
        function cc() {
            var int1 = document.getElementById("input1").value;
            <%--var int2 = ${furniture.price};--%>
            var n1 = parseInt(int1);
            <%--var n2 = parseInt(int2);--%>
            show1.innerHTML = "การสั่งซื้อเสร็จสิ้น"
            show2.innerHTML = "ราคาทั้งหมด : " + n1 * ${furniture.price} +" บาท"
        };

        function hide() {
            var x = document.getElementById("inputDiv");
            if (x.style.display === "none") {
                x.style.display = "block";
            } else {
                x.style.display = "none";
            }
        }
    </script>
</head>
<body style="margin: 0">
<h1 class="h_list_fur">${title}</h1>
<div id="inputDiv">
    <table class="table-list-member">
        <tr>
            <td style="width: 140px;">รหัสสินค้า</td>
            <td style="width: 300px;">ชื่อสินค้า</td>
            <td style="width: 150px;">ราคา</td>
            <td style="width: 400px;">รายละเอียด</td>
        </tr>

        <form:form action="" modelAttribute="furniture" method="POST">
        <form:hidden path="id"/>
            <tr style="font-weight: 200">
                <td rowspan="3">${furniture.code}</td>
                <td>${furniture.name}</td>
                <td><fmt:formatNumber type="number" pattern="###,###.00" value="${furniture.price}"/></td>
                <td>${furniture.description}</td>
            </tr>
        </form:form>

        <div class="area-qty">
            จำนวน : <input type="number" name="input1" id="input1" min="1" max="10" value="1">
            <button class="bt-cal" onclick="javascript: cc() , hide();">สั่งซื้อ</button>
        </div>
    </table>
</div>

<div class="area-result">
    <p id="show1" class="mes-result"></p>
    <p id="show2" style="margin-left: 33px;"></p>
</div>
</body>
</html>
