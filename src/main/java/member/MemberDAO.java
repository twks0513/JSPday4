package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import DBPKG.DBConnect;

public class MemberDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	public MemberDAO() {
		try {
			con = DBConnect.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public ArrayList<MemberDTO> getNewst(){
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		System.out.println("연결성공");
		String sql = "select * from Newst";
				
		try {
			ps = con.prepareStatement(sql); // 명령어를 얻어 올 수 있는 전송객체
			rs = ps.executeQuery();
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setAge(rs.getInt("age"));
				list.add(dto);
				
				System.out.println("id : "+rs.getString("id"));
				System.out.println("name : "+rs.getString("name"));
				System.out.println("age : "+rs.getInt("age"));
				System.out.println("----------------------");				
			}			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return list;
			
		
	}
	
	public MemberDTO getUser(String id) {
		System.out.println("id : "+id);
		String sql = "select * from newst where id=?";
		MemberDTO dto = new MemberDTO();
				
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setAge(rs.getInt("age"));
				System.out.println(rs.getString("id"));
				System.out.println(rs.getString("name"));
				System.out.println(rs.getInt("age"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
		
	}
	
	
}
