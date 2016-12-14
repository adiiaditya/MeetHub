/*
 * MySqlDataStoreUtilities.java
 *
 */
package com;
import java.io.*;
import java.util.*;
import java.sql.*;

public class MySqlDataStoreUtilities
{
    static Connection con = null;
    public static void getConnection()
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MeetHubDatabase"
            ,"root","root");
        }
        catch(Exception e){
            e.printStackTrace();
        }
        finally {
    			if (con != null) {
    				// closes the database connection
    				try {
    					con.close();
    				} catch (SQLException ex) {
    					ex.printStackTrace();
    				}
    			}

    		}
    }

    public static void insertUser(String name, String email, String password){
        try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MeetHubDatabase"
            ,"root","root");

            PreparedStatement ps =
            con.prepareStatement( "insert into UserProfile values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setString(4, "default.gif");
            ps.setString(5, "defaultCover.gif");
            ps.setString(6, "");
            ps.setString(7, "");
            ps.setString(8, "");
            ps.setString(9, "");
            ps.setString(10, "");
            ps.setString(11, "");
            ps.setString(12, "");
            ps.setString(13, "");
            ps.execute();
        }
        catch(Exception e){
            e.printStackTrace();
        }
        finally {
    			if (con != null) {
    				// closes the database connection
    				try {
    					con.close();
    				} catch (SQLException ex) {
    					ex.printStackTrace();
    				}
    			}

    		}
    }

    public static void insertFriend(String userEmail, String friendEmail, String status){
        try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MeetHubDatabase"
            ,"root","root");

            PreparedStatement ps =
            con.prepareStatement( "insert into FriendList values(?,?,?)");
            ps.setString(1, userEmail);
            ps.setString(2, friendEmail);
            ps.setString(3, status);
            ps.execute();
        }
        catch(Exception e){
            e.printStackTrace();
        }
        finally {
    			if (con != null) {
    				// closes the database connection
    				try {
    					con.close();
    				} catch (SQLException ex) {
    					ex.printStackTrace();
    				}
    			}

    		}
    }

    public static void removeFriendRequest(String userEmail, String friendEmail, String status){
        try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MeetHubDatabase"
            ,"root","root");

            PreparedStatement ps =
            con.prepareStatement( "delete from FriendList WHERE username='"+userEmail+"' AND friendname='"+friendEmail+"' AND status='pending';");
            ps.executeUpdate();
        }
        catch(Exception e){
            e.printStackTrace();
        }
        finally {
    			if (con != null) {
    				// closes the database connection
    				try {
    					con.close();
    				} catch (SQLException ex) {
    					ex.printStackTrace();
    				}
    			}

    		}
    }

    public static void removeFriend(String userEmail, String friendEmail, String status){
        try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MeetHubDatabase"
            ,"root","root");

            PreparedStatement ps =
            con.prepareStatement( "delete from FriendList WHERE username='"+userEmail+"' AND friendname='"+friendEmail+"' AND status='accepted';");
            ps.executeUpdate();
        }
        catch(Exception e){
            e.printStackTrace();
        }
        finally {
    			if (con != null) {
    				// closes the database connection
    				try {
    					con.close();
    				} catch (SQLException ex) {
    					ex.printStackTrace();
    				}
    			}
    		}
    }

    public static void updateFriend(String userEmail, String friendEmail){
          try{
              Class.forName("com.mysql.jdbc.Driver").newInstance();
              con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MeetHubDatabase"
              ,"root","root");

              PreparedStatement ps =
              con.prepareStatement("update FriendList SET status='accepted' WHERE username='"+userEmail+"' AND friendname='"+friendEmail+"';");
              ps.executeUpdate();
          }
          catch(Exception e){
              e.printStackTrace();
          }
          finally {
      			if (con != null) {
      				// closes the database connection
      				try {
      					con.close();
      				} catch (SQLException ex) {
      					ex.printStackTrace();
      				}
      			}

      		}
      }

    public static List<String> getCommonFriends(String username, String friendname){
       List<String> commonFriendList = new ArrayList<String>();
    try{
      Class.forName("com.mysql.jdbc.Driver").newInstance();
          con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MeetHubDatabase"
          ,"root","root");

       PreparedStatement ps =
       con.prepareStatement("SELECT friendname from FriendList where username='"+username+"' AND status='accepted' AND friendname in (SELECT friendname from FriendList where username='"+friendname+"' AND status='accepted');");
       ResultSet result =ps.executeQuery();
      while (result.next()) {
          commonFriendList.add(result.getString("friendname"));
      }
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
    finally {
      if (con != null) {
        // closes the database connection
        try {
          con.close();
        } catch (SQLException ex) {
          ex.printStackTrace();
        }
      }

    }
  return commonFriendList;
  }

    public static HashMap<String,String> getFriendRequests(String email){
       HashMap<String,String> friendList = new HashMap<String,String>();
    try{
      Class.forName("com.mysql.jdbc.Driver").newInstance();
          con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MeetHubDatabase"
          ,"root","root");

       PreparedStatement ps =
       con.prepareStatement("select * from FriendList where friendname='"+email+"' AND status='pending';");
       ResultSet result =ps.executeQuery();
      while (result.next()) {
          friendList.put(result.getString("username"), result.getString("friendname"));
      }
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
    finally {
      if (con != null) {
        // closes the database connection
        try {
          con.close();
        } catch (SQLException ex) {
          ex.printStackTrace();
        }
      }

    }
  return friendList;
  }

  public static HashMap<String,String> getSentFriendRequests(String email, String friendEmail){
     HashMap<String,String> friendList = new HashMap<String,String>();
  try{
    Class.forName("com.mysql.jdbc.Driver").newInstance();
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MeetHubDatabase"
        ,"root","root");

     PreparedStatement ps =
     con.prepareStatement("select * from FriendList where username='"+email+"' AND friendname='"+friendEmail+"';");
     ResultSet result =ps.executeQuery();
    while (result.next()) {
        friendList.put(result.getString("friendname"), result.getString("status"));
    }
  }
  catch(Exception e)
  {
      e.printStackTrace();
  }
  finally {
    if (con != null) {
      // closes the database connection
      try {
        con.close();
      } catch (SQLException ex) {
        ex.printStackTrace();
      }
    }

  }
return friendList;
}

    public static void insertStatus(String email, String status, String date, int likeCount){
        try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MeetHubDatabase"
            ,"root","root");

            PreparedStatement ps =
            con.prepareStatement( "insert into StatusList values(?,?,?,?)");
            ps.setString(1, email);
            ps.setString(2, status);
            ps.setString(3, date);
            ps.setInt(4, likeCount);
            ps.execute();
        }
        catch(Exception e){
            e.printStackTrace();
        }
        finally {
    			if (con != null) {
    				// closes the database connection
    				try {
    					con.close();
    				} catch (SQLException ex) {
    					ex.printStackTrace();
    				}
    			}

    		}
    }

    public static boolean validateUniqueUser(String email){
        try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MeetHubDatabase"
            ,"root","root");

            PreparedStatement ps =
            con.prepareStatement( "select email from UserProfile");
            ResultSet results = ps.executeQuery();

           while (results.next()) {
            String storedEmail = results.getString("email");
                if(email.equals(storedEmail)) {
                    return false;
            }
        }
    }
       catch(Exception e){
            e.printStackTrace();
        }
        finally {
    			if (con != null) {
    				// closes the database connection
    				try {
    					con.close();
    				} catch (SQLException ex) {
    					ex.printStackTrace();
    				}
    			}

    		}
        return true;
    }


    public static boolean checkUser(String email,String password){
      try{
        Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MeetHubDatabase"
            ,"root","root");

         PreparedStatement ps =
         con.prepareStatement("select password from UserProfile where email='"+email+"';");
         ResultSet result =ps.executeQuery();
        while (result.next()) {
            if(result.getString("password").equals(password))
            {
                return true;
            }
        }
      }
      catch(Exception e)
      {
          e.printStackTrace();
      }
      finally {
        if (con != null) {
          // closes the database connection
          try {
            con.close();
          } catch (SQLException ex) {
            ex.printStackTrace();
          }
        }

      }
    return false;
  }

  public static User getUserInfo(String email){
        User user = null;
      try{
        Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MeetHubDatabase"
            ,"root","root");

         PreparedStatement ps =
         con.prepareStatement("select * from UserProfile where email='"+email+"';");
         ResultSet result =ps.executeQuery();
        while (result.next()) {
            user = new User();
            user.setFullName(result.getString("name"));
            user.setUserEmail(result.getString("email"));
            user.setProfilePic(result.getString("profilepic"));
            user.setCoverPic(result.getString("coverpic"));
            user.setUserUniversity(result.getString("university"));
            user.setUserDOB(result.getString("dateofbirth"));
            user.setUserMajor(result.getString("major"));
            user.setUserCity(result.getString("city"));
            user.setJoinDate(result.getString("joindate"));
            user.setLeavingDate(result.getString("leavingdate"));
            user.setUserGender(result.getString("gender"));
            user.setUserPhone(result.getString("phone"));
        }
      }
      catch(Exception e)
      {
          e.printStackTrace();
      }
      finally {
  			if (con != null) {
  				// closes the database connection
  				try {
  					con.close();
  				} catch (SQLException ex) {
  					ex.printStackTrace();
  				}
  			}

  		}
    return user;
  }

  public static HashMap<String,User> getUsers(){
        HashMap<String,User> userList = new HashMap<String,User>();
        try{
        Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MeetHubDatabase"
            ,"root","root");
        PreparedStatement ps = con.prepareStatement("select * from UserProfile");
         ResultSet result =ps.executeQuery();
        while (result.next()) {
            User user = new User();
            user.setFullName(result.getString("name"));
            user.setProfilePic(result.getString("profilepic"));
            userList.put(result.getString("name"), user);
        }
      }
      catch(Exception e)
      {
          e.printStackTrace();
      }
      finally {
  			if (con != null) {
  				// closes the database connection
  				try {
  					con.close();
  				} catch (SQLException ex) {
  					ex.printStackTrace();
  				}
  			}

  		}
    return userList;
  }

  public static ArrayList<Status> getUserStatus(String email){
	  ArrayList<Status> statusList = new ArrayList<Status>();
	  Status status = null;
 try{
    Class.forName("com.mysql.jdbc.Driver").newInstance();
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MeetHubDatabase"
        ,"root","root");

     PreparedStatement ps =
     con.prepareStatement("select * from StatusList where email='"+email+"' ORDER BY date DESC;");
     ResultSet result =ps.executeQuery();
    while (result.next()) {
        status = new Status();
        status.setEmail(result.getString("email"));
        status.setStatus(result.getString("status"));
        status.setDate(result.getString("date"));
        status.setLikes(result.getInt("likes"));
		    statusList.add(status);
    }
  }
  catch(Exception e)
  {
      e.printStackTrace();
  }
  finally {
    if (con != null) {
      // closes the database connection
      try {
        con.close();
      } catch (SQLException ex) {
        ex.printStackTrace();
      }
    }

  }
return statusList;
  }

  public static void updateUser(User user){
        try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MeetHubDatabase"
            ,"root","root");

            PreparedStatement ps =
            con.prepareStatement("update UserProfile SET university='"+user.university+"', dateofbirth='"+user.dateofbirth+"', major='"+user.major+"', city='"+user.city+"', joindate='"+user.joindate+"', leavingdate='"+user.leavingdate+"', gender='"+user.gender+"', phone='"+user.phone+"' WHERE email='"+user.email+"';");
            ps.executeUpdate();
        }
        catch(Exception e){
            e.printStackTrace();
        }
        finally {
          if (con != null) {
            // closes the database connection
            try {
              con.close();
            } catch (SQLException ex) {
              ex.printStackTrace();
            }
          }

        }
    }

  	public static String readFile(String fileId) {
  		Connection conn = null;
  		String fileName = null;
      String accessSpecifier = null;
  		try {
  			Class.forName("com.mysql.jdbc.Driver").newInstance();
  			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/MeetHubDatabase", "root", "root");

  			// constructs SQL statement
  			String sql = "SELECT file, accessSpecifier FROM AddToGroup WHERE file = ?";
  			PreparedStatement statement = conn.prepareStatement(sql);
  			statement.setString(1, fileId);

  			ResultSet result = statement.executeQuery();
  			if (result.next()) {

  				fileName = result.getString("file");
  				accessSpecifier = result.getString("accessSpecifier");
  				System.out.println(fileName);
  			}
  			conn.close();

  		} catch (SQLException ex) {

  			ex.printStackTrace();
  		} catch (Exception ex) {
  			ex.printStackTrace();
  		} finally {
  			if (conn != null) {
  				// closes the database connection
  				try {
  					conn.close();
  				} catch (SQLException ex) {
  					ex.printStackTrace();
  				}
  			}

  		}
  		return fileName;
  	}

  	public static String updateUserProfilePicture(String fileName, User user) {
  		try {
  			Class.forName("com.mysql.jdbc.Driver").newInstance();
  			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MeetHubDatabase", "root", "root");

  			PreparedStatement ps = con.prepareStatement("update UserProfile SET profilepic=? WHERE email=?");
  			ps.setString(1, fileName);
  			ps.setString(2, user.getUserEmail());
  			ps.executeUpdate();
  			return "SUCCESS";

  		} catch (Exception e) {
  			e.printStackTrace();
  			return "FAILURE";
  		}
      finally {
        if (con != null) {
          // closes the database connection
          try {
            con.close();
          } catch (SQLException ex) {
            ex.printStackTrace();
          }
        }

      }
  	}

  	public static String updateUserCoverPicture(String fileName, User user) {
  		try {
  			Class.forName("com.mysql.jdbc.Driver").newInstance();
  			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MeetHubDatabase", "root", "root");

  			PreparedStatement ps = con.prepareStatement("update UserProfile SET coverpic=? WHERE email=?");
  			ps.setString(1, fileName);
  			ps.setString(2, user.getUserEmail());
  			ps.executeUpdate();
  			return "SUCCESS";

  		} catch (Exception e) {
  			e.printStackTrace();
  			return "FAILURE";
  		}
      finally {
        if (con != null) {
          // closes the database connection
          try {
            con.close();
          } catch (SQLException ex) {
            ex.printStackTrace();
          }
        }

      }
  	}

    //Update this function to everyone
	public static void CreateEvent(String eventadmin,String eventName,String eventLocation,String eventDate,String eventTime,String eventType,String eventImage)
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MeetHubDatabase","root","root");
			PreparedStatement ps =
            con.prepareStatement( "insert into EventsTable values(?,?,?,?,?,?,?)");
			ps.setString(1,eventadmin);
			ps.setString(2,eventName);
            ps.setString(3,eventLocation);
			ps.setString(4,eventDate);
			ps.setString(5,eventTime);
			ps.setString(6,eventType);
			ps.setString(7,eventImage);
			ps.execute();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
    finally {
      if (con != null) {
        // closes the database connection
        try {
          con.close();
        } catch (SQLException ex) {
          ex.printStackTrace();
        }
      }

    }
	}

	//Update this function to everyone
	public static ArrayList<Events> getEvents(String admin)
	{
		ArrayList<Events> a = new ArrayList<Events>();
		try
		{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MeetHubDatabase","root","root");
			PreparedStatement ps = con.prepareStatement("select * from EventsTable where eventadmin='"+admin+"';");
			ResultSet result =ps.executeQuery();
			if(result!=null)
			{
				while (result.next()) {
					String eventname = result.getString(2);
					String eventlocation = result.getString(3);
					String eventdate = result.getString(4);
					String eventtime = result.getString(5);
					String eventtype = result.getString(6);
					String eventImage = result.getString(7);
					Events e = new Events(admin,eventname,eventlocation,eventdate,eventtime,eventtype,eventImage);
					a.add(e);
				}
			}
		}
		catch(Exception e){
			System.out.println("getEvents error");
			e.printStackTrace();
		}
    finally {
      if (con != null) {
        // closes the database connection
        try {
          con.close();
        } catch (SQLException ex) {
          ex.printStackTrace();
        }
      }

    }
		return a;
	}

	//Update this function to everyone
	public static ArrayList<User> getFriends(String email){
         ArrayList<User> friendList = new ArrayList<User>();
      try{
        Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MeetHubDatabase","root","root");

         PreparedStatement ps =
         con.prepareStatement("select * from userprofile where email in (select friendname from friendlist where username='"+email+"' AND status='accepted');");
         ResultSet result =ps.executeQuery();
			if(result!=null){
				while (result.next()) {
					User u=new User();
					u.setFullName(result.getString(1));
					u.setUserEmail(result.getString(2));
					u.setPassword(result.getString(3));
					u.setProfilePic(result.getString(4));
					u.setCoverPic(result.getString(5));
					u.setUserUniversity(result.getString(6));
					u.setUserDOB(result.getString(7));
					u.setUserMajor(result.getString(8));
					u.setUserCity(result.getString(9));
					u.setJoinDate(result.getString(10));
					u.setLeavingDate(result.getString(11));
					u.setUserGender(result.getString(12));
					u.setUserPhone(result.getString(13));
					friendList.add(u);
				}
			}
		  }
		  catch(Exception e)
		  {
			  e.printStackTrace();
		  }
      finally {
        if (con != null) {
          // closes the database connection
          try {
            con.close();
          } catch (SQLException ex) {
            ex.printStackTrace();
          }
        }

      }
		return friendList;
		}

	//Update this function to everyone
	public static void AddUsertoEvent(String eventadmin,String eventname,String user)
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MeetHubDatabase","root","root");
         PreparedStatement ps = con.prepareStatement("insert ignore into UserEvent values(?,?,?)");
		 ps.setString(1,eventadmin);
		 ps.setString(2,eventname);
		 ps.setString(3,user);
		 ps.execute();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
    finally {
      if (con != null) {
        // closes the database connection
        try {
          con.close();
        } catch (SQLException ex) {
          ex.printStackTrace();
        }
      }

    }
	}

	//Update this function to everyone
	public static ArrayList<String> getUsersEvents(String eventname, String admin)
	{
		ArrayList<String> u = new ArrayList<String>();
		try
		{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MeetHubDatabase","root","root");
            String eventName = eventname.replaceAll("'","\\\\'");
         PreparedStatement ps =
         con.prepareStatement("select * from UserEvent where username='"+admin+"' and eventname='"+eventName+"';");
         ResultSet result =ps.executeQuery();
			if(result!=null){
				while (result.next())
				{
					u.add(result.getString(3));
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
    finally {
      if (con != null) {
        // closes the database connection
        try {
          con.close();
        } catch (SQLException ex) {
          ex.printStackTrace();
        }
      }

    }
		return u;
	}

	//Add this function to everyone, this one is specifically used as username in the input
	public static User getUserInfo2(String name){
        User user = null;
      try{
        Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MeetHubDatabase"
            ,"root","root");

         PreparedStatement ps =
         con.prepareStatement("select * from UserProfile where name='"+name+"';");
         ResultSet result =ps.executeQuery();
        while (result.next()) {
            user = new User();
            user.setFullName(result.getString("name"));
            user.setUserEmail(result.getString("email"));
            user.setProfilePic(result.getString("profilepic"));
            user.setCoverPic(result.getString("coverpic"));
            user.setUserUniversity(result.getString("university"));
            user.setUserDOB(result.getString("dateofbirth"));
            user.setUserMajor(result.getString("major"));
            user.setUserCity(result.getString("city"));
            user.setJoinDate(result.getString("joindate"));
            user.setLeavingDate(result.getString("leavingdate"));
            user.setUserGender(result.getString("gender"));
            user.setUserPhone(result.getString("phone"));
			}
		  }
		  catch(Exception e)
		  {
			  e.printStackTrace();
		  }
      finally {
  			if (con != null) {
  				// closes the database connection
  				try {
  					con.close();
  				} catch (SQLException ex) {
  					ex.printStackTrace();
  				}
  			}

  		}
		return user;
	  }

	  //Add this function to everyone
	  public static void DeleteEvent(String eventname)
	  {
		  try
		  {
				Class.forName("com.mysql.jdbc.Driver").newInstance();
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MeetHubDatabase","root","root");
        String eventName = eventname.replaceAll("'","\\\\'");
				PreparedStatement ps = con.prepareStatement("delete from EventsTable where eventname='"+eventName+"';");
				ps.executeUpdate();
				ps = con.prepareStatement("delete from UserEvent where eventname='"+eventName+"';");
				ps.executeUpdate();
		  }
		  catch(Exception e)
		  {
			  e.printStackTrace();
		  }
      finally {
  			if (con != null) {
  				// closes the database connection
  				try {
  					con.close();
  				} catch (SQLException ex) {
  					ex.printStackTrace();
  				}
  			}

  		}
	  }


	  //Update this function to everyone
	  public static ArrayList<Events> getEventsAttended(String user)
	{
		ArrayList<Events> a = new ArrayList<Events>();
		try
		{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
      con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MeetHubDatabase","root","root");
			PreparedStatement ps = con.prepareStatement("select * from EventsTable where eventname in (select eventname from userevent where username='"+user+"');");
			ResultSet result =ps.executeQuery();
			if(result!=null)
			{
				while (result.next()) {
					String admin=result.getString(1);
					String eventname = result.getString(2);
					String eventlocation = result.getString(3);
					String eventdate = result.getString(4);
					String eventtime = result.getString(5);
					String eventtype = result.getString(6);
					String eventImage = result.getString(7);
					Events e = new Events(admin,eventname,eventlocation,eventdate,eventtime,eventtype,eventImage);
					a.add(e);
				}
			}
		}
		catch(Exception e){
			System.out.println("getEvents error");
			e.printStackTrace();
		}
    finally {
      if (con != null) {
        // closes the database connection
        try {
          con.close();
        } catch (SQLException ex) {
          ex.printStackTrace();
        }
      }

    }
		return a;
	}

	//update this function to everyone
	public static void DropEvent(String admin, String eventname, String user)
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MeetHubDatabase","root","root");
            String eventName = eventname.replaceAll("'","\\\\'");
			PreparedStatement ps = con.prepareStatement("delete from UserEvent where eventadmin='"+admin+"' and eventname='"+eventName+"' and username='"+user+"';");
			ps.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
    finally {
      if (con != null) {
        // closes the database connection
        try {
          con.close();
        } catch (SQLException ex) {
          ex.printStackTrace();
        }
      }

    }
	}

  public static ArrayList<Message> getInboxMessage(String email){

	  ArrayList<Message> currentUserMessage = new ArrayList<Message>();

	  try{
        Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MeetHubDatabase","root","root");

         PreparedStatement ps = con.prepareStatement("select id,fromEmailID,toEmailID,fromUser,messageText,sentOn,count(*) from MessageList where toEmailID='"+email+"' group by fromEmailID order by sentOn desc;");
		 ResultSet result =ps.executeQuery();
        while (result.next()) {
            Message message = new Message();

			message.setId(result.getInt("id"));
			message.setFromEmailID(result.getString("fromEmailID"));
			message.setToEmailID(result.getString("toEmailID"));
			message.setFromUser(result.getString("fromUser"));
			message.setMessageText(result.getString("messageText"));
			message.setSentOn(result.getTimestamp("sentOn"));

			currentUserMessage.add(message);
		}
	  }
	  catch(Exception e)
      {
          e.printStackTrace();
      }
      finally {
  			if (con != null) {
  				// closes the database connection
  				try {
  					con.close();
  				} catch (SQLException ex) {
  					ex.printStackTrace();
  				}
  			}

  		}
    return currentUserMessage;
  }


  public static void insertUserMessage(Message message){
        try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MeetHubDatabase"
            ,"root","root");

            PreparedStatement ps =
            con.prepareStatement( "insert into MessageList values(?,?,?,?,?,?)");
            ps.setInt(1, message.getId());
            ps.setString(2, message.getFromEmailID());
            ps.setString(3, message.getToEmailID());
            ps.setString(4, message.getFromUser());
            ps.setString(5, message.getMessageText());
            ps.setTimestamp(6, new java.sql.Timestamp(message.getSentOn().getTime()));

            ps.executeUpdate();
        }
        catch(Exception e){
            e.printStackTrace();
        }
        finally {
    			if (con != null) {
    				// closes the database connection
    				try {
    					con.close();
    				} catch (SQLException ex) {
    					ex.printStackTrace();
    				}
    			}

    		}
    }


	public static ArrayList<Message> getChatMessages(String toemail,String fromEmailID){

	  ArrayList<Message> chatMessage = new ArrayList<Message>();

	  try{
        Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MeetHubDatabase"
            ,"root","root");

         PreparedStatement ps = con.prepareStatement("select * from MessageList where toEmailID='"+toemail+"' and fromEmailID='"+fromEmailID+"' OR toEmailID='"+fromEmailID+"' and fromEmailID='"+toemail+"' ;");
		 ResultSet result =ps.executeQuery();
        while (result.next()) {
            Message message = new Message();

			message.setId(result.getInt("id"));
			message.setFromEmailID(result.getString("fromEmailID"));
			message.setToEmailID(result.getString("toEmailID"));
			message.setFromUser(result.getString("fromUser"));
			message.setMessageText(result.getString("messageText"));
			message.setSentOn(result.getTimestamp("sentOn"));

			chatMessage.add(message);
		}
	  }
	  catch(Exception e)
      {
          e.printStackTrace();
      }
      finally {
  			if (con != null) {
  				// closes the database connection
  				try {
  					con.close();
  				} catch (SQLException ex) {
  					ex.printStackTrace();
  				}
  			}

  		}
    return chatMessage;
  }

//Titus Ka Code

public static ArrayList<String> getUniversityList()
	{
			  ArrayList<String> univList = new ArrayList<String>();

	  try{
        Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MeetHubDatabase"
            ,"root","root");

         PreparedStatement ps = con.prepareStatement("select DISTINCT university from UserProfile;");
		 ResultSet result =ps.executeQuery();
        while (result.next()) {
			String s = result.getString("university");
			univList.add(s);
		}
	  }
	  catch(Exception e)
      {
          e.printStackTrace();
      }
    return univList;
	}

	public static void insertUserInGroup(String name,String university,String file,String status,String Date,String time,String accessSpecifier)
	{
		try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MeetHubDatabase"
            ,"root","root");

            PreparedStatement ps =
            con.prepareStatement( "insert into addtogroup values(?,?,?,?,?,?,?)");
            ps.setString(1, university);
            ps.setString(2, name);
			      ps.setString(3,"");
			      ps.setString(4,status);
			      ps.setString(5,Date);
			      ps.setString(6,"");
			      ps.setString(7,accessSpecifier);

            ps.executeUpdate();
        }
        catch(Exception e){
            e.printStackTrace();
        }
	}

	public static boolean checkAddedGroup(String name, String university)
	{
		 try{
        Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MeetHubDatabase"
            ,"root","root");

         PreparedStatement ps =
         con.prepareStatement("select * from addtogroup where name='"+name+"' AND university='"+university+"';");
         ResultSet result =ps.executeQuery();
        while (result.next()) {
                return true;
        }
      }
      catch(Exception e)
      {
          e.printStackTrace();
      }
    return false;
	}
	public static void removeUserFromGroup(String name,String university)
	{
		try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MeetHubDatabase"
            ,"root","root");

            PreparedStatement ps =
			con.prepareStatement("delete from addtogroup where name='"+name+"' AND university='"+university+"';");
            ps.executeUpdate();
        }
        catch(Exception e){
            e.printStackTrace();
        }
	}
	public static ArrayList<User> getFriendInGroup(String university)
	{
		ArrayList<User> friendList = new ArrayList<User>();
		User user = null;
		try{
        Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MeetHubDatabase"
            ,"root","root");

         PreparedStatement ps =
         con.prepareStatement("select DISTINCT t1.* from userprofile t1, addtogroup t2 where t1.name = t2.name AND t2.university = '"+university+"';");
         ResultSet result =ps.executeQuery();
        while (result.next()) {
			user = new User();
            user.setFullName(result.getString("name"));
            user.setUserEmail(result.getString("email"));
            user.setProfilePic(result.getString("profilepic"));
            user.setCoverPic(result.getString("coverpic"));
            user.setUserUniversity(result.getString("university"));
            user.setUserDOB(result.getString("dateofbirth"));
            user.setUserMajor(result.getString("major"));
            user.setUserCity(result.getString("city"));
            user.setJoinDate(result.getString("joindate"));
            user.setLeavingDate(result.getString("leavingdate"));
            user.setUserGender(result.getString("gender"));
            user.setUserPhone(result.getString("phone"));
			friendList.add(user);
        }
      }
      catch(Exception e)
      {
          e.printStackTrace();
      }
    return friendList;
	}

	public static void insertStatusInGroup(String university,String name,String file,String status,String date,String time,String accessSpecifier)
	{
		 try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MeetHubDatabase"
            ,"root","root");

            PreparedStatement ps =
            con.prepareStatement( "insert into addtogroup values(?,?,?,?,?,?,?)");
            ps.setString(1, university);
            ps.setString(2, name);
            ps.setString(3, file);
            ps.setString(4, status);
            ps.setString(5, date);
            ps.setString(6, time);
			      ps.setString(7, accessSpecifier);
            ps.executeUpdate();
        }
        catch(Exception e){
            e.printStackTrace();
        }
	}

	public static ArrayList<addToGroup> getStatusInGroup(String university)
	{
		ArrayList<addToGroup> statusList = new ArrayList<addToGroup>();
		addToGroup atg = null;
		try{
        Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MeetHubDatabase"
            ,"root","root");

         PreparedStatement ps =
         con.prepareStatement("select * from addtogroup where university = '"+university+"';");
         ResultSet result =ps.executeQuery();
        while (result.next()) {
			atg = new addToGroup();
            atg.setuniversity(result.getString("university"));
            atg.setname(result.getString("name"));
            atg.setfile(result.getString("file"));
            atg.setstatus(result.getString("status"));
            atg.setDate(result.getString("Date"));
            atg.setTime(result.getString("Time"));
            atg.setaccessSpecifier(result.getString("accessSpecifier"));
			statusList.add(atg);
        }
      }
      catch(Exception e)
      {
          e.printStackTrace();
      }
    return statusList;
	}

	public static User getUserInfoForGroup(String name)
	{
		User user = null;
      try{
        Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MeetHubDatabase"
            ,"root","root");

         PreparedStatement ps =
         con.prepareStatement("select * from UserProfile where name='"+name+"';");
         ResultSet result =ps.executeQuery();
        while (result.next()) {
            user = new User();
            user.setFullName(result.getString("name"));
            user.setUserEmail(result.getString("email"));
            user.setProfilePic(result.getString("profilepic"));
            user.setCoverPic(result.getString("coverpic"));
            user.setUserUniversity(result.getString("university"));
            user.setUserDOB(result.getString("dateofbirth"));
            user.setUserMajor(result.getString("major"));
            user.setUserCity(result.getString("city"));
            user.setJoinDate(result.getString("joindate"));
            user.setLeavingDate(result.getString("leavingdate"));
            user.setUserGender(result.getString("gender"));
            user.setUserPhone(result.getString("phone"));
        }
      }
      catch(Exception e)
      {
          e.printStackTrace();
      }
    return user;
	}

	public static ArrayList<addToGroup> getPublicStatusInGroup(String university)
	{
		ArrayList<addToGroup> statusList = new ArrayList<addToGroup>();
		addToGroup atg1 = null;
		try{
        Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MeetHubDatabase"
            ,"root","root");

         PreparedStatement ps =
         con.prepareStatement("select * from addtogroup where university = '"+university+"' AND accessSpecifier = 'Public';");
         ResultSet result =ps.executeQuery();
        while (result.next()) {
			atg1 = new addToGroup();
            atg1.setuniversity(result.getString("university"));
            atg1.setname(result.getString("name"));
            atg1.setfile(result.getString("file"));
            atg1.setstatus(result.getString("status"));
            atg1.setDate(result.getString("Date"));
            atg1.setTime(result.getString("Time"));
            atg1.setaccessSpecifier(result.getString("accessSpecifier"));
			statusList.add(atg1);
        }
      }
      catch(Exception e)
      {
          e.printStackTrace();
      }
    return statusList;
	}

  public static void DeleteMessageThread(String user1, String user2)
	{
		try{
        Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MeetHubDatabase"
            ,"root","root");

         PreparedStatement ps =
		 con.prepareStatement("delete from MessageList where fromEmailID='"+user1+"' and toEmailID='"+user2+"';");
		 ps.executeUpdate();

		 ps=con.prepareStatement("delete from MessageList where fromEmailID='"+user2+"' and toEmailID='"+user1+"';");
		 ps.executeUpdate();

		}
		catch(Exception e){
            e.printStackTrace();
        }
	}



}
