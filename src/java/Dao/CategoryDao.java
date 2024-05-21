package Dao;

import Connection.MyConn;
import Dto.*;
import Dao.*;
import java.sql.*;
import java.util.*;

public class CategoryDao {
    public int addCategory(Category c){
        int i=0;
        try{
           Connection con = MyConn.getConnection();
           String query="insert into category(cat_id,cat_name,gst) values(?,?,?)";
           PreparedStatement ps=con.prepareStatement(query);
           
           ps.setString(1,c.getCat_id());
           ps.setString(2,c.getCat_name());
           ps.setDouble(3,c.getGst());
            
            i = ps.executeUpdate();
            con.close();
            
        }catch(SQLException e){
            System.out.println("Exception: "+e);
        }
        return i;
    }
    
    public int searchUser(String email,String password){
        int i=0;
        try{
            Connection con=MyConn.getConnection();
            
            String query="select * from user where email=? and password=?";
            PreparedStatement ps=con.prepareStatement(query);
            
            ps.setString(1,email);
            ps.setString(2,password);
            
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                i++;
            }
            
        }catch(SQLException e){
            System.out.println("Exception: "+e);
        }
        return i;
    }
    
    public ArrayList<Category> getCategory(){
        ArrayList<Category> list=new ArrayList<>();
        Connection con=MyConn.getConnection();
        try{
            String query="select * from category";
            PreparedStatement ps=con.prepareStatement(query);
            
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                Category c=new Category();
                c.setCat_id(rs.getString(1));
                c.setCat_name(rs.getString(2));
                c.setGst(rs.getDouble(3));
                
                list.add(c);
            }
        }catch(SQLException e){
            System.out.println("Exception: "+e);
        }
        return list;
    }
    
}
