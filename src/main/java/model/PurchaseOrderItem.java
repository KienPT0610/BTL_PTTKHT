package model;

public class PurchaseOrderItem {
    private int id;
    private float price;
    private int quantity;
    private SparePart sparePart;

    public PurchaseOrderItem() {
    }

    public PurchaseOrderItem(int id, float price, int quantity, SparePart sparePart) {
        this.id = id;
        this.price = price;
        this.quantity = quantity;
        this.sparePart = sparePart;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public SparePart getSparePart() {
        return sparePart;
    }

    public void setSparePart(SparePart sparePart) {
        this.sparePart = sparePart;
    }
}
