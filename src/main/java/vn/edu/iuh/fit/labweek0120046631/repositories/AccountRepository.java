package vn.edu.iuh.fit.labweek0120046631.repositories;

import vn.edu.iuh.fit.labweek0120046631.connectDB.ConnectDB;
import vn.edu.iuh.fit.labweek0120046631.models.Account;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AccountRepository {
    public List<Account> getAllAccount() throws SQLException, ClassNotFoundException {
        List<Account> lstAccount = new ArrayList<>();
        Connection con;
        con = ConnectDB.getInstance().getConnection();

        try {
            String sql = "Select * from account";
            Statement statement = con.createStatement();
            ResultSet rs = statement.executeQuery(sql);
            while (rs.next()) {
                String id = rs.getString("account_id");
                String fullName = rs.getString("full_name");
                String password = rs.getString("password");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                int status = rs.getInt("status");

                Account account = new Account(id, fullName, password, email, phone, status);
                lstAccount.add(account);

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lstAccount;
    }

    public boolean addAccount(Account account) throws SQLException, ClassNotFoundException {
        Connection con;
        con = ConnectDB.getInstance().getConnection();
        try {
            PreparedStatement statement = null;

            statement = con.prepareStatement("insert into account values(?,?,?,?,?,?)");
            statement.setString(1, account.getId());
            statement.setString(2, account.getFullName());
            statement.setString(3, account.getPassword());
            statement.setString(4, account.getEmail());
            statement.setString(5, account.getPhone());
            statement.setInt(6, account.getStatus());

            statement.executeUpdate();
            return true;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteAccount(String id) throws SQLException, ClassNotFoundException {
        Connection con;
        con = ConnectDB.getInstance().getConnection();
        PreparedStatement statement = null;

        try {
            statement = con.prepareStatement("delete from account where account_id = ?");
            statement.setString(1, id);
           statement.executeUpdate();

           return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean update(Account account) throws SQLException, ClassNotFoundException {
        Connection con;
        con = ConnectDB.getInstance().getConnection();
        PreparedStatement statement = null;
        try {
            statement = con.prepareStatement("UPDATE account\n" +
                    "SET full_name = ?, password = ?, email = ?, phone = ?, status = ?\n" +
                    "WHERE account_id = ?");
            statement.setString(1, account.getFullName());
            statement.setString(2, account.getPassword());
            statement.setString(3, account.getEmail());
            statement.setString(4, account.getPhone());
            statement.setInt(5, account.getStatus());
            statement.setString(6, account.getId());

            statement.executeUpdate();
           return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public Account loginAccount(Account account) throws SQLException, ClassNotFoundException{
        Connection con;
        con = ConnectDB.getInstance().getConnection();
        PreparedStatement statement = null;
        Account acc = null;

        try{
            statement = con.prepareStatement("SELECT * FROM account\n" +
                    "WHERE email = ? AND password = ?");
            statement.setString(1, account.getEmail());
            statement.setString(2, account.getPassword());

            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                String id = rs.getString("account_id");
                String fullName = rs.getString("full_name");
                String password = rs.getString("password");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                int status = rs.getInt("status");

                acc = new Account(id, fullName, password, email, phone, status);

            }
        }catch (Exception e){
            e.printStackTrace();
        }

        return acc;

    }



}
