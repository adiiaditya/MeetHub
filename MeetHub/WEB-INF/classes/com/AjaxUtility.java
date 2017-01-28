/*
 * AjaxUtility.java
 *
 */
 package com;
import java.io.*;
import java.util.HashMap;
import java.util.Map;
import java.util.*;
import java.text.DecimalFormat;
import java.lang.Math.*;
import java.sql.*;

public class AjaxUtility {
    static Connection con = null;
    StringBuffer sb = null;

    public static HashMap<String,User> getData() {
      HashMap<String,User> hm = new HashMap<String,User>();
      try
      {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MeetHubDatabase","root","root");
        PreparedStatement ps = con.prepareStatement("select * from UserProfile");
        ResultSet results = ps.executeQuery();

        while(results.next())
        {
          User user = new User();
          user.setFullName(results.getString("name"));
          user.setUserEmail(results.getString("email"));
          user.setProfilePic(results.getString("profilepic"));
          user.setCoverPic(results.getString("coverpic"));
          user.setUserUniversity(results.getString("university"));
          user.setUserDOB(results.getString("dateofbirth"));
          user.setUserMajor(results.getString("major"));
          user.setUserCity(results.getString("city"));
          user.setJoinDate(results.getString("joindate"));
          user.setLeavingDate(results.getString("leavingdate"));
          user.setUserGender(results.getString("gender"));
          user.setUserPhone(results.getString("phone"));
          hm.put(results.getString("email"), user);
        }
      }
      catch(Exception ex){}
      return hm;
    }

    public StringBuffer readData(String searchId)
    {
      HashMap<String,User> data;
      sb = new StringBuffer();
      data= getData();
      Iterator it = data.entrySet().iterator();
      while (it.hasNext())
      {
        Map.Entry pi = (Map.Entry)it.next();
        User user =(User) pi.getValue();
        if (user.name.startsWith(searchId))
        {
          sb.append("<user>");
          sb.append("<userEmail>" + user.email + "</userEmail>");
          sb.append("<userName>" + user.name + "</userName>");
          sb.append("</user>");
        }
      }
      return sb;
    }
}
