package Dto;

public class Orders {
    int ord_id,user_id;
    String user_add,status,pay_meth,ord_date,ord_time;
    double t_price;

    public String getOrd_time() {
        return ord_time;
    }

    public void setOrd_time(String ord_time) {
        this.ord_time = ord_time;
    }
    

    public int getOrd_id() {
        return ord_id;
    }

    public void setOrd_id(int ord_id) {
        this.ord_id = ord_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getUser_add() {
        return user_add;
    }

    public void setUser_add(String user_add) {
        this.user_add = user_add;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPay_meth() {
        return pay_meth;
    }

    public void setPay_meth(String pay_meth) {
        this.pay_meth = pay_meth;
    }

    public String getOrd_date() {
        return ord_date;
    }

    public void setOrd_date(String ord_date) {
        this.ord_date = ord_date;
    }

    public double getT_price() {
        return t_price;
    }

    public void setT_price(double t_price) {
        this.t_price = t_price;
    }
    
    
}
