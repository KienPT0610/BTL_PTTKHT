<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Tạo lịch hẹn mới</title>
</head>
<body>
<h2>Tạo lịch hẹn</h2>
<form action="${pageContext.request.contextPath}/createAppointment" method="post">
    <label>Thời gian:</label>
    <input type="datetime-local" name="datetime" required><br><br>

    <label>Ghi chú:</label>
    <input type="text" name="note" maxlength="255"><br><br>

    <button type="submit">Tạo lịch hẹn</button>
    <% String message = (String) request.getAttribute("message"); %>
    <% if(message != null) { %>
        <p><%= message %></p>
    <% } %>
</form>
</body>
</html>
