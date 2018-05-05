/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package product.manager;

import product.manager.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Bartek
 */
@WebServlet(name = "AllProducts", value = "/all_products")
public class AllProducts extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //System.out.println("XXXXXXXXXXXXXXXXXx");
        //Logger.getLogger(AllProducts.class.getName()).log(Level.SEVERE, null, "XXXXXXXXXXXXxxx");
        request.setAttribute("AllProducts", ProductDAO.getAll());
        RequestDispatcher rd = request.getRequestDispatcher("AllProducts.jsp");
        rd.forward(request, response);
    }
    
    @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            processRequest(request, response);
        }

        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            processRequest(request, response);
        }

        @Override
        public String getServletInfo() {
            return "Short description";
        }
}
