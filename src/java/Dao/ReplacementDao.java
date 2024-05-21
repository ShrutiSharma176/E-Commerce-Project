package Dao;

import Connection.MyConn;
import Dto.*;
import java.sql.*;
import java.util.ArrayList;

public class ReplacementDao {
    public int addReplacement(Replacement r) {
        int i = 0;
        try {
            Connection con = MyConn.getConnection();
            String query = "insert into replacement(ord_id,pay_id,time,rep_date,rep_per,status) values(?,?,?,?,0.5,'true')";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, r.getOrd_id() );
            ps.setInt(2, r.getPay_id());
            ps.setString(3, r.getTime());
            ps.setString(4, r.getRep_date());

            i = ps.executeUpdate();
            con.close();

        } catch (SQLException e) {
            System.out.println("Exception: " + e);
        }
        return i;
    }
    
    public ArrayList<Replacement> getReplacement() {
        ArrayList<Replacement> list = new ArrayList<>();
        Connection con = MyConn.getConnection();
        try {
            String query = "select * from replacement";
            PreparedStatement ps = con.prepareStatement(query);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Replacement r=new Replacement();
                r.setRep_id(rs.getInt(1));
                r.setOrd_id(rs.getInt(2));
                r.setPay_id(rs.getInt(3));
                r.setTime(rs.getString(4));
                r.setRep_date(rs.getString(5));
                r.setRep_per(rs.getDouble(6));
                r.setStatus(rs.getString(7));
               
                list.add(r);
            }
        } catch (SQLException e) {
            System.out.println("Exception: " + e);
        }
        return list;
    }
}
