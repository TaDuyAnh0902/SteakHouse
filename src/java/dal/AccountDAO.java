/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Account;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class AccountDAO extends StatusDAO {

    public List<Account> getAllAccount(){
        String sql = "select * from Account order by role asc";
        List<Account> list = new ArrayList<>();
        
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Account ad = new Account();
                ad.setUsername(rs.getString("username"));
                ad.setPassWord(rs.getString("password"));
                ad.setRole(rs.getInt("role"));
                
                list.add(ad);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public Account check(String username) {
        String sql = """
                     SELECT [username]
                           ,[password]
                           ,[role]
                       FROM [dbo].[Account]
                       where username = ?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                return new Account(rs.getString("username"),
                        rs.getString("password"),
                        rs.getInt("role"));
            }
        } catch (SQLException e) {

        }
        return null;
    }

    public Account checkAccountSystem(String username, String password) {
        String sql = """
                     SELECT [username]
                           ,[password]
                           ,[role]
                       FROM [dbo].[Account]
                       where username = ? and password = ?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                Account ad = new Account(rs.getString("username"),
                        rs.getString("password"),
                        rs.getInt("role"));

                return ad;
            }
        } catch (SQLException e) {

        }
        return null;
    }

    public Account checkUserName(String username) {
        String sql = """
                     SELECT  [username]
                            ,[password]
                            ,[role]
                       FROM [dbo].[Account]
                       where username = ?""";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                Account ad = new Account(rs.getString("username"),
                        rs.getString("password"),
                        rs.getInt("role"));
                return ad;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public void addUser(String username, String password) {
        String sql = """
                     INSERT INTO [dbo].[Account]
                                ([username]
                                ,[password]
                                ,[role])
                          VALUES
                                (?,?,?)""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            st.setInt(3, 3);
            st.executeUpdate();

        } catch (SQLException e) {

        }
    }

    public void addUserPhone(String username, int role) {
        String sql = """
                     INSERT INTO [dbo].[Account]
                                ([username]
                                ,[password]
                                ,[role])
                          VALUES
                                (?,?,?)""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, "");
            st.setInt(3, role);
            st.executeUpdate();

        } catch (SQLException e) {

        }
    }

    public void deleteUser(String user) {
        String sql = "delete Account where username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.executeUpdate();

        } catch (SQLException e) {

        }
    }
}
