package dao;

import model.*;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

public class PurchaseOrderDAO extends DAO {
    public PurchaseOrderDAO() {
        super();
    }

    public ArrayList<PurchaseOrder> getPurchaseOrderStat(int supplierId, Date startDate, Date endDate) throws SQLException {
        ArrayList<PurchaseOrder> purchaseOrders = new ArrayList<>();
        String sql =
                "SELECT s.name AS supplierName, po.id AS purchaseOrderId, po.orderDate, " +
                "ws.name AS warehouseStaffName, " +
                "SUM(poi.quantity) AS totalQuantity, " +
                "SUM(poi.quantity * poi.price) AS totalAmount " +
                "FROM tblpurchaseorder po " +
                "JOIN tblsupplier s ON po.tblSupplierid = s.id " +
                "JOIN tblpurchaseorderitem poi ON poi.tblPurchaseOrderid = po.id " +
                "JOIN tblmember ws ON po.tblWarehouseStaffid = ws.id " +
                "WHERE po.tblSupplierid = ? AND po.orderDate BETWEEN ? AND ? " +
                "GROUP BY s.name, po.id, po.orderDate, ws.name " +
                "ORDER BY po.orderDate ASC";


        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, supplierId);
        ps.setDate(2, new java.sql.Date(startDate.getTime()));
        ps.setDate(3, new java.sql.Date(endDate.getTime()));

        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            PurchaseOrder po = new PurchaseOrder();
            po.setId(rs.getInt("purchaseOrderId"));
            po.setOrderDate(rs.getDate("orderDate"));
            po.setTotalQuantity(rs.getInt("totalQuantity"));
            po.setTotalAmount(rs.getInt("totalAmount"));

            WarehouseStaff ws = new WarehouseStaff();
            ws.setName(rs.getString("warehouseStaffName"));

            Supplier s = new  Supplier();
            s.setName(rs.getString("supplierName"));

            po.setWarehouseStaff(ws);
            po.setSupplier(s);
            purchaseOrders.add(po);
        }

        rs.close();
        ps.close();
        return purchaseOrders;
    }

    public PurchaseOrder getPurchaseOrderById(int purchaseOrderId) throws SQLException {
        PurchaseOrder purchaseOrder = null;
        ArrayList<PurchaseOrderItem> items = new ArrayList<>();

        String sql = "SELECT " +
                "po.id AS purchaseOrderId, " +
                "po.orderDate AS orderDate, " +
                "po.note AS note, " +
                "m.name AS warehouseStaffName, " +
                "s.name AS supplierName, " +
                "sp.id AS sparePartid, " +
                "sp.name AS sparePartName, " +
                "poi.id AS itemId, " +
                "poi.quantity AS quantity, " +
                "poi.price AS price " +
                "FROM " +
                "tblPurchaseOrder AS po " +
                "JOIN " +
                "tblPurchaseOrderItem AS poi ON po.id = poi.tblPurchaseOrderId " +
                "JOIN " +
                "tblSparePart AS sp ON poi.tblSparePartId = sp.id " +
                "JOIN " +
                "tblSupplier AS s ON po.tblSupplierId = s.id " +
                "JOIN " +
                "tblWarehouseStaff AS ws ON po.tblWarehouseStaffId = ws.tblStaffid " +
                "JOIN " +
                "tblStaff AS st ON ws.tblStaffId = st.tblMemberid " +
                "JOIN " +
                "tblMember AS m ON st.tblMemberId = m.id " +
                "WHERE " +
                "po.id = ?;";

        try(PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, purchaseOrderId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                if(purchaseOrder == null) {
                    purchaseOrder = new PurchaseOrder();
                    purchaseOrder.setId(rs.getInt("purchaseOrderId"));
                    purchaseOrder.setOrderDate(rs.getDate("orderDate"));
                    purchaseOrder.setNote(rs.getString("note"));

                    Supplier s = new Supplier();
                    s.setName(rs.getString("supplierName"));
                    purchaseOrder.setSupplier(s);


                    WarehouseStaff ws = new WarehouseStaff();
                    ws.setName(rs.getString("warehouseStaffName"));

                    purchaseOrder.setWarehouseStaff(ws);
                    purchaseOrder.setPurchaseOrderItems(items);
                }

                SparePart sp = new SparePart();
                sp.setId(rs.getInt("sparePartId"));
                sp.setName(rs.getString("sparePartName"));

                PurchaseOrderItem item = new PurchaseOrderItem();
                item.setId(rs.getInt("itemId"));
                item.setQuantity(rs.getInt("quantity"));
                item.setPrice(rs.getFloat("price"));
                item.setSparePart(sp);

                items.add(item);
            }
        }
        return purchaseOrder;
    }
}
