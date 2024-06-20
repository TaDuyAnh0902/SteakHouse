/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

/**
 *
 * @author kitai
 */
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Category;

public class ManageDAO extends ProductsDAO {

    public List<Integer> getCategories() {
        List<Integer> list = new ArrayList<>();
        try {
            String sql = "select distinct cid from products";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(rs.getInt("cid"));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public int getTotalProductsWithCategory(int name) {
        String sql = """
                     select count(*) from products
                     where cid like ?
                     """;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + name + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }

    public Map<String, Integer> getDataProductsCategories() {
        Map<String, Integer> data = new HashMap<>();
        List<Integer> list = getCategories();
        for (int x : list) {
            Category c = getCategoryById(x);
            int count = getTotalProductsWithCategory(x);
            data.put(c.getName(), count);
        }
        return data;
    }

    public int totalCategory() {
        String sql = "SELECT COUNT(*) AS total_rows FROM [dbo].[categories]";
        int count = 0;

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt("total_rows");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return count;
    }

    public int totalProduct() {
        String sql = "SELECT COUNT(*) AS total_rows FROM [dbo].[products]";
        int count = 0;

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt("total_rows");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return count;
    }

    public int totalUser() {
        String sql = "SELECT COUNT(*) AS total_rows FROM [dbo].[account]";
        int count = 0;

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt("total_rows");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return count;
    }

    public int totalOrder() {
        String sql = "SELECT COUNT(*) AS total_rows FROM [dbo].[ordermanage]";
        int count = 0;

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt("total_rows");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return count;
    }

    public List<String> getDateFromOrderManage() {
        List<String> list = new ArrayList<>();
        try {
            String sql = "select distinct [date] from OrderManage order by [date] desc";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(rs.getString("date"));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public int getTotalOrdersByDay(String name) {
        String sql = """
                     select count(*) from OrderManage
                     where [date] like ?
                     """;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + name + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }

    public Map<String, Integer> getDataOrderManage() {
        Map<String, Integer> data = new HashMap<>();
        List<String> list = getDateFromOrderManage();
        for (String x : list) {
            int count = getTotalOrdersByDay(x);
            data.put(x, count);
        }
        return data;
    }

    public double getTotalMoneyByDay(String date) {
        String sql = """
                     SELECT SUM(totalmoney) as total_money
                     FROM OrderManage
                     WHERE date = ?
                     """;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, date);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getDouble("total_money");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }

    public Map<String, Double> getDataRevenue() {
        Map<String, Double> data = new HashMap<>();
        List<String> list = getDateFromOrderManage();
        for (String x : list) {
            double money = getTotalMoneyByDay(x);
            data.put(x, money);
        }
        return data;
    }
}
