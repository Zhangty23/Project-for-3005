package com.bookstore.tool;

import java.io.UnsupportedEncodingException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


public class FileUpload{
	/**
	 * @param request
	 * @param response
	 * @param sizeKB
	 * @throws UnsupportedEncodingException
	 * @throws FileUploadException
	 */
	public static List<FileItem> getList(HttpServletRequest request, HttpServletResponse response,long sizeKB) throws UnsupportedEncodingException, FileUploadException{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload sfu = new ServletFileUpload(factory);
		sfu.setFileSizeMax(2048*sizeKB);
		List<FileItem> list = sfu.parseRequest(request);
		return list;
	}
}
