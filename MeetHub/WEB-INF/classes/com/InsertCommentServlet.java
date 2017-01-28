package com;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class InsertCommentServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String comment = request.getParameter("comment").toString();
		String email = request.getParameter("email").toString();
		String status = request.getParameter("status");
		User logName = MySqlDataStoreUtilities.getUserInfo(request.getParameter("searchedUser"));
		MongoDBDataStoreUtilities.insertComment(email, status, comment);
		try{

			System.out.println(request.getSession().getAttribute("user"));

		if(logName.email.equals(request.getSession().getAttribute("user")))
		{

			response.sendRedirect(request.getContextPath() + "/PrivateTimeline.jsp");
		}
		else if(!logName.email.equals(request.getSession().getAttribute("user")))
		{
			response.sendRedirect(request.getContextPath() + "/PublicTimeline.jsp?searchedUser="+request.getParameter("searchedUser"));
		}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
