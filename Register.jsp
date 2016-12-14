<%@ page
import= "com.User, com.MySqlDataStoreUtilities, java.io.*, javax.servlet.*, javax.servlet.http.*, java.util.*"%>

<%
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if(email.endsWith(".edu"))
        {
          boolean uniqueUser = MySqlDataStoreUtilities.validateUniqueUser(email);
            if(uniqueUser == true)
            {
                MySqlDataStoreUtilities.insertUser(name, email, password);
                response.sendRedirect("index.html");
            }
            else
            {
                response.sendRedirect("indexNotUnique.html");
            }
        }
        else
        {
              response.sendRedirect("indexInvalidEmail.html");
        }
%>
