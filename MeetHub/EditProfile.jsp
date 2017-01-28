<!DOCTYPE html>

<%@ page
import= "com.User, com.MySqlDataStoreUtilities, java.io.*, javax.servlet.*,
javax.servlet.http.*, java.util.*"%>

<%
        HashMap<String,String> friendList = null;
        User friendRequestBy = null;
        User friend = null;
        User user = null;
        if(request.getSession(false) != null)
        {
            String email = session.getAttribute("user").toString();
            user = MySqlDataStoreUtilities.getUserInfo(email);
            friendList = MySqlDataStoreUtilities.getFriendRequests(email);
        }
%>

<html class='hide-sidebar ls-bottom-footer' lang='en'>
<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<meta name='description' content=''>
<meta name='author' content=''>
<title>MeetHub</title>
<link href="css/vendor/all.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<link href="css/app/app.css" rel="stylesheet">
<link href="css/stylesheet.css" rel="stylesheet">
<script src="javascript.js"></script>
</head>
<body onload="init()">

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
  <strong><a class='navbar-brand' href='index.html'>MeetHub</a></strong>
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
  <%
    if(friendList.size()!=0)
    {
      for(Map.Entry<String, String> entry : friendList.entrySet())
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
                  <img name='coverpic' src='images/<%= user.coverpic %>' style="width:1138px;height:300px;" />
                </div>
              <div class='cover-info'>
                <div class='avatar'>
                  <img name='profilepic' src='images/<%= user.profilepic %>' />
                </div>
                <div class='name'><a href='#'><%= user.name %></a></div>
              </div>
            </div>
              <form id='update' action='/Project/UpdateProfile.jsp' method='post' accept-charset='UTF-8'>
                <h4 class="page-section-heading">Update Profile</h4>
                  <div class="panel panel-default">
                    <div class="panel-body">
                      <form>
                        <div class="row">
                          <div class="col-md-6">
                            <div class="form-group form-control-default">
                              <label for="FullName">Full name</label>
                              <input readonly type="read" class="form-control" name='name' value='<%= user.name %>'>
                            </div>
                          </div>
                          <div class="col-md-6">
                            <div class="form-group form-control-default">
                              <label for="Email">Email address</label>
                              <input readonly type="read" class="form-control" name='email' value='<%= user.email %>'>
                            </div>
                          </div>
                        </div>
                        <div class="form-group form-control-default required">
                          <label for="Age">Age</label>
                          <input required type="text" class="form-control" name='age' placeholder="Enter Age">
                        </div>
                        <div class="form-group form-control-default required">
                          <label for="Gender">Gender</label>
                          <select name='gender'>
                                <option value='Male'>Male</option>
                                <option value='Female'>Female</option>
                          </select>
                        </div>
                        <div class="form-group form-control-default required">
                          <label for="University">University</label>
                          <input required type="text" class="form-control" name='university' placeholder="University Name">
                        </div>
                        <div class="form-group form-control-default required">
                          <label for="Major">Major</label>
                          <input required type="text" class="form-control" name='major' placeholder="Major">
                        </div>
                        <div class="form-group form-control-default required">
                          <label for="City">City</label>
                          <input required type="text" class="form-control" name='city' placeholder="City">
                        </div>
                        <div class="form-group form-control-default required">
                          <label for="Phone">Phone</label>
                          <input required type="text" class="form-control" name='phone' placeholder="Phone">
                        </div>
                        <div class="form-group form-control-default required">
                          <label for="dob">Date Of Birth</label>
                          <input required type="date" class="form-control" name='dob'>
                        </div>
                        <div class="form-group form-control-default required">
                          <label for="joindate">Joining Date</label>
                          <input required type="date" class="form-control" name='joindate'>
                        </div>
                        <div class="form-group form-control-default required">
                          <label for="leavedate">Graduation Date</label>
                          <input required type="date" class="form-control" name='leavedate'>
                        </div>
                        <center><button class='btn btn-primary'><i class='fa fa-check-circle-o'></i>Submit Changes</button></center>
                      </form>
                    </div>
                  </div>
              </form>
        <!-- Footer -->
        <footer class='footer'>
        <strong>MeetHub</strong> v1.0.0 &copy; Copyright 2016
        </footer>
        <!-- Footer -->
        </body>
        </html>
