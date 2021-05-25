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
<%
	String SeqNo = request.getParameter("SEQ_NO");
	int pageLine;
	int rowcnt;
	if(request.getParameter("line")!=null){
		pageLine = Integer.parseInt(request.getParameter("line"));
		session.setAttribute("pageLine", pageLine);
	} else if(session.getAttribute("pageLine")!=null) {
		pageLine = (int)session.getAttribute("pageLine");
	} else {
		pageLine = 5;
	}
	
	int pageNo;
	if(SeqNo != null)
		pageNo = Integer.parseInt(SeqNo);
	else
		pageNo = 1;
	
	HistoryDAO hdao = new HistoryDAO();
	String s_cond = request.getParameter("cond");
	String s_text = request.getParameter("ctext");
	List<HistoryBean> list = hdao.readTriggerDB(pageNo, pageLine, s_cond, s_text);
	
	int totalcnt=hdao.totalCnt();
	if(totalcnt > 0)
		rowcnt = (int) Math.ceil((double)totalcnt/pageLine);
	else
		rowcnt = 0;
	
	request.setAttribute("list", list);
	request.setAttribute("rowcnt", rowcnt);
	request.setAttribute("target", "TriggerListView");
%>
<jsp:forward page="template.jsp" />
</body>
</html>