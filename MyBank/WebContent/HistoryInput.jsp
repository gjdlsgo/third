<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
body,html{width:100%, height:100%}  
table{
	position:absolute; left:50%; top:50%;
	transform:translate(-50%, -50%);
	cellpadding:10px;
	height:400px;
}
</style>
<script>
function check() {
	if(fm.moeny.value<0){
		alert('0원이상을 입력하세요');
		fm.moeny.focus();
		return false;
	}
	
	return true;
}
</script>
</head>
<body>
<form action="HistorySave.jsp" name='fm' onsubmit='return check()'>
<table>
	<tr>
		<td>날짜</td><td></td>
		<td><input type="date" name="date"></td>
	</tr>&nbsp;
	<tr>
		<td>분류</td><td></td>
		<td> <select name="tag" size="1" >
		<option value="1" selected>입금</optin>
		<option value="2">출금</option>
		<option value="3">투자</option>
		</select></td>
	</tr>&nbsp;
	<tr>
		<td>금액</td><td></td>
		<td> <input type=number name=moeny value='0'/></td>
	</tr>&nbsp;
	<tr> <td>설명</td><td></td>
		<td> <input type="text" name="exa"></td>
	</tr>&nbsp;
	<tr>
		<td colspan="3" align="center">
		<button type='submit'>등록하기</button>
		<button type='reset'>취소하기</button>
		</td>
	</tr>
</table>
</form>
</body>
</html>