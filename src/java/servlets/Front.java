
package servlets;

import data.DB;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "Front", urlPatterns = {"/Front"})
public class Front extends HttpServlet 
{


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        //Check if account exists
        try
        {
        String sql = "SELECT * FROM user WHERE Username = ? AND Password = ?";
        
        Connection con = DB.getConnection();
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, username);
        stmt.setString(2, password);
        stmt.executeQuery();
        ResultSet rs = stmt.getResultSet();
        if(rs.next())
        {
            HttpSession session = request.getSession();
            session.setAttribute("sessionusername", username);
            session.setAttribute("sessionbalance", rs.getString("Balance"));
            //request.setAttribute("password", password);
            request.getRequestDispatcher("shop.jsp").forward(request, response);
        }
        }
        catch(Exception ex)
        {
            response.sendRedirect("shop.jsp");
            ex.printStackTrace();
        }
        
        
        
    }

}
