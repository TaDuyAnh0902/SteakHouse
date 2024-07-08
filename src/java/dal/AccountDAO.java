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
import model.Status;

/**
 *
 * @author ASUS
 */
public class AccountDAO extends StatusDAO {

    public List<Account> getAllAccount() {
        String sql = "select * from Account order by role asc";
        List<Account> list = new ArrayList<>();

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Account ad = new Account();
                ad.setName(rs.getString("name"));
                ad.setUsername(rs.getString("username"));
                ad.setEmail(rs.getString("email"));
                ad.setPassWord(rs.getString("password"));
                ad.setPhoneNumber(rs.getString("phoneNumber"));
                ad.setCode(rs.getString("code"));
                ad.setRole(rs.getInt("role"));
                Status s = getStatusById(rs.getInt("sid"));
                ad.setSid(s);
                list.add(ad);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public Account check(String username) {
        String sql = """
                     SELECT [name]
                            ,[username]
                            ,[email]
                            ,[password]
                            ,[phoneNumber]
                            ,[code]
                            ,[role]
                            ,[sid]
                       FROM [dbo].[Account]
                       where username = ?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                Account ad = new Account();
                ad.setName(rs.getString("name"));
                ad.setUsername(rs.getString("username"));
                ad.setEmail(rs.getString("email"));
                ad.setPassWord(rs.getString("password"));
                ad.setPhoneNumber(rs.getString("phoneNumber"));
                ad.setCode(rs.getString("code"));
                ad.setRole(rs.getInt("role"));
                Status s = getStatusById(rs.getInt("sid"));
                ad.setSid(s);
                return ad;
            }
        } catch (SQLException e) {

        }
        return null;
    }

    public Account checkAccountSystem(String username, String password) {
        String sql = """
                    SELECT [name]
                            ,[username]
                            ,[email]
                            ,[password]
                            ,[phoneNumber]
                            ,[code]
                            ,[role]
                            ,[sid]
                       FROM [dbo].[Account]
                       where username = ? and password = ?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                Account ad = new Account();
                ad.setName(rs.getString("name"));
                ad.setUsername(rs.getString("username"));
                ad.setEmail(rs.getString("email"));
                ad.setPassWord(rs.getString("password"));
                ad.setPhoneNumber(rs.getString("phoneNumber"));
                ad.setCode(rs.getString("code"));
                ad.setRole(rs.getInt("role"));
                Status s = getStatusById(rs.getInt("sid"));
                ad.setSid(s);
                return ad;
            }
        } catch (SQLException e) {

        }
        return null;
    }

    public Account checkUserName(String username) {
        String sql = """
                     SELECT  [name]
                            ,[username]
                            ,[email]
                            ,[password]
                            ,[phoneNumber]
                            ,[code]
                            ,[role]
                            ,[sid]
                       FROM [dbo].[Account]
                       where username = ?""";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                Account ad = new Account();
                ad.setName(rs.getString("name"));
                ad.setUsername(rs.getString("username"));
                ad.setEmail(rs.getString("email"));
                ad.setPassWord(rs.getString("password"));
                ad.setPhoneNumber(rs.getString("phoneNumber"));
                ad.setCode(rs.getString("code"));
                ad.setRole(rs.getInt("role"));
                Status s = getStatusById(rs.getInt("sid"));
                ad.setSid(s);
                return ad;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public void addAccount(Account ac) {
        String sql = """
                     INSERT INTO [dbo].[Account]
                                           ([name]
                                           ,[username]
                                           ,[email]
                                           ,[password]
                                           ,[phoneNumber]
                                           ,[code]
                                           ,[role]
                                           ,[sid])
                                     VALUES
                                           (?,?,?,?,'','',3,1)""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, ac.getName());
            st.setString(2, ac.getUsername());
            st.setString(3, ac.getEmail());
            st.setString(4, ac.getPassWord());
            st.executeUpdate();

        } catch (SQLException e) {

        }
    }
    
    public void deleteUser(String user) {
        String sql = "Update [Account] SET sid = 2 where username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.executeUpdate();

        } catch (SQLException e) {

        }
    }

    public void updateUser(String name, String user, String phone, String pass) {
        String sql = """
                     UPDATE [dbo].[Account]
                                   SET [name] = ?
                                      ,[password] = ?
                                      ,[phoneNumber] = ?
                                 WHERE username = ?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, pass);
            st.setString(3, phone);
            st.setString(4, user);
            st.executeUpdate();

        } catch (SQLException e) {

        }
    }
    public Account getAccountByUser(String username) {
        String sql = """
                     SELECT [name]
                            ,[username]
                            ,[email]
                            ,[password]
                            ,[phoneNumber]
                            ,[code]
                            ,[role]
                            ,[sid]
                       FROM [dbo].[Account]
                       where username = ?""";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);

            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                Account ad = new Account();
                ad.setName(rs.getString("name"));
                ad.setUsername(rs.getString("username"));
                ad.setEmail(rs.getString("email"));
                ad.setPassWord(rs.getString("password"));
                ad.setPhoneNumber(rs.getString("phoneNumber"));
                ad.setCode(rs.getString("code"));
                ad.setRole(rs.getInt("role"));
                Status s = getStatusById(rs.getInt("sid"));
                ad.setSid(s);
                return ad;
            }
        } catch (SQLException e) {
        }
        return null;
    }

}

