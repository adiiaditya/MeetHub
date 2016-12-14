package com;
import java.io.*;

public class Events
{
	public String eventAdmin;
	public String eventName;
	public String eventLocation;
	public String eventDate;
	public String eventTime;
	public String eventType;
	public String eventImage;
	
	public Events(String eventAdmin,String eventName,String eventLocation,String eventDate,String eventTime,String eventType,String eventImage)
	{
		super();
		this.eventAdmin=eventAdmin;
		this.eventName=eventName;
		this.eventLocation=eventLocation;
		this.eventDate=eventDate;
		this.eventTime=eventTime;
		this.eventType=eventType;
		this.eventImage=eventImage;
	}
	
	public Events(){}
	
	public void setEventAdmin(String eventAdmin)
	{
		this.eventAdmin=eventAdmin;
	}
	public void setEventName(String eventName)
	{
		this.eventName=eventName;
	}
	public void setEventLocation(String eventLocation)
	{
		this.eventLocation=eventLocation;
	}
	public void setEventDate(String eventDate)
	{
		this.eventDate=eventDate;
	}
	public void setEventTime(String eventTime)
	{
		this.eventTime=eventTime;
	}
	public void setEventType(String eventType)
	{
		this.eventType=eventType;
	}
	public void setEventImage(String eventImage)
	{
		this.eventImage=eventImage;
	}
	public String getEventAdmin()
	{
		return eventAdmin;
	}
	public String getEventName()
	{
		return eventName;
	}
	public String getEventLocation()
	{
		return eventLocation;
	}
	public String getEventDate()
	{
		return eventDate;
	}
	public String getEventTime()
	{
		return eventTime;
	}
	public String getEventType()
	{
		return eventType;
	}
	public String getEventImage()
	{
		return eventImage;
	}
}