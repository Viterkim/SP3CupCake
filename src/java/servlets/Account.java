/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import data.DB;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ViktorKim
 */
@WebServlet(name = "Account", urlPatterns = {"/Account"})
public class Account extends HttpServlet 
{

//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException 
//    {
//        ArrayList<User> users = new ArrayList();
//        try
//        {
//            ResultSet rs = DB.getConnection().prepareStatement("SELECT * FROM user").executeQuery();
//            while (rs.next())
//            {
//                int id = rs.getInt(1);
//                String username = rs.getString(2);
//                String password = rs.getString(3);
//                users.add(new User(id, username, password));
//            }
//        }
//        catch(Exception ex)
//        {
//            ex.printStackTrace();
//        }
//        request.getSession().setAttribute("users", users);
//        response.sendRedirect("shop.jsp");
//    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        PrintWriter pw = response.getWriter();
        try
        {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            
            String sql = "INSERT INTO user (Username, Password) VALUES (?, ?)";
            Connection con = DB.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);
            stmt.executeUpdate();
            request.setAttribute("username", username);
            HttpSession session = request.getSession();
            session.setAttribute("sessionusername", username);
            request.setAttribute("password", password);
            request.getRequestDispatcher("shop.jsp").forward(request, response);
        }
        catch(Exception ex)
        {
            response.sendRedirect("createacc.jsp");
            ex.printStackTrace();
        }
    }
    


}
