<%@ page
import= "com.User, com.MySqlDataStoreUtilities, java.io.*, javax.servlet.*, javax.servlet.http.*, java.util.*"%>

<%
        String userName = request.getParameter("hiddenUserName");
        String friendName = request.getParameter("hiddenFriendName");

        MySqlDataStoreUtilities.removeFriendRequest(userName, friendName, "pending");
        response.sendRedirect("PrivateAbout.jsp");
%>
