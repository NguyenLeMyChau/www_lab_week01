package vn.edu.iuh.fit.labweek0120046631.repositories;

import vn.edu.iuh.fit.labweek0120046631.connectDB.ConnectDB;
import vn.edu.iuh.fit.labweek0120046631.models.Account;
import vn.edu.iuh.fit.labweek0120046631.models.GrantAccess;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class GrantAccessRepository {

    public GrantAccess getGrantAccess(String accountId) throws SQLException, ClassNotFoundException {
        Connection con;
        con = ConnectDB.getInstance().getConnection();
        PreparedStatement statement = null;
        GrantAccess grantAccess = null;

        try{
            statement = con.prepareStatement("SELECT * FROM grant_access " +
                    "WHERE account_id = ?");
            statement.setString(1, accountId);

            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                String roleId = rs.getString("role_id");
                Account acc = new Account(rs.getString("account_id"));
                boolean isGrant = rs.getBoolean("is_grant");
                String note = rs.getString("note");

                grantAccess = new GrantAccess(roleId, acc, isGrant, note);

            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return grantAccess;
    }







}
