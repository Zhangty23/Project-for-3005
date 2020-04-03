package com.bookstore.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;

import com.bookstore.dao.BookDao;
import com.bookstore.model.Book;
import com.bookstore.tool.FileUpload;

public class AddBookServ extends HttpServlet {

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
		String para,val;
		List<String> ls=new ArrayList<String>();
		List<FileItem> list;
		String book_name = "",author_name="",ISBN="",genre="",pid="",price="",page_number="",number="",warehouse="",percentage="";
		String cover="";
		String root = this.getServletContext().getRealPath("/photo");
		String filename = "";
		FileItem fi = null;
		try {
			list = FileUpload.getList(request, response, 20*1024);
			for(int i=0;i<list.size();i++)
			{
				para=list.get(i).getFieldName();
				val=list.get(i).getString("UTF-8");
				//ordinary field
				if(list.get(i).isFormField()){
//					System.out.println(para+":"+val);
					if(para.compareTo("book_name")==0){
						book_name=val;
					}else if (para.compareTo("author_name")==0) {
						author_name=val;
					}else if (para.compareTo("ISBN")==0) {
						ISBN=val;
					}else if (para.compareTo("genre")==0) {
						genre=val;
					}else if (para.compareTo("pid")==0) {
						pid=val;
					}else if (para.compareTo("price")==0) {
						price=val;
					}else if (para.compareTo("page_number")==0) {
						page_number=val;
					}else if (para.compareTo("number")==0) {
						number=val;
					}else if (para.compareTo("warehouse")==0) {
						warehouse=val;
					}else if (para.compareTo("percentage")==0) {
						percentage=val;
					}
				}
				//file field
				else{
					fi = list.get(i);
					filename = fi.getName();
					String imgPath=System.currentTimeMillis()+"";
					if(filename.compareTo("")!=0){
						int index = filename.lastIndexOf(".");
						if(filename.substring(index+1).compareTo("jpg")!=0&&
								filename.substring(index+1).compareTo("png")!=0&&
								filename.substring(index+1).compareTo("jpeg")!=0&&
								filename.substring(index+1).compareTo("gif")!=0) {
							request.setAttribute("msg", "please select a photo");
							request.getRequestDispatcher("admin/addbook.jsp").forward(request, response);
							return;
						}
						if(index != -1) {
							filename = imgPath +"."+filename.substring(index+1);
						}
					}else{
						request.setAttribute("msg", "please select a photo");
						request.getRequestDispatcher("admin/addbook.jsp").forward(request, response);
						return;
					}
					if (para.compareTo("cover")==0) {
						cover="photo/"+filename;
					}
				}
			}
			int result=new BookDao().insert(new Book(0, book_name, author_name, ISBN, genre, pid, cover, page_number, price, number, warehouse, percentage));
			if(result!=0){
				if(result==1){
					File destFile=new File(root,filename);
					fi.write(destFile);
				}
				response.sendRedirect("admin/book.jsp");
			}else{
				request.setAttribute("msg", "Add book failed. Please retry later!");
				request.getRequestDispatcher("addbook.jsp").forward(request, response);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
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
