package com.bookstore.tool;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Utility {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		System.out.println(uuid());
	}
	public static String getNow(){
		Date date = new Date();
		return (date.getYear()+1900)+"-"+(date.getMonth()+1)+"-"+date.getDate()+" "+date.getHours()+":"+date.getMinutes();
	}
	/**
	 * @param request
	 * @param response
	 * @return
	 */
	public static boolean check(HttpServletRequest request, HttpServletResponse response)
	{
		String client = request.getParameter("checkCode");
		String server = (String) request.getSession().getAttribute("checkCode");
		if(client!=null&&server!=null&&client.equals(server)){
			return true;
		}else{
			return false;
		}
	}
	public static String uuid() {
		return UUID.randomUUID().toString().replace("-", "").substring(0,16).toUpperCase();
	}
	public static void writeCookie(HttpServletResponse response, String key,
			String value) throws UnsupportedEncodingException {
		writeCookie(response, key, value, -1);
	}

	/**
	 * 
	 * @param response
	 * @param key
	 * @param value
	 * @param expirse
	 * @throws UnsupportedEncodingException 
	 */
	public static void writeCookie(HttpServletResponse response, String key,
			String value, int expirse) throws UnsupportedEncodingException {
		value=URLEncoder.encode(value,"UTF-8");
		Cookie newCookie = new Cookie(key, value);
		if (expirse > 0)
			expirse = expirse * 60;
		newCookie.setPath("/");
		newCookie.setMaxAge(expirse);
		response.addCookie(newCookie);
	}

	/**
	 * 
	 * @param request
	 * @param key
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	public static String readCookie(HttpServletRequest request, String key) throws UnsupportedEncodingException {
		String value = "";
		Cookie[] ck = request.getCookies();
		if (ck == null)
			return "";
		for (Cookie c : ck) {
			if (c.getName().equals(key)) {
				value = URLDecoder.decode(c.getValue(),"UTF-8");
				break;
			}
		}
		return value;
	}
	/**
	 * read file
	 * @param filepath
	 * @return
	 */
	public static String readFile(String filepath){
		File file = new File(filepath);
	    FileInputStream fin = null;
		try {
			fin = new FileInputStream(file);
		} catch (FileNotFoundException e1) {
			System.err.println(e1.getMessage());
		}
	    int length = 0 ;
	    byte[] buf = new byte[1024];
	    StringBuffer sb=new StringBuffer();
	    try {
			while((length = fin.read(buf))!=-1){
			    sb.append(new String(buf,0 ,length,"UTF-8"));
			}
		} catch (IOException e) {
			System.err.println(e.getMessage());
		}finally{
			try {
				fin.close();
			} catch (IOException e) {
				System.err.println(e.getMessage());
			} 
		}
	    return sb.toString();
	}
}
