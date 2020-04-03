package com.bookstore.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.bookstore.dao.BookDao;
import com.bookstore.dao.ItemDao;
import com.bookstore.dao.OrderDao;
import com.bookstore.dao.PublisherDao;
import com.bookstore.dao.SaleBookDao;
import com.bookstore.dao.ShipDao;
import com.bookstore.dao.ShoppingCarDao;
import com.bookstore.model.Book;
import com.bookstore.model.BookCar;
import com.bookstore.model.BookItem;
import com.bookstore.model.Item;
import com.bookstore.model.Order;
import com.bookstore.model.Publisher;
import com.bookstore.model.SaleBook;
import com.bookstore.model.Ship;
import com.bookstore.model.ShoppingCar;
import com.bookstore.tool.Utility;

public class ReqServ extends HttpServlet {

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
		String type=request.getParameter("type");
		if(type.equals("getPublisher")){
			getPublisher(request, response);
		}else if(type.equals("getBooks")){
			getBooks(request, response);
		}else if(type.equals("search")){
			search(request, response);
		}else if(type.equals("getBook")){
			getBook(request, response);
		}else if(type.equals("addToCart")){
			addToCart(request, response);
		}else if(type.equals("getCart")){
			getCart(request, response);
		}else if(type.equals("deleteCartBook")){
			deleteCartBook(request, response);
		}else if(type.equals("getInfor")){
			getInfor(request, response);
		}else if(type.equals("purchase")){
			purchase(request, response);
		}else if(type.equals("getOrder")){
			getOrder(request, response);
		}else if(type.equals("track")){
			track(request, response);
		}else if(type.equals("deleteBook")){
			deleteBook(request, response);
		}else if(type.equals("getpublisher")){
			getpublisher(request, response);
		}else if(type.equals("statistic")){
			statistic(request, response);
		}else if(type.equals("getRecommend")){
			getRecommend(request, response);
		}
	}
	
	private void getRecommend(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String book_id=request.getParameter("book_id");
		Book book = new BookDao().select(Integer.parseInt(book_id));
		List<Book> lb = new BookDao().select(book);
		Map<String, Object> map = new HashMap<String, Object>();
		if (lb!=null) {
			map.put("data", lb);
			map.put("status", "success");
		} else {
			map.put("status", "fail");
		}
		JSONObject json = new JSONObject(map);
		PrintWriter out = response.getWriter();  
		out.write(json.toString());
		
	}

	private void statistic(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String command=request.getParameter("command");
		List<SaleBook> lsb=null;
		SaleBookDao sbd = new SaleBookDao();
		if("book".equals(command)){
			lsb=sbd.selectBook();
		}else if ("author".equals(command)) {
			lsb=sbd.selectAuthor();
		}else if ("genre".equals(command)) {
			lsb=sbd.selectGenre();
		}
		Map<String, Object> map = new HashMap<String, Object>();
		if (lsb!=null) {
			map.put("data", lsb);
			map.put("status", "success");
		} else {
			map.put("status", "fail");
		}
		JSONObject json = new JSONObject(map);
		PrintWriter out = response.getWriter();  
		out.write(json.toString());
	}

	private void getpublisher(HttpServletRequest request, HttpServletResponse response) throws IOException {
		List<Publisher> lp = new PublisherDao().select();
		Map<String, Object> map = new HashMap<String, Object>();
		if (lp!=null) {
			map.put("data", lp);
			map.put("status", "success");
		} else {
			map.put("status", "fail");
		}
		JSONObject json = new JSONObject(map);
		PrintWriter out = response.getWriter();  
		out.write(json.toString());
	}

	private void deleteBook(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id=request.getParameter("id");
		//TODO check whether shopping car or order has this book
		int result = new BookDao().delete(id);
		Map<String, Object> map = new HashMap<String, Object>();
		if (result!=0) {
			map.put("status", "success");
		} else {
			map.put("status", "fail");
		}
		JSONObject json = new JSONObject(map);
		PrintWriter out = response.getWriter();  
		out.write(json.toString());
	}

	private void track(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String oid=request.getParameter("oid");
		List<Ship> ls = new ShipDao().select(oid);
		Map<String, Object> map = new HashMap<String, Object>();
		if(ls!=null){
			map.put("data", ls);
			map.put("status", "success");
		}else {
			map.put("status", "failed");
		}
		JSONObject json = new JSONObject(map);
		PrintWriter out = response.getWriter();  
		out.write(json.toString());
	}

	private void getOrder(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int uid=Integer.parseInt(request.getParameter("uid"));
		List<Order> lo = new OrderDao().select(uid);
		ItemDao id = new ItemDao();
		List<BookItem> lb=new ArrayList<BookItem>();
		ArrayList<Map> am = new ArrayList<Map>();
		Map<String, Object> result = new HashMap<String, Object>();
		for (int i = 0; i < lo.size(); i++) {
			id = new ItemDao();
			lb=new ArrayList<BookItem>();
			result = new HashMap<String, Object>();
			lb = id.select(lo.get(i).getOid());
			result.put("order", lo.get(i));
			result.put("Item", lb);
			am.add(result);
		}
		Map<String, Object> map = new HashMap<String, Object>();
		if(am.size()>0){
			map.put("status", "success");
			map.put("data", am);
		}else {
			map.put("status", "failed");
		}
		JSONObject json = new JSONObject(map);
		PrintWriter out = response.getWriter();  
		out.write(json.toString());
	}

	private void purchase(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String book_ids=request.getParameter("bids");
		int uid=Integer.parseInt(request.getParameter("uid"));
		String total_price=request.getParameter("total_price");
		String name=request.getParameter("name");
		String address=request.getParameter("address");
		String phone=request.getParameter("phone");
		//TODO insert the recipient information to the order
//		System.out.println(total_price);
		String[] bids = book_ids.split("-");
		String oid=System.currentTimeMillis()+"";
		//use oid add order first, then add item one by one
		int result=0;
		OrderDao od = new OrderDao();
		BookDao bd = new BookDao();
		if(od.insert(new Order(oid, uid, "in transit", total_price, Utility.getNow()))!=0){
			result=1;
			ItemDao id = new ItemDao();
			ShoppingCarDao scd = new ShoppingCarDao();
			String place="";
			for (int i = 0; i < bids.length; i++) {
				id = new ItemDao();
				scd = new ShoppingCarDao();
				bd = new BookDao();
				BookCar bc = scd.select(uid, bids[i]);
				place=bc.getWarehouse();
				if(Integer.parseInt(bd.select(Integer.parseInt(bids[i])).getNumber())<bc.getNumber()){continue;}
				if(id.insert(new Item(0, oid, Integer.parseInt(bids[i]), bc.getPrice(), bc.getNumber()+""))!=0){
					scd = new ShoppingCarDao();
					scd.delete(bc.getSid());
					bd.update(Integer.parseInt(bids[i]), Integer.parseInt(bd.select(Integer.parseInt(bids[i])).getNumber())-bc.getNumber());
				}
			}
			new ShipDao().insert(new Ship(0, oid, place, Utility.getNow()));
		}
		Map<String, Object> map = new HashMap<String, Object>();
		if(result==1){
			map.put("status", "success");
		}else {
			map.put("status", "failed");
		}
		JSONObject json = new JSONObject(map);
		PrintWriter out = response.getWriter();  
		out.write(json.toString());
	}

	private void getInfor(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String book_ids=request.getParameter("bids");
		int uid=Integer.parseInt(request.getParameter("uid"));
		String[] bids = book_ids.split("-");
		List<BookCar> lbc=new ArrayList<BookCar>();
		ShoppingCarDao scd = new ShoppingCarDao();
		for (int i = 0; i < bids.length; i++) {
			scd = new ShoppingCarDao();
			lbc.add(scd.select(uid, bids[i]));
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("data", lbc);
		JSONObject json = new JSONObject(map);
		PrintWriter out = response.getWriter();  
		out.write(json.toString());
	}

	private void deleteCartBook(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int sid=Integer.parseInt(request.getParameter("sid"));
		Map<String, Object> map = new HashMap<String, Object>();
		if (new ShoppingCarDao().delete(sid)!=0) {
			map.put("status", "success");
		} else {
			map.put("status", "fail");
		}
		JSONObject json = new JSONObject(map);
		PrintWriter out = response.getWriter();  
		out.write(json.toString());
	}

	private void getCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int uid=Integer.parseInt(request.getParameter("uid"));
		List<BookCar> lbc = new ShoppingCarDao().select(uid);
		Map<String, Object> map = new HashMap<String, Object>();
		if (lbc!=null) {
			map.put("data", lbc);
			map.put("status", "success");
		} else {
			map.put("status", "fail");
		}
		JSONObject json = new JSONObject(map);
		PrintWriter out = response.getWriter();  
		out.write(json.toString());
	}

	private void addToCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int bid=Integer.parseInt(request.getParameter("book_id"));
		int uid=Integer.parseInt(request.getParameter("uid"));
		ShoppingCar sc=new ShoppingCar(0, uid, bid, 1, Utility.getNow());
		int result = new ShoppingCarDao().insert(sc);
		Map<String, Object> map = new HashMap<String, Object>();
		if (result!=0) {
			map.put("status", "success");
		} else {
			map.put("status", "fail");
		}
		JSONObject json = new JSONObject(map);
		PrintWriter out = response.getWriter();  
		out.write(json.toString());
	}

	private void getBook(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String book_id=request.getParameter("book_id");
		Book book = new BookDao().select(Integer.parseInt(book_id));
		Map<String, Object> map = new HashMap<String, Object>();
		if (book!=null) {
			map.put("data", book);
			map.put("status", "success");
		} else {
			map.put("status", "fail");
		}
		JSONObject json = new JSONObject(map);
		PrintWriter out = response.getWriter();  
		out.write(json.toString());
	}
	
	private void search(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String way=request.getParameter("way");
		String keyword=request.getParameter("keyword");
		List<Book> lb = new BookDao().select(way, keyword);
		Map<String, Object> map = new HashMap<String, Object>();
		if (lb!=null) {
			map.put("data", lb);
			map.put("status", "success");
		} else {
			map.put("status", "fail");
		}
		JSONObject json = new JSONObject(map);
		PrintWriter out = response.getWriter();  
		out.write(json.toString());
	}

	private void getBooks(HttpServletRequest request, HttpServletResponse response) throws IOException {
		List<Book> lb = new BookDao().select();
		Map<String, Object> map = new HashMap<String, Object>();
		if (lb!=null) {
			map.put("data", lb);
			map.put("status", "success");
		} else {
			map.put("status", "fail");
		}
		JSONObject json = new JSONObject(map);
		PrintWriter out = response.getWriter();  
		out.write(json.toString());
	}

	private void getPublisher(HttpServletRequest request, HttpServletResponse response) throws IOException {
		List<Publisher> lp = new PublisherDao().select();
		Map<String, Object> map = new HashMap<String, Object>();
		if (lp!=null) {
			map.put("data", lp);
			map.put("status", "success");
		} else {
			map.put("status", "fail");
		}
		JSONObject json = new JSONObject(map);
		PrintWriter out = response.getWriter();  
		out.write(json.toString());
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
