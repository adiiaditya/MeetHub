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

</head>
<body onload="init()">
<%@ page import= "com.User, com.AutoComplete, com.MySqlDataStoreUtilities, java.io.*, javax.servlet.*,
javax.servlet.http.*, java.util.*"%>

<%
    HashMap<String,String> friendRequestsList = null;
    User user = null;
    User friendRequestBy = null;
    if(request.getSession(false) !=null)
    {
        String email = session.getAttribute("user").toString();
        user = MySqlDataStoreUtilities.getUserInfo(email);
        friendRequestsList = MySqlDataStoreUtilities.getFriendRequests(email);
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
                <span class="badge badge-primary"><%= friendRequestsList.size() %></span>
              </a>
              <ul class="dropdown-menu" role="notification">
                <li class="dropdown-header">Notifications</li>
<%
  if(friendRequestsList.size()!=0)
  {
    for(Map.Entry<String, String> entry : friendRequestsList.entrySet())
    {
      friendRequestBy = MySqlDataStoreUtilities.getUserInfo(entry.getKey());
%>
                  <li class="media">
                  <div class="media-left">
                    <img src="images/<%= friendRequestBy.profilepic %>" alt="people" class="img-circle" width="30">
                  </div>
                  <div class="media-body">
                    <a href="#"><%= friendRequestBy.name %></a> sent you a friend request.
                    <form id='updateFriend' action='UpdateFriend.jsp' method='post' accept-charset='UTF-8'>
                    <button class="btn btn-default btn-circle"><i class="fa fa-check"></i></button>
                    <input type='hidden' name='hiddenUserName' value='<%= friendRequestBy.email %>'>
                    <input type='hidden' name='hiddenFriendName' value='<%= user.email %>'>
                    </form>
                    <form id='deleteFriendRequest' action='RemoveFriendRequest.jsp' method='post' accept-charset='UTF-8'>
                    <button class="btn btn-default btn-circle"><i class="fa fa-remove"></i></button>
                    <input type='hidden' name='hiddenUserName' value='<%= friendRequestBy.email %>'>
                    <input type='hidden' name='hiddenFriendName' value='<%= user.email %>'>
                    </form>
                  </div>
                  </li>
<%
    }
  }
%>
  </ul>
  </li>
<!-- // END notifications -->
    <li class='hidden-xs'>
      <a href='Inbox.jsp'>
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
          <img src='images/<%= user.coverpic %>' style="width:1138px;height:300px;" onclick="callUploadCoverPic()" />
        </div>
      <div class='cover-info'>
        <div class='avatar'>
       <img src='images/<%= user.profilepic %>' onclick="callUploadProfilePic()" />
        </div>
        <div class='name'><a href='#'><%= user.name %></a></div>
        <ul class='cover-nav'>
          <li class='active'><a href='PrivateAbout.jsp'><i class='fa fa-fw fa-user'></i> About</a></li>
          <li><a href='PrivateTimeline.jsp'><i class='fa fa-fw fa-ship'></i> Timeline</a></li>
          <li><a href='PrivateFriends.jsp'><i class='fa fa-fw fa-users'></i> Friends</a></li>
          <li><a href='PrivateEvents.jsp'><i class='fa fa-fw fa fa-fw fa-birthday-cake'></i> Events</a></li>
		      <li><a href='PrivateGroup.jsp'><i class='fa fa-fw fa fa-fw fa-institution'></i>Groups</a></li>
        </ul>
      </div>
    </div>
<div class="timeline row" data-toggle="isotope">
<div class='col-xs-12 col-md-6 col-lg-4 item'>
        <div class='timeline-block'>
          <div class='panel panel-default profile-card clearfix-xs'>
            <div class='panel-body'>
              <div class='profile-card-icon'>
                <i class='fa fa-file-text'></i>
              </div>
              <h4 class="text-center">Whats new?</h4>
              <div class='panel-body'>
                <form id='postStatus' action='PostStatus.jsp' method='post' accept-charset='UTF-8'>
              <textarea name='status' class='form-control share-text' rows='3' placeholder='Whats new?'></textarea>
              <input type='hidden' name='hiddenEmail' value='<%= user.email %>'>
            </div>
            <div class='panel-footer share-buttons'>
              <button type='submit' class='btn btn-primary btn-xs pull-right display-none' href='#' style="display: block;">Post</button>
            </form>
            </div>
            </div>
          </div>
        </div>
      </div>
  <div class='col-xs-12 col-md-6 col-lg-4 item'>
        <div class='timeline-block'>
          <div class='panel panel-default profile-card clearfix-xs'>
            <div class='panel-body'>
              <div class='profile-card-icon'>
                <i class='fa fa-graduation-cap'></i>
              </div>
              <h4 class='text-center'>Graduation Badge</h4>
              <ul class='icon-list icon-list-block'>
               <li><i class='fa fa-university'></i><%= user.university %></li>
                <li><i class='fa fa-map-marker'></i><%= user.city %></li>
                <li><i class='fa fa-book'></i><%= user.major %></li>
                <li><i class='fa fa-calendar'></i><%= user.leavingdate %></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
       <div class='col-xs-12 col-md-6 col-lg-4 item'>
        <div class='timeline-block'>
          <div class='panel panel-default profile-card clearfix-xs'>
            <div class='panel-body'>
              <div class='profile-card-icon'>
                <i class='fa fa-info'></i>
              </div>
              <h4 class='text-center'>Basic Info</h4>
              <ul class='icon-list icon-list-block'>
               <li><i class='fa fa-calendar'></i><%= user.dateofbirth %></li>
                <li><i class='fa fa-venus-mars'></i><%= user.gender %></li>
                <li><i class='fa fa-phone'></i><%= user.phone %></li>
                <li><i class='fa fa-envelope'></i><%= user.email %></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</div>
</div>
</div>
<form id="edit" action="EditProfile.jsp" method="post" accept-charset="UTF-8">
  <center><button class="btn btn-primary"><i class="fa fa-user-secret"></i>Update Profile</button></center>
</form>
<!-- Footer -->
<footer class="footer">
<strong>MeetHub</strong> v1.0.0 &copy; Copyright 2016
</footer>
<!--  Footer -->
<script src="javascript.js"></script>
<script type="text/javascript">
  function callUploadProfilePic() {
    var jspcall = "UploadProfilePhoto.jsp"
    window.location.href = jspcall
  }
  function callUploadCoverPic() {
    var jspcall = "UploadCoverPhoto.jsp"
    window.location.href = jspcall
  }
</script>
</body>
</html>
