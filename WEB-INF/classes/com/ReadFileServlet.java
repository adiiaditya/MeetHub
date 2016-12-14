package com;

import java.io.File;
import java.io.FileOutputStream;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;

public class ReadFileServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {

				String fileName = "";


				String fileId = request.getParameter("fileId").toString();
				if (fileId != null) {
					fileName = MySqlDataStoreUtilities.readFile(fileId);
					fileName = fileName.replaceAll(" ","%20");
					URL url = new URL("http://localhost:8080/Project/files/"+fileName);
					System.out.println("User Home "+System.getProperty("user.home"));
					FileUtils.copyURLToFile(url, new File(System.getProperty("user.home").replace("\\", "/") +"/" +
						"/Downloads/" +fileName.replaceAll("%20"," ")));


				if (fileName.equals("")) {
					RequestDispatcher rd = request.getRequestDispatcher("ReadFileFailure.jsp");
					rd.forward(request, response);
				} else {
					RequestDispatcher rd = request.getRequestDispatcher("ReadFileSuccess.jsp");
					rd.forward(request, response);
				}
			}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {

	}
}
