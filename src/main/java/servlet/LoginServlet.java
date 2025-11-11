package servlet;

import dao.MemberDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Member;

import java.io.IOException;
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private MemberDAO memberDAO;
    public LoginServlet() {
        memberDAO = new MemberDAO();
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        Member member = new Member();
        member.setUsername(username);
        member.setPassword(password);

        boolean result = memberDAO.checkLogin(member);
        if (result && (member.getRole().equalsIgnoreCase("customer"))) {
            HttpSession session = req.getSession();
            session.setAttribute("customer", member);
            resp.sendRedirect(req.getContextPath() + "/view/customer/CustomerHomeView.jsp");
        } else if (result && (member.getRole().equalsIgnoreCase("manager"))) {
            HttpSession session = req.getSession();
            session.setAttribute("manager", member);
            resp.sendRedirect(req.getContextPath() + "/view/staff/ManagerHomeView.jsp");
        } else {
            req.setAttribute("error", "Tên đăng nhập hoặc mật khẩu không đúng!");
            RequestDispatcher rd = req.getRequestDispatcher("/view/member/LoginView.jsp");
            rd.forward(req, resp);
        }
    }
}