<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Bean.HistoryBean" %>
<%@ page import="Bean.HistoryDAO" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%! int session_pLine = 0; %>
<%
	if(session.getAttribute("pageLine")!=null){
		session_pLine = (int)session.getAttribute("pageLine");
	} else {
		session_pLine = 5;
	}
%>
<h4>내 가계부 보기</h4>
<form action="HistoryList.jsp" id="fm" >
<table>
<tr>
	<td width="460">
	검색조건
		<select size="1" name="cond">
			<option value="">전체</option>
			<option value="idate">날짜</option>
		</select>
		<input type="date" name="ctext">
		<input type="submit" value="검색">
	</td>
	<td>
		페이지당 줄수
			<select size="1" name="line">
		<% if(session_pLine==5) { %>
				<option selected>5</option>
				<option >10</option>
		<%} else { %>
				<option>5</option>
				<option selected>10</option>
		<%} %>
			</select>
	</td>
	</tr>
</table>
<table border="1"> 
	<tr>
		<td width=40>순번</td>
		<td width=80>분류</td>
		<td width=80>날짜</td>
		<td width=80>금액</td>
		<td width=80>설명</td>
	</tr>
<%
	List historylist = (List)request.getAttribute("list");
	for(int i=0; i<historylist.size(); i++) {
		HistoryBean bean = (HistoryBean)historylist.get(i);
		out.println("<tr><td><a href='HistoryDelete.jsp?No=" + bean.getNo() + "'>"
				+ bean.getNo() +"</a></td>");
		out.println("<td>" + bean.getTag() + "</td>");
		out.println("<td>" + bean.getDate() + "</td>");
		out.println("<td>" + bean.getMoeny() + "</td>");
		out.println("<td>" + bean.getExa() + "</td></tr>");
	}
	
%>
	<tr><td colspan="5" align="center"> 잔액 : <%=request.getAttribute("all") %> </td></tr>
</table>
<table>
	<tr>
	<td width="600" align="center">
<%
	int rowcnt = (int)request.getAttribute("rowcnt");
	for(int pcnt=1; pcnt<=rowcnt; pcnt++) {%>
		<a href='HistoryList.jsp?SEQ_NO=<%=pcnt %>'>[<%=pcnt %>]</a>
<%	} %>
	<a href='HistoryInput.jsp'><input type="button" value="입력"></a></td>
	</tr>
</table>
</form>
</body>
</html>