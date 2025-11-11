<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="model.Member" %>
<%
    Member user = (Member) session.getAttribute("customer");
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
<h2>Xin chào, <%= user.getName() %>!</h2>
<p>Bạn đã đăng nhập thành công.</p>
<a href="<%= request.getContextPath() %>/view/customer/AppointmentView.jsp">Đặt lịch hẹn</a><br><br>
<a href="<%= request.getContextPath() %>/logout">Đăng xuất</a>
</body>
</html>
