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
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.Map;
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
    public List<Integer> getAllTableId() {
        String sql = "select distinct [id] from [table]";
        List<Integer> list = new ArrayList<>();

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(rs.getInt("id"));
            }
        } catch (SQLException e) {
        }
        return list;
    }
    public boolean getStatusByTable(int idTable) {
        String sql = """
                     select * from orderline where tid = ?
                     """;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1,idTable);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return false;
    }
    public Map<Integer, Boolean> getTableStatus() {
        Map<Integer, Boolean> data = new HashMap<>();
        List<Integer> list = getAllTableId();
        for (Integer x : list) {
            boolean check = getStatusByTable(x);
            data.put(x, check);
        }
        return data;
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

    public void addOrderLine(int productId, int quantity, int tableNumber) {

        String sql = """
                    DECLARE @NewData TABLE (
                            pid INT,
                            quantity INT,
                            dateOrderline DATETIME,
                            tid INT,
                            sid INT
                        );
                        
                        -- Chèn các giá trị mới vào bảng tạm
                        INSERT INTO @NewData (pid, quantity, dateOrderline, tid, sid)
                        VALUES (?, ?, CURRENT_TIMESTAMP, ?, 1);
                        
                        -- Sử dụng MERGE để cập nhật hoặc chèn vào OrderLine
                        MERGE [dbo].[OrderLine] AS target
                        USING @NewData AS source
                        ON (target.pid = source.pid AND target.tid = source.tid AND target.sid = 1)
                        WHEN MATCHED THEN 
                            UPDATE SET target.quantity = target.quantity + source.quantity
                        WHEN NOT MATCHED THEN
                            INSERT (pid, quantity, dateOrderline, tid, sid)
                            VALUES (source.pid, source.quantity, source.dateOrderline, source.tid, source.sid);""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productId);
            st.setInt(2, quantity);
            st.setInt(3, tableNumber);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public List<OrderLine> getAllListOrderLine() {
        String sql = """
                    SELECT id, pid, dateOrderline, tid, sid, MAX(quantity) AS max_quantity
                    FROM orderline
                    GROUP BY id, pid, tid, sid, dateOrderline
                    ORDER BY dateOrderline desc
                 """;
        List<OrderLine> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OrderLine ol = new OrderLine();
                // Since the `id` column is not part of the grouped result, you might need to handle it differently
                // ol.setId(rs.getInt("id"));
                ol.setId(rs.getInt("id"));
                Product p = getProductById(rs.getString("pid"));
                ol.setPid(p);
                ol.setDateOrderline(rs.getString("dateOrderline"));
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

    public List<OrderLine> getListOrderLine(int idTable) {
        String sql = """
                    SELECT pid, tid, sid, quantity
                    FROM orderline
                    where tid = ?
                 """;
        List<OrderLine> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, idTable);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OrderLine olt = new OrderLine();
                // Since the `id` column is not part of the grouped result, you might need to handle it differently
                // ol.setId(rs.getInt("id"));

                Product p = getProductById(rs.getString("pid"));
                olt.setPid(p);
                Table t = getTableById(rs.getInt("tid"));
                olt.setTid(t);
                Status s = getStatusById(rs.getInt("sid"));
                olt.setSid(s);
                olt.setQuantity(rs.getInt("quantity"));
                list.add(olt);
            }
        } catch (SQLException e) {
            // Better to log the exception

        }

        return list;
    }

    public int totalProductByTable(int idTable) {
        String sql = """
                    SELECT SUM(quantity) as total_product
                    FROM Orderline
                    WHERE tid = ?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, idTable);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            // Better to log the exception
        }
        return 0;
    }

    public List<OrderLine> getListOrderLineByIdTable(int idTable) {
        String sql = """
                    SELECT id, pid, dateOrderline, tid, sid, MAX(quantity) AS max_quantity
                    FROM orderline
                    GROUP BY id, pid, tid, sid, dateOrderline
                    HAVING tid = ?
                 """;
        List<OrderLine> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, idTable);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OrderLine ol = new OrderLine();
                // Since the `id` column is not part of the grouped result, you might need to handle it differently
                // ol.setId(rs.getInt("id"));
                ol.setId(rs.getInt("id"));
                Product p = getProductById(rs.getString("pid"));
                ol.setPid(p);
                Table t = getTableById(rs.getInt("tid"));
                ol.setDateOrderline(rs.getString("dateOrderline"));
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

    public void confirmOrder(String id) {
        String sql = """
                     UPDATE [dbo].[OrderLine]
                      SET [sid] = 3
                      WHERE [id] = ? 
                      """;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void buy(int idTable) {
        String sql = """
                     UPDATE [dbo].[OrderLine]
                    SET [sid] = 2
                    WHERE [tid] = ?
                      """;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, idTable);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public String totalMoney(int idTable) {
        String sql = """
                    SELECT pid, tid, sid, MAX(quantity) AS max_quantity
                    FROM orderline
                    GROUP BY pid, tid, sid
                    HAVING tid = ?
                 """;
        double total = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, idTable);
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
        DecimalFormat decimalFormat = new DecimalFormat("#,###,000");
        String formattedString = decimalFormat.format(total * 1000);
        return formattedString;
    }

    public void pay(int idTable, String totalMoney) {
        String sql = """
                    INSERT INTO [dbo].[OrderManage]
                               ([date]
                               ,[tid]
                               ,[totalmoney])
                         VALUES
                               (CURRENT_TIMESTAMP,?,?)
                    
                    delete orderline where tid = ?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, idTable);
            st.setString(2, totalMoney);
            st.setInt(3, idTable);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
}
