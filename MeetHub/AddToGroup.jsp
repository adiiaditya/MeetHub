<%@ page
import= "com.User, com.Status, com.AutoComplete, com.MySqlDataStoreUtilities, java.io.*, javax.servlet.*,
javax.servlet.http.*, java.util.*, java.text.*"%>

<%
		User user = null;
		String univName = null;
		String userName = null;
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		
  	   	Date date = new Date();
  	   	String postDate = dateFormat.format(date);
		
        if(session!=null)
        {
            String email = session.getAttribute("user").toString();
            user = MySqlDataStoreUtilities.getUserInfo(email);
			univName = request.getParameter("value1");
			userName = user.name;
        }
		MySqlDataStoreUtilities.insertUserInGroup(userName,univName,"","Has been Added to the Group",postDate,"","Public");
		response.sendRedirect("PrivateGroup.jsp");
%>


