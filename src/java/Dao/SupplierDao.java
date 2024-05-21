package Dao;

import Connection.MyConn;
import Dto.*;
import Dao.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class SupplierDao {
    public int addSupp(Supplier s){
        int i=0;
        try{
           Connection con = MyConn.getConnection();
           String query="insert into supplier(supp_id,supp_name,password,supp_email,supp_phone,address,company,status) values(?,?,?,?,?,?,?,?)";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setString(1,s.getSupp_id());
            ps.setString(2,s.getSupp_name());
            ps.setString(3,s.getPassword());
            ps.setString(4,s.getSupp_email());
            ps.setString(5,s.getSupp_phone());
            ps.setString(6,s.getAddress());
            ps.setString(7,s.getCompany());
            ps.setString(8,"true");
            
            i = ps.executeUpdate();
            con.close();
            
        }catch(SQLException e){
            System.out.println("Exception: "+e);
        }
        return i;
    }
    
    public int searchSupp(String email,String password){
        int i=0;
        try{
            Connection con=MyConn.getConnection();
            
            String query="select * from supplier where supp_email=? and password=? and status='true'";
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
    
    public ArrayList<Supplier> getSupp(){
        ArrayList<Supplier> list=new ArrayList<>();
        Connection con=MyConn.getConnection();
        try{
            String query="select * from Supplier";
            PreparedStatement ps=con.prepareStatement(query);
            
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                Supplier s=new Supplier();
                s.setSupp_id(rs.getString(1));
                s.setSupp_name(rs.getString(2));
                s.setSupp_email(rs.getString(4));
                s.setSupp_phone(rs.getString(5));
                s.setAddress(rs.getString(6));
                s.setCompany(rs.getString(7));
                list.add(s);
            }
        }catch(SQLException e){
            System.out.println("Exception: "+e);
        }
        return list;
    }
    
    public Supplier getSuppDetails(String email)
    {
        Supplier s=new Supplier();
        try{
            Connection con=MyConn.getConnection();
            
            String query="select * from supplier where supp_email=?";
            PreparedStatement ps=con.prepareStatement(query);
            
            ps.setString(1,email);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next())
            {
                s.setSupp_id(rs.getString(1));
                s.setSupp_name(rs.getString(2));
                s.setPassword(rs.getString(3));
                s.setSupp_email(rs.getString(4));
                s.setSupp_phone(rs.getString(5));
                s.setAddress(rs.getString(6));
                s.setCompany(rs.getString(7));
            }
            
        }catch(SQLException e){
            System.out.println("Exception: "+ e);
        }
        
        return s;
    }
    
    public int updateSupp(Supplier s,String email){
        int i=0;
        try{
            Connection con=MyConn.getConnection();
            String query="update supplier set supp_id=?,supp_name=?,supp_email=?,supp_phone=?,company=?,address=? where supp_email=?";
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setString(1,s.getSupp_id());
            ps.setString(2,s.getSupp_name());
            ps.setString(3,s.getSupp_email());
            ps.setString(4,s.getSupp_phone());
            ps.setString(5,s.getCompany());
            ps.setString(6,s.getAddress());
            
            ps.setString(7,email);
            
            i = ps.executeUpdate();
        
            con.close();
        }catch(SQLException e){
            System.out.println("Exception: "+e);
        }
        
        return i;
    }
    
    public int updatePass(Supplier s,String email){
        int i=0;
        try{
            Connection con=MyConn.getConnection();
            String query="update supplier set password=? where supp_email=?";
            
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setString(1,s.getPassword());
            
            ps.setString(2,email);
            
            i = ps.executeUpdate();
            con.close();
        
        }catch(SQLException e){
            System.out.println("Exception: "+e);
        }
        
        return i;
    }
}
