<%@ page
import= "com.MySqlDataStoreUtilities, java.text.DateFormat, java.text.SimpleDateFormat, java.io.*, javax.servlet.*,
javax.servlet.http.*, java.util.*, org.apache.commons.fileupload.FileItem, org.apache.commons.fileupload.disk.DiskFileItemFactory, org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%
    File uploadFile;
		int maxFileSize = 1073741824;
		int maxMemSize = 1073741824;
		ServletContext context = request.getServletContext();
		String filePath = context.getInitParameter("file-upload");

    //Uploading File
    // Verify the content type
		String contentType = request.getContentType();
		if ((contentType.indexOf("multipart/form-data") >= 0)) {

			DiskFileItemFactory factory = new DiskFileItemFactory();
			// maximum size that will be stored in memory
			factory.setSizeThreshold(maxMemSize);
			// Location to save data that is larger than maxMemSize.
			factory.setRepository(new File("/Users/uzmanaaz/Movies/temporary"));

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
						System.out.println("Field Name " + fieldName);
						String fName = fi.getName();
						System.out.println("File Name " + fName);

						long sizeInBytes = fi.getSize();
						System.out.println("File Size in Bytes " + sizeInBytes);
						// Write the file
						if (fName.lastIndexOf("\\") >= 0) {

							uploadFile = new File(filePath + fName.substring(fName.lastIndexOf("\\")));
						} else {

							uploadFile = new File(filePath + fName.substring(fName.lastIndexOf("\\") + 1));
						}
						file = fName.substring(fName.lastIndexOf("\\")+1);
						fi.write(uploadFile);
						System.out.println("Uploaded Filename: " + filePath + fName);
						System.out.println("Uploaded Filename: " + file);

					} else {
						String fieldName = fi.getFieldName();

						if (fieldName.equals("accessSpecifier")) {
							String fieldValue = fi.getString();
							accessSpecifier = fieldValue;
						}
					}
				}
System.out.println("Yuhuuu" + file + status);

			} catch (Exception ex) {
				ex.printStackTrace();
				RequestDispatcher rd = request.getRequestDispatcher("UploadFailure.jsp");
				rd.forward(request, response);
			}
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("UploadFailure.jsp");
			rd.forward(request, response);
		}
%>
