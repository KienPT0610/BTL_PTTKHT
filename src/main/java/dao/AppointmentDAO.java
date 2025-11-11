package dao;

import model.Appointment;

import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.util.Date;

public class AppointmentDAO extends DAO {
    public AppointmentDAO() {
        super();
    }

    public boolean createAppointment(Appointment appointment) {
        String sql = "INSERT INTO tblappointment (datetime, status, note, tblMemberid) VALUES (?,?,?,?)";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setTimestamp(1, new Timestamp(appointment.getDateTime().getTime()));
            ps.setString(2, appointment.getStatus());
            ps.setString(3, appointment.getNote());
            ps.setInt(4, appointment.getCustomer().getId());

            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
