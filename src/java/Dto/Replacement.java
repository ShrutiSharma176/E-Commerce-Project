package Dto;

public class Replacement {
    int rep_id,ord_id,pay_id;
    String time,rep_date,status;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    double rep_per;

    public int getRep_id() {
        return rep_id;
    }

    public void setRep_id(int rep_id) {
        this.rep_id = rep_id;
    }

    public int getOrd_id() {
        return ord_id;
    }

    public void setOrd_id(int ord_id) {
        this.ord_id = ord_id;
    }

    public int getPay_id() {
        return pay_id;
    }

    public void setPay_id(int pay_id) {
        this.pay_id = pay_id;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getRep_date() {
        return rep_date;
    }

    public void setRep_date(String rep_date) {
        this.rep_date = rep_date;
    }

    public double getRep_per() {
        return rep_per;
    }

    public void setRep_per(double rep_per) {
        this.rep_per = rep_per;
    }
 
}
