<%@ page
import= "com.User, com.MySqlDataStoreUtilities, java.io.*, javax.servlet.*,
javax.servlet.http.*, java.util.*"%>

<%
        User user = null;
        if(session!=null)
        {
            String email = session.getAttribute("user").toString();
            user = new User();
            user.setFullName(request.getParameter("name"));
            user.setUserEmail(session.getAttribute("user").toString());
            user.setProfilePic(request.getParameter("profilepic"));
            user.setCoverPic(request.getParameter("coverpic"));
            user.setUserUniversity(request.getParameter("university"));
            user.setUserDOB(request.getParameter("dob"));
            user.setUserMajor(request.getParameter("major"));
            user.setUserCity(request.getParameter("city"));
            user.setJoinDate(request.getParameter("joindate"));
            user.setLeavingDate(request.getParameter("leavedate"));
            user.setUserGender(request.getParameter("gender"));
            user.setUserPhone(request.getParameter("phone"));   

            MySqlDataStoreUtilities.updateUser(user);
            response.sendRedirect("/Project/PrivateAbout.jsp");
        }
%>
