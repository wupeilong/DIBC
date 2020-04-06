package cn.dibcbks.entity;

import java.io.Serializable;

/**
 * 单位视频地址信息表
 * @author Administrator
 *
 */
public class VideoAddress implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 5783696669214834316L;
	private Integer unitId;//单位ID
	private String videoAddress;//视频地址
	private String cameraPosition;//摄像机位
	public String videoType;//视频类型
	private String streamType;
	private Integer videoId;
	public Integer getVideoId() {
		return videoId;
	}
	public void setVideoId(Integer videoId) {
		this.videoId = videoId;
	}
	public VideoAddress() {
		super();
		
		// TODO Auto-generated constructor stub
	}
	public Integer getUnitId() {
		return unitId;
	}
	public void setUnitId(Integer unitId) {
		this.unitId = unitId;
	}
	public String getVideoAddress() {
		return videoAddress;
	}
	public void setVideoAddress(String videoAddress) {
		this.videoAddress = videoAddress;
	}
	public String getCameraPosition() {
		return cameraPosition;
	}
	public void setCameraPosition(String cameraPosition) {
		this.cameraPosition = cameraPosition;
	}
	public String getVideoType() {
		return videoType;
	}
	public void setVideoType(String videoType) {
		this.videoType = videoType;
	}
	public String getStreamType() {
		return streamType;
	}
	public void setStreamType(String streamType) {
		this.streamType = streamType;
	}
	
	
	public VideoAddress(Integer unitId, String videoAddress, String cameraPosition, String videoType, String streamType,
			Integer videoId) {
		super();
		this.unitId = unitId;
		this.videoAddress = videoAddress;
		this.cameraPosition = cameraPosition;
		this.videoType = videoType;
		this.streamType = streamType;
		this.videoId = videoId;
	}
	@Override
	public String toString() {
		return "VideoAddress [unitId=" + unitId + ", videoAddress=" + videoAddress + ", cameraPosition="
				+ cameraPosition + ", videoType=" + videoType + ", streamType=" + streamType + ", videoId=" + videoId
				+ "]";
	}
	
	
	
	
}
