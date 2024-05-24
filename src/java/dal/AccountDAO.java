/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Account;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author ASUS
 */
public class AccountDAO extends DBContext {
    public Account check(String phone) {
        String sql = """
                     SELECT [phoneNumber]
                           ,[name]
                           ,[password]
                           ,[role]
                       FROM [dbo].[Account]
                       where phoneNumber = ?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, phone);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                return new Account(rs.getString("phoneNumber"),
                        rs.getString("name"),
                        rs.getString("password"),
                        rs.getInt("role"));
            }
        } catch (SQLException e) {

        }
        return null;
    }

    public Account checkAccountSystemr(String phone, String password) {
        String sql = """
                     SELECT [phoneNumber]
                           ,[name]
                           ,[password]
                           ,[role]
                       FROM [dbo].[Account]
                       where phoneNumber = ? and password = ?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, phone);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                Account ad = new Account(rs.getString("phoneNumber"),
                            rs.getString("password"),
                        rs.getString("name"),
                        rs.getInt("role"));

                return ad;
            }
        } catch (SQLException e) {

        }
        return null;
    }
    public Account checkUserName(String phone) {
        String sql = """
                     SELECT  [phoneNumber]
                            ,[name]
                            ,[password]
                            ,[role]
                       FROM [dbo].[Account]
                       where phoneNumber = ?""";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, phone);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                Account ad = new Account(rs.getString("phoneNumber"),
                        rs.getString("name"),
                        rs.getString("password"),
                        rs.getInt("role"));
                return ad;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public void addUser(String name, String phone) {
        String sql = """
                     INSERT INTO [dbo].[Account]
                                ([phoneNumber]
                                ,[name]
                                ,[password]
                                ,[role])
                          VALUES
                                (?,?,?)""";
        try {
PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, phone);
            st.setString(2, name);
            st.setInt(3, 3);
            st.executeUpdate();

        } catch (SQLException e) {

        }
    }

    public Account getAccountByUser(String phone) {
        String sql = """
                     SELECT [phoneNumber]
                           ,[name]
                           ,[password]
                           ,[role]
                       FROM [dbo].[Account]
                       where phoneNumber = ?""";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, phone);

            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                Account ac = new Account(rs.getString("phoneNumber"),
                        rs.getString("name"),
                        rs.getString("password"),
                        rs.getInt("role"));

                return ac;
            }
        } catch (SQLException e) {
        }
        return null;
    }

}
