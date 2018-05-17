/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package manager.account;

import manager.account.AccountDAO;
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
@WebServlet(name = "EditAccount", value = "/edit_account")
public class EditAccount extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String idTemp = request.getParameter("id");
        int id = Integer.parseInt(idTemp);
        request.setAttribute("getAccountById", AccountDAO.getAccountById(id));
        RequestDispatcher rd = request.getRequestDispatcher("editAccount.jsp");
        try {
            rd.forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(EditAccount.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        
         String idTemp = request.getParameter("id");
            int id = Integer.parseInt(idTemp);
            
            String name = request.getParameter("name");
            String surname = request.getParameter("surname");
            String phone = request.getParameter("phone");
            String code = request.getParameter("code"); 
            String town = request.getParameter("town");
            String number = request.getParameter("number");
            String street = request.getParameter("street");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String registrationDate = request.getParameter("registrationDate");
                        
            String permissionIdString = request.getParameter("permissionId");
            int permissionId = Integer.parseInt(permissionIdString);
            
            
            AccountDAO.edit(id, name, surname, phone, code, town, number, street, email, password, registrationDate, permissionId);
            response.sendRedirect("/Artemis/all_accounts");
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
