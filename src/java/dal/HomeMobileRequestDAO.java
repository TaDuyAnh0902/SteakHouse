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
import model.ClientRequest;
import model.PaymentRequest;
import model.Table;

/**
 *
 * @author ASUS
 */
public class HomeMobileRequestDAO extends OrderDAO {
    public List<PaymentRequest> getAllPaymentRequest(){
        String sql = "select * from PaymentRequest";
        List<PaymentRequest> list = new ArrayList<>();

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                PaymentRequest pr = new PaymentRequest();
                pr.setId(rs.getInt("id"));
                pr.setType(rs.getInt("type"));
                Table t = getTableById(rs.getInt("tid"));
                pr.setTid(t);
                list.add(pr);
            }
        } catch (SQLException e) {
        }
        return list;
    }
    public void addPaymentRequest(int type, int tid){
        String sql = """
                     INSERT INTO [dbo].[PaymentRequest]
                                ([type]
                                ,[tid])
                          VALUES
                                (?,?)""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, type);
            st.setInt(2, tid);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
    public void deletePaymentRequest(int tid){
        String sql = "delete PaymentRequest where tid = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, tid);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
            
    public List<ClientRequest> getAllClientRequest(){
        String sql = "select * from CallStaff";
        List<ClientRequest> list = new ArrayList<>();

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ClientRequest pr = new ClientRequest();
                pr.setId(rs.getInt("id"));
                pr.setContent(rs.getString("content"));
                Table t = getTableById(rs.getInt("tid"));
                pr.setTid(t);
                list.add(pr);
            }
        } catch (SQLException e) {
        }
        return list;
    }
    
    public void addClientRequest(String content, int tid){
        String sql = """
                     INSERT INTO [dbo].[CallStaff]
                                ([content]
                                ,[tid])
                          VALUES
                                (?,?)""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, content);
            st.setInt(2, tid);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
    public void deleteClientRequest(int tid){
        String sql = "delete CallStaff where tid = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, tid);
            st.executeUpdate();
            } catch (SQLException e) {
        }
    }
}
