package dao;

import model.SupplierStat;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

public class SupplierDAO extends DAO {
    public SupplierDAO() {
        super();
    }

    public ArrayList<SupplierStat> getSupplierStat(Date startDate, Date endDate) throws SQLException, IOException {
        ArrayList<SupplierStat> supplierStats = new ArrayList<>();
        String sql = "SELECT s.id, s.name, s.address, s.contact, SUM(poi.quantity) AS import_total, SUM(poi.quantity * poi.price) AS import_value " +
                "FROM tblsupplier s " +
                "JOIN tblpurchaseorder po ON s.id = po.tblSupplierid " +
                "JOIN tblPurchaseOrderItem poi on poi.tblPurchaseOrderid = po.id " +
                "WHERE po.orderDate >= ? AND po.orderDate <= ? " +
                "GROUP BY s.id, s.name, s.address, s.contact " +
                "ORDER BY import_total DESC";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setDate(1, new java.sql.Date(startDate.getTime()));
            ps.setDate(2, new java.sql.Date(endDate.getTime()));
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                SupplierStat supplierStat = new SupplierStat();
                supplierStat.setId(rs.getInt("id"));
                supplierStat.setName(rs.getString("name"));
                supplierStat.setAddress(rs.getString("address"));
                supplierStat.setContact(rs.getString("contact"));
                supplierStat.setImportTotal(rs.getInt("import_total"));
                supplierStat.setImportValue(rs.getInt("import_value"));
                supplierStats.add(supplierStat);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return supplierStats;
    }
}
