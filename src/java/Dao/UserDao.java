package Dao;

import Dto.User;
import Connection.MyConn;
import java.sql.PreparedStatement;
import java.sql.*;
import java.util.ArrayList;

public class UserDao {
    public int addUser(User u){
        int i=0;
        try{
           Connection con = MyConn.getConnection();
           String query="insert into user(name,email,password,phone_no,status) values(?,?,?,?,?)";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setString(1,u.getName());
            ps.setString(2,u.getEmail());
            ps.setString(3,u.getPassword());
            ps.setString(4,u.getPhone_no());
            ps.setString(5,"true");
            
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
            
            String query="select * from user where email=? and password=? and status='true'";
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
    
    public ArrayList<User> getUser(){
        ArrayList<User> list=new ArrayList<>();
        Connection con=MyConn.getConnection();
        try{
            String query="select * from user";
            PreparedStatement ps=con.prepareStatement(query);
            
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                User u=new User();
                u.setUser_id(rs.getInt(1));
                u.setName(rs.getString(2));
                u.setEmail(rs.getString(4));
                u.setPhone_no(rs.getString(5));
                list.add(u);
            }
        }catch(SQLException e){
            System.out.println("Exception: "+e);
        }
        return list;
    }
    
    public User getUserDetails(String email)
    {
        User user=new User();
        try{
            Connection con=MyConn.getConnection();
            
            String query="select * from user where email=?";
            PreparedStatement ps=con.prepareStatement(query);
            
            ps.setString(1,email);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next())
            {
                user.setUser_id(rs.getInt(1));
                user.setName(rs.getString(2));
                user.setPassword(rs.getString(3));
                user.setEmail(rs.getString(4));
                user.setPhone_no(rs.getString(5));
            }
            
        }catch(SQLException e){
            System.out.println("Exception: "+ e);
        }
        
        return user;
    }
    
    public int updateUser(User user,String email){
        int i=0;
        try{
            Connection con=MyConn.getConnection();
            String query="update user set name=?,email=?,phone_no=? where email=?";
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setString(1,user.getName());
            ps.setString(2,user.getEmail());
            ps.setString(3,user.getPhone_no());
            
            ps.setString(4,email);
            
            i = ps.executeUpdate();
        
            con.close();
        }catch(SQLException e){
            System.out.println("Exception: "+e);
        }
        
        return i;
    }
    
    public int updatePass(User user,String email){
        int i=0;
        try{
            Connection con=MyConn.getConnection();
            String query="update user set password=? where email=?";
            
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setString(1,user.getPassword());
            
            ps.setString(2,email);
            
            i = ps.executeUpdate();
            con.close();
        
        }catch(SQLException e){
            System.out.println("Exception: "+e);
        }
        
        return i;
    }
    
    
}
