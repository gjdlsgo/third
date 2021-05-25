<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Bean.UserBean" %>
<%@ page import="Bean.UserDAO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
table{position : absolute; left:50%; top:50%; transform:translate(-50%, -50%);
	border-spacing:20px;}
</style>
</head>
<body>
<form action="login.jsp" method=post name=fm>
<table>
	<tr>
		<td id='id'>아이디</td>
		<td> <input type=text name=id></td>
	</tr>
	<tr> <td>패스워드</td>
		<td> <input type="pw" name="pw"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
		<input type="submit" value="로그인"><br><br>
		<a href='idx_Jsp.jsp?idx=joinForm'>회원가입 페이지로</a>
		</td>
	</tr>
</table>
</form>
</body>
</html>