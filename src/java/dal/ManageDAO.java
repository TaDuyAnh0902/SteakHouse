/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.ParseException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import model.Category;

/**
 *
 * @author kitai
 */

public class ManageDAO extends ProductsDAO{
    public List<Integer> getCategories() {
        List<Integer> list = new ArrayList<>();
        try {
            String sql = "select distinct cid from products";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(rs.getInt("cid"));
            }
        } catch (SQLException e) {
        }
        return list;
    }
    public int getTotalProductsWithCategory(int name) {
        String sql = """
                     select count(*) from products
                     where cid like ?
                     """;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + name + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }

    public Map<String, Integer> getDataProductsCategories() {
        Map<String, Integer> data = new HashMap<>();
        List<Integer> list = getCategories();
        for (int x : list) {
            Category c = getCategoryById(x);
            int count = getTotalProductsWithCategory(x);
            data.put(c.getName(), count);
        }
        return data;
    }
    
    public int totalCategory() {
        String sql = "SELECT COUNT(*) AS total_rows FROM [dbo].[categories]";
        int count = 0;

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt("total_rows");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return count;
    }
    public int totalProduct(){
        String sql = "SELECT COUNT(*) AS total_rows FROM [dbo].[products]";
        int count=0;
        
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt("total_rows");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return count;
    }
    public int totalUser(){
        String sql = "SELECT COUNT(*) AS total_rows FROM [dbo].[account]";
        int count=0;
        
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt("total_rows");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return count;
    }
    public int totalOrder(){
        String sql = "SELECT COUNT(*) AS total_rows FROM [dbo].[ordermanage]";
        int count=0;
        
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt("total_rows");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return count;
    }
    
    public List<String> getDateFromOrderManage() {
        List<String> list = new ArrayList<>();
        try {
                String sql = """
                         SELECT DISTINCT [date]
                         FROM OrderManage
                         WHERE [date] >= DATEADD(WEEK, DATEDIFF(WEEK, 0, GETDATE()), 0)
                           AND [date] < DATEADD(WEEK, DATEDIFF(WEEK, 0, GETDATE()) + 1, 0)
                         ORDER BY [date] DESC;""";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(rs.getString("date"));
            }
        } catch (SQLException e) {
        }
        
        return list;
    }
    
    public List<String> getMonthFromOrderManage() {
        List<String> list = new ArrayList<>();
        try {
            String sql = """
                         SELECT DISTINCT [date]
                         FROM OrderManage
                         WHERE [date] >= DATEFROMPARTS(YEAR(GETDATE()), MONTH(GETDATE()), 1)
                           AND [date] < DATEADD(MONTH, 1, DATEFROMPARTS(YEAR(GETDATE()), MONTH(GETDATE()), 1))
                         ORDER BY [date] DESC;""";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(rs.getString("date"));
            }
        } catch (SQLException e) {
        }
        
        return list;
    }
    
    public List<String> sortDates(List<String> dateStrings) {
        // Định dạng ngày
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        // Danh sách các ngày ở dạng LocalDate
        List<LocalDate> dates = new ArrayList<>();
        for (String dateString : dateStrings) {
            LocalDate date = LocalDate.parse(dateString, formatter);
            dates.add(date);
        }

        // Sắp xếp danh sách ngày
        Collections.sort(dates);

        // Chuyển đổi danh sách LocalDate thành danh sách chuỗi
        List<String> sortedDateStrings = new ArrayList<>();
        for (LocalDate date : dates) {
            sortedDateStrings.add(date.format(formatter));
        }

        return sortedDateStrings;
    }
    public int getTotalOrdersByDay(String name) {
        String sql = """
                     select count(*) from OrderManage
                     where [date] like ?
                     """;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + name + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }

    public Map<String, Integer> getDataOrderManage() {
        Map<String, Integer> data = new HashMap<>();
        List<String> list = getDateFromOrderManage();
        for (String x : list) {
            int count = getTotalOrdersByDay(x);
            data.put(x, count);
        }
        return sortMapByDate(data);
    }
    
    public Map<String, Integer> getDataOrderManageByMonth() {
        Map<String, Integer> data = new HashMap<>();
        List<String> list = getMonthFromOrderManage();
        for (String x : list) {
            int count = getTotalOrdersByDay(x);
            data.put(x, count);
        }
        return sortMapByDate(data);
    }
    
    public static Map<String, Integer> sortMapByDate(Map<String, Integer> dateMap) {
        // Định dạng ngày
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        // Tạo danh sách các mục từ Map
        List<Map.Entry<String, Integer>> entries = new ArrayList<>(dateMap.entrySet());

        // Sắp xếp danh sách các mục theo khóa (ngày)
        Collections.sort(entries, (Map.Entry<String, Integer> entry1, Map.Entry<String, Integer> entry2) -> {
            LocalDate date1 = LocalDate.parse(entry1.getKey(), formatter);
            LocalDate date2 = LocalDate.parse(entry2.getKey(), formatter);
            return date2.compareTo(date1);
        });

        // Tạo LinkedHashMap để giữ các mục đã sắp xếp
        Map<String, Integer> sortedMap = new LinkedHashMap<>();
        for (Map.Entry<String, Integer> entry : entries) {
            sortedMap.put(entry.getKey(), entry.getValue());
        }

        return sortedMap;
    }
    
    public static Map<String, Double> sortMapByDate2(Map<String, Double> dateMap) {
        // Định dạng ngày
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        // Tạo danh sách các mục từ Map
        List<Map.Entry<String, Double>> entries = new ArrayList<>(dateMap.entrySet());

        // Sắp xếp danh sách các mục theo khóa (ngày) theo thứ tự giảm dần
        Collections.sort(entries, (entry1, entry2) -> {
            LocalDate date1 = LocalDate.parse(entry1.getKey(), formatter);
            LocalDate date2 = LocalDate.parse(entry2.getKey(), formatter);
            return date2.compareTo(date1);
        });

        // Tạo LinkedHashMap để giữ các mục đã sắp xếp
        Map<String, Double> sortedMap = new LinkedHashMap<>();
        for (Map.Entry<String, Double> entry : entries) {
            sortedMap.put(entry.getKey(), entry.getValue());
        }

        return sortedMap;
    }
    public double getTotalMoneyByDay(String date) {
        String sql = """
                     SELECT SUM(totalmoney) as total_money
                     FROM OrderManage
                     WHERE date = ?
                     """;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1,date);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getDouble("total_money");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }

    public Map<String, Double> getDataRevenue() {
        Map<String, Double> data = new HashMap<>();
        List<String> list = getDateFromOrderManage();
        for (String x : list) {
            double money = getTotalMoneyByDay(x);
            data.put(x, money);
        }
        return sortMapByDate2(data);
    }
    
    public Map<String, Double> getDataRevenueByMonth() {
        Map<String, Double> data = new HashMap<>();
        List<String> list = getMonthFromOrderManage();
        for (String x : list) {
            double money = getTotalMoneyByDay(x);
            data.put(x, money);
        }
        return sortMapByDate2(data);
    }
    
    public String totalMoneyToday() {
        String sql = "SELECT * FROM OrderManage WHERE CAST(date AS DATE) = CAST(GETDATE() AS DATE);";
        DecimalFormat decimalFormat = new DecimalFormat("#,###,000");
        double total =0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                total += rs.getDouble("totalmoney");
                
            }
            st.executeUpdate();
        } catch (SQLException e) {
        }
        
        return decimalFormat.format(total);
    }
    
    public String totalMoneyYesterday() {
        String sql = "SELECT * FROM OrderManage WHERE CAST(date AS DATE) = CAST(DATEADD(DAY, -1, GETDATE()) AS DATE);";
        DecimalFormat decimalFormat = new DecimalFormat("#,###,000");
        double total =0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                total += rs.getDouble("totalmoney");
                
            }
            st.executeUpdate();
        } catch (SQLException e) {
        }
        
        return decimalFormat.format(total);
    }
    
    public String totalMoneyThisWeek() {
        String sql = """
                     SELECT * 
                       FROM OrderManage 
                       WHERE DATEPART(ISO_WEEK, date) = DATEPART(ISO_WEEK, GETDATE()) 
                         AND DATEPART(YEAR, date) = DATEPART(YEAR, GETDATE());""";
        DecimalFormat decimalFormat = new DecimalFormat("#,###,000");
        double total =0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                total += rs.getDouble("totalmoney");
                
            }
            st.executeUpdate();
        } catch (SQLException e) {
        }
        
        return decimalFormat.format(total);
    }
    
    public String totalMoneyLastWeek() {
        String sql = """
                       SELECT * 
                     FROM OrderManage 
                     WHERE DATEPART(ISO_WEEK, date) = DATEPART(ISO_WEEK, DATEADD(WEEK, -1, GETDATE())) 
                       AND DATEPART(YEAR, date) = DATEPART(YEAR, DATEADD(WEEK, -1, GETDATE()));""";
        DecimalFormat decimalFormat = new DecimalFormat("#,###,000");
        double total =0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                total += rs.getDouble("totalmoney");
                
            }
            st.executeUpdate();
        } catch (SQLException e) {
        }
        
        return decimalFormat.format(total);
    }
    
    public String totalMoneyThisMonth() {
        String sql = """
                     SELECT * 
                     FROM OrderManage 
                     WHERE DATEPART(MONTH, date) = DATEPART(MONTH, GETDATE()) 
                       AND DATEPART(YEAR, date) = DATEPART(YEAR, GETDATE());""";
        DecimalFormat decimalFormat = new DecimalFormat("#,###,000");
        double total =0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                total += rs.getDouble("totalmoney");
                
            }
            st.executeUpdate();
        } catch (SQLException e) {
        }
        
        return decimalFormat.format(total);
    }
    
    public String totalMoneyLastMonth() {
        String sql = """
                       SELECT * 
                     FROM OrderManage 
                     WHERE DATEPART(MONTH, date) = DATEPART(MONTH, DATEADD(MONTH, -1, GETDATE())) 
                       AND DATEPART(YEAR, date) = DATEPART(YEAR, DATEADD(MONTH, -1, GETDATE()));""";
        DecimalFormat decimalFormat = new DecimalFormat("#,###,000");
        double total =0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                total += rs.getDouble("totalmoney");
                
            }
            st.executeUpdate();
        } catch (SQLException e) {
        }
        
        return decimalFormat.format(total);
    }
    
    public static String calculateDifference(String numStr1, String numStr2) throws ParseException {
        // Tạo một đối tượng DecimalFormatSymbols
        DecimalFormatSymbols symbols = new DecimalFormatSymbols();
        symbols.setGroupingSeparator(',');
        
        // Tạo một đối tượng DecimalFormat để phân tích chuỗi thành số
        DecimalFormat decimalFormat = new DecimalFormat("#,###", symbols);
        
        // Phân tích các chuỗi thành số
        Number number1 = decimalFormat.parse(numStr1);
        Number number2 = decimalFormat.parse(numStr2);
        
        // Tính hiệu
        double difference = number1.doubleValue() - number2.doubleValue();
        
        // Định dạng kết quả
        return decimalFormat.format(difference);
    }
    
    public String CompareTwoDates() throws ParseException{
        return calculateDifference(totalMoneyToday(),totalMoneyYesterday());
    }
    public String CompareTwoWeek() throws ParseException{
        return calculateDifference(totalMoneyThisWeek(),totalMoneyLastWeek());
    }
    public String CompareTwoMonth() throws ParseException{
        return calculateDifference(totalMoneyThisMonth(),totalMoneyLastMonth());
    }
}
