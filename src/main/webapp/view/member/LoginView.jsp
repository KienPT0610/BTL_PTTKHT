<%@ page contentType="text/html; charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập - GaraMan</title>
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light d-flex align-items-center justify-content-center vh-100">

<div class="login-container card shadow-lg p-4 rounded-4" style="width: 400px;">
    <div class="text-center mb-4">
        <h3 class="fw-bold text-primary">GaraMan</h3>
        <p class="text-muted">Đăng nhập hệ thống quản lý gara ô tô</p>
    </div>

    <form method="post" action="${pageContext.request.contextPath}/login">
        <div class="mb-3">
            <label class="form-label">Tên đăng nhập</label>
            <input type="text" name="username" class="form-control" placeholder="Nhập tên đăng nhập" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Mật khẩu</label>
            <input type="password" name="password" class="form-control" placeholder="Nhập mật khẩu" required>
        </div>

        <c:if test="${not empty error}">
            <div class="alert alert-danger py-2">${error}</div>
        </c:if>

        <button type="submit" class="btn btn-primary w-100 mt-2">Đăng nhập</button>
    </form>

    <p class="text-center mt-3 mb-0 small text-muted">
        &copy; 2025 GaraMan System
    </p>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
