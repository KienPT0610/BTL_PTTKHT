package servlet;

import dao.SupplierDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.SupplierStat;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

@WebServlet("/SupplierServlet")
public class SupplierServlet extends HttpServlet {
    public SupplierDAO supplierDAO;

    public SupplierServlet() {
        supplierDAO = new SupplierDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sd = request.getParameter("startDate");
        String ed = request.getParameter("endDate");
        try {
            if (sd != null && ed != null && !sd.isEmpty() && !ed.isEmpty()) {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                Date startDate = sdf.parse(sd);
                Date endDate = sdf.parse(ed);

                if(startDate.after(endDate)){
                    request.setAttribute("error", "Thời gian bắt đầu phải nhỏ hơn thời gian kết thúc!");
                } else {
                    ArrayList<SupplierStat> list = supplierDAO.getSupplierStat(startDate, endDate);
                    System.out.println("Sp: " + list.size());

                    HttpSession session = request.getSession();
                    session.setAttribute("startDate", sd);
                    session.setAttribute("endDate", ed);
                    if (list.isEmpty()) {
                        session.removeAttribute("supplierStat");
                    } else {
                        session.setAttribute("supplierStat", list);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        RequestDispatcher rd = request.getRequestDispatcher("/view/staff/SupplierStatView.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
