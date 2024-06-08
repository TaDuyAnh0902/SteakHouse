/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Status;
/**
 *
 * @author HP
 */
public class StatusDAO extends DBContext{
    public Status getStatusById(int id){
        String sql= "select * from Status where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                Status status = new Status(rs.getInt("id"), rs.getString("nameStatus"));
                
                return status;
            }
        } catch (SQLException e) {
        }
        return null;
    }
}
