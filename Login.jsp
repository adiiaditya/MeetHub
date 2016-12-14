<%@ page
import= "com.MySqlDataStoreUtilities, java.io.*, javax.servlet.*,
javax.servlet.http.*, java.util.*"%>
<%
        String email = request.getParameter("useremail");
        String password = request.getParameter("userpassword");

         if(MySqlDataStoreUtilities.checkUser(email,password))
        {
            session.setAttribute("user",email);
            response.sendRedirect("PrivateAbout.jsp");
         }
         else
         {
            response.sendRedirect("WrongPassword.html");
         }

%>
