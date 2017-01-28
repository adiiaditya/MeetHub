<%@

page import= "com.*, java.io.*, javax.servlet.*,javax.servlet.http.*, java.util.*, java.text.*"
%>
<%
String user1=request.getParameter("user");
String user2=request.getParameter("friend");

System.out.println("The user is "+user1);
System.out.println("The friend is "+user2);
MySqlDataStoreUtilities.DeleteMessageThread(user1,user2);
response.sendRedirect("Inbox.jsp");

%>