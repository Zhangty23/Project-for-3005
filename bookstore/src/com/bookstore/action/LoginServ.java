package com.bookstore.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bookstore.dao.UserDao;
import com.bookstore.model.User;
import com.bookstore.tool.Utility;


public class LoginServ extends HttpServlet {

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
		String role=request.getParameter("role");
		if("admin".equals(role)){
			adminLogin(request,response);
		}else if ("user".equals(role)) {
			userLogin(request,response);
		}
	}

	private void userLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		if(!Utility.check(request, response)){
			request.setAttribute("msg", "Wrong checkcode");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
			return;
		}
		UserDao ud=new UserDao();
		User user=ud.select(username);
		if(user.getUid()==0){
			request.setAttribute("msg", "This user didn't register yet£¡");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
			return;
		}else if(user.getPassword().compareTo(password)!=0){
			request.setAttribute("msg", "Wrong password!");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}else{
			HttpSession session = request.getSession();
			session.setAttribute("username", username);
			session.setAttribute("uid", user.getUid());
			session.setAttribute("role", "user");
			response.sendRedirect("index.jsp");
		}
	}

	private void adminLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		if(!username.equals("admin")||!password.equals("1")){
			response.sendRedirect("admin/login.jsp");
//			request.setAttribute("msg", "wrong username or password!");
//			request.getRequestDispatcher("admin/login.jsp").forward(request, response);
			return;
		}
		HttpSession session = request.getSession();
		session.setAttribute("username", username);
		session.setAttribute("role", "admin");
		response.sendRedirect("admin/index.jsp");
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
