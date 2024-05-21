package Dao;

import Connection.MyConn;
import Dto.*;
import java.sql.*;
import java.util.ArrayList;

public class CartDao {
    public int addtoCart(Cart c){
        int i=0;
        try{
           Connection con = MyConn.getConnection();
           String query="insert into cart(prod_id,user_id,price) values(?,?,?)";
            PreparedStatement ps=con.prepareStatement(query);
            
            ps.setInt(1,c.getProd_id());
            ps.setInt(2,c.getUser_id());
            ps.setDouble(3,c.getPrice());
           // ps.setInt(4,c.getQuantity());
            
            i = ps.executeUpdate();
            con.close();
            
        }catch(SQLException e){
            System.out.println("Exception: "+e);
        }
        return i;
    }
    
    public int countProd(int user_id){
        int count=0;
        try{
           Connection con = MyConn.getConnection();
           String query="select * from cart where user_id=?";
            PreparedStatement ps=con.prepareStatement(query);
            
            ps.setInt(1,user_id);
            
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                count++;
            }
            con.close();
            
        }catch(SQLException e){
            System.out.println("Exception: "+e);
        }
        return count;
    }
    
    public ArrayList<Product> getProd(int user_id){
        ArrayList<Product> list = new ArrayList<>();
        Connection con = MyConn.getConnection();
        try {
            String query = " select * from product,cart where product.prod_id=cart.prod_id and user_id=?";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1,user_id);
            
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p=new Product();
                p.setProd_id(rs.getInt(1));
                p.setProd_name(rs.getString(2));
                p.setCat_id(rs.getString(3));
                p.setStock(rs.getInt(4));
                p.setPrice(rs.getDouble(5));
                p.setSupp_id(rs.getString(6));
                p.setP_desc(rs.getString(7));
                p.setP_img(rs.getString(8));

                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println("Exception: " + e);
        }
        return list;
    }
    
    public int deleteProd(int prod_id){
        int i=0;
        try{
           Connection con = MyConn.getConnection();
           String query="delete from cart where prod_id=?";
            PreparedStatement ps=con.prepareStatement(query);
            
            ps.setInt(1,prod_id);
            
            i = ps.executeUpdate();
            con.close();
            
        }catch(SQLException e){
            System.out.println("Exception: "+e);
        }
        return i;
    }
    
    public int deleteCart(int user_id){
        int i=0;
        try{
           Connection con = MyConn.getConnection();
           String query="delete from cart where user_id=?";
            PreparedStatement ps=con.prepareStatement(query);
            
            ps.setInt(1,user_id);
            
            i = ps.executeUpdate();
            con.close();
            
        }catch(SQLException e){
            System.out.println("Exception: "+e);
        }
        return i;
    }

}
