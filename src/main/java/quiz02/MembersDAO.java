package quiz02;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DBPKG.DBConnect;


public class MembersDAO {

	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	public MembersDAO() {
		try {
			con = DBConnect.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public ArrayList<MembersDTO> getmembers() {
		ArrayList<MembersDTO> list = new ArrayList<MembersDTO>();
		String sql = "select * from members";
				
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				MembersDTO dto = new MembersDTO();
				dto.setId(rs.getString("id"));
				dto.setPwd(rs.getString("pwd"));
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
				dto.setTel(rs.getString("tel"));
				list.add(dto);			
			}			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return list;
	}
	public MembersDTO getName(String id) {
		String sql = "select * from members where id =?";
		MembersDTO dto = new MembersDTO();		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				dto.setName(rs.getString("name"));	
				dto.setId(rs.getString("id"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public int loginCheck(String id, String pwd) {
		String sql = "select * from members where id=?";
		String sql2 = "select * from members where id=? and pwd=?";
		int num = 0;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				if(rs.getString("id").equals(id))
				ps = con.prepareStatement(sql2);
				ps.setString(1, id);
				ps.setString(2, pwd);
				rs = ps.executeQuery();
				if(rs.next()) {
					System.out.println("로그인 성공");
					num = 1;
				}else {
					System.out.println("비밀번호실패");
					num = -1;
				}
			}else {
				System.out.println("아이디실패");
				num = -2;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return num;
	}
	
}
