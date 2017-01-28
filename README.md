# MeetHub - Connect with friends from different Universities

MeetHub is a platform for students to connect with students form different universities and share notes, network with them and attend events. All powered by JSP, Servlet, with data being kept on MySQL and MongoDB, with the code written in Java.

Another academic project by [@adiiaditya](http://www.twitter.com/adiiaditya)

![](Screenshots/Home Page.png)

### Features
* User can register and login using .edu mail-id.
* User can upload a profile and cover picture and update their profile information.
* User can update their status on timeline.
* User can comment on the status on the timeline of other users.
* User can add other users as a friend, which will be displayed on their friends page along with their mutual friends.
* User can send messages to other users,reply to messages, view the sent messages and the conversation thread.
* User can create events and add friends to the event.
* User can see the list of events which he/she has created and has been added to.
* Groups of different universities.
* User can join/leave any university group.
* User can see the members of a particular university group.
* User can see the tweets based on the university groups.
* user can upload/download documents.
* The document can be uploaded as private/public. If shared as public, users from any university can access the document while if shared as private, users from only that particular university can access the document under which it is uploaded.

### Functional Demo
* User tries logging in with wrong password.

![](Screenshots/Wrong Password.png)

* User tries to register with an already existing email address.

![](Screenshots/User Exists Warning.png)

* Prompt after user tries registering with invalid email address.

![](Screenshots/Invalid email warning.png)

* Profile Page of a User.

![](Screenshots/Profile Page.png)

* Update Profile screen.

![](Screenshots/Update Profile Page.png)

* User Timeline where posts are mentioned.

![](Screenshots/Timeline Page.png)

* User adding a friend.

![](Screenshots/Add Friend.png)

* After adding a friend, we get a pending approval message instead of Add as a Friend.

![](Screenshots/Friend Pending Approval.png)

* After accepting a friend request, we can remove them.

![](Screenshots/Remove Friend.png)

* Friends Page displaying friends and common friends

![](Screenshots/Friends Page.png)

* Events Page along with events created

![](Screenshots/Created Events Page.png)

* Create Events Form page

![](Screenshots/Create Event Form.png)

* Groups page

![](Screenshots/Groups Page.png)

* Inside a group, display group users and tweets

![](Screenshots/AjaxGroupTwitter Screenshot.png)

* Empty Inbox

![](Screenshots/Empty Inbox Page.png)

* Send New Message

![](Screenshots/Send New Message.png)

* Inbox Message being displayed for the receiver user

![](Screenshots/Inbox Message Page.png)

* After replying to the message

![](Screenshots/Display Message Page.png)

* Notifications Page

![](Screenshots/Notification Page.png)

* Search for users

![](Screenshots/AjaxScreenShot.png)

### How to Deploy and Run
1. Start the MongoDB server with mongod.exe. 
2. Start the MySQL database
	* database name is “MeetHubDatabase” so create that first
	* The create table commands of each table that are necessary for the project to run are given in the queries.txt file
	* Tables created are:
	a. AddTogroup.
	b. EventsTable.
	c. FriendList.
	d. MessageList.
	e. StatusList.
	f. UserEvent.
	g. UserProfile.
	* The information to automatically populate the database is given in the .sql files present in the Data folder. These can be imported by going to Server, Data Import, Import from self contained file, browse to the particular file to be imported, select default target schema as MeetHubDatabase and select start import.
	* Repeat this step for all the files present in the Data folder.
3. Add the two jar files that are present in the "jar files" folder that is given into the lib folder of apache.
4. Run the following command to compile all the files:
		javac -cp "/usr/local/Cellar/tomcat/8.5.5/libexec/lib/servlet-api.jar:/usr/local/Cellar/tomcat/8.5.5/libexec/lib/mysql-connector-java-5.1.40-bin.jar:/usr/local/Cellar/tomcat/8.5.5/libexec/lib/mongo-java-driver-3.2.2.jar:/usr/local/Cellar/tomcat/8.5.5/libexec/lib/commons-fileupload-1.3.2.jar:/usr/local/Cellar/tomcat/8.5.5/libexec/lib/commons-io-2.5.jar" *.java
5. Copy "csj" folder on to the tomcat web app folder.
6. Run the python script.
	a. credentials.txt which contains all the login and access permission info.
	b. The script searches for tweets with the different university names and generates four output files- Illinois Tech.txt, Harvard.txt, Stanford.txt, University Of Illinois.txt.
7. Start tomcat server
8. open the browser and type localhost:8080/Project/index.html

## License
Copyright (c) 2016 MeetHub

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
