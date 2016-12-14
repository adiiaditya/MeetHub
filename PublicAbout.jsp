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
<script src="javascript.js"></script>
</head>
<body onload="init()">
<%@ page import= "com.User, com.AutoComplete, com.MySqlDataStoreUtilities, java.io.*, javax.servlet.*,
javax.servlet.http.*, java.util.*" %>

<%
    HashMap<String,String> sentFriendList = null;
    HashMap<String,String> receivedFriendList = null;
    User user = null;
    String searchedUserEmail = request.getParameter("searchedUser");
    User searchedUser = null;

    if(session!=null)
    {
      String email = session.getAttribute("user").toString();
      user = MySqlDataStoreUtilities.getUserInfo(email);
      searchedUser = MySqlDataStoreUtilities.getUserInfo(searchedUserEmail);
      sentFriendList = MySqlDataStoreUtilities.getSentFriendRequests(email, searchedUser.email);
      receivedFriendList = MySqlDataStoreUtilities.getFriendRequests(email);
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
                <span class="badge badge-primary"><%= receivedFriendList.size() %></span>
              </a>
              <ul class="dropdown-menu" role="notification">
                <li class="dropdown-header">Notifications</li>
<%
  if(receivedFriendList.size()!=0)
  {
    for(Map.Entry<String, String> entry : receivedFriendList.entrySet())
    {
%>
                  <li class="media">
                  <div class="media-left">
                    <img src="images/<%= user.profilepic %>" alt="people" class="img-circle" width="30">
                  </div>
                  <div class="media-body">
                    <a href="#"><%= entry.getKey() %></a> sent you a friend request.
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
            <img src='images/<%= searchedUser.coverpic %>' style="width:1138px;height:300px;" />

          </div>
      <div class='cover-info'>
        <div class='avatar'>
       <img src='images/<%= searchedUser.profilepic %>' />
        </div>
        <div class='name'><a href='#'><%= searchedUser.name %></a></div>
        <ul class='cover-nav'>
          <li class='active'><a href='PublicAbout.jsp?searchedUser=<%= searchedUser.email %>'><i class='fa fa-fw fa-user'></i> About</a></li>
          <li><a href='PublicTimeline.jsp?searchedUser=<%= searchedUser.email %>'><i class='fa fa-fw fa-ship'></i> Timeline</a></li>
          <li><a href='PublicFriends.jsp?searchedUser=<%= searchedUser.email %>'><i class='fa fa-fw fa-users'></i> Friends</a></li>
          <li><a href='PublicEvents.jsp?searchedUser=<%= searchedUser.email %>'><i class='fa fa-fw fa fa-fw fa-birthday-cake'></i> Events</a></li>
          <li><a href='PublicGroup.jsp?searchedUser=<%= searchedUser.email %>'><i class='fa fa-fw fa fa-fw fa-institution'></i>Groups</a></li>
        </ul>
<%
    if(sentFriendList.size()!= 0)
    {
      for(Map.Entry<String, String> entry : sentFriendList.entrySet())
      {
        System.out.println("hello" + entry.getKey() + entry.getValue());
        if(entry.getKey().equals(searchedUser.email) && entry.getValue().equals("pending"))
        {
%>
          <form id='add' action='AddFriend.jsp' method='post' accept-charset='UTF-8'>
          <button style='float: right; vertical-align:middle;' class='btn btn-primary'><i class='fa fa-user'></i>Pending Approval</button>
          <input type='hidden' name='hiddenUserName' value='<%= user.email %>'>
          <input type='hidden' name='hiddenFriendName' value='<%= searchedUser.email %>'>
          </form>
<%
        }
        else if(!entry.getKey().equals(searchedUser.email))
        {
          System.out.println(entry.getKey());
          System.out.println(searchedUser.email);
          System.out.println("Why me?");
%>
          <form id='add' action='AddFriend.jsp' method='post' accept-charset='UTF-8'>
          <button style='float: right; vertical-align:middle;' class='btn btn-primary'><i class='fa fa-user-plus'></i>Add as a friend</button>
          <input type='hidden' name='hiddenUserName' value='<%= user.email %>'>
          <input type='hidden' name='hiddenFriendName' value='$<%= searchedUser.email %>'>
          </form>
<%
        }
        //else if denied write querry to delete the row from table
        else if(entry.getKey().equals(searchedUser.email) && entry.getValue().equals("accepted"))
        {
%>
          <form id='remove' action='RemoveFriend.jsp' method='post' accept-charset='UTF-8'>
          <button style='float: right; vertical-align:middle;' class='btn btn-primary'><i class='fa fa-user-times'></i>Remove Friend</button>
          <input type='hidden' name='hiddenUserName' value='<%= user.email %>'>
          <input type='hidden' name='hiddenFriendName' value='<%= searchedUser.email %>'>
          </form>
<%
        }
      }
    }
    else
    {
%>
          <form id='add' action='AddFriend.jsp' method='post' accept-charset='UTF-8'>
          <button style='float: right; vertical-align:middle;' class='btn btn-primary'><i class='fa fa-user-plus'></i>Add as a friend</button>
          <input type='hidden' name='hiddenUserName' value='<%= user.email %>'>
          <input type='hidden' name='hiddenFriendName' value='<%= searchedUser.email %>'>
          </form>
<%
    }
%>


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
                       <li><i class='fa fa-university'></i><%= searchedUser.university %></li>
                        <li><i class='fa fa-map-marker'></i><%= searchedUser.city %></li>
                        <li><i class='fa fa-book'></i><%= searchedUser.major %></li>
                        <li><i class='fa fa-calendar'></i><%= searchedUser.leavingdate %></li>
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
                       <li><i class='fa fa-calendar'></i><%= searchedUser.dateofbirth %></li>
                        <li><i class='fa fa-venus-mars'></i><%= searchedUser.gender %></li>
                        <li><i class='fa fa-phone'></i><%= searchedUser.phone %></li>
                        <li><i class='fa fa-envelope'></i><%= searchedUser.email %></li>
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
        <!-- Footer -->
        <footer class="footer">
        <strong>MeetHub</strong> v1.0.0 &copy; Copyright 2016
        </footer>
        <!--  Footer -->
        <!-- Vendor Scripts Bundle -->
</body>
</html>
