package Dao;

import Connection.MyConn;
import Dto.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class OrdersDao {

    public int addOrders(Orders o) {
        int i = 0;
        try {
            Connection con = MyConn.getConnection();
            String query = "insert into orders(user_id,t_price,ord_date,pay_meth,user_add,status,ord_time) values(?,?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, o.getUser_id());
            ps.setDouble(2, o.getT_price());
            ps.setString(3, o.getOrd_date());
            ps.setString(4, o.getPay_meth());
            ps.setString(5, o.getUser_add());
            ps.setString(6, o.getStatus());
            ps.setString(7, o.getOrd_time());

            i = ps.executeUpdate();
            con.close();

        } catch (SQLException e) {
            System.out.println("Exception: " + e);
        }
        return i;
    }

    public Orders getOrdDetails(int user_id, String date, String time) {
        Orders ord = new Orders();
        try {
            Connection con = MyConn.getConnection();

            String query = "select * from orders where user_id=? and ord_date=? and ord_time=?";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, user_id);
            ps.setString(2, date);
            ps.setString(3, time);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ord.setOrd_id(rs.getInt(1));

            }
        } catch (SQLException e) {
            System.out.println("Exception: " + e);
        }

        return ord;
    }

    public Orders getOrdDetail(int ord_id) {
        Orders ord = new Orders();
        try {
            Connection con = MyConn.getConnection();

            String query = "select * from orders where ord_id=?";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, ord_id);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ord.setOrd_id(rs.getInt(1));
                ord.setUser_id(rs.getInt(2));
                ord.setT_price(rs.getDouble(3));
                ord.setOrd_date(rs.getString(4));
                ord.setPay_meth(rs.getString(5));
                ord.setUser_add(rs.getString(6));
                ord.setStatus(rs.getString(7));
                ord.setOrd_time(rs.getString(8));
            }
        } catch (SQLException e) {
            System.out.println("Exception: " + e);
        }

        return ord;
    }

    public ArrayList<Orders> getOrdDetails(int user_id) {
        ArrayList<Orders> a = new ArrayList<>();

        try {
            Connection con = MyConn.getConnection();

            String query = "select * from orders where user_id=?";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, user_id);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Orders ord = new Orders();
                ord.setOrd_id(rs.getInt(1));
                ord.setUser_id(rs.getInt(2));
                ord.setT_price(rs.getDouble(3));
                ord.setOrd_date(rs.getString(4));
                ord.setPay_meth(rs.getString(5));
                ord.setUser_add(rs.getString(6));
                ord.setStatus(rs.getString(7));
                ord.setOrd_time(rs.getString(8));

                a.add(ord);
            }
        } catch (SQLException e) {
            System.out.println("Exception: " + e);
        }

        return a;
    }

    public ArrayList<Orders> getOrdDetails() {
        ArrayList<Orders> a = new ArrayList<>();

        try {
            Connection con = MyConn.getConnection();

            String query = "select * from orders";
            PreparedStatement ps = con.prepareStatement(query);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Orders ord = new Orders();
                ord.setOrd_id(rs.getInt(1));
                ord.setUser_id(rs.getInt(2));
                ord.setT_price(rs.getDouble(3));
                ord.setOrd_date(rs.getString(4));
                ord.setPay_meth(rs.getString(5));
                ord.setUser_add(rs.getString(6));
                ord.setStatus(rs.getString(7));
                ord.setOrd_time(rs.getString(8));

                a.add(ord);
            }
        } catch (SQLException e) {
            System.out.println("Exception: " + e);
        }

        return a;
    }

    public int cancelOrd(int ord_id) {
        int i = 0;
        try {
            Connection con = MyConn.getConnection();

            String query = "update orders set status='canceled' where ord_id=? and status<>'canceled'";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, ord_id);

            i = ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Exception: " + e);
        }

        return i;
    }
    
    public int changeStatus(int ord_id,String status) {
        int i = 0;
        try {
            Connection con = MyConn.getConnection();

            String query = "update orders set status=? where ord_id=?";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, status);
            ps.setInt(2, ord_id);

            i = ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Exception: " + e);
        }

        return i;
    }
}
