package laptrinh.com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import laptrinh.com.dao.ProductDao;
import laptrinh.com.model.Product;

@WebServlet(name = "LoadMoreControl", urlPatterns = {"/load"})
public class LoadMoreControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        ProductDao productDao = new ProductDao();
        int amount = Integer.parseInt(request.getParameter("amount"));
        List<Product> listProducts = productDao.getNext12(amount);
        listProducts.forEach(p -> {
            out.println(" <div class=\"col-12 col-md-6 col-lg-4\">\n"
                    + "                                <div class=\"card\">\n"
                    + "                                    <img class=\"card-img-top\"\n"
                    + "                                         src=\"images/" + p.getImage() + "\">\n"
                    + "                                    <div class=\"card-body\">\n"
                    + "                                        <h4 class=\"card-title show_txt\">" + p.getName() + "</h4>\n"
                    + "                                        <p class=\"card-text show_txt\">" + p.getPrice() + "</p>\n"
                    + "                                        <div class=\"row\">\n"
                    + "                                            <div class=\"col\">\n"
                    + "                                                <a href=\"detail?productid=" + p.getProductid() + "\" class=\"btn detail btn-danger btn-block\">Chi tiết</a>\n"
                    + "                                            </div>\n"
                    + "                                            <div class=\"col\">\n"
                    + "                                                <a href=\"cart.jsp\" class=\"btn btn-success btn-block\">Thêm vào giỏ hàng</a>\n"
                    + "                                            </div>\n"
                    + "                                        </div>\n"
                    + "                                    </div>\n"
                    + "                                </div>\n"
                    + "                            </div>");
        });
}

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
/**
 * Handles the HTTP <code>GET</code> method.
 *
 * @param request servlet request
 * @param response servlet response
 * @throws ServletException if a servlet-specific error occurs
 * @throws IOException if an I/O error occurs
 */
@Override

        protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(LoadMoreControl

.class  


.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(LoadMoreControl

.class  


.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
        public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
