<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Bean.UserBean" %>
<%@ page import="Bean.UserDAO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	String id=request.getParameter("id");
	String pw=request.getParameter("pw");
	UserDAO udao = new UserDAO();
	UserBean user = udao.readUserDB(id);
	if(pw.equals(user.getPw())){
		session.setAttribute("id", id);
		session.setAttribute("pw", pw);
		session.setAttribute("lev", user.getLev());
		request.setAttribute("target", "home");
	} else
		request.setAttribute("target", "LoginForm");
%>
<jsp:forward page="template.jsp" />
</body>
</html>