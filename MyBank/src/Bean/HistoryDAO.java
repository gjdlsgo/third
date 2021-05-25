package Bean;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class HistoryDAO {
	
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

	
	public void insertHistoryDB(HistoryBean bean) {
		int cnt=0;
		
		try {
			getCon();
			
			String sql="insert into input(slev, id, idate, imoeny, iexa, no) values(?,?,?,?,?,?)";
			st=con.prepareStatement(sql);
			st.setString(1, bean.getTag());
			st.setString(2, bean.getId());
			st.setString(3, bean.getDate());
			st.setInt(4, bean.getMoeny());
			st.setString(5, bean.getExa());
			st.setInt(6, bean.getNo());
			cnt = st.executeUpdate();
			rs.close();
			st.close();
			con.close();
		} catch(Exception e) {
			System.out.println("DB 입력 실패");
		}
		
	}
	
	
	public void insertSaveDB(HistoryBean bean) {
		int cnt=0;
		
		try {
			getCon();
			
			String sql="insert into save(id, sall) values(?,?)";
			st=con.prepareStatement(sql);
			st.setString(1, bean.getId());
			st.setInt(2, bean.getAll());
			cnt = st.executeUpdate();
			rs.close();
			st.close();
			con.close();
		} catch(Exception e) {
			System.out.println("잔액DB 입력 실패");
		}
		
	}
	
	
	public void updateHistoryDB(HistoryBean bean) {
		int cnt=0;
		
		try {
			getCon();
			
			String sql="update input set slev=?, idate=?, imoeny=?, iexa=? where no=?";
			st=con.prepareStatement(sql);
			st.setString(1, bean.getTag());
			st.setString(2, bean.getDate());
			st.setInt(3, bean.getMoeny());
			st.setString(4, bean.getExa());
			st.setLong(5, bean.getNo());
			cnt = st.executeUpdate();
			if(cnt > 0)
				System.out.println("데이터가 성공적으로 업데이트되었습니다.");
			else
				System.out.println("업데이트에 실패하였습니다.");
			st.close();
			con.close();
		} catch(Exception e) {
			System.out.println("DB 수정 실패");
		}
	}
	
	
	public void updateSaveDB(HistoryBean bean) {
		int cnt=0;
		
		try {
			getCon();
			
			String sql="update save set sall=? where id=?";
			st=con.prepareStatement(sql);
			st.setInt(1, bean.getAll());
			st.setString(2, bean.getId());
			cnt = st.executeUpdate();
			if(cnt > 0)
				System.out.println("데이터가 성공적으로 업데이트되었습니다.");
			else
				System.out.println("업데이트에 실패하였습니다.");
			st.close();
			con.close();
		} catch(Exception e) {
			System.out.println("잔액DB 수정 실패");
		}
	}
	
	
	public void deleteHistoryDB(int no) {
		int cnt=0;
		
		try {
			getCon();
			
			String sql="delete input where no=?";
			st=con.prepareStatement(sql);
			st.setInt(1, no);
			cnt = st.executeUpdate();
			if(cnt > 0)
				System.out.println("데이터가 성공적으로 삭제되었습니다.");
			else
				System.out.println("삭제에 실패하였습니다.");
			st.close();
			con.close();
		} catch(Exception e) {
			System.out.println("DB 삭제 실패");
		}
	}
	
	
	public void deleteSaveDB(String id) {
		int cnt=0;
		
		try {
			getCon();
			
			String sql="delete input where id=?";
			st=con.prepareStatement(sql);
			st.setString(1, id);
			cnt = st.executeUpdate();
			if(cnt > 0)
				System.out.println("데이터가 성공적으로 삭제되었습니다.");
			else
				System.out.println("삭제에 실패하였습니다.");
			st.close();
			con.close();
		} catch(Exception e) {
			System.out.println("잔액DB 삭제 실패");
		}
	}
	
	
	public int readSlastDB(String id) {
		int before=0;
		
		try {
			getCon();
			String sql = "select sall from (select rownum as rn, sall from save where id=?) " + 
					"where rn=(select max(rn) from (select rownum as rn, sall from save where id=?))";
			st = con.prepareStatement(sql);
			st.setString(1, id);
			st.setString(2, id);
			rs = st.executeQuery();
			if(rs.next())
				before=rs.getInt("sall");
			
			rs.close();
			st.close();
			con.close();
		} catch (Exception e) {
			System.out.println("최근 잔액 읽기 실패");
		}
		
		return before;
	}
	
	
	public int readSaveDB(String id) {
		HistoryBean bean = new HistoryBean();
		
		try {
			getCon();
			String sql = "select sall from save where id='" + id + "'";
			st = con.prepareStatement(sql);
			rs = st.executeQuery();
			
			if(rs.next())
				bean.setAll(rs.getInt("sall"));
			
			rs.close();
			st.close();
			con.close();
			
		} catch (Exception e) {
			System.out.println("잔액 읽기 실패");
		}
		
		return bean.getAll();
	}
	
	
	public HistoryBean readNoInfo(int no) {
		HistoryBean bean = new HistoryBean();
		
		try {
			getCon();
			
			String sql = "select id, slev, imoeny from input where no=" + no;
			st = con.prepareStatement(sql);
			rs = st.executeQuery();
			if(rs.next()) {
				bean.setId(rs.getString("id"));
				bean.setTag(rs.getString("slev"));
				bean.setMoeny(rs.getInt("imoeny"));
			}
			
			rs.close();
			st.close();
			con.close();
		} catch (Exception e) {
			System.out.println("ID 읽기 실패");
		}
		
		return bean;
	}
	
	
	public List<HistoryBean> readHistoryDB(String id, int pageNo, int pageLine, String cond, String ctext) {
		List<HistoryBean> list = new ArrayList<HistoryBean>();
		
		try {
			getCon();
			int end = pageNo * pageLine;
			int start = end - pageLine + 1;
			
			String whereCondition = "";
			if(cond != null & cond != " ") {
				whereCondition = " and " + cond + "=To_date('" + ctext + "', 'YYYY-MM-DD')";
			}
			
			String sql = "select b.* from "
					+ "(select rownum rn, a.* from "
					+ "(select * from input natural join genre where id='"+ id +"'"
					+ whereCondition + " order by no desc)a)b"
					+ " where b.rn between " + start + " and " + end;
			st = con.prepareStatement(sql);
			rs = st.executeQuery();
			while(rs.next()) {
				HistoryBean bean = new HistoryBean();
				bean.setNo(rs.getInt("no"));
				bean.setTag(rs.getString("sgen"));
				bean.setDate(rs.getString("idate"));
				bean.setMoeny(rs.getInt("imoeny"));
				bean.setExa(rs.getString("iexa"));
				list.add(bean);
			}
			
			rs.close();
			st.close();
			con.close();
		} catch(Exception e) {
			System.out.println("DB 읽기 실패");
		}
		
		return list;
	}
	
	
	public List<HistoryBean> readTriggerDB(int pageNo, int pageLine, String cond, String ctext) {
		List<HistoryBean> list = new ArrayList<HistoryBean>();
		
		try {
			getCon();
			int end = pageNo * pageLine;
			int start = end - pageLine + 1;
			
			String whereCondition = "";
			if(cond != null & cond != "") {
				whereCondition = "where " + cond + "=To_date('" + ctext + "', 'YYYY-MM-DD') ";
			}
			
			String sql = "select b.* from "
					+ "(select rownum rn, a.* from "
					+ "(select * from trg_input_tbl "+ whereCondition + "order by idate desc)a)b"
					+ " where b.rn between " + start + " and " + end;
			st = con.prepareStatement(sql);
			rs = st.executeQuery();
			while(rs.next()) {
				HistoryBean bean = new HistoryBean();
				bean.setNo(rs.getInt("no"));
				bean.setId(rs.getString("id"));
				bean.setTag(rs.getString("slev"));
				bean.setDate(rs.getString("idate"));
				bean.setMoeny(rs.getInt("imoeny"));
				bean.setExa(rs.getString("iexa"));
				list.add(bean);
			}
			
			rs.close();
			st.close();
			con.close();
		} catch(Exception e) {
			System.out.println("DB 읽기 실패");
		}
		
		return list;
	}
	
	
	public List<HistoryBean> readHistoryAllDB(UserBean user, int pageNo, int pageLine) {
		List<HistoryBean> list = new ArrayList<HistoryBean>();
		
		try {
			getCon();
			int end = pageNo * pageLine;
			int start = end - pageLine + 1;
			
			String sql = "select b.* from "
					+ "(select rownum rn, a.* from "
					+ "(select * from input natural join genre where id=(select id from member where gname='" 
					+ user.getGroup() + "') order by no desc)a" + ")b"
					+ " where b.rn between " + start + " and " + end;
			st = con.prepareStatement(sql);
			rs = st.executeQuery();
			while(rs.next()) {
				HistoryBean bean = new HistoryBean();
				bean.setNo(rs.getInt("no"));
				bean.setId(rs.getString("id"));
				bean.setTag(rs.getString("sgen"));
				bean.setDate(rs.getString("idate"));
				bean.setMoeny(rs.getInt("imoeny"));
				bean.setExa(rs.getString("iexa"));
				list.add(bean);
			}
			
			rs.close();
			st.close();
			con.close();
		} catch(Exception e) {
			System.out.println("전체 DB 읽기 실패");
		}
		
		return list;
	}
	
	
	public int totalCnt() {
		int cnt=0;
		
		String sql = "select count(no) from input";
		try {
			getCon();
			st = con.prepareStatement(sql);
			rs = st.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
			
			rs.close();
			st.close();
			con.close();
			
		} catch (Exception e) {
			System.out.println("레코드수 읽기 실패");
		} 
		
		return cnt;
	}
	
	
	public int maxCnt() {
		int cnt=0;

		String sql = "select max(no) from input";
		try {
			getCon();
			st = con.prepareStatement(sql);
			rs = st.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
			
			rs.close();
			st.close();
			con.close();
			
		} catch (Exception e) {
			System.out.println("no최대값 읽기 실패");
		} 
		
		return cnt;
	}
}
