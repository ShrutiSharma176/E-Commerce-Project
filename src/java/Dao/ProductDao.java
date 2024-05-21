package Dao;

import Connection.MyConn;
import Dto.*;
import Dao.*;
import java.sql.*;
import java.util.*;

public class ProductDao {

    public int addProduct(Product p) {
        int i = 0;
        try {
            Connection con = MyConn.getConnection();
            String query = "insert into product(prod_name,cat_id,stock,price,supp_id,p_desc,p_img,status) values(?,?,?,?,?,?,?,'true')";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, p.getProd_name());
            ps.setString(2, p.getCat_id());
            ps.setInt(3, p.getStock());
            ps.setDouble(4, p.getPrice());
            ps.setString(5, p.getSupp_id());
            ps.setString(6, p.getP_desc());
            ps.setString(7, p.getP_img());

            i = ps.executeUpdate();
            con.close();

        } catch (SQLException e) {
            System.out.println("Exception: " + e);
        }
        return i;
    }

    public ArrayList<Product> searchProduct(String email) {
        ArrayList<Product> list = new ArrayList<>();
        Connection con = MyConn.getConnection();
        try {
            String query = "select * from product,supplier where supp_email=? and product.supp_id=supplier.supp_id and product.status='true';";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
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

    public ArrayList<Product> getProduct() {
        ArrayList<Product> list = new ArrayList<>();
        Connection con = MyConn.getConnection();
        try {
            String query = "select * from product where status='true'";
            PreparedStatement ps = con.prepareStatement(query);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
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

    public int deleteProduct(String prod_id) {
        int i = 0;
        Connection con = MyConn.getConnection();
        try {
            String query = "update product set status='false' where prod_id=?;";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, prod_id);

            i = ps.executeUpdate();
            con.close();
        } catch (SQLException e) {
            System.out.println("Exception: " + e);
        }
        return i;
    }

    public Product getProdDetails(int prod_id) {
        Product prod = new Product();
        try {
            Connection con = MyConn.getConnection();

            String query = "select * from product where prod_id=?";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, prod_id);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                prod.setProd_id(rs.getInt(1));
                prod.setProd_name(rs.getString(2));
                prod.setCat_id(rs.getString(3));
                prod.setStock(rs.getInt(4));
                prod.setPrice(rs.getDouble(5));
                prod.setSupp_id(rs.getString(6));
                prod.setP_desc(rs.getString(7));
                prod.setP_img(rs.getString(8));
            }
        }catch(SQLException e){
            System.out.println("Exception: "+ e);
        }

            return prod;
        }
    
    public ArrayList<Product> getProdDetailsByCat (String cat_id) {
        ArrayList<Product> list = new ArrayList<>();
        try {
            Connection con = MyConn.getConnection();

            String query = "select * from product where cat_id=?";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, cat_id);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product prod = new Product();
                
                prod.setProd_id(rs.getInt(1));
                prod.setProd_name(rs.getString(2));
                prod.setCat_id(rs.getString(3));
                prod.setStock(rs.getInt(4));
                prod.setPrice(rs.getDouble(5));
                prod.setSupp_id(rs.getString(6));
                prod.setP_desc(rs.getString(7));
                prod.setP_img(rs.getString(8));
                
                list.add(prod);
            }
        }catch(SQLException e){
            System.out.println("Exception: "+ e);
        }
System.out.println(list);
            return list;
        }
    
    public int updateProduct(Product p){
        int i=0;
        System.out.println(p.getProd_name()+"\n"+p.getP_desc());
        try{
            Connection con=MyConn.getConnection();
            String query="update product set prod_name=?,cat_id=?,stock=?,price=?,supp_id=?,p_desc=? where prod_id=?";
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setString(1,p.getProd_name());
            ps.setString(2,p.getCat_id());
            ps.setInt(3,p.getStock());
            ps.setDouble(4,p.getPrice());
            ps.setString(5,p.getSupp_id());
            ps.setString(6,p.getP_desc());
            
            ps.setInt(7,p.getProd_id());
            
            i = ps.executeUpdate();
        
            con.close();
        }catch(SQLException e){
            System.out.println("Exception: "+e);
        }
        
        return i;
    }
}
