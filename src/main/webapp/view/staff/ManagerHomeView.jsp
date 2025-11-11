<%@ page import="model.Member" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    Member member = (Member) session.getAttribute("manager");
    if (member == null) {
        response.sendRedirect(request.getContextPath() + "/view/member/LoginView.jsp?err=timeout");
        return;
    }
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang chủ Quản lý - GaraMan</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            margin: 0;
            background-color: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            overflow-x: hidden;
        }

        /* Sidebar */
        .sidebar {
            position: fixed;
            top: 0;
            left: 0;
            height: 100vh;
            width: 240px;
            background: #0d6efd;
            color: white;
            display: flex;
            flex-direction: column;
            padding: 1rem 0;
        }

        .sidebar .brand {
            font-size: 1.4rem;
            font-weight: 600;
            text-align: center;
            margin-bottom: 1.5rem;
        }

        .sidebar .menu {
            flex-grow: 1;
        }

        .sidebar .menu a {
            display: block;
            color: white;
            text-decoration: none;
            padding: 0.75rem 1.5rem;
            transition: 0.2s;
        }

        .sidebar .menu a:hover,
        .sidebar .menu a.active {
            background-color: rgba(255, 255, 255, 0.15);
            border-left: 4px solid #ffc107;
        }

        /* Main layout */
        .main-content {
            margin-left: 240px;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        /* Header */
        .main-header {
            background-color: white;
            border-bottom: 1px solid #dee2e6;
            padding: 0.75rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: sticky;
            top: 0;
            z-index: 10;
        }

        .main-header .account-info {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        /* Main body */
        .main-body {
            background-image: url("/assets/images/manager_home.png");
            background-size: cover;
            flex-grow: 1;
            display: flex;
            justify-content: center;
            /*align-items: center;*/
            text-align: center;
            padding: 3rem;
        }

        .welcome-box h1 {
            color: #0d6efd;
            font-weight: 600;
        }

        .welcome-box p {
            color: #6c757d;
            font-size: 1.1rem;
            margin-bottom: 2rem;
        }

        .btn-stat {
            font-size: 1.1rem;
            padding: 0.75rem 2rem;
            border-radius: 50px;
        }
    </style>
</head>
<body>

<!-- Sidebar -->
<div class="sidebar">
    <div class="brand">🚗 GaraMan</div>
    <div class="menu">
        <a href="${pageContext.request.contextPath}/view/staff/ManagerHomeView.jsp" class="active">
            <i class="bi bi-house-door-fill me-2"></i> Trang chủ
        </a>
        <a href="${pageContext.request.contextPath}/view/staff/SellectStatView.jsp">
            <i class="bi bi-bar-chart-fill me-2"></i> Xem thống kê
        </a>
        <a href="${pageContext.request.contextPath}/view/staff/ManagerHomeView.jsp">
            <i class="bi bi-tools me-2"></i> Quản lý dịch vụ
        </a>
        <a href="${pageContext.request.contextPath}/view/staff/ManagerHomeView.jsp">
            <i class="bi bi-gear-wide-connected me-2"></i> Quản lý phụ tùng
        </a>
        <a href="${pageContext.request.contextPath}/view/staff/ManagerHomeView.jsp">
            <i class="bi bi-truck me-2"></i> Nhà cung cấp
        </a>
    </div>
</div>

<!-- Main content area -->
<div class="main-content">
    <!-- Header -->
    <div class="main-header">
        <h5 class="m-0 text-secondary">Trang chủ quản lý</h5>
        <div class="account-info">
            <span>👤 <b><%= member.getName() %></b></span>
            <a href="${pageContext.request.contextPath}/logout" class="btn btn-outline-danger btn-sm">
                <i class="bi bi-box-arrow-right"></i> Đăng xuất
            </a>
        </div>
    </div>

    <!-- Body -->
    <div class="main-body">
        <div class="welcome-box">
            <h1>Chào mừng, <%= member.getName() %>!</h1>
            <p>Đây là trang trung tâm quản lý GaraMan — nơi bạn có thể theo dõi dịch vụ, phụ tùng và thống kê tổng quan.</p>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
