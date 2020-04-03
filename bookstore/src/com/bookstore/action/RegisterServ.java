package com.bookstore.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.dao.UserDao;
import com.bookstore.model.User;
import com.bookstore.tool.Utility;

public class RegisterServ extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		String username=request.getParameter("username");
		String phone=request.getParameter("phone");
		String address=request.getParameter("address");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String qrPwd=request.getParameter("qrPwd");
		if(!Utility.check(request, response)){
			request.setAttribute("msg", "Wrong checkcode!");
			request.getRequestDispatcher("/register.jsp").forward(request, response);
			return;
		}
		if(password.compareTo(qrPwd)!=0){
			request.setAttribute("msg", "The password are inconsistent!");
			request.getRequestDispatcher("/register.jsp").forward(request, response);
			return;
		}
		User user = new User(0, username, phone, password, address, email);
		UserDao ud = new UserDao();
		if (ud.select(username).getUid()!=0) {
			request.setAttribute("msg", "Register failed. This username has been used!");
			request.getRequestDispatcher("/register.jsp").forward(request, response);
			return;
		}
		if (ud.insert(user)!=0) {
			response.sendRedirect("login.jsp");
		}else {
			request.setAttribute("msg", "Register failed. Please retry later!");
			request.getRequestDispatcher("/register.jsp").forward(request, response);
		}
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
