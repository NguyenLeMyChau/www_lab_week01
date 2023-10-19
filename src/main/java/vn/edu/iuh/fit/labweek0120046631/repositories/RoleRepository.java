package vn.edu.iuh.fit.labweek0120046631.repositories;

import vn.edu.iuh.fit.labweek0120046631.connectDB.ConnectDB;
import vn.edu.iuh.fit.labweek0120046631.models.Account;
import vn.edu.iuh.fit.labweek0120046631.models.Logs;
import vn.edu.iuh.fit.labweek0120046631.models.Role;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class RoleRepository {
    public List<Role> getAllRole() throws SQLException, ClassNotFoundException {
        List<Role> roleList = new ArrayList<>();
        Connection con;
        con = ConnectDB.getInstance().getConnection();

        try {
            String sql = "Select * from role";
            Statement statement = con.createStatement();
            ResultSet rs = statement.executeQuery(sql);

            while (rs.next()) {
                String roleId = rs.getString("role_id");
                String roleName = rs.getString("role_name");
                String description = rs.getString("description");
                int status = rs.getInt("status");

                Role role = new Role(roleId, roleName, description, status);
                roleList.add(role);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return roleList;
    }
}
