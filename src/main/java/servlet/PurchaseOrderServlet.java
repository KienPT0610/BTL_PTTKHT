package servlet;

import dao.PurchaseOrderDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.PurchaseOrder;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

@WebServlet("/PurchaseOrderServlet")
public class PurchaseOrderServlet extends HttpServlet {
    private PurchaseOrderDAO purchaseOrderDAO;

    public PurchaseOrderServlet() {
        purchaseOrderDAO = new PurchaseOrderDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String supplierIdStr = request.getParameter("supplierId");
        String sd = request.getParameter("startDate");
        String ed = request.getParameter("endDate");

        if (supplierIdStr == null || sd == null || ed == null) {
            request.setAttribute("error", "Thiếu thông tin lọc dữ liệu!");
            RequestDispatcher rd = request.getRequestDispatcher(request.getContextPath() + "/view/staff/SupplierDetailView.jsp");
            rd.forward(request, response);
            return;
        }

        try {
            int supplierId = Integer.parseInt(supplierIdStr);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date startDate = sdf.parse(sd);
            Date endDate = sdf.parse(ed);

            ArrayList<PurchaseOrder> listOrders = purchaseOrderDAO.getPurchaseOrderStat(supplierId, startDate, endDate);

            session.setAttribute("listPurchaseOrder", listOrders);
            session.setAttribute("supplierId", supplierId);
            session.setAttribute("supplierName", listOrders.isEmpty() ? "" : listOrders.get(0).getSupplier().getName());
            session.setAttribute("startDate", sd);
            session.setAttribute("endDate", ed);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Không thể tải dữ liệu đơn hàng!");
        }

        RequestDispatcher rd = request.getRequestDispatcher("/view/staff/SupplierDetailView.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
