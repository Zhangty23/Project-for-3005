package com.bookstore.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.dao.PublisherDao;
import com.bookstore.dao.UserDao;
import com.bookstore.model.Publisher;
import com.bookstore.model.User;
import com.bookstore.tool.Utility;

public class AddPublisherServ extends HttpServlet {

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
		String name=request.getParameter("name");
		String address=request.getParameter("address");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		String banking_account=request.getParameter("banking_account");
		Publisher publisher = new Publisher(0, name, address, email, phone, banking_account);
		PublisherDao pd = new PublisherDao();
		if (pd.select(name).getPid()!=0) {
			request.setAttribute("msg", "Add publisher failed. This publisher name has been used!");
			request.getRequestDispatcher("/admin/addpublisher.jsp").forward(request, response);
			return;
		}
		if (pd.insert(publisher)!=0) {
			response.sendRedirect("admin/addbook.jsp");
		}else {
			request.setAttribute("msg", "Add publisher failed. Please retry later!");
			request.getRequestDispatcher("/admin/addpublisher.jsp").forward(request, response);
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
