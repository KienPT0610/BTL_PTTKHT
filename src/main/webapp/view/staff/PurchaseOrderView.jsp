<%@ page import="model.Member" %>
<%@ page import="model.PurchaseOrder" %>
<%@ page import="model.PurchaseOrderItem" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.SparePart" %>
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
    <title>Chi tiết hóa đơn nhập - GaraMan</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/manager.css" rel="stylesheet">

    <style>
        .card {
            border-radius: 10px;
        }
        .table th, .table td {
            vertical-align: middle;
        }
        .btn-back {
            border-radius: 6px;
        }
    </style>
</head>
<body>

<%
    Member manager = (Member) session.getAttribute("manager");
    if (manager == null) {
        response.sendRedirect(request.getContextPath() + "/view/member/LoginView.jsp?err=timeout");
        return;
    }
    PurchaseOrder po = (PurchaseOrder) session.getAttribute("purchaseOrder");
    ArrayList<PurchaseOrderItem> listItem = po.getPurchaseOrderItems();
%>

<div class="sidebar">
    <div class="brand">🚗 GaraMan</div>
    <div class="menu">
        <a href="${pageContext.request.contextPath}/view/staff/ManagerHomeView.jsp">
            <i class="bi bi-house-door-fill me-2"></i> Trang chủ
        </a>
        <a href="${pageContext.request.contextPath}/view/staff/SellectStatView.jsp" class="active">
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

<!-- Main content -->
<div class="main-content">
    <!-- Header -->
    <div class="main-header">
        <h5 class="m-0 text-secondary">Chi tiết hóa đơn nhập</h5>
        <div class="account-info">
            <span>👤 <b><%= member.getName() %></b></span>
            <a href="${pageContext.request.contextPath}/logout" class="btn btn-outline-danger btn-sm">
                <i class="bi bi-box-arrow-right"></i> Đăng xuất
            </a>
        </div>
    </div>

    <!-- Body -->
    <div class="main-body">
        <div class="card shadow-sm">
            <div class="card-body">
                <h4 class="fw-bold mb-4 text-center">Chi tiết hóa đơn</h4>

                <div class="mb-4">
                    <p><b>ID: </b> <%=po.getId()%> </p>
                    <p><b>Ngày tạo: </b> <%=po.getOrderDate()%> </p>
                    <p><b>Nhân viên phụ trách:</b> <%=po.getWarehouseStaff().getName()%> </p>
                    <p><b>Nhà cung cấp:</b> <%=po.getSupplier().getName()%> </p>
                </div>

                <h6 class="fw-semibold mb-3 text-secondary">Chi tiết phụ tùng</h6>

                <div class="table-responsive">
                    <table class="table table-hover align-middle">
                        <thead class="table-primary">
                        <tr>
                            <th>ID phụ tùng</th>
                            <th>Tên phụ tùng</th>
                            <th>Số lượng</th>
                            <th>Giá</th>
                            <th>Ghi chú</th>
                        </tr>
                        </thead>
                        <tbody>
                        <% if (listItem != null && !listItem.isEmpty()) { %>
                        <%
                            for (PurchaseOrderItem ps : listItem) {
                                SparePart sp = ps.getSparePart();
                        %>
                        <tr>
                            <td><%= sp.getId() %></td>
                            <td><%= sp.getName() %></td>
                            <td><%= ps.getQuantity() %></td>
                            <td><%= ps.getPrice() %></td>
                            <td>VND</td>
                        </tr>
                        <% } %>
                        <% } else { %>
                        <tr>
                            <td colspan="5" class="text-center text-muted">
                                <i>Chưa có dữ liệu trong khoảng thời gian này.</i>
                            </td>
                        </tr>
                        <% } %>
                        </tbody>
                    </table>
                </div>

                <div class="text-start mt-4">
                    <a href="${pageContext.request.contextPath}/view/staff/SupplierDetailView.jsp"
                       class="btn btn-secondary btn-back">
                        <i class="bi bi-arrow-left"></i> Quay lại
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
