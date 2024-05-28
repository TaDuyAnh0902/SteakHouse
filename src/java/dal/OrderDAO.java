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

/**
 *
 * @author ASUS
 */
public class OrderDAO extends DBContext {
    public List<Table> getAllTable() {
        String sql = "select * from [Table]";
        List<Table> list = new ArrayList<>();

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Table tb = new Table(rs.getInt("id"),
                        rs.getString("nameTable"));

                list.add(tb);
            }
        } catch (Exception e) {
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
                Table t = new Table(rs.getInt("id"), rs.getString("nameTable"));
                
                return t;
            }
        } catch (Exception e) {
        }
        return null;
    }
}
