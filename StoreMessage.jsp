<%@ page
import= "com.*, java.io.*, javax.servlet.*,
javax.servlet.http.*, java.util.*,java.text.*"%>

<%
    String fromEmailId = request.getParameter("fromID");
    String toEmailId = request.getParameter("toID");
    String messageText = request.getParameter("message");
    String pageId = request.getParameter("pageId");


		User user = new User();
		user = MySqlDataStoreUtilities.getUserInfo(fromEmailId);

		Message message = new Message();
		message.setId(0);
		message.setFromEmailID(fromEmailId);
		message.setToEmailID(toEmailId);
		if(user!=null){
			message.setFromUser(user.getFullName());
		}
		else{
			message.setFromUser("Laree Portman");
		}
		message.setMessageText(messageText);
		message.setSentOn(new Date());

		MySqlDataStoreUtilities.insertUserMessage(message);

    if(pageId.equals("messageForm")){
			response.sendRedirect(request.getContextPath()+"/Inbox.jsp");
		}
		else if(pageId.equals("replyForm")){
			response.sendRedirect(request.getContextPath()+"/DisplayMessages.jsp?fromUserEmailId="+toEmailId);
		}


%>
