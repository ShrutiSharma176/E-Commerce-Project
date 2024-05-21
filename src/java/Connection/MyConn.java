package Connection;

import java.sql.*;
public class MyConn {
    public static Connection getConnection(){
        Connection con=null;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce","root","root");
            
            if(con==null)
                System.out.println("Error in establishing connection");
            else
                System.out.println("Connetion established");
            
        }catch(ClassNotFoundException | SQLException e){
            System.out.println("Exception: "+e);
        }
        return con;
    }
}
 
