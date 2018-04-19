package jdbc;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


import charactor.Smajor;
import charactor.Sschool;

public class schDAO {
	public schDAO() {
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
		int total = 0;int total2 = 0;
		try (Connection c = getConnection(); Statement s = c.createStatement();) {

			String sql = "select count(*) from sschool1";
		//	String sql2 = "select count(*) from sschool1";
		ResultSet rs = s.executeQuery(sql);
		//	Statement s2 = c.createStatement();
		//	ResultSet rs2 = s2.executeQuery(sql2);
			while (rs.next()) {
				//total=total+1;
				total2 = rs.getInt(1);
			}
		//	while (rs.next()) {
		//		total2 = rs.getInt(1);
		//	}

			//System.out.println("total:" + total);
			System.out.println("total2:" + total2);

		} catch (SQLException e) {

			e.printStackTrace();
		}
		return total2;
	}
	
	public List<Smajor> getMajor(String scinfor) {
		System.out.println(scinfor+"77777777");
		List<Smajor> smajors = new ArrayList<Smajor>();
	//	request.setCharacterEncoding("UTF-8");
	  //  String sql2 = "select * from smajor1 where scinfor like '%" + scinfor + "%'";
	    String sql = "select * from smajor1 where scinfor ='"+scinfor+"'";
	   try (Connection c = getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {

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
	public List<Sschool> list(int start, int count) {
		 List<Sschool> sschools = new ArrayList<Sschool>();


			String sql = "select * from sschool1  limit ?,? ";

			try (Connection c = getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {

				ps.setInt(1, start);
				ps.setInt(2, count);

				ResultSet rs = ps.executeQuery();

				while (rs.next()) {
					Sschool sschool = new Sschool();
					
					String scname = rs.getString("scname");
					
					sschool.scname = scname;
					
					sschools.add(sschool);
				}
			} catch (SQLException e) {

				e.printStackTrace();
			}
			return sschools;
		

	}}
