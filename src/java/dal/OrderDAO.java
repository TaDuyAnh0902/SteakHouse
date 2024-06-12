/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import model.Table;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Account;
import model.OrderLine;
import model.Product;
import model.Status;

/**
 *
 * @author ASUS
 */
public class OrderDAO extends ProductsDAO {

    public List<Table> getAllTable() {
        String sql = "select * from [Table]";
        List<Table> list = new ArrayList<>();

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Table tb = new Table();
                tb.setId(rs.getInt("id"));
                tb.setNameTable(rs.getString("nameTable"));
                Status s = getStatusById(rs.getInt("sid"));
                tb.setSid(s);
                list.add(tb);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public Table getTableById(int id) {
        String sql = "select * from [Table] where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Table tb = new Table();
                tb.setId(rs.getInt("id"));
                tb.setNameTable(rs.getString("nameTable"));
                Status s = getStatusById(rs.getInt("sid"));
                tb.setSid(s);
                return tb;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public Table deleteTableById(int id) {
        String sql = "Update [Table] set sid = 2 where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();

        } catch (SQLException e) {
        }
        return null;
    }

    public void addTable(String nameTable) {
        String sql = """
                     INSERT INTO [dbo].[Table]
                                ([nameTable], sid)
                          VALUES
                                (?, 1)""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, nameTable);
            st.executeUpdate();

        } catch (SQLException e) {
        }
    }

    public void updateTable(String nameTable, int id) {
        String sql = """
                     UPDATE [dbo].[Table]
                        SET [nameTable] = ?
                      WHERE id = ?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, nameTable);
            st.setInt(2, id);
            st.executeUpdate();

        } catch (SQLException e) {
        }
    }

    public void addOrderLine(int productId, int quantity, String user, int tableNumber) {
        String sql = """
                     SET IDENTITY_INSERT [dbo].[OrderLine] OFF;
                              
                              INSERT INTO [dbo].[OrderLine] ([pid], [quantity], [aid], [dateOrderline], [tid], sid) 
                              VALUES
                              (?,?,?,CURRENT_TIMESTAMP,?,1)
                              
                              SET IDENTITY_INSERT [dbo].[OrderLine] ON;""";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productId);
            st.setInt(2, quantity);
            st.setString(3, user);
            st.setInt(4, tableNumber);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public List<OrderLine> getListOrderLine(String user) {
        String sql = """
                    SELECT pid, aid, tid, sid, MAX(quantity) AS max_quantity
                    FROM orderline
                    GROUP BY pid, aid, tid, sid
                    HAVING aid = ?
                 """;
        List<OrderLine> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OrderLine ol = new OrderLine();
                // Since the `id` column is not part of the grouped result, you might need to handle it differently
// ol.setId(rs.getInt("id"));

                Product p = getProductById(rs.getString("pid"));
                ol.setPid(p);
                Account ac = check(rs.getString("aid"));
                ol.setAid(ac);
                Table t = getTableById(rs.getInt("tid"));
                ol.setTid(t);
                Status s = getStatusById(rs.getInt("sid"));
                ol.setSid(s);
                ol.setQuantity(rs.getInt("max_quantity"));
                list.add(ol);
            }
        } catch (SQLException e) {
            // Better to log the exception

        }

        return list;
    }

    public void buy(String user) {
        String sql = """
                     UPDATE [dbo].[OrderLine]
                      SET [sid] = 2
                      WHERE [aid] = ? 
                      AND [quantity] = (
                          SELECT MAX([quantity])
                          FROM [dbo].[OrderLine]
                          WHERE [aid] = ?
                      );""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, user);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public double totalMoney(String user) {
        String sql = """
                    SELECT pid, aid, tid, sid, MAX(quantity) AS max_quantity
                    FROM orderline
                    GROUP BY pid, aid, tid, sid
                    HAVING aid = ?
                 """;
        double total = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OrderLine ol = new OrderLine();
                Product p = getProductById(rs.getString("pid"));
                ol.setQuantity(rs.getInt("max_quantity"));

                total += p.getPrice() * ol.getQuantity();
            }
            st.executeUpdate();
        } catch (SQLException e) {
        }

        return total;
    }
}
