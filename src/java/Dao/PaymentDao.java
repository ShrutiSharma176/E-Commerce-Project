package Dao;

import Connection.MyConn;
import Dto.*;
import java.sql.*;

public class PaymentDao {
    public int addPay(int ord_id) {
        int i = 0;
        try {
            Connection con = MyConn.getConnection();
            String query = "insert into payment(ord_id,status) values(?,'payment-done')";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1,ord_id );

            i = ps.executeUpdate();
            con.close();

        } catch (SQLException e) {
            System.out.println("Exception: " + e);
        }
        return i;
    }
    
    public Payment getPay(int ord_id) {
        Payment pay=new Payment();
        try {
            Connection con = MyConn.getConnection();

            String query = "select * from payment where ord_id=?";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, ord_id);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                pay.setPay_id(rs.getInt(1));
                pay.setStatus(rs.getString(3));
            }
        }catch(SQLException e){
            System.out.println("Exception: "+ e);
        }

            return pay;
        }
}
