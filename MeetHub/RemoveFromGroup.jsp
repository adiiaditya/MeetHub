<%@ page
import= "com.User, com.Status, com.AutoComplete, com.MySqlDataStoreUtilities, java.io.*, javax.servlet.*,
javax.servlet.http.*, java.util.*"%>

<%
		User user = null;
        String univName = null;
		String userName = null;
        if(session!=null)
        {
            String email = session.getAttribute("user").toString();
            user = MySqlDataStoreUtilities.getUserInfo(email);
			univName = request.getParameter("value1");
			userName = user.name;
        }
		MySqlDataStoreUtilities.removeUserFromGroup(userName,univName);
		response.sendRedirect("PrivateGroup.jsp");
%>