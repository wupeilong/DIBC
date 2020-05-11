package cn.dibcbks.test;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import cn.dibcbks.controller.WapVideoAddressController;
import cn.dibcbks.entity.VideoAddress;
import cn.dibcbks.mapper.VideoAddressMapper;
import cn.dibcbks.util.CommonUtil;
import cn.dibcbks.util.ResponseResult;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring-mapper.xml","classpath:spring-mvc.xml","classpath:spring-quartz.xml"})
@WebAppConfiguration
public class TestDemo {
	@Autowired 
	private VideoAddressMapper addressMapper;
	
	@Autowired
	private  WapVideoAddressController sdf;
	

	@Test
	public void test(){		
		List<VideoAddress> list = addressMapper.select(null, null, null, null);
		System.out.println("测试视频匹配信息开始>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		for(VideoAddress address : list){
			if(StringUtils.isNotEmpty(address.getUnitName())){
				boolean connect = CommonUtil.isConnect(address.getVideoAddress());
				if (connect) {
					System.out.println(address.getUnitName() + " " + address.getCameraPosition() +  " " + address.getVideoAddress() + " 匹配成功");
				}else{
					System.out.println(address.getUnitName() + " " + address.getCameraPosition() +  " " + address.getVideoAddress() + " 匹配不成功");
				}
			}
		}
		System.out.println("测试视频匹配信息结束>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
	}
	
} 