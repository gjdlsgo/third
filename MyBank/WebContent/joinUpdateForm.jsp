<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Bean.UserBean" %>
<% request.setCharacterEncoding("UTF-8");%>
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
<form action="joinUpdate.jsp" method="post" name="form">
<table>
<caption>회원 정보 수정</caption>
<tr> <td>ID</td> <td><input type="text" name="id" size="10" readonly value=${user.getId()} ></tr>
<tr> <td>이름</td> <td><input type="text" name="name" size="10" value=${user.getName()} ></td> </tr>
<tr> <td>그룹</td> <td><input type="text" name="group" size="10" readonly value=${user.getGroup()} ></td> </tr>
<tr> <td>권한</td> <td><input type="radio" name="lev" value="1" checked>그룹관리
<input type="radio" name="lev" value="2">내 정보만</td> </tr>
<tr><td colspan="2" align="center"><input type="submit" value="수정하기"></td></tr>
</table>
</form>
</body>
</html>