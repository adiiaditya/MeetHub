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
String eventname=request.getParameter("value2");
String user=request.getParameter("value1");
String admin=u.getFullName();
//System.out.println("Event is "+eventname+" and user is "+user+" and admin is "+admin);

MySqlDataStoreUtilities.AddUsertoEvent(admin,eventname,user);

response.sendRedirect("PrivateEvents.jsp");


%>
