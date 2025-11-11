package model;

import java.util.ArrayList;
import java.util.Date;

public class PurchaseOrder {
    private int id;
    private String code;
    private Date orderDate;
    private int totalQuantity;
    private float totalAmount;
    private String note;
    private WarehouseStaff warehouseStaff;
    private Supplier supplier;
    private ArrayList<PurchaseOrderItem> purchaseOrderItems;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public int getTotalQuantity() {
        return totalQuantity;
    }

    public void setTotalQuantity(int totalQuantity) {
        this.totalQuantity = totalQuantity;
    }

    public float getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(float totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public WarehouseStaff getWarehouseStaff() {
        return warehouseStaff;
    }

    public void setWarehouseStaff(WarehouseStaff warehouseStaff) {
        this.warehouseStaff = warehouseStaff;
    }

    public Supplier getSupplier() {
        return supplier;
    }

    public void setSupplier(Supplier supplier) {
        this.supplier = supplier;
    }

    public ArrayList<PurchaseOrderItem> getPurchaseOrderItems() {
        return purchaseOrderItems;
    }

    public void setPurchaseOrderItems(ArrayList<PurchaseOrderItem> purchaseOrderItems) {
        this.purchaseOrderItems = purchaseOrderItems;
    }
}
