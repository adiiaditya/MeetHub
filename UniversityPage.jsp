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
<body onload="init()" style="width:100%;">
<%@ page import= "com.*, com.AutoComplete, com.MySqlDataStoreUtilities, java.io.*, javax.servlet.*,
javax.servlet.http.*, java.util.*, java.text.* "%>

<%
    HashMap<String,String> friendList = null;
    User user = null;
    User friend = null;
	ArrayList<addToGroup> atg = new ArrayList<addToGroup>();
    if(session!=null)
    {
        String email = session.getAttribute("user").toString();
        user = MySqlDataStoreUtilities.getUserInfo(email);
        friendList = MySqlDataStoreUtilities.getFriendRequests(email);
    }
    else
    {
        user = MySqlDataStoreUtilities.getUserInfo("akulk2@uis.edu");
    }
	String universityName = request.getParameter("value1");

	atg = MySqlDataStoreUtilities.getStatusInGroup(universityName);
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
      <a href='Inbox.jsp' >
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
        <div class='name'><a href='#'><%= universityName %></a></div>
        <ul class='cover-nav'>
          <li class='active'><a href='UniversityPage.jsp?value1=<%= universityName%>'><i class='fa fa-fw fa-user'></i> Discussion</a></li>
          <li><a href='UniversityMembers.jsp?value1=<%= universityName%>'><i class='fa fa-fw fa-users'></i> Members</a></li>

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


	<div>
        <div class='timeline-block'>
          <div class='panel panel-default  clearfix-xs'>
            <div class='panel-body'>
              <div class='panel-body'>
              <form id='postStatus' action='PostStatusInGroup.jsp?value1=<%= universityName%>&value2=<%= user.name%>' method='post' accept-charset='UTF-8' enctype="multipart/form-data">
              <textarea name='status' class='form-control share-text' rows='3' placeholder='Whats new?'></textarea>
              <input type='hidden' name='hiddenEmail' value='<%= user.email %>'>
            </div>
            <div class='panel-footer share-buttons'>
			<table style="background-color:transparent; width:100%;">
			<tr>
			<td>
        <input type="file" id="newClick" class="form-control" name="fileName" style="width:500px"/></td>
      <td>
				<select required name="accessSpecifier" style="background-color:#26a69a;border-color:#26a69a;width:150px">
					<option value="Private">Private</option>
					<option value="Public">Public</option>
				</select>
			</td>
			<td>
				<button type='submit' class='btn btn-primary btn-xs pull-right display-none' href='#' style="display:block;">Post</button>
			</td>
			</tr>
			</table>
            </form>
            </div>
            </div>
          </div>
        </div>
      </div>


<div style="max-width:45%;float:right;">
      <div class="timeline-block">
        <div class="panel panel-default">

          <div class="panel-heading">
            <div class="media">

              <div class="media-body">
                <a href="">Twitter Trends</a>
              </div>
            </div>
          </div>

          <div class="panel-body">
                <%
          System.out.println("In twitter");
                BufferedReader reader = new BufferedReader(new FileReader(new File("/usr/local/Cellar/tomcat/8.5.5/libexec/webapps/Project/"+universityName+".txt")));
                System.out.println("buffered reader done");
          while((reader.readLine()) != null)
                        {
                          String line = reader.readLine();
                          System.out.println(line);
                          %>
                          <p><i class="fa fa-fw fa-twitter"></i>
            <strong><%= universityName %></strong>: <%= line%>
          </p>
                          <%
                          }%>
            </div>
          </div>

        </div>
      </div>


	<%
	//System.out.println("Before For loop" + atg.size());
		if(user.getUserUniversity().equals(universityName))
		{
		  for(int i=0;i<atg.size();i++)
		  {
			String currentUserName = atg.get(i).getname();
			String currentUserDate = atg.get(i).getDate();
			String currentUserStatus = atg.get(i).getstatus();
			String currentUserFile = atg.get(i).getfile();

			if(currentUserFile.equals(""))
			{
				currentUserFile = "";
			}
			if(currentUserStatus.equals(""))
			{
				currentUserStatus = "";
			}
			User userNew = null;
			userNew = MySqlDataStoreUtilities.getUserInfoForGroup(currentUserName);
			//System.out.println("in the loop " + userNew.getProfilePic() + currentUserName + currentUserDate + atg.get(i).getstatus() + atg.get(i).getfile());
	%>

<div style="max-width:45%;float:left;">

                <div class="timeline-block">
                  <div class="panel panel-default">

                    <div class="panel-heading">
                      <div class="media">
                        <div class="media-left">
                          <a href="">
                            <img src="images/<%= userNew.getProfilePic() %>" height="50" width="50" class="media-object">
                          </a>
                        </div>
                        <div class="media-body">

                          <a href=""><%= currentUserName %></a>

                          <span>on <%= currentUserDate%></span>
                        </div>
                      </div>
                    </div>

                    <div class="panel-body">
                      <p><%= currentUserStatus %></p>
					            <a href="/Project/ReadServlet?fileId=<%= currentUserFile %>"><%= currentUserFile %></a>

                    </div>
                    <div class="view-all-comments">
                      <a href="#">
                        <i class="fa fa-comments-o"></i>
                      </a>
                      <span>0 comments</span>
                    </div>
                    <ul class="comments">
                      <li class="comment-form">
                        <div class="input-group">

                          <span class="input-group-btn">
                              <a href="" class="btn btn-default"><i class="fa fa-comment"></i></a>
                          </span>
                          <input type="text" class="form-control" />

                        </div>
                      </li>
                    </ul>
                  </div>
                </div>

</div>
	<%
			}
		}
		else{
			//System.out.println("In else condition                           -------------->");
				ArrayList<addToGroup> atgPublic = new ArrayList<addToGroup>();
				atgPublic = MySqlDataStoreUtilities.getPublicStatusInGroup(universityName);
				for(int i=0;i<atgPublic.size();i++)
				{
			String PubliccurrentUserName = atgPublic.get(i).getname();
			String PubliccurrentUserDate = atgPublic.get(i).getDate();
			String PubliccurrentUserStatus = atgPublic.get(i).getstatus();
			String PubliccurrentUserFile = atgPublic.get(i).getfile();

			if(PubliccurrentUserFile.equals(""))
			{
				PubliccurrentUserFile = "";
			}
			if(PubliccurrentUserStatus.equals(""))
			{
				PubliccurrentUserStatus = "";
			}
			User userNew = null;
			userNew = MySqlDataStoreUtilities.getUserInfoForGroup(PubliccurrentUserName);
%>

<div style="max-width:45%;float:left;">

                <div class="timeline-block">
                  <div class="panel panel-default">

                    <div class="panel-heading">
                      <div class="media">
                        <div class="media-left">
                          <a href="">
                            <img src="images/<%= userNew.getProfilePic() %>" height="50" width="50" class="media-object">
                          </a>
                        </div>
                        <div class="media-body">

                          <a href=""><%= PubliccurrentUserName %></a>

                          <span>on <%= PubliccurrentUserDate%></span>
                        </div>
                      </div>
                    </div>

                    <div class="panel-body">
                      <p><%= PubliccurrentUserStatus %></p>
					            <p>File Name: <%= PubliccurrentUserFile %></p>
                    </div>
                    <div class="view-all-comments">
                      <a href="#">
                        <i class="fa fa-thumbs-up"></i>
                      </a>
                      <span>0</span>
                      <a href="#">
                        <i class="fa fa-comments-o"></i>
                      </a>
                      <span>0 comments</span>
                    </div>
                    <ul class="comments">
                      <li class="comment-form">
                        <div class="input-group">

                          <span class="input-group-btn">
                   <a href="" class="btn btn-default"><i class="fa fa-comment"></i></a>
                </span>

                          <input type="text" class="form-control" />

                        </div>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>

	<%
				}
		}
	%>

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
