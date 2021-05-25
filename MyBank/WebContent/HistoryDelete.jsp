<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import='Bean.HistoryDAO' %>
<%@ page import='Bean.HistoryBean' %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%	
	int no = Integer.parseInt(request.getParameter("No"));
	HistoryDAO hdao = new HistoryDAO();
	HistoryBean bean = hdao.readNoInfo(no);
	String lev = bean.getTag();
	String id = bean.getId();
	int last = hdao.readSlastDB(id);
	if(lev.equals("1")) {
		last = last - bean.getMoeny();
	} else {
		last = last + bean.getMoeny();
	}
	bean.setAll(last);
	hdao.updateSaveDB(bean);
	hdao.deleteHistoryDB(no);
	request.setAttribute("target", "HistoryList");
%>
<jsp:forward page="template.jsp" />
</body>
</html>