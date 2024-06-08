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

    public Table getTableById(int id){
        String sql = "select * from [Table] where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()){
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
    public Table deleteTableById(int id){
        String sql = "Update [Table] set sid = 2 where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
            
        } catch (SQLException e) {
        }
        return null;
    }
    
    public void addTable(String nameTable){
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
    
    public void updateTable(String nameTable, int id){
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
}
