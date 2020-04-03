<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String role = (String)session.getAttribute("role");
	if (role==null||role.equals("")) {
		response.sendRedirect("login.jsp");
	}
%>
