package com;

import java.util.ArrayList;
import java.util.List;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientOptions;

public class MongoDBDataStoreUtilities {

	public static MongoClient getMongoConnection() {
		MongoClient mongo = null;
		try {
			mongo = new MongoClient("localhost", 27017);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mongo;
	}

	
	public static void insertComment(String email, String status, String comment) {

		try {
			MongoClient mongo = getMongoConnection();
            
            // uzma
			DB db = mongo.getDB("MeetHubDatabase");
            
            //uzma
			DBCollection comments = db.getCollection("comments");
			BasicDBObject dbObj = new BasicDBObject();
            
			dbObj.put("email", email);
			dbObj.put("status", status);
			dbObj.put("comment", comment);
			comments.insert(dbObj);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public static List<Comment> getComments(String email, String status) {

		try {
			List<Comment> commentsList = new ArrayList<Comment>();

			MongoClient mongo = getMongoConnection();
			DB db = mongo.getDB("MeetHubDatabase");
			DBCollection comments = db.getCollection("comments");
        
			BasicDBObject query = new BasicDBObject("status", status);
			DBCursor cursor = comments.find(query);
			while (cursor.hasNext()) {
				BasicDBObject obj = (BasicDBObject) cursor.next();
				Comment comment = new Comment();
				comment.setComment(obj.getString("comment"));
				comment.setEmail(obj.getString("email"));
				comment.setStatus(obj.getString("status"));
				//if (obj.getString("status").equals(status))
					commentsList.add(comment);
			}

			return commentsList;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

}
