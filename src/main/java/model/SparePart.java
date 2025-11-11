package model;

public class SparePart {
    private int id;
    private String code;
    private String name;
    private float stockQty;
    private float unitPrice;

    public SparePart() {
    }

    public SparePart(int id, String code, String name, float stockQty, float unitPrice) {
        this.id = id;
        this.code = code;
        this.name = name;
        this.stockQty = stockQty;
        this.unitPrice = unitPrice;
    }

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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getStockQty() {
        return stockQty;
    }

    public void setStockQty(float stockQty) {
        this.stockQty = stockQty;
    }

    public float getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(float unitPrice) {
        this.unitPrice = unitPrice;
    }
}
