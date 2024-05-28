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
import model.Account;
import model.Blog;
/**
 *
 * @author Admin
 */
public class BlogDAO extends AccountDAO{
    public List<Blog> getAllBlog(){
        List<Blog> list = new ArrayList<>();
        String sql = "Select * from Blog";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Blog b = new Blog();
                b.setId(rs.getInt("id"));
                b.setTitle(rs.getString("title"));
                b.setImage(rs.getString("image"));
                b.setSource(rs.getString("source"));
                b.setDate(rs.getString("date"));
                Account a = getAccountByUser(rs.getString("aid"));
                b.setAid(a);
                list.add(b);
            }
        } catch (SQLException e) {
        }
        return list;
    }
}

