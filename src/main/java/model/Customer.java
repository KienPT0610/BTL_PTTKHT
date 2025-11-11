package model;

public class Customer extends Member {
    private String note;
    public Customer() {
        super();
    }
    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
}
