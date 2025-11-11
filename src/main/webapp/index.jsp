<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Member" %>

<%
    Object user = (Member) session.getAttribute("user");

    // 2. Nếu user là null (chưa đăng nhập)
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/view/member/LoginView.jsp");
        return;
    }
%>

<html>
<head>
    <title>Trang chủ</title>
</head>
<body>
<%--    <h2>Xin chào, <%= user.getName() %>!</h2>--%>
    <p>Chào mừng bạn đến với hệ thống đặt lịch!</p>
    <a href="<%= request.getContextPath() %>/view/customer/AppointmentView.jsp">Đặt lịch hẹn</a> |
    <a href="<%= request.getContextPath() %>/logout">Đăng xuất</a>
</body>
</html>