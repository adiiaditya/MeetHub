<%@ page
import= "com.MySqlDataStoreUtilities, java.text.DateFormat, java.text.SimpleDateFormat, java.io.*, javax.servlet.*,
javax.servlet.http.*, java.util.*, org.apache.commons.fileupload.FileItem, org.apache.commons.fileupload.disk.DiskFileItemFactory, org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%
    String email = null;
    String status  = null;
		String file = request.getParameter("fileName");
		String name = request.getParameter("value2");
		String university = request.getParameter("value1");
		String accessSpecifier = null;

    File uploadFile;
		int maxFileSize = 1073741824;
		int maxMemSize = 1073741824;
		ServletContext context = request.getServletContext();
		String filePath = context.getInitParameter("file-upload");

    DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		DateFormat dateFormat1 = new SimpleDateFormat("HH:mm:ss");
  	Date date = new Date();
  	String postDate = dateFormat.format(date);
		String postTime = dateFormat1.format(date);

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
						String fName = fi.getName();


						long sizeInBytes = fi.getSize();
						// Write the file
						if (fName.lastIndexOf("\\") >= 0) {

							uploadFile = new File(filePath + fName.substring(fName.lastIndexOf("\\")));
						} else {

							uploadFile = new File(filePath + fName.substring(fName.lastIndexOf("\\") + 1));
						}
						file = fName.substring(fName.lastIndexOf("\\")+1);
						fi.write(uploadFile);

					} else {
						String fieldName = fi.getFieldName();
						if (fieldName.equals("accessSpecifier")) {
							String fieldValue = fi.getString();
							accessSpecifier = fieldValue;
						}
            if(fieldName.equals("hiddenEmail")){
              String fieldValue = fi.getString();
              email = fieldValue;
            }
            if(fieldName.equals("status")){
              String fieldValue = fi.getString();
              status = fieldValue;
            }
					}
				}
        if(status.equals("") && !file.equals(""))
    		{
    			MySqlDataStoreUtilities.insertStatusInGroup(university,name,file,"",postDate,postTime,accessSpecifier);
    		}
    		else
    		{
    			MySqlDataStoreUtilities.insertStatusInGroup(university,name,file,status,postDate,postTime,accessSpecifier);
    		}
        response.sendRedirect("UniversityPage.jsp?value1="+university);
			} catch (Exception ex) {
				ex.printStackTrace();
				RequestDispatcher rd = request.getRequestDispatcher("UniversityPage.jsp");
				rd.forward(request, response);
			}
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("UniversityPage.jsp");
			rd.forward(request, response);
		}
%>
