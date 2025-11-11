package model;

import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;

public class SupplierStat extends Supplier {
    private int importTotal;
    private float importValue;
    public int getImportTotal() {
        return importTotal;
    }
    public void setImportTotal(int importTotal) {
        this.importTotal = importTotal;
    }

    public float getImportValue() {
        return importValue;
    }

    public void setImportValue(float importValue) {
        this.importValue = importValue;
    }

    private String formatValueToVND(float value) {
        DecimalFormatSymbols symbols = new DecimalFormatSymbols();
        symbols.setGroupingSeparator('.'); // for mat hang ngin
        symbols.setDecimalSeparator(','); // format hang thap phan

        DecimalFormat df =  new DecimalFormat("#,##0.00", symbols);
        return df.format(value);
    }

    public String getFormatValueToVND() {
        return formatValueToVND(importValue);
    }
}
