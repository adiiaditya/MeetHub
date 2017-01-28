/*
 * AutoComplete.java
 *
 */
 package com;
 import java.io.*;
 import javax.servlet.*;
 import javax.servlet.http.*;
 import java.util.*;
 import java.util.HashMap;
 import java.util.Iterator;

public class AutoComplete extends HttpServlet {

    private ServletContext context;
    private HashMap<String,User> users;

    @Override
    public void init(ServletConfig config) throws ServletException {
        this.context = config.getServletContext();
    }

    AjaxUtility a = new AjaxUtility();
    /** Handles the HTTP <code>GET</code> method.
    * @param request servlet request
    * @param response servlet response
    */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, java.io.IOException {
        String action = request.getParameter("action");
        String searchID = request.getParameter("searchId");
        StringBuffer sb = new StringBuffer();

        if (searchID != null) {
            searchID = searchID.trim();
        } else {
            System.out.println("Error Located");
            //context.getRequestDispatcher("/error.jsp").forward(request, response);
        }

        boolean namesAdded = false;
        if (action.equals("complete")){
                // check if user sent empty string
                if (!searchID.equals(""))
                {
                    sb = a.readData(searchID);
                    if(sb!=null || !sb.equals(""))
                    {
                      namesAdded=true;
                    }

                    if (namesAdded)
                    {
                      response.setContentType("text/xml");
                      response.getWriter().write("<users>" + sb.toString() + "</users>");
                    } else {
                      //nothing to show
                      response.setStatus(HttpServletResponse.SC_NO_CONTENT);
                    }
                }
        }
        if (action.equals("lookup")) {
          users = a.getData();
          // put the target user in the request scope to display
            if ((searchID != null) && users.containsKey(searchID.trim())) {
                request.setAttribute("searchedUser", users.get(searchID));
                context.getRequestDispatcher("/PublicAboutAjax.jsp").forward(request, response);
            }
        }
      }
}
