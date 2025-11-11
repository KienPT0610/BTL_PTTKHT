<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ page import="model.Member" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    // 1. Kiểm tra session (BẮT BUỘC)
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
    <title>Tạo lịch hẹn</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        /* Tái sử dụng phong cách từ CustomerHomeView để đồng nhất */
        body {
            background-image: url("/assets/images/manager_home.png");
            background-size: cover;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            font-family: 'Inter', Arial, sans-serif;
            margin: 0;
            padding: 2rem 0; /* Thêm đệm cho màn hình nhỏ, tránh form dính sát */
        }

        .form-card {
            background-color: #f8f9fa;
            width: 100%;
            /* Tăng max-width để chứa 2 cột */
            max-width: 800px;
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


<div class="form-card">
    <div class="card-body p-4 p-md-5">

        <div class="text-center">
            <div class="card-icon mb-3">
                <i class="bi bi-calendar-plus"></i>
            </div>
            <h2 class="card-title fw-bold h3 mb-4">
                Đặt lịch hẹn mới
            </h2>
        </div>

        <form action="${pageContext.request.contextPath}/createAppointment" method="post">

            <!--
              Hiển thị thông báo (từ Servlet) nếu có
              (Ví dụ: "Tạo lịch hẹn thành công!" hoặc "Thời gian đã có người đặt")
            -->
            <c:if test="${not empty message}">
                <div class="alert alert-info" role="alert">
                        ${message}
                </div>
            </c:if>

            <!-- Bố cục 2 cột -->
            <div class="row">
                <!-- Cột 1 -->
                <div class="col-md-6">
                    <div class="mb-3">
                        <label for="datetime" class="form-label fw-bold">Thời gian:</label>
                        <input type="datetime-local" class="form-control form-control-lg"
                               id="datetime" name="datetime" required>
                    </div>
                </div>

                <!-- Cột 2 -->
                <div class="col-md-6">
                    <div class="mb-3">
                        <label for="username" class="form-label fw-bold">Họ và tên:</label>
                        <input type="text" class="form-control form-control-lg"
                               value="<%=user.getName()%>" id="username" name="username" required>
                    </div>
                </div>

                <!-- Cột 1 -->
                <div class="col-md-6">
                    <div class="mb-3">
                        <label for="email" class="form-label fw-bold">Email:</label>
                        <input type="email" class="form-control form-control-lg"
                               value="<%=user.getEmail()%>" id="email" name="email" required>
                    </div>
                </div>

                <!-- Cột 2 -->
                <div class="col-md-6">
                    <div class="mb-3">
                        <label for="telephone" class="form-label fw-bold">Điện thoại:</label>
                        <input type="text" class="form-control form-control-lg"
                               value="<%=user.getTel()%>" id="telephone" name="telephone" required>
                    </div>
                </div>
            </div> <!-- Kết thúc .row -->

            <!-- Địa chỉ (Full-width) -->
            <div class="mb-3">
                <label for="address" class="form-label fw-bold">Địa chỉ:</label>
                <input type="text" class="form-control form-control-lg"
                       value="<%=user.getAddress()%>" id="address" name="address" required>
            </div>

            <!-- Ghi chú (Full-width) -->
            <div class="mb-4">
                <label for="note" class="form-label fw-bold">Ghi chú (Tùy chọn):</label>
                <textarea class="form-control form-control-lg" id="note" name="note"
                          rows="3" placeholder="Ví dụ: Thay dầu, xe có tiếng kêu lạ..."></textarea>
            </div>

            <!-- Nút bấm (Full-width) -->
            <div class="d-grid gap-3">
                <button type="submit" class="btn btn-primary btn-lg">
                    <i class="bi bi-check-circle me-2"></i> Xác nhận đặt hẹn
                </button>

                <a href="${pageContext.request.contextPath}/view/customer/CustomerHomeView.jsp"
                   class="btn btn-outline-secondary btn-lg">
                    <i class="bi bi-arrow-left me-2"></i> Quay lại
                </a>
            </div>

        </form>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>