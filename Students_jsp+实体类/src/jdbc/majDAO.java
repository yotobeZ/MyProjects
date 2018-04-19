package jdbc;

import charactor.Smajor;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class majDAO {
    public majDAO() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public Connection getConnection() throws SQLException {
        return DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/school?characterEncoding=UTF-8", "root",
                "admin");
    }

    public int getTotal() {
        int total = 0;
        try (Connection c = getConnection(); Statement s = c.createStatement();) {

            String sql = "select * from smajor1";

            ResultSet rs = s.executeQuery(sql);
            while (rs.next()) {
                total = total + 1;
            }

            System.out.println("total:" + total);

        } catch (SQLException e) {

            e.printStackTrace();
        }
        return total;
    }

    public List<Smajor> list(int start, int count) {
        List<Smajor> smajors = new ArrayList<Smajor>();


        String sql = "select * from smajor1 order by id asc limit ?,? ";

        try (Connection c = getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {

            ps.setInt(1, start);
            ps.setInt(2, count);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Smajor smajor = new Smajor();

                String mname = rs.getString("mname");

                smajor.mname = mname;


                smajors.add(smajor);
            }
        } catch (SQLException e) {

            e.printStackTrace();
        }
        return smajors;


    }

}
