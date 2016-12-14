<%@
page import="com.*,java.io.*,java.util.*"
%>

<%
User u = null;
HttpSession session2 = request.getSession(false);
        if(session2!=null)
        {
            String email = session2.getAttribute("user").toString();
            u = MySqlDataStoreUtilities.getUserInfo(email);
        }
String eventname=request.getParameter("value1");
String admin=request.getParameter("value2");
String user=u.getFullName();
System.out.println("");
System.out.println("In Drop event:Event is "+eventname+" and user is "+user+" and admin is "+admin);


MySqlDataStoreUtilities.DropEvent(admin,eventname,user);
response.sendRedirect("PrivateEvents.jsp");


%>
