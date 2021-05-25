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
body, html{width:100%; height:100%;}
table{
	position:absolute; left:50%; top:50%;
	transform:translate(-50%, -50%);
	cellpadding:10px;
	width:600px;
}
th{background-color:rgba(33,33,33,.2);}
td:nth-child(2n){background-color:rgba(99,99,99,.2);}
td:nth-child(2n+1){background-color:rgba(00,57,66,.2);}
</style>
</head>
<body>
<%
	String id=(String)session.getAttribute("id");
	UserDAO udao = new UserDAO();
	UserBean user = udao.readUserDB(id);
%>

<table border="1">
<caption>My page</caption>
<tr> <td>ID</td> <td><%=user.getId() %></td> </tr>
<tr> <td>이름</td> <td><%=user.getName() %></td> </tr>
<tr> <td>그룹</td> <td><%=user.getGroup() %></td> </tr>
<tr> <td>권한</td> <td><%=user.getLev() %></td> </tr>
<tr> <td colspan='2' align='center'>
<input type="button" value="수정하기" onclick="location.href='idx_Jsp.jsp?id=<%=id %>&idx=joinUpdateProcess'">
<input type="button" value="회원탈퇴" onclick="location.href='idx_Jsp.jsp?id=<%=id %>&idx=joinDelete'">
</td></tr>
</table>
</body>
</html>