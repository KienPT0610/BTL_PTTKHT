package model;

import java.util.Date;

public class Appointment {
    private int id;
    private Date dateTime;
    private String status;
    private String note;
    private Customer customer;
    public Appointment() {}
    public Appointment(int id, Date dateTime, String status, String note, Customer customer) {
        this.id = id;
        this.dateTime = dateTime;
        this.status = status;
        this.note = note;
        this.customer = customer;
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public Date getDateTime() {
        return dateTime;
    }
    public void setDateTime(Date dateTime) {
        this.dateTime = dateTime;
    }
    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
    public String getNote() {
        return note;
    }
    public void setNote(String note) {
        this.note = note;
    }
    public Customer getCustomer() {
        return customer;
    }
    public void setCustomer(Customer customer) {
        this.customer = customer;
    }
}
