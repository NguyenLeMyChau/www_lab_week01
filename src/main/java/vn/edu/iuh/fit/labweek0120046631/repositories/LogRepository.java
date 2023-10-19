package vn.edu.iuh.fit.labweek0120046631.repositories;

import vn.edu.iuh.fit.labweek0120046631.connectDB.ConnectDB;
import vn.edu.iuh.fit.labweek0120046631.models.Account;
import vn.edu.iuh.fit.labweek0120046631.models.Logs;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class LogRepository {

    public List<Logs> getAllLogs() throws SQLException, ClassNotFoundException {
        List<Logs> logsList = new ArrayList<>();
        Connection con;
        con = ConnectDB.getInstance().getConnection();

        try {
            String sql = "Select * from log";
            Statement statement = con.createStatement();
            ResultSet rs = statement.executeQuery(sql);

            while (rs.next()) {
                Long id = rs.getLong("id");
                String accountId = rs.getString("account_id");
                LocalDateTime logIn = rs.getObject("login_time", LocalDateTime.class);
                LocalDateTime logOut = rs.getObject("logout_time", LocalDateTime.class);
                String note = rs.getString("notes");

                Logs logs = new Logs(id, new Account(accountId), logIn, logOut, note);

                logsList.add(logs);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return logsList;
    }

    public boolean noteLog(Logs logs) throws SQLException, ClassNotFoundException {
        Connection con;
        con = ConnectDB.getInstance().getConnection();

        try {
            PreparedStatement statement = null;

            statement = con.prepareStatement("INSERT INTO log\n" +
                    "VALUES (?, ?, ?, ?, ?)");
            statement.setLong(1, logs.getId());
            statement.setString(2, logs.getAccount().getId());
            statement.setObject(3, logs.getLoginTime(), Types.DATE);
            statement.setObject(4, logs.getLogoutTime(), Types.DATE);
            statement.setString(5, logs.getNotes());

            statement.executeUpdate();

            return true;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
