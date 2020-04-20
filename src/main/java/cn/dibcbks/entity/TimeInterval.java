package cn.dibcbks.entity;

import java.io.Serializable;

public class TimeInterval implements Serializable{	  
	  /**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 9026225958441454667L;
	private Integer id;//视频时段ID
	private String startTime;//开始时间
	private String endTime;//结束时间
	public TimeInterval() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TimeInterval(Integer id, String startTime, String endTime) {
		super();
		this.id = id;
		this.startTime = startTime;
		this.endTime = endTime;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	@Override
	public String toString() {
		return "TimeInterval [id=" + id + ", startTime=" + startTime + ", endTime=" + endTime + "]";
	}
	  
	  
}
