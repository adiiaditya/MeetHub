<%@
page import="com.*,java.io.*,java.util.*"
%>

<%
String eventname=request.getParameter("value");
System.out.println(eventname);

MySqlDataStoreUtilities.DeleteEvent(eventname);
response.sendRedirect("PrivateEvents.jsp");


%>
