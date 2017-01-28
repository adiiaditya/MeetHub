<%@ page
import= "com.User, com.MySqlDataStoreUtilities, java.io.*, javax.servlet.*, javax.servlet.http.*, java.util.*"%>

<%
        String userName = request.getParameter("hiddenUserName");
        String friendName = request.getParameter("hiddenFriendName");

        System.out.println(userName);
        System.out.println(friendName);

        MySqlDataStoreUtilities.removeFriend(userName, friendName, "accepted");
        MySqlDataStoreUtilities.removeFriend(friendName, userName, "accepted");
        response.sendRedirect("PrivateAbout.jsp");
%>
