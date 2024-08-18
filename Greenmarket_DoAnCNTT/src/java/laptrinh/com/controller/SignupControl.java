package laptrinh.com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import laptrinh.com.dao.UserDao;
import laptrinh.com.model.Users;
//import laptrinh.com.service.JavaMail;

@WebServlet(name = "SignupControl", urlPatterns = {"/signup"})
public class SignupControl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");
        String email = request.getParameter("email");
        String repass = request.getParameter("repass");

        if (!pass.equals(repass)) {
            request.setAttribute("message", "Mật khẩu chưa giống");
            request.setAttribute("user", user);
            request.setAttribute("pass", pass);
            request.setAttribute("email", email);
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } else {
            UserDao userDao = new UserDao();
            boolean a = userDao.CheckLoginExist(user);
            if (a == false) {
                Users u = new Users(user, pass, email, 0);
                userDao.insert(u);
                String subject = "Than chao quy khach";
                String text = "Xin chan thanh cam on quy khach da lua chon va tin dung san pham cua GreenMarket."
                        + "\nMoi thac mac hoac dong gop y kien vui long trao doi qua email nay"
                        + "\nThan chao!";
//                JavaMail.sendMail(email, subject, text);
                response.sendRedirect("HomeControl");
            } else {
                request.setAttribute("message", "Tài khoản đã tồn tại");
                request.setAttribute("user", user);
                request.setAttribute("pass", pass);
                request.setAttribute("email", email);
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
