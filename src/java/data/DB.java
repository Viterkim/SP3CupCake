
package data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.logging.Level;
import java.util.logging.Logger;


public class DB 
{
    private static String driver = "com.mysql.jdbc.Driver";
    private static String url = "jdbc:mysql://localhost/shop";
    private static String user = "admin";
    private static String password = "admin";
    
    public static Connection getConnection()
    {
        Connection con = null;
        try 
        {
            Class.forName(driver);
            con = DriverManager.getConnection(DB.url,DB.user,DB.password);
        } 
        catch (Exception ex)
        {
            ex.printStackTrace();
        }
        return con;
    }
    
}
