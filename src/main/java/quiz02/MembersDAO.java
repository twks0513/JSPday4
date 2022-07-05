package quiz02;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DBPKG.DBConnect;
import member.MemberDTO;


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
	
	public MembersDTO getUser(String id) {
		String sql="select * from members where id =?";
		MembersDTO dto = new MembersDTO();
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPwd(rs.getString("pwd"));
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
				dto.setTel(rs.getString("tel"));
			}			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return dto;
	}
	
	
	public int delete(String id) {
		String sql ="delete from members where id=?";
		int d = 0;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			d = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return d;
	}
	public int modify(String pwd,String name, String addr, String tel,String id) {
		int m = 0;
		String sql = "update members set pwd=?, name=?,addr=?,tel=? where id=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, pwd);
			ps.setString(2,name);
			ps.setString(3,addr);
			ps.setString(4,tel);
			ps.setString(5,id);
			m = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(m);
		
		return m;
	}	
	
	public int loginCheck(String id, String pwd) {
		String sql = "select * from members where id=?";		
		int num = 0;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				if(pwd.equals(rs.getString("pwd"))){		
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
	
	public int joinCheck(String id, String pwd, String name,String addr,String tel) {
		int r =0;
		String sql = "insert into members values(?,?,?,?,?)";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, pwd);
			ps.setString(3, name);
			ps.setString(4, addr);
			ps.setString(5, tel);
			r = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	return r;
	}
	
}
