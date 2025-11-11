package servlet;

import dao.PurchaseOrderDAO;
import model.PurchaseOrder;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/PurchaseOrderDetailServlet")
public class PurchaseOrderDetailServlet extends HttpServlet {
    private PurchaseOrderDAO purchaseOrderDAO = new PurchaseOrderDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String poIdStr = request.getParameter("purchaseOrderId");
        if (poIdStr == null) {
            response.sendRedirect(request.getContextPath() + "/view/staff/SupplierStatView.jsp");
            return;
        }

        try {
            int purchaseOrderId = Integer.parseInt(poIdStr);
            // Lấy PurchaseOrder kèm items, supplier, staff
            PurchaseOrder po = purchaseOrderDAO.getPurchaseOrderById(purchaseOrderId);
            session.setAttribute("purchaseOrder", po);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(500, "Lỗi server khi tải chi tiết phiếu nhập.");
        }
        RequestDispatcher rd = request.getRequestDispatcher("/view/staff/PurchaseOrderView.jsp");
        rd.forward(request, response);
    }
}
