<%@ page
import= "com.MySqlDataStoreUtilities, java.text.DateFormat, java.text.SimpleDateFormat, java.io.*, javax.servlet.*,
javax.servlet.http.*, java.util.*"%>
<%
        String email = request.getParameter("hiddenEmail");
        String status = request.getParameter("status");

        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
  	   	//get current date time with Date()
  	   	Date date = new Date();
  	   	String postDate = dateFormat.format(date);

        MySqlDataStoreUtilities.insertStatus(email,status,postDate,0);
        response.sendRedirect("PrivateAbout.jsp");
%>
