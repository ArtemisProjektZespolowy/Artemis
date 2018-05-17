/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package manager.product;

import manager.product.ProductDAO;
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
@WebServlet(name = "AddProduct", value = "/add_product")
public class AddProductServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        RequestDispatcher rd = request.getRequestDispatcher("addProduct.jsp");
        try {
            rd.forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(AddProductServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        
            
            String name = request.getParameter("name");
            String releaseDate = request.getParameter("releaseDate");
            String category = request.getParameter("category");
            String platform = request.getParameter("platform");            
            String priceString = request.getParameter("price");

            double price = Double.parseDouble(priceString);
            String publisher = request.getParameter("publisher");
            String description = request.getParameter("decription");
            String image = request.getParameter("image");
            
            ProductDAO.add(name, releaseDate, category, platform, price, publisher, description, image);
            response.sendRedirect("/Artemis/all_products");
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
