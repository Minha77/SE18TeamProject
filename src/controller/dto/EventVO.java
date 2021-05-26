package dto;

public class EventVO {
	private int event_number;
	private String event_name;
	private String event_content;
	private String event_startdate;
	private String event_enddate;
	private String event_banner;
	
	public int getEventNumber() {
		return event_number;
	}
	public void setEventNumber(int event_number) {
		this.event_number = event_number;
	}
	public String getEventName() {
		return event_name;
	}
	public void setEventName(String event_name) {
		this.event_name = event_name;
	}
	public String getEventContent() {
		return event_content;
	}
	public void setEventContent(String event_content) {
		this.event_content = event_content;
	}
	public String getEventSdate() {
		return event_startdate;
	}
	public void setEventSdate(String event_startdate) {
		this.event_startdate = event_startdate;
	}
	public String getEventEdate() {
		return event_enddate;
	}
	public void setEventEdate(String event_enddate) {
		this.event_enddate = event_enddate;
	}
	public String getEventBanner() {
		return event_banner;
	}
	public void setEventBanner(String event_banner) {
		this.event_banner = event_banner;
	}
}
