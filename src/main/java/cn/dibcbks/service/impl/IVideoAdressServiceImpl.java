package cn.dibcbks.service.impl;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import cn.dibcbks.entity.TimeInterval;
import cn.dibcbks.entity.Unit;
import cn.dibcbks.entity.VideoAddress;
import cn.dibcbks.mapper.TimeIntervalMapper;
import cn.dibcbks.mapper.UnitMapper;
import cn.dibcbks.mapper.VideoAddressMapper;
import cn.dibcbks.service.IVideoAddressService;
import cn.dibcbks.util.CommonUtil;
import cn.dibcbks.util.Constants;
import cn.dibcbks.util.DateUtil;
import cn.dibcbks.util.ResponseResult;
import net.sf.json.JSONArray;

@Service
public class IVideoAdressServiceImpl implements IVideoAddressService {
	private static final Logger logger = LogManager.getLogger(IVideoAdressServiceImpl.class.getName());
	@Autowired
	VideoAddressMapper videoAddressMapper;
	@Autowired
	private TimeIntervalMapper timeIntervalMapper;
	@Autowired
	private UnitMapper unitMapper;
	

	@Override
	public String SelectVideoAddress(ModelMap map, Integer id) {
		try {
			/**
			 * 根据企业id查询视频流地址
			 */
			List<VideoAddress> list = videoAddressMapper.SelectVideoAddressById(id);
			TimeInterval timeInterval = timeIntervalMapper.selectById(1);
			String endTime = DateUtil.dateFormat(new Date(),DateUtil.DATE_PATTERN) + " " + timeInterval.getEndTime();
			map.addAttribute("endTime", endTime);
			
				//把企业id传到前端  方便后续添加
			map.addAttribute("unitid", id);
			map.addAttribute("videoAddressList", list);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "bks_wap/video_detail";
	}
	
	/**
	 * 根据视频流id查询视频流地址对象
	 */
	public VideoAddress getVideAddressBeanById(Integer videoId){
		
		VideoAddress va = videoAddressMapper.SelectAddressByVideoId(videoId);
		
		return va;
	}
	
	/**
	 * 根据视频流id和企业id查询视频流地址对象
	 */
	public void getVideoAddressBeanById(ModelMap modelMap,Integer unitId,Integer videoId){
		
		try {
			VideoAddress va = videoAddressMapper.SelectAddressByVUId(unitId, videoId);
			modelMap.addAttribute("videoInfo", va);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
	}
	
	
	/**
	 * 视频流地址的保存或者修改
	 */
	@Override
	public ResponseResult<?> VideoAdressSave(VideoAddress videoAddress) {

		ResponseResult<?> rs = null;

		// 根据videoId查看视频流地址是否已经存在,存在则修改，不存在则保存
		try {
			if (videoAddress.getVideoId() == null) {

				videoAddressMapper.InsertAddress(videoAddress);
				rs = new ResponseResult<>(1, "信息添加成功");
			} else {
				VideoAddress va = videoAddressMapper.SelectAddressByVideoId(videoAddress.getVideoId());

				if (va == null) {
					videoAddressMapper.InsertAddress(videoAddress);
					rs = new ResponseResult<>(1, "信息添加成功");

				} else {
					videoAddressMapper.UpdateAddress(videoAddress);
					rs = new ResponseResult<>(1, "信息修改成功");
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			rs = new ResponseResult<>(0, e.getMessage());
		}

		return rs;
	}

	@Override
	public ResponseResult<?> DeleteVideoAddress(Integer videoId) {

		ResponseResult<?> rs = null;
		try {

			VideoAddress va = videoAddressMapper.SelectAddressByVideoId(videoId);
			if (va == null) {
				rs = new ResponseResult<>(1, "删除失败,信息不存在");

			} else {
				videoAddressMapper.DeleteAddressById(videoId);
				rs = new ResponseResult<>(1, "信息删除成功");
			}

		} catch (Exception e) {
			e.printStackTrace();
			rs = new ResponseResult<>(0, e.getMessage());

		}
		return rs;
	}

	@Override
	public String selectUnitVideoList(ModelMap modelMap) {
		if (CommonUtil.getSessionUser().getType().equals(2)) {
			try {
				List<VideoAddress> videoList = videoAddressMapper.SelectVideoAddressById(CommonUtil.getSessionUser().getUnitId());
				modelMap.addAttribute("videoAddressList", videoList);
			} catch (Exception e) {
				e.printStackTrace();
			}			
			return "bks_wap/video_detail";
		}
		return "bks_wap/video";
	}

	@Override
	public String selectTimeInterval(ModelMap modelMap) {
		try {
			TimeInterval timeInterval = timeIntervalMapper.selectById(1);
			modelMap.addAttribute("timeInterval", timeInterval);
		} catch (Exception e) {
			e.printStackTrace();			
		}
		return "bks_web/video/video_time";
	}

	@Override
	public ResponseResult<Void> updateTimeInterval(TimeInterval timeInterval) {
		ResponseResult<Void> rr = null;
		try {
			timeIntervalMapper.updateById(timeInterval);
			rr = new ResponseResult<>(ResponseResult.SUCCESS, "操作成功！");
		} catch (Exception e) {
			e.printStackTrace();
			rr = new ResponseResult<>(ResponseResult.ERROR, "操作失败！");
		}
		return rr;
	}

	@Override
	public ResponseResult<Void> viweMonitoring() {
		ResponseResult<Void> rr = null;
		try {
			TimeInterval timeInterval = timeIntervalMapper.selectById(1);
			Date currentTime = new Date();			
			Date stratTime = DateUtil.dateParse(DateUtil.dateFormat(currentTime,DateUtil.DATE_PATTERN) + " " + timeInterval.getStartTime(),DateUtil.DATE_TIME_PATTERN);
			Date endTime = DateUtil.dateParse(DateUtil.dateFormat(currentTime,DateUtil.DATE_PATTERN) + " " + timeInterval.getEndTime(),DateUtil.DATE_TIME_PATTERN) ;			
			if(DateUtil.dateCompare(currentTime, stratTime) < 1){ ///未到监控开放时间
				rr = new ResponseResult<>(ResponseResult.ERROR,"未到监控开放时间！");
			}else if(DateUtil.dateCompare(currentTime, endTime) > 0){ //已过监控放时间
				rr = new ResponseResult<>(ResponseResult.ERROR,"已过监控开放时间！");
			}else {
				rr = new ResponseResult<>(ResponseResult.SUCCESS,"操作成功！");
			}
		} catch (Exception e) {
			rr = new ResponseResult<>(ResponseResult.ERROR,"操作失败！");
		}		
		return rr;
	}

	@SuppressWarnings("unchecked")
	@Override
	public ResponseResult<List<List<String>>> batchAddVideo(String videoList) {
		ResponseResult<List<List<String>>> rr;
		List<List<String>> list = new ArrayList<List<String>>();
		JSONArray json = JSONArray.fromObject(videoList);
		System.out.println("json:" + json);
		String unitName = "";//单位名称
		String cameraPosition = "";//摄像机位
		String videoAddress = "";//视频地址		
		String videoType = "";//监控类型
		String streamType = "";//视频流类型
		VideoAddress video = null;
		List<Unit> units = new ArrayList<>();
		List<VideoAddress> videos = new ArrayList<>();
		Integer row = 0;
		System.out.println(json.getJSONArray(0));
		for(int i=0; i<json.size(); i++){
			try {				
				unitName = json.getJSONArray(i).get(0).toString().trim();
				cameraPosition = json.getJSONArray(i).get(1).toString().trim();
				videoAddress = json.getJSONArray(i).get(2).toString().trim();
				videoType = json.getJSONArray(i).get(3).toString().trim();
				streamType = json.getJSONArray(i).get(4).toString().trim();
				//依据企业名称查询企业信息
				units = unitMapper.select("n.unit_name = '" + unitName + "'", null, null, null);
				if(!units.isEmpty()){
					videos = videoAddressMapper.select(" v.unit_id = '" + units.get(0).getUnitId() + "' AND v.video_address = '" + videoAddress + "'",null,null,null);
					if(!videos.isEmpty()){
						list.add(json.getJSONArray(i));	
						logger.error(Constants.ERROR_HEAD_INFO + "企业：" + unitName + "  视频流信息已存在，无法添加！视频流信息：" + json.getJSONArray(i).toString());			
						continue;
					}
					video = new VideoAddress();
					video.setUnitId(units.get(0).getUnitId());//企业ID
					video.setCameraPosition(cameraPosition);
					video.setVideoAddress(videoAddress);
					video.setVideoType(videoType.equals("实时监控")? 1 : 2);
					video.setStreamType(streamType.isEmpty() ? "HTTP" : streamType );
					row = videoAddressMapper.InsertAddress(video);
					if(row == 0){
						list.add(json.getJSONArray(i));			
					}
				}else{				
					logger.error(Constants.ERROR_HEAD_INFO + "企业：" + unitName + " 信息不存在，无法添加！视频流信息：" + json.getJSONArray(i).toString());			
				}
			} catch (Exception e) {
				e.printStackTrace();
				list.add(json.getJSONArray(i));	
				logger.error(Constants.ERROR_HEAD_INFO + "视频流信息：" + json.getJSONArray(i).toString());
			}
		}		
		rr = new ResponseResult<List<List<String>>>(ResponseResult.SUCCESS,"操作成功:" + (json.size() - list.size()) + "条  失败：" + list.size() + "条 ",list);		
		return rr;
	}


}
