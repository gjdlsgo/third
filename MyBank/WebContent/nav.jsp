<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<nav>
	<ul>
		<li><a href="idx_Jsp.jsp?idx=home">Home</a></li>
<%
	Object s_name = session.getAttribute("name");
	Object s_id = session.getAttribute("id");
	String lev = (String)session.getAttribute("lev");
	session.setAttribute("id", s_id);
	if(session.getAttribute("id")==null){
		out.println("<li><a href='idx_Jsp.jsp?idx=LoginForm'>로그인</a></li>");
		out.println("<li><a href='idx_Jsp.jsp?idx=joinForm'>회원가입</a></li>");
	} else {
		if(lev.equals("1")) {
			out.println("<li><a href='idx_Jsp.jsp?idx=mypage'>마이페이지</a></li>");
			out.println("<li><a href='idx_Jsp.jsp?idx=HistoryInput'>가계부 입력</a></li>");
			out.println("<li><a href='idx_Jsp.jsp?idx=HistoryList'>내 가계부 조회</a></li>");
			out.println("<li><a href='idx_Jsp.jsp?idx=GroupList'>그룹 가계부 조회</a</li>");
		} else {
			out.println("<li><a href='idx_Jsp.jsp?idx=mypage'>마이페이지</a></li>");
			out.println("<li><a href='idx_Jsp.jsp?idx=HistoryInput'>가계부 입력</a></li>");
			out.println("<li><a href='idx_Jsp.jsp?idx=HistoryList'>내 가계부 조회</a></li>");
		}
		out.println("<li><a href='idx_Jsp.jsp?idx=TriggerList'>삭제 내역 조회</a</li>");
		out.println("<li><a href='logout.jsp'>로그아웃</a></li>");
		
	}
%>
	</ul>
</body>
</html>