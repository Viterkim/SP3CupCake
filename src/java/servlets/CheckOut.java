
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "CheckOut", urlPatterns = {"/CheckOut"})
public class CheckOut extends HttpServlet 
{

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) 
        {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            int lortelort = 85;
            out.println("<title>Receipt #" + lortelort + "</title>");            
            out.println("</head>");
            out.println("<body>");
            HttpSession ses = request.getSession();
            out.println("<h1>Flotteste Receipt Eu (Det er sidste gang vi bruger JS hvis backend er vigtigt :(</h1>");
            out.println("<img  src = \"http://i.imgur.com/2DJiwLT.png\"/></br>");
            out.println("<img  src = \"https://wallpaperscraft.com/image/dolphin_smiling_water_pool_93437_3840x2400.jpg\" width=\"1000\" heigth=\"1000\"/>");
            out.println("</body>");
            out.println("</html>");
        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        processRequest(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        
        processRequest(request, response);
    }


}
