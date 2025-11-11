<%@ page import="model.Member" %>
<%@ page import="model.SupplierStat" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    Member manager = (Member) session.getAttribute("manager");
    if (manager == null) {
        response.sendRedirect(request.getContextPath() + "/view/member/LoginView.jsp?err=timeout");
        return;
    }

    ArrayList<SupplierStat> listSuppliers = (ArrayList<SupplierStat>) session.getAttribute("supplierStat");
    String startValue = (String) session.getAttribute("startDate");
    String endValue = (String) session.getAttribute("endDate");
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thống kê Nhà cung cấp - GaraMan</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/manager.css" rel="stylesheet">
    <style>
        /* Làm hàng có thể click và hiển thị hiệu ứng hover */
        tr.clickable-row { cursor: pointer; transition: background-color 0.15s ease-in-out; }
        tr.clickable-row:hover { background-color: #f2f8ff; }
    </style>
</head>
<body>

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
        <h5 class="m-0 text-secondary">Thống kê nhà cung cấp theo lượng hàng nhập</h5>
        <div class="account-info">
            <span>👤 <b><%= manager.getName() %></b></span>
            <a href="${pageContext.request.contextPath}/logout" class="btn btn-outline-danger btn-sm">
                <i class="bi bi-box-arrow-right"></i> Đăng xuất
            </a>
        </div>
    </div>

    <!-- Body -->
    <div class="main-body">
        <!-- Bộ lọc thời gian -->
        <div class="card shadow-sm mb-4">
            <div class="card-body">
                <form class="row g-3 align-items-end" method="get" action="${pageContext.request.contextPath}/SupplierServlet">
                    <div class="col-md-4">
                        <label for="startDate" class="form-label">Thời gian bắt đầu</label>
                        <input type="date" value="<%=startValue%>" id="startDate" name="startDate" class="form-control" required>
                    </div>
                    <div class="col-md-4">
                        <label for="endDate" class="form-label">Thời gian kết thúc</label>
                        <input type="date" value="<%=endValue%>" id="endDate" name="endDate" class="form-control" required>
                    </div>
                    <div class="col-md-4">
                        <button type="submit" class="btn btn-primary w-100">
                            <i class="bi bi-search"></i> Xem thống kê
                        </button>
                    </div>
                </form>
            </div>
        </div>

        <!-- Bảng thống kê -->
        <div class="card shadow-sm">
            <div class="card-body">
                <h6 class="mb-3 text-secondary">Kết quả thống kê</h6>

                <div class="table-responsive">
                    <table class="table table-hover align-middle">
                        <thead class="table-primary">
                        <tr>
                            <th>ID</th>
                            <th>Tên nhà cung cấp</th>
                            <th>Liên hệ</th>
                            <th>Địa chỉ</th>
                            <th>Tổng tiền nhập</th>
                            <th>Lượng hàng nhập</th>
                        </tr>
                        </thead>
                        <tbody>
                        <% if (listSuppliers != null && !listSuppliers.isEmpty()) { %>
                        <%
                            for (SupplierStat sp : listSuppliers) {
                                String detailUrl = request.getContextPath() + "/PurchaseOrderServlet"
                                        + "?supplierId=" + sp.getId()
                                        + "&startDate=" + (startValue != null ? startValue : "")
                                        + "&endDate=" + (endValue != null ? endValue : "");
                        %>
                        <tr class="clickable-row" onclick="window.location.href='<%= detailUrl %>'">
                            <td><%= sp.getId() %></td>
                            <td><%= sp.getName() %></td>
                            <td><%= sp.getContact() %></td>
                            <td><%= sp.getAddress() %></td>
                            <td><%= sp.getFormatValueToVND() %> VND</td>
                            <td><%= sp.getImportTotal() %></td>
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
            </div>
        </div>

        <c:if test="${not empty error}">
            <div class="alert alert-warning mt-3">${error}</div>
        </c:if>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
