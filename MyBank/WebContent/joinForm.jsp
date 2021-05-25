<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
 <head>
  <meta charset="utf-8" />
  <title> 회원정보 입력 양식 </title>
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
    function id_search(){
    	theURL = "id.jsp";
    	window.open(theURL,'id_check','width=500,height=200');
    }
 </script>
 <script>
 function check() {
 	var regExp = /^[a-z][0-9a-z]*$/g;
 	var string = form.id.value;
 	
 	if(!regExp.test(string)){
 		alert('올바른 아이디를 입력하세요.\n영문소문자+숫자조합');
 		form.id.focus();
 		return false;		
 	}
 	if(!form.pw.value){
 		alert('비밀번호를 입력하세요.');
 		form.pw.focus();
 		return false;		
 	}
 	if(!form.name.value){
 		alert('이름을 입력하세요.');
 		form.name.focus();
 		return false;		
 	}
 	return true;
 } 
</script>

 </head>

 <BODY> 
   <FORM ACTION="join.jsp" METHOD=post name="form" onsubmit="return check()">   
	<TABLE>     
	  <tr><td COLSPAN="2" ALIGN="center"><h2>회원 정보 입력</h2></td></tr>   
	  <TR>   
	   <TD> 아이디 </TD>   
	   <TD> <INPUT TYPE="text" NAME="id" SIZE="10" readonly> 
	   		<INPUT TYPE="button" value="아이디 생성"  onclick="id_search()"></TD> 
	  <TR>   
	   <TD> 이름 </TD>    
	   <TD> <INPUT TYPE="text" NAME="name" SIZE="10"></TD> 
	   </TR> <TR>   <TD> 암호 </TD>   
	   <TD> <INPUT TYPE="password" NAME="pw" SIZE="10"></TD> 
	  </TR> 
	  <TR>   
	   <TR>   
	   <TD> 그룹설정 </TD>   
	   <TD> <input type='text' name="group" size="10"> </TD>
	  </TR>
	  <TR>   
	   <TD> 권한설정 </TD>   
	   <TD> <INPUT TYPE="radio" NAME="lev" VALUE="1" CHECKED>그룹 관리&nbsp;&nbsp;       
	        <INPUT TYPE="radio" NAME="lev" VALUE="2">내 정보 관리</TD> 
	  </TR> 
	  <TR>   
	   <TD COLSPAN="2" ALIGN="center"> <INPUT TYPE="submit" VALUE="등록하기">
	      <INPUT TYPE="reset" VALUE="취소하기"> 
       </TD>  
	  </TR> 
	</TABLE> 
  </FORM>
 </BODY> 
</html>
