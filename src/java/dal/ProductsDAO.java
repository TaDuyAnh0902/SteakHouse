/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.Product;

/**
 *
 * @author Admin
 */
public class ProductsDAO extends AccountDAO{
    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String sql = "select * from Categories";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getInt("id"),
                        rs.getString("name"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Category getCategoryById(int id) {
        String sql = "select * from Categories where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Category c = new Category(rs.getInt("id"), rs.getString("name"));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Product> getproductByCid(int cid) {
        List<Product> list = new ArrayList<>();
        String sql = """
                     SELECT [id]
                           ,[name]
                           ,[quantity]
                           ,[price]
                           ,[dateproduct]
                           ,[describe]
                           ,[image]
                           ,[cid]
                       FROM [dbo].[Products]
                       where 1=1""";
        if (cid != 0) {
            sql = sql + "and cid = " + cid;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getString("id"));
                p.setName(rs.getString("name"));
                p.setQuantity(rs.getInt("quantity"));
                p.setPrice(rs.getDouble("price"));
                p.setDateproduct(rs.getString("dateproduct"));
                p.setDescribe(rs.getString("describe"));
                p.setImage(rs.getString("image"));
                Category c = getCategoryById(rs.getInt("cid"));
                p.setCategory(c);
                list.add(p);

            }
        } catch (SQLException e) {

        }
        return list;
    }

    public List<Product> getListByPage(List<Product> list,
            int start, int end) {
        ArrayList<Product> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public List<Product> getproductByCid2(String id, int cid) {
        List<Product> list = new ArrayList<>();
        String sql = """
                     SELECT [id]
                           ,[name]
                           ,[quantity]
                           ,[price]
                           ,[dateproduct]
                           ,[describe]
                           ,[image]
                           ,[cid]
                       FROM [dbo].[Products]
                       where 1=1 and id != ? and cid = ?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            st.setInt(2, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getString("id"));
                p.setName(rs.getString("name"));
                p.setQuantity(rs.getInt("quantity"));
                p.setPrice(rs.getDouble("price"));
                p.setDateproduct(rs.getString("dateproduct"));
                p.setDescribe(rs.getString("describe"));
                p.setImage(rs.getString("image"));
                Category c = getCategoryById(rs.getInt("cid"));
                p.setCategory(c);
                list.add(p);

            }
        } catch (SQLException e) {

        }
        return list;
    }

    public Product getProductById(String id) {
        String sql = """
                     SELECT [id]
                           ,[name]
                           ,[quantity]
                           ,[price]
                           ,[dateproduct]
                           ,[describe]
                           ,[image]
                           ,[cid]
                       FROM [dbo].[Products]
                       where id = ?""";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Product p = new Product();
                p.setId(rs.getString("id"));
                p.setName(rs.getString("name"));
                p.setQuantity(rs.getInt("quantity"));
                p.setPrice(rs.getDouble("price"));
                p.setDateproduct(rs.getString("dateproduct"));
                p.setDescribe(rs.getString("describe"));
                p.setImage(rs.getString("image"));
                Category c = getCategoryById(rs.getInt("cid"));
                p.setCategory(c);
                return p;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public List<Product> searchProductByPrice(float price) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Products where price > ? and price < 500";

        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setFloat(1, price);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getString("id"));
                p.setName(rs.getString("name"));
                p.setQuantity(rs.getInt("quantity"));
                p.setPrice(rs.getDouble("price"));
                p.setDateproduct(rs.getString("dateproduct"));
                p.setDescribe(rs.getString("describe"));
                p.setImage(rs.getString("image"));
                Category c = getCategoryById(rs.getInt("cid"));
                p.setCategory(c);

                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Product> searchProductByName(String name) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Products where name like ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, "%" + name + "%");

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getString("id"));
                p.setName(rs.getString("name"));
                p.setQuantity(rs.getInt("quantity"));
                p.setPrice(rs.getDouble("price"));
                p.setDateproduct(rs.getString("dateproduct"));
                p.setDescribe(rs.getString("describe"));
                p.setImage(rs.getString("image"));
                Category c = getCategoryById(rs.getInt("cid"));
                p.setCategory(c);

                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Product> searchProductBySort(int idx) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Products";

        switch (idx) {
            case 1 -> sql += " ORDER BY [name] ASC";
            case 2 -> sql += " ORDER BY [price] DESC";
            case 3 -> sql += " ORDER BY [price] ASC";
            default -> {
            }
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getString("id"));
                p.setName(rs.getString("name"));
                p.setQuantity(rs.getInt("quantity"));
                p.setPrice(rs.getDouble("price"));
                p.setDateproduct(rs.getString("dateproduct"));
                p.setDescribe(rs.getString("describe"));
                p.setImage(rs.getString("image"));
                Category c = getCategoryById(rs.getInt("cid"));
                p.setCategory(c);
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }
    
    
    public void addProduct(String name, int quantity, double price, String describe, String image, int cid) {
        String sql = """
                     INSERT INTO [dbo].[Products]
                                ([name]
                                ,[quantity]
                                ,[price]
                                ,[dateproduct]
                                ,[describe]
                                ,[image]
                                ,[cid])
                          VALUES
                                (?,?,?,CURRENT_TIMESTAMP,?,?,?)""";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setInt(2, quantity);
            st.setDouble(3, price);
            st.setString(4, describe);
            st.setString(5, image);
            st.setInt(6, cid);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void deleteProductById(String id) {
        String sql = """
                     DELETE FROM [dbo].[Products]
                           WHERE id = ?""";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);

            st.executeUpdate();

        } catch (SQLException e) {
        }
    }
            
    public void updateProductById(String name, int quantity, double price, String describe, String image, int cid, String id) {
        String sql = "UPDATE [dbo].[Products]\n"
                + "   SET [name] = ?\n"
                + "      ,[quantity] = ?\n"
                + "      ,[price] = ?\n"
                + "      ,[describe] = ?\n"
                + "      ,[image] = ?\n"
                + "      ,[cid] = ?\n"
                + " WHERE id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setInt(2, quantity);
            st.setDouble(3, price);
            st.setString(4, describe);
            st.setString(5, image);
            st.setInt(6, cid);
            st.setString(7, id);

            st.executeUpdate();
        } catch (Exception e) {
        }
    }
    
}
