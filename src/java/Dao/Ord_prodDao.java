package Dao;

import Connection.MyConn;
import Dto.*;
import java.sql.*;
import java.util.ArrayList;

public class Ord_prodDao {
    public int addOrd_prod(Ord_prod o){
        int i=0;
        try{
           Connection con = MyConn.getConnection();
           String query="insert into ord_prod(ord_id,prod_name,quantity,price) values(?,?,?,?)";
            PreparedStatement ps=con.prepareStatement(query);
            
            ps.setInt(1,o.getOrd_id());
            ps.setString(2,o.getProd_name());
            ps.setInt(3,o.getQuantity());
            ps.setDouble(4,o.getPrice());
            
            i = ps.executeUpdate();
            con.close();
            
        }catch(SQLException e){
            System.out.println("Exception: "+e);
        }
        return i;
    }
    public ArrayList<Ord_prod> getOrd_prods(int ord_id) {
        ArrayList<Ord_prod> list = new ArrayList<>();
        
        try {
            Connection con = MyConn.getConnection();
            String query = "select * from ord_prod where ord_id=?";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1,ord_id);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Ord_prod o = new Ord_prod();
                o.setOrd_id(rs.getInt(1));
                o.setProd_name(rs.getString(2));
                o.setQuantity(rs.getInt(3));
                o.setPrice(rs.getDouble(4));

                list.add(o);
            }
        } catch (SQLException e) {
            System.out.println("Exception: " + e);
        }
        return list;
    }
}
