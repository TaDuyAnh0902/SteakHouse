/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.BestSelling;
import model.Product;

/**
 *
 * @author kitai
 */
public class BestSellingDAO extends ProductsDAO {
    public void addBestSelling(int pid, int quantity){
        String sql = """
                     DECLARE @NewData TABLE (
                         pid INT,
                         quantity INT,
                         date date
                     );
                                             
                     -- Ch\u00e8n c\u00e1c gi\u00e1 tr\u1ecb m\u1edbi v\u00e0o b\u1ea3ng t\u1ea1m
                     INSERT INTO @NewData (pid, quantity, date)
                     VALUES (?, ?, CURRENT_TIMESTAMP);
                                             
                     -- S\u1eed d\u1ee5ng MERGE \u0111\u1ec3 c\u1eadp nh\u1eadt ho\u1eb7c ch\u00e8n v\u00e0o OrderLine
                     MERGE [dbo].[BestSelling] AS target
                     USING @NewData AS source
                     ON (target.pid = source.pid AND target.date = source.date)
                     WHEN MATCHED THEN 
                         UPDATE SET target.quantity = target.quantity + source.quantity
                     WHEN NOT MATCHED THEN
                         INSERT (pid, quantity, date)
                         VALUES (source.pid, source.quantity, source.date);""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, pid);
            st.setInt(2, quantity);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
    public List<BestSelling> getBestSellings(){
        String sql = """
                     SELECT TOP 6 *
                     FROM BestSelling
                     ORDER BY quantity DESC;""";
        List<BestSelling> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                BestSelling bs = new BestSelling();
                Product p = getProductById(rs.getString("pid"));
                bs.setPid(p);
                bs.setQuantity(rs.getInt("quantity"));
                bs.setDate(rs.getString("date"));
                list.add(bs);
            }
        } catch (SQLException e) {
        }
        return list;
    }
    
    public Map<String,Integer> getStatisticsBestSellings(){
        Map<String, Integer> map = new HashMap<>();
        String sql = """
                     SELECT DISTINCT TOP 5 *
                    FROM BestSelling
                    WHERE date = CAST(GETDATE() AS DATE);""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Product p = getProductById(rs.getString("pid"));
                String name = p.getName();
                int quantity = rs.getInt("quantity");
                map.put(name, quantity);
            }
        } catch (SQLException e) {
        }
        return map;
    }
}
