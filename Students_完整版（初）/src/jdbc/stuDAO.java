
package jdbc;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import charactor.Student;

public class stuDAO {

	public stuDAO() {
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

			String sql = "select count(*) from student1";

			ResultSet rs = s.executeQuery(sql);
			while (rs.next()) {
				total = rs.getInt(1);
			}

			System.out.println("total:" + total);

		} catch (SQLException e) {

			e.printStackTrace();
		}
		return total;
	}

	public void add(Student student) {

		String sql = "insert into student1(sname,sage,ssex,shobby,sschool,smajor) values(?,?,?,?,?,?)";
		try (Connection c = getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {

			ps.setString(1, student.sname);
			ps.setInt(2, student.sage);
			ps.setString(3, student.ssex);
			ps.setString(4, student.shobby);
			ps.setString(5, student.sschool);
			ps.setString(6, student.smajor);

			ps.execute();

			ResultSet rs = ps.getGeneratedKeys();
			if (rs.next()) {
				int id = rs.getInt(1);
				student.id = id;

			}
		} catch (SQLException e) {

			e.printStackTrace();
		}
		
	}

	public void update(Student student) {
		System.out.println(student.sschool);
		String sql = "update student1 set sname= ?, sage = ? , ssex = ? ,shobby=?, sschool=?,smajor=? where id = ?";
		try (Connection c = getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {

			ps.setString(1, student.sname);
			ps.setInt(2, student.sage);
			ps.setString(3, student.ssex);
			// hobby��Ҫsplit����
			ps.setString(4, student.shobby);
			// sschool��smajor��Ҫ���ݿ����Ӹ�ֵ
			ps.setString(5, student.sschool);
			ps.setString(6, student.smajor);
			ps.setInt(7, student.id);
			
			
			ps.execute();

		} catch (SQLException e) {

			e.printStackTrace();
		}

	}

	public void delete(int id) {

		try (Connection c = getConnection(); Statement s = c.createStatement();) {

			String sql = "delete from student1 where id = " + id;

			s.execute(sql);

		} catch (SQLException e) {

			e.printStackTrace();
		}
	}

	public Student get(int id) {
		Student student = null;

		try (Connection c = getConnection(); Statement s = c.createStatement();) {

			String sql = "select * from student1 where id = " + id;
			ResultSet rs = s.executeQuery(sql);

			
			if (rs.next()) {
				student = new Student();
				String sname = rs.getString(2);
				int sage = rs.getInt(3);
				String ssex = rs.getString(4);
				String shobby = rs.getString(5);
				String sschool = rs.getString(6);
				String smajor = rs.getString(7);

				student.sname = sname;
				student.sage = sage;
				student.ssex = ssex;
				student.shobby = shobby;
				student.sschool = sschool;
				student.smajor = smajor;
				student.id = id;
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}
		return student;
	}

	public List<Student> list() {
		return list(0, Short.MAX_VALUE);
	}

	public List<Student> list(int start, int count) {
		List<Student> students = new ArrayList<Student>();

		String sql = "select * from student1 order by id desc limit ?,? ";

		try (Connection c = getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {

			ps.setInt(1, start);
			ps.setInt(2, count);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Student student = new Student();
				int id = rs.getInt(1);
				String sname = rs.getString(2);
				int sage = rs.getInt(3);
				String ssex = rs.getString(4);
				String shobby = rs.getString(5);
				String sschool = rs.getString(6);
				String smajor = rs.getString(7);

			/*	String sql1 = "select * from sschool where id=" + sschool;
				Statement s1 = c.createStatement();
				ResultSet rs1 = s1.executeQuery(sql1);
				// ResultSet rs1 = s.execute(sql1);
				if (rs1.next()) {
					String scname = rs1.getString("scname");
					student.sschool = scname;
				}

				String sql2 = "select * from smajor where id=" + smajor;
				Statement s2 = c.createStatement();
				ResultSet rs2 = s2.executeQuery(sql2);
				// ResultSet rs1 = s.execute(sql1);
				if (rs2.next()) {
					String mname = rs2.getString("mname");
					student.smajor = mname;
				}*/

				student.sname = sname;
				student.sage = sage;
				student.ssex = ssex;
				student.shobby = shobby;
				 student.sschool = sschool;
				 student.smajor = smajor;
				student.id = id;
				students.add(student);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return students;
	}

}
