package cn.dibcbks.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import cn.dibcbks.entity.VideoAddress;
import cn.dibcbks.mapper.VideoAddressMapper;
import cn.dibcbks.service.IVideoAddressService;
import cn.dibcbks.util.ResponseResult;

@Service
public class IVideoAdressServiceImpl implements IVideoAddressService {
	
	@Autowired
	VideoAddressMapper videoAddressMapper;

	@Override
	public String SelectVideoAddress(ModelMap map, Integer id) {
		
		/**
		 * 根据企业id查询视频流地址
		 */
		List<VideoAddress> list=videoAddressMapper.SelectVideoAddressById(id);
		System.out.println("http://localhost:8080/DIBC_BKS/wap_video/wap_videodetal:" + list);
		try {
			map.addAttribute("videoAddressList", list);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "bks_wap/video_detail";
	}
	
	/**
	 * 视频流地址的保存或者修改
	 */
	@Override
	public ResponseResult<?> VideoAdressSave(VideoAddress videoAddress) {
		
		ResponseResult<?> rs=null;
		
		//根据videoId查看视频流地址是否已经存在,存在则修改，不存在则保存
		try {
			if (videoAddress.getVideoId()==null) {
				videoAddressMapper.InsertAddress(videoAddress);
				rs=new ResponseResult<>(1, "信息添加成功");
			}else{
				String videoId = videoAddressMapper.SelectAddressById(videoAddress.getVideoId());
				if(videoId==""||videoId==null){
				   videoAddressMapper.InsertAddress(videoAddress);
					rs=new ResponseResult<>(1, "信息添加成功");
				}else {
					videoAddressMapper.UpdateAddress(videoAddress);
					rs=new ResponseResult<>(1, "信息修改成功");
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			rs=new ResponseResult<>(0, e.getMessage());
		}
		
		
		return rs;
	}
	

	@Override
	public ResponseResult<?> DeleteVideoAddress(Integer videoId) {
		
		ResponseResult<?> rs=null;
		try {
			videoAddressMapper.DeleteAddressById(videoId);
			rs=new ResponseResult<>(1, "信息删除成功");
		} catch (Exception e) {
			e.printStackTrace();
			rs=new ResponseResult<>(0, e.getMessage());
			
		}
		return rs;
	}

}
