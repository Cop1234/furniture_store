<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>${title}</title>
    <script language="javascript">
        function cc() {
            var int1 = document.getElementById("input1").value;
            <%--var int2 = ${furniture.price};--%>
            var n1 = parseInt(int1);
            <%--var n2 = parseInt(int2);--%>
            show1.innerHTML = "การสั่งซื้อเสร็จสิ้น"
            show2.innerHTML = "ราคาทั้งหมด : "+ n1 * ${furniture.price} + " บาท"
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
<body>
<div id="header"><h1>${title}</h1></div>
<div class="container">
    <jsp:include page="/WEB-INF/view/layouts/nav.jsp"/>
</div id="container">
        <div id="inputDiv">
            <form:form action="" modelAttribute="furniture" method="POST">
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
            จำนวน : <input type="number" name="input1" id="input1" min="1" max="10" value="1">
            <button id="buy" onclick="javascript: cc() , hide();">สั่งซื้อ</button><br>
        </div>
<p id="show1"></p>
<p id="show2"></p>
</body>
</html>
