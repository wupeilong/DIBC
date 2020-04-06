package cn.dibcbks.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import cn.dibcbks.entity.VideoAddress;
import cn.dibcbks.mapper.VideoAddressMapper;
import cn.dibcbks.service.IVideoAddressService;

@Service
public class IVideoAdressServiceImpl implements IVideoAddressService {
	
	@Autowired
	VideoAddressMapper videoAddressMapper;

	@Override
	public String SelectVideoAddress(ModelMap map, Integer id) {
		
		// 根据企业id查询视频流地址
		List<VideoAddress> list=videoAddressMapper.SelectVideoAddressById(id);
		System.out.println("http://localhost:8080/DIBC_BKS/wap_video/wap_videodetal:" + list);
		try {
			map.addAttribute("videoAddressList", list);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "bks_wap/video_detail";
	}

}
