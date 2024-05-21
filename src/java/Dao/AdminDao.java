package Dao;

import Connection.MyConn;
import Dto.*;
import Dao.*;
import java.sql.*;

public class AdminDao {
    public int searchAdmin(String email,String password){
        int i=0;
        try{
            Connection con=MyConn.getConnection();
            
            String query="select * from admin where email=? and password=?";
            PreparedStatement ps=con.prepareStatement(query);
            
            ps.setString(1,email);
            ps.setString(2,password);
            
            ResultSet rs=ps.executeQuery();
            if(rs.next())
                i++;
            
        }catch(SQLException e){
            System.out.println("Exception: "+e);
        }
        return i;
       }
    
    public Admin getAdDetails(String email)
    {
        Admin a=new Admin();
        try{
            Connection con=MyConn.getConnection();
            
            String query="select * from admin where email=?";
            PreparedStatement ps=con.prepareStatement(query);
            
            ps.setString(1,email);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next())
            {
                a.setUsername(rs.getString(1));
                a.setPassword(rs.getString(2));
            }
            
        }catch(SQLException e){
            System.out.println("Exception: "+ e);
        }
        
        return a;
    }
    
    public int updatePass(Admin a,String email){
        int i=0;
        try{
            Connection con=MyConn.getConnection();
            String query="update admin set password=? where email=?";
            
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setString(1,a.getPassword());
            
            ps.setString(2,email);
            
            i = ps.executeUpdate();
            con.close();
        
        }catch(SQLException e){
            System.out.println("Exception: "+e);
        }
        
        return i;
    }
    
    public int blockUser(String email){
        int i=0;
        try{
            Connection con=MyConn.getConnection();
            String query="update user set status='flase' where email=?";
            
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setString(1,email);
            
            i = ps.executeUpdate();
            con.close();
        
        }catch(SQLException e){
            System.out.println("Exception: "+e);
        }
        
        return i;
    }
    
    public int blockSupp(String email){
        int i=0;
        try{
            Connection con=MyConn.getConnection();
            String query="update supplier set status='flase' where supp_email=?";
            
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setString(1,email);
            
            i = ps.executeUpdate();
            con.close();
        
        }catch(SQLException e){
            System.out.println("Exception: "+e);
        }
        
        return i;
    }
}
