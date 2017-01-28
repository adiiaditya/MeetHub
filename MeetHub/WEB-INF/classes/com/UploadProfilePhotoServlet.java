package com;

import java.io.File;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class UploadProfilePhotoServlet extends HttpServlet {
	private String message = "";

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {

		File file;
		String email = "";
		int maxFileSize = 1073741824;
		int maxMemSize = 1073741824;
		ServletContext context = request.getServletContext();
		String filePath = context.getInitParameter("photo-upload");
		HttpSession session = request.getSession();

		User user = null;
		if (session != null) {
			if (session.getAttribute("user") != null) {
				email = session.getAttribute("user").toString();
				user = MySqlDataStoreUtilities.getUserInfo(email);
				System.out.println("EMail"+user.getUserEmail());
			}
		}
		String fileName = "defaultName";

		// Verify the content type
		String contentType = request.getContentType();
		if ((contentType.indexOf("multipart/form-data") >= 0)) {

			DiskFileItemFactory factory = new DiskFileItemFactory();
			// maximum size that will be stored in memory
			factory.setSizeThreshold(maxMemSize);
			// Location to save data that is larger than maxMemSize.
			factory.setRepository(new File("/Users/uzmanaaz/Movies"));

			// Create a new file upload handler
			ServletFileUpload upload = new ServletFileUpload(factory);
			// maximum file size to be uploaded.
			upload.setSizeMax(maxFileSize);
			try {
				// Parse the request to get file items.
				List fileItems = upload.parseRequest(request);

				// Process the uploaded file items
				Iterator i = fileItems.iterator();

				while (i.hasNext()) {
					FileItem fi = (FileItem) i.next();
					if (!fi.isFormField()) {
						// Get the uploaded file parameters
						String fieldName = fi.getFieldName();
						String fName = fi.getName();
						String profilePicName = email+fName;

						long sizeInBytes = fi.getSize();
						// Write the file
						if (profilePicName.lastIndexOf("\\") >= 0) {

							file = new File(filePath + profilePicName.substring(profilePicName.lastIndexOf("\\")));
						} else {

							file = new File(filePath + profilePicName.substring(profilePicName.lastIndexOf("\\") + 1));
						}
						fileName = profilePicName.substring(profilePicName.lastIndexOf("\\") + 1);
						fi.write(file);

					}

				}
				message = MySqlDataStoreUtilities.updateUserProfilePicture(fileName, user);
				if (message.equals("SUCCESS")) {
					RequestDispatcher rd = request.getRequestDispatcher("PrivateAbout.jsp");
					rd.forward(request, response);
				} else {
					RequestDispatcher rd = request.getRequestDispatcher("UploadFailure.jsp");
					rd.forward(request, response);
				}

			} catch (Exception ex) {
				ex.printStackTrace();
				RequestDispatcher rd = request.getRequestDispatcher("UploadFailure.jsp");
				rd.forward(request, response);
			}
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("UploadFailure.jsp");
			rd.forward(request, response);
		}
	}
}
