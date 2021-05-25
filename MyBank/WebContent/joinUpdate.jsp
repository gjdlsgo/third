<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Bean.UserBean" %>
<%@ page import="Bean.UserDAO" %>
<% request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="user" class="Bean.UserBean" />
<jsp:setProperty property="*" name="user"/>
<%
	UserDAO udao = new UserDAO();
	udao.updateUserDB(user);
	request.setAttribute("target", "mypage");
%>
<jsp:forward page="template.jsp" />
</body>
</html>