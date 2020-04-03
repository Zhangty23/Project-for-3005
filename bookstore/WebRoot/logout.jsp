<%@page import="com.bookstore.tool.Utility"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String username = (String)session.getAttribute("username");
	if (username==null||username.equals("")) {
		response.sendRedirect("login.jsp");
	} else {
		session.removeAttribute("username");
		session.removeAttribute("uid");
		session.removeAttribute("role");
		response.sendRedirect("login.jsp");
	}
%>