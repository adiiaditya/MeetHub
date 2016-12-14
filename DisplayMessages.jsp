<%@ page
import= "com.*, java.io.*, javax.servlet.*,
javax.servlet.http.*, java.util.*,java.text.*"%>

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
<script type="text/javascript" src="javascript.js"></script>
</head>
<body onload="init()">


<%
  User user = null;
  User friendRequestBy = null;
  User friend = null;
  ArrayList<Message> messageList = null;
  HashMap<String,String> friendRequestsList = null;
  String toEmailId = (String)session.getAttribute("user");
	String fromEmailID = request.getParameter("fromUserEmailId");




  if(session!=null)
  {
    messageList = MySqlDataStoreUtilities.getChatMessages(toEmailId,fromEmailID);
    user = MySqlDataStoreUtilities.getUserInfo(toEmailId);
    friendRequestsList = MySqlDataStoreUtilities.getFriendRequests(toEmailId);
    friend = MySqlDataStoreUtilities.getUserInfo(fromEmailID);
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

<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<div  align="center" style="margin: 20px;width:90%">
<article>
<table style="width:100%;background: none;">
<tr>
<td colspan="2">
<span style="font-size:28px;font-weight:bold;color:#777;margin-left: 2px;">Chat Messages</span>
</td>
<td align="right">
&nbsp;
</td>
</tr>
</table>
<div style="cursor:pointer; text-transform:none;">
<div>
  <div class="panel panel-default share">
    <form id="form" class="form1" action="StoreMessage.jsp?pageId=replyForm" method="POST">
      <input type="hidden" name="fromID" id="fromID" value="<%= toEmailId %>" />
      <input type="hidden"  id="toID" name="toID" value="<%= fromEmailID %>" />
    <div class="input-group">
      <div class="input-group-btn">

          <button class="btn btn-primary" href="#">
              <i class="fa fa-envelope"></i> Send
          </button>

      </div>
    <!-- /btn-group -->
        <input type="text" id="message" name="message" class="form-control share-text" placeholder="Write message..." />
    </div>
  </form>
  <!-- /input-group -->
  </div>
<% int count=0;
for(Message message : messageList){
 count++;
%>

<%if(message.getFromEmailID().equals(fromEmailID)){ %>
<div class="media">
    <div class="media-left">
        <a href="#">
            <img src="images/<%= friend.profilepic %>" width="60" class="media-object" />
        </a>
    </div>
    <div class="media-body message">
      <div class="panel panel-default">
        <div class="panel-heading panel-heading-white">
          <div class="pull-right">
            <%SimpleDateFormat sdf = new SimpleDateFormat("MMM dd 'at' HH:mm a");%>
            <small class="text-muted"><%= sdf.format(message.getSentOn())%></small>
          </div>
          <a href="#"><%= message.getFromUser()%></a>
        </div>
        <div class="panel-body"><%= message.getMessageText()%></div>
      </div>
    </div>
</div>

<%} else if(message.getFromEmailID().equals(toEmailId)){%>
<div class="media">
      <div class="media-body message">
          <div class="panel panel-default">
              <div class="panel-heading panel-heading-white">
                    <div class="pull-right">
                      <%SimpleDateFormat sdf = new SimpleDateFormat("MMM dd 'at' HH:mm a");%>
                      <small class="text-muted"><%= sdf.format(message.getSentOn())%></small>
                    </div>
              <a href="#">Me</a>
              </div>
              <div class="panel-body"><%= message.getMessageText()%></div>
          </div>
      </div>
      <div class="media-right">
        <img src="images/<%= user.profilepic %>" width="60" alt="" class="media-object" />
      </div>
</div>
<% }
}
%>

<%if(count==0){%>
	<div>
	<div>No Messages to Display</div>
	</div>
<%}%>
</div>
</article>


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
