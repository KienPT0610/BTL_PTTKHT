package dao;

import model.Member;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDAO extends DAO {
    public MemberDAO() {
        super();
    }

    public boolean checkLogin(Member m) {
        String sql = "SELECT * FROM tblmember WHERE username=? AND password=?";
        try(PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, m.getUsername());
            ps.setString(2, m.getPassword());
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                m.setId(rs.getInt("id"));
                m.setName(rs.getString("name"));
                m.setUsername(rs.getString("username"));
                m.setPassword(rs.getString("password"));
                m.setAddress(rs.getString("address"));
                m.setEmail(rs.getString("email"));
                m.setTel(rs.getString("tel"));
                m.setRole(rs.getString("role"));
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}