package servlet;

import dao.AppointmentDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Appointment;
import model.Customer;
import model.Member;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/createAppointment")
public class AppointmentServlet extends HttpServlet {
    private AppointmentDAO appointmentDAO;

    public AppointmentServlet() {
        appointmentDAO = new AppointmentDAO();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // lay du lieu tu form
            String dateStr = req.getParameter("datetime");
            String note = req.getParameter("note");

            Member member = (Member) req.getSession().getAttribute("customer");

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
            Date datetime = sdf.parse(dateStr);

            Customer c = new Customer();
            c.setId(member.getId());

            Appointment a = new Appointment();
            a.setDateTime(datetime);
            a.setStatus("PENDING");
            a.setNote(note);
            a.setCustomer(c);

            boolean success = appointmentDAO.createAppointment(a);

            if(success) {
                req.setAttribute("message", "Appointment created successfully!");
            } else {
                req.setAttribute("message", "Appointment creation failed!");
            }

            RequestDispatcher rd = req.getRequestDispatcher("/view/customer/CustomerHomeView.jsp");
            rd.forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("message", "Something went wrong!");
            req.getRequestDispatcher("/view/customer/CustomerHomeView.jsp").forward(req, resp);
        }
    }
}
