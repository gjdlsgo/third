package Bean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {
	Connection con;
	PreparedStatement st;
	ResultSet rs;
	
	public void getCon() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "mine", "mine");
	
		} catch (Exception e) {
			System.out.println("DB 접근 실패");
		}
	}
	
	
	public boolean idcheck(String id) {
		try {
			getCon();
			String sql = "select pw from member where id = '"+ id + "'";
			st=con.prepareStatement(sql);
			rs=st.executeQuery();	
			if(rs.next()) 
				return true;
			
			else
				return false;
			
		}
		catch(Exception e) {
			System.out.println("아이디 read 오류");
		}
	
		return false;
	}
	
	
	public int insertUserDB(UserBean user) {
		int cnt=0;
		
		try {
			getCon();
			String sql="select * from member where id='"+user.getId()+"'";
			st = con.prepareStatement(sql);
			rs = st.executeQuery();
			
			if(!(rs.next())) {
				sql="insert into member(id, pw, name, glev, gname) values(?,?,?,?,?)";
				st=con.prepareStatement(sql);
				st.setString(1, user.getId());
				st.setString(2, user.getPw());
				st.setString(3, user.getName());
				st.setString(4, user.getLev());
				st.setString(5, user.getGroup());
				cnt = st.executeUpdate();
			} 
			
			rs.close();
			st.close();
			con.close();
			
		} catch(Exception e) {
			System.out.println("DB 추가 실패");
		}
		
		return cnt;
	}
	
	
	public int updateUserDB(UserBean user) {
		int cnt=0;
		
		try {
			getCon();
			String sql = "update member set name='"+user.getName()+"', glev='"+user.getLev()+
					"' where id='"+user.getId()+"'";
			st = con.prepareStatement(sql);
	/*		st.setString(1, user.getName());
			st.setString(2, user.getLev());
			st.setString(3, user.getId());*/
			cnt=st.executeUpdate();
			st.close();
			con.close();
			
		} catch(Exception e) {
			System.out.println("DB 수정 실패");
		}
		
		return cnt;
	}
	
	
	public int deleteUserDB(String id) {
		int cnt=0;
		
		try {
			getCon();
		
			String sql="delete member where id='"+id+"'";
			st=con.prepareStatement(sql);
		/*	st.setString(1, id);*/
			cnt=st.executeUpdate();
			st.close();
			con.close();
			
		} catch(Exception e) {
			System.out.println("DB 삭제 실패");
		}
		
		return cnt;
	}
	
	
	public UserBean readUserDB(String id) {
		UserBean user = new UserBean();
		
		try {
			getCon();
			String sql = "select * from member natural join grade where id='"+id+"'";
			st = con.prepareStatement(sql);
			rs = st.executeQuery();
			
			if(rs.next()) {
				user.setId(rs.getString("id"));
				user.setName(rs.getString("name"));
				user.setPw(rs.getString("pw"));
				user.setLev(rs.getString("gright"));
				user.setGroup(rs.getString("gname"));
			}
			
			rs.close();
			st.close();
			con.close();
			
		} catch(Exception e) {
			System.out.println("DB 읽기 실패");
		}
		
		return user;
	}
	
	
	public List<UserBean> readAllUser(){
		List<UserBean> list = new ArrayList<UserBean>();
		
		try {
			getCon();
			String sql = "select * from member natural join grade";
			st = con.prepareStatement(sql);
			rs = st.executeQuery();
			
			while(rs.next()) {
				UserBean user = new UserBean();
				user.setId(rs.getString("id"));
				user.setName(rs.getString("name"));
				user.setPw(rs.getString("pw"));
				user.setLev(rs.getString("gright"));
				user.setGroup(rs.getString("gname"));
				list.add(user);
			}
			
			rs.close();
			st.close();
			con.close();
			
		} catch(Exception e) {
			System.out.println("전체 DB 읽기 실패");
		}
		
		return list;
		
	}
 
}
