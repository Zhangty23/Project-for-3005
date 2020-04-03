package com.bookstore.action;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 */
public class CheckCode extends HttpServlet {
	public static final int WIDTH=120;
	public static final int HEIGHT=35;
		
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		BufferedImage image=new BufferedImage(WIDTH,HEIGHT,BufferedImage.TYPE_INT_RGB);
		Graphics g=image.getGraphics();
		setBackGround(g);
		setBorder(g);
		drawRandomLine(g);
		String random = drawRandomRum((Graphics2D)g);
		request.getSession().setAttribute("checkCode", random);	
		response.setContentType("image/jpeg");
		response.setDateHeader("expires", -1);
		response.setHeader("Cacahe-Control","no-cache");
		response.setHeader("Pragma", "no-cache");
		ImageIO.write(image, "jpg",response.getOutputStream());

	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	
	}
	private String drawRandomRum(Graphics2D g) {
		// TODO Auto-generated method stub
		g.setColor(Color.RED);
		g.setFont(new Font("Times New Roman",Font.BOLD,20));
		String base="1234567890abcdefghijklmnopqrstuvwxyz";
		StringBuffer sb = new StringBuffer();
		int x=5,y=20;
		for(int i=0;i<4;i++){
			int degree=new Random().nextInt()%30;
			
			String ch=base.charAt(new Random().nextInt(base.length()))+"";
			sb.append(ch);	
			g.rotate(degree*Math.PI/180,x,y);
			g.drawString(ch, x, y);
			g.rotate(-degree*Math.PI/180,x,y);
			x+=30;
		}
		return sb.toString();
	}
	private void drawRandomLine(Graphics g) {
		// TODO Auto-generated method stub
		g.setColor(Color.GREEN);
		for(int i=0;i<5;i++){
			int x1 = new Random().nextInt(WIDTH);
			int y1 = new Random().nextInt(HEIGHT);
			int x2 = new Random().nextInt(WIDTH);
			int y2 = new Random().nextInt(HEIGHT);
			g.drawLine(x1, y1, x2, y2);
		}
	}
	private void setBorder(Graphics g) {
		// TODO Auto-generated method stub
		g.setColor(Color.BLUE);
		g.drawRect(1, 1,WIDTH-2,HEIGHT-2);
	}
	private void setBackGround(Graphics g) {
		// TODO Auto-generated method stub
		g.setColor(Color.WHITE);
		g.fillRect(0, 0,WIDTH,HEIGHT);
	}
}
