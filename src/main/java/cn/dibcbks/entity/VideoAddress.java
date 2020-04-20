package cn.dibcbks.entity;

import java.io.Serializable;

/**
 * 单位视频地址信息表
 * @author Administrator
 *
 */
public class VideoAddress implements Serializable {
	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 5783696669214834316L;
	private Integer videoId;
	private Integer unitId;//单位ID
	private String unitName;//单位名称
	private String videoAddress;//视频地址
	private String cameraPosition;//摄像机位
	public Integer videoType;//视频类型
	private String streamType;//流类型
	public VideoAddress() {
		super();
		// TODO Auto-generated constructor stub
	}
	public VideoAddress(Integer videoId, Integer unitId, String unitName, String videoAddress, String cameraPosition,
			Integer videoType, String streamType) {
		super();
		this.videoId = videoId;
		this.unitId = unitId;
		this.unitName = unitName;
		this.videoAddress = videoAddress;
		this.cameraPosition = cameraPosition;
		this.videoType = videoType;
		this.streamType = streamType;
	}
	public Integer getVideoId() {
		return videoId;
	}
	public void setVideoId(Integer videoId) {
		this.videoId = videoId;
	}
	public Integer getUnitId() {
		return unitId;
	}
	public void setUnitId(Integer unitId) {
		this.unitId = unitId;
	}
	public String getUnitName() {
		return unitName;
	}
	public void setUnitName(String unitName) {
		this.unitName = unitName;
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
	public Integer getVideoType() {
		return videoType;
	}
	public void setVideoType(Integer videoType) {
		this.videoType = videoType;
	}
	public String getStreamType() {
		return streamType;
	}
	public void setStreamType(String streamType) {
		this.streamType = streamType;
	}
	@Override
	public String toString() {
		return "VideoAddress [videoId=" + videoId + ", unitId=" + unitId + ", unitName=" + unitName + ", videoAddress="
				+ videoAddress + ", cameraPosition=" + cameraPosition + ", videoType=" + videoType + ", streamType="
				+ streamType + "]";
	}
	
	
	
}
