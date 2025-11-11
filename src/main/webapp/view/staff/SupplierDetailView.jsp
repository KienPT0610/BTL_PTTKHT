<%@ page import="model.Member" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi tiết nhập hàng - GaraMan</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/manager.css" rel="stylesheet">
</head>
<%
    Member member = (Member) session.getAttribute("manager");
    if (member == null) {
        response.sendRedirect(request.getContextPath() + "/view/member/LoginView.jsp?err=timeout");
        return;
    }
%>

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
        <h5 class="m-0 text-secondary">Chi tiết các lần nhập</h5>
        <div class="account-info">
            <span>👤 <b><%= member.getName() %></b></span>
            <a href="#" class="btn btn-outline-danger btn-sm">
                <i class="bi bi-box-arrow-right"></i> Đăng xuất
            </a>
        </div>
    </div>

    <!-- Body -->
    <div class="main-body">
        <div class="card shadow-sm">
            <div class="card-body">
                <div class="text-start mb-4">
                    <a href="${pageContext.request.contextPath}/view/staff/SupplierStatView.jsp" class="btn btn-secondary">
                        <i class="bi bi-arrow-left"></i> Quay lại
                    </a>
                </div>
                <h4 class="fw-bold mb-3">Chi tiết các lần nhập</h4>

                <p><b>Nhà cung cấp:</b> ${supplierName} </p>
                <p><b>Thời gian:</b> ${startDate} - ${endDate} </p>

                <h6 class="mt-4 mb-3 text-secondary">Bảng thống kê chi tiết</h6>

                <div class="table-responsive">
                    <table class="table table-hover align-middle">
                        <thead class="table-primary">
                        <tr>
                            <th>ID Hóa đơn</th>
                            <th>Ngày nhập</th>
                            <th>Nhân viên phụ trách</th>
                            <th>Lượng hàng nhập</th>
                            <th>Tổng tiền</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:if test="${not empty listPurchaseOrder}">
                            <c:forEach var="po" items="${listPurchaseOrder}">
                                <tr onclick="window.location.href='${pageContext.request.contextPath}/PurchaseOrderDetailServlet?purchaseOrderId=${po.id}'" style="cursor: pointer;">
                                    <td>${po.id}</td>
                                    <td><fmt:formatDate value="${po.orderDate}" pattern="dd/MM/yyyy"/></td>
                                    <td>${po.warehouseStaff.name}</td>
                                    <td>${po.totalQuantity}</td>
                                    <td><fmt:formatNumber value="${po.totalAmount}" type="currency" currencySymbol="₫"/></td>
                                </tr>
                            </c:forEach>
                        </c:if>

                        <c:if test="${empty listPurchaseOrder}">
                            <tr>
                                <td colspan="5" class="text-center text-muted">
                                    <i>Chưa có dữ liệu trong khoảng thời gian này.</i>
                                </td>
                            </tr>
                        </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
