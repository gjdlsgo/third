<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Bean.HistoryDAO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="history" class="Bean.HistoryBean" />
<jsp:setProperty property="*" name="history" />
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("id");
	HistoryDAO hdao = new HistoryDAO();
	int no = hdao.maxCnt() + 1;
	int before=hdao.readSlastDB(id);
	history.setNo(no);
	history.setId(id);
	if(history.getTag().equals("1")){
		history.setAll(before+history.getMoeny());
	} else {
		history.setAll(before-history.getMoeny());
	}
	hdao.insertHistoryDB(history);
	hdao.updateSaveDB(history);
	
	request.setAttribute("target", "HistoryList");
%>
<jsp:forward page="template.jsp" />
</body>
</html>