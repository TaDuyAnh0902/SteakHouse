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
import model.Status;
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
                Status s = getStatusById(rs.getInt("sid"));
                b.setSid(s);
                list.add(b);
            }
        } catch (SQLException e) {
        }
        return list;
    }
    
    public Blog getBlogById(int id){
        String sql = "select * from [Blog] where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()){
                Blog b = new Blog();
                b.setId(rs.getInt("id"));
                b.setTitle(rs.getString("title"));
                b.setImage(rs.getString("image"));
                b.setSource(rs.getString("source"));
                b.setDate(rs.getString("date"));
                Account a = getAccountByUser(rs.getString("aid"));
                b.setAid(a);
                Status s = getStatusById(rs.getInt("sid"));
                b.setSid(s);
                return b;
            }
        } catch (SQLException e) {
        }
        return null;
    }
    
    public Blog deleteBlogById(int id){
        String sql = "delete [Blog] where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
            
        } catch (SQLException e) {
        }
        return null;
    }
    
    public void addBlog(String title, String image, String source){
        String sql = """
                     INSERT INTO [dbo].[Blog]
                                ([title]
                                ,[image]
                                ,[source]
                                ,[date]
                                ,[aid])
                          VALUES
                                (?,?,?,CURRENT_TIMESTAMP,'admin')""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, title);
            st.setString(2, image);
            st.setString(3, source);
            st.executeUpdate();
            
        } catch (SQLException e) {
        }
    }
    
    public void updateBlog(String title, String image, String source, int id) {
        String sql = """
                     UPDATE [dbo].[Blog]
                            SET [title] = ?
                           ,[image] = ?
                           ,[source] = ?
                      WHERE id = ?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, title);
            st.setString(2, image);
            st.setString(3, source);
            st.setInt(4, id);
            st.executeUpdate();
            
        } catch (SQLException e) {
        }
    }
}