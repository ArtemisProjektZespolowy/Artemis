/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package system.logowania;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Iluvris
 */
@WebServlet(name = "LogoutServlet", urlPatterns = {"/logout"})

public class LogoutServlet extends HttpServlet {
private static final String PAGE = "logoutSuccess.jsp";
    private static final long serialVersionUID = 1L;


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     request.setCharacterEncoding("UTF-8");
     response.setCharacterEncoding("UTF-8");
        
        
        HttpSession session = request.getSession(false); //Fetch session object

        if (session != null) //If session is not null
        {
            session.invalidate(); //removes all session attributes bound to the session
//            request.setAttribute("errMessage", "You have logged out successfully");
//            RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
//            requestDispatcher.forward(request, response);
            
            request.getRequestDispatcher(PAGE).include(request, response);
        }
    }
}
