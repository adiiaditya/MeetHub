<!DOCTYPE html>
<html class="hide-sidebar ls-bottom-footer" lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>MeetHub</title>
<link href="css/vendor/all.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<link href="css/app/app.css" rel="stylesheet">
<link href="css/stylesheet.css" rel="stylesheet">
<script src="javascript.js"></script>
</head>
<body onload="init()">
<%@ page import= "com.User, com.AutoComplete, com.MySqlDataStoreUtilities, java.io.*, javax.servlet.*,
javax.servlet.http.*, java.util.*"%>

<%
    HashMap<String,String> friendList = null;
	ArrayList<User> friendListGroup = new ArrayList<User>();
    User user = null;
    User friend = null;
	String universityName = request.getParameter("value1");
    if(session!=null)
    {
      String email = session.getAttribute("user").toString();
      user = MySqlDataStoreUtilities.getUserInfo(email);
      friendList = MySqlDataStoreUtilities.getFriendRequests(email);
		  friendListGroup = MySqlDataStoreUtilities.getFriendInGroup(universityName);
    }

	%>

<!-- Wrapper required for sidebar transitions -->
<div class='st-container'>
<!-- Fixed navbar -->
<div class='navbar navbar-main navbar-primary navbar-fixed-top' role='navigation'>
<div class='container'>
<div class='navbar-header'>
<button type='button' class='navbar-toggle collapsed' data-toggle='collapse' data-target='#main-nav'>
    <span class='sr-only'>Toggle navigation</span>
    <span class='icon-bar'></span>
    <span class='icon-bar'></span>
    <span class='icon-bar'></span>
</button>
  <a href='#sidebar-chat' data-toggle='sidebar-menu' class='toggle pull-right visible-xs'><i class='fa fa-comments'></i></a>
<strong><a class='navbar-brand' href='PrivateAbout.jsp'>MeetHub</a></strong>
</div>
<!-- Collect the nav links, forms, and other content for toggling -->
<div class='collapse navbar-collapse' id='collapse'>
  <form class="navbar-form navbar-left hidden-xs">
    <div class="search-2">
      <div class="input-group">
      <span class="input-group-btn">
    <button class="btn btn-primary" type="button"><i class="fa fa-search"></i></button>
    </span>
    <form name="autofillform" action="autocomplete">
        <input class="form-control form-control-w-150" id='searchId' name='searchId' placeholder='Search people' type='text' onkeyup='doCompletion()' />
        <div id="auto-row" colspan="2">
            <table style="position:absolute;top:36px;left:32px;width:315px;" id='complete-table' class="popupBox"></table>
       </div>
    </form>
      </div>
    </div>
  </form>
  <ul class='nav navbar-nav  navbar-right'>
    <!-- notifications -->
            <li class="dropdown notifications updates hidden-xs hidden-sm">
              <a href="NotificationsPage.jsp" class="dropdown-toggle" data-toggle="dropdown">
                <i class="fa fa-bell-o"></i>
                <span class="badge badge-primary"><%= friendList.size() %></span>
              </a>
              <ul class="dropdown-menu" role="notification">
                <li class="dropdown-header">Notifications</li>
                <li class="media">
<%
  if(friendList.size()!=0)
  {
    for(Map.Entry<String, String> entry : friendList.entrySet())
    {
      user = MySqlDataStoreUtilities.getUserInfo(entry.getValue());
%>
                  <div class="media-left">
                    <img src="images/<%= user.profilepic %>" alt="people" class="img-circle" width="30">
                  </div>
                  <div class="media-body">
                    <a href="#"><%= entry.getValue() %></a> sent you a friend request.
                  </div>
<%
    }
  }
%>
                </li>
              </ul>
            </li>
            <!-- // END notifications -->

    <li class='hidden-xs'>
      <a href='messageinbox.jsp' >
        <i class='fa fa-comments'></i>
      </a>
    </li>
    <!-- User -->
    <li class='dropdown'>
      <a href='index.html' class='dropdown-toggle user' data-toggle='dropdown'>
        <img src='images/<%= user.profilepic %>' class='img-circle' width='40' /><%= user.name %>&nbsp&nbsp<i class="fa fa-sign-out"></i>
      </a>
    </li>
  </ul>
</div>
</div>
</div>
<!-- content push wrapper -->
<div class='st-pusher' id='content'>
<!-- this is the wrapper for the content -->
<div class='st-content'>
<!-- extra div for emulating position:fixed of the menu -->
<div class='st-content-inner'>
  <div class='container'>
  <div class='cover profile'>
        <div class='image'>
          <img src='images/<%= user.coverpic %>' style="width:1138px;height:300px;" />
        </div>
      <div class='cover-info'>
        <div class='avatar'>
       <img src='images/<%= user.profilepic %>' />
        </div>
        <div class='name'><a href='#'><%= universityName %></a></div>
        <ul class='cover-nav'>
          <li><a href='UniversityPage.jsp?value1=<%= universityName%>'><i class='fa fa-fw fa-user'></i> About</a></li>
          <li class='active'><a href='UniversityMembers.jsp?value1=<%= universityName%>'><i class='fa fa-fw fa-users'></i> Members</a></li>

		  <%if(MySqlDataStoreUtilities.checkAddedGroup(user.name,universityName))
		  {%>
			  <li><a href='RemoveFromGroup.jsp?value1=<%= universityName%>'><i class='fa fa-fw fa-remove'></i> Leave Group</a></li>
		  <%}else{%>
			  <li><a href='AddToGroup.jsp?value1=<%= universityName%>'><i class='fa fa-fw fa-plus'></i> Join Group</a></li>
		  <%}
		  %>

        </ul>
      </div>
    </div>


	           <div class="col-xs-12 col-md-6 col-lg-4 item">
                <table style="width:1115px; background-color:transparent;">
				<%
				int i =0;
				for(i=0;i<friendListGroup.size();i++)
				{
					String currentProfilePic = friendListGroup.get(i).getProfilePic();
					String currentFriendName = friendListGroup.get(i).getFullName();
          String currentFriendEmail = friendListGroup.get(i).getUserEmail();
					//System.out.println(friendListGroup.get(i));
					if(i%2==0)
					{%>
					<tr>
					<%}%>
					<td>
				<div class="timeline-block">
                  <div class="panel panel-default">

                    <div class="panel-heading">
                      <div class="media">

						<div class="media-left">
                          <a href="">
                            <img src="images/<%= currentProfilePic%>" height="50" width="50" class="media-object">
                          </a>
                        </div>
                        <div class="media-body">
						<a href="PublicAbout.jsp?searchedUser=<%=currentFriendEmail%>"><%= currentFriendName%></a>
						</div>
                      </div>
                    </div>
                  </div>
                </div>

				</td>
				<%
				if(i%2!=0)
				{%>
				</tr>
				<%}
				%>

				<%}
				%>
				</table>

              </div>





  </div>
</div>
</div>
</div>



</div>

<!-- Footer -->
<footer class="footer">
<strong>MeetHub</strong> v1.0.0 &copy; Copyright 2016
</footer>
<!--  Footer -->
</body>
</html>
