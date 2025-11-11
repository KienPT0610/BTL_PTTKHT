<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ page import="model.Member" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    // 1. Kiểm tra session
    Member user = (Member) session.getAttribute("customer");
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/view/member/LoginView.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang chủ khách hàng</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            background-image: url("/assets/images/manager_home.png");
            background-size: cover;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            font-family: 'Inter', Arial, sans-serif;
            margin: 0;
        }

        .customer-card {
            background-color: #f8f9fa;
            width: 100%;
            max-width: 500px;
            border-radius: 15px;
            border: none;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
        }

        .card-icon {
            font-size: 3.5rem;
            color: var(--bs-primary);
        }

        .btn-lg {
            padding: 0.75rem 1.25rem;
            font-size: 1.1rem;
            font-weight: 600;
        }
    </style>
</head>
<body>

<!-- Thẻ nội dung chính -->
<div class="customer-card text-center">
    <div class="card-body p-4 p-md-5">

        <div class="card-icon mb-3">
            <i class="bi bi-person-circle"></i>
        </div>

        <h2 class="card-title fw-bold h3">
            Xin chào, <%= user.getName() %>!
        </h2>

        <p class="card-text text-muted mb-4">
            Chào mừng bạn trở lại GaraMan. Bạn muốn làm gì hôm nay?
        </p>

        <div class="d-grid gap-3">
            <a href="${pageContext.request.contextPath}/view/customer/AppointmentView.jsp"
               class="btn btn-primary btn-lg">
                <i class="bi bi-calendar-plus me-2"></i> Đặt lịch hẹn
            </a>

            <a href="#" class="btn btn-outline-secondary btn-lg">
                <i class="bi bi-clock-history me-2"></i> Xem lịch sử
            </a>

            <a href="${pageContext.request.contextPath}/logout" class="btn btn-link text-danger mt-2">
                <i class="bi bi-box-arrow-right me-2"></i> Đăng xuất
            </a>
        </div>

    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>