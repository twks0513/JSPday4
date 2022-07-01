package quiz01;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import DBPKG.DBConnect;

public class Quiz01DAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	public Quiz01DAO() {
		try {
			con = DBConnect.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Quiz01DTO> getStudents() {
		ArrayList<Quiz01DTO> list = new ArrayList<Quiz01DTO>();
		String sql = "select * from student1";
		
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				Quiz01DTO dto = new Quiz01DTO();
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setKor(rs.getInt("kor"));
				dto.setEng(rs.getInt("eng"));
				dto.setMath(rs.getInt("math"));
				list.add(dto);
				
				System.out.println(rs.getString("id"));
				System.out.println(rs.getString("name"));
				System.out.println(rs.getInt("kor"));
				System.out.println(rs.getInt("eng"));
				System.out.println(rs.getInt("math"));
				System.out.println();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public Quiz01DTO getUser(String id) {
		String sql = "select * from student1 where id=?";
		Quiz01DTO dto = new Quiz01DTO();
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setKor(rs.getInt("kor"));
				dto.setEng(rs.getInt("eng"));
				dto.setMath(rs.getInt("math"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
}
