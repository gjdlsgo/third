<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Bean.UserBean" %>
<%@ page import="Bean.UserDAO" %>
<%@ page import="Bean.HistoryDAO" %>
<%@ page import="Bean.HistoryBean" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="Bean.UserBean" />
<jsp:setProperty property="*" name="user" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	UserDAO udao = new UserDAO();
	HistoryDAO hdao = new HistoryDAO();
	HistoryBean history = new HistoryBean();
	history.setId(user.getId());
	udao.insertUserDB(user);
	hdao.insertSaveDB(history);
	request.setAttribute("id", user.getId());
	request.setAttribute("target", "join_result");
%>
<jsp:forward page="template.jsp" />
</body>
</html>