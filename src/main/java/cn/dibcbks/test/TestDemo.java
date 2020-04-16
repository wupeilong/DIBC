package cn.dibcbks.test;

import java.util.List;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import cn.dibcbks.controller.WapVideoAddressController;
import cn.dibcbks.entity.VideoAddress;
import cn.dibcbks.mapper.VideoAddressMapper;
import cn.dibcbks.util.ResponseResult;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring-mapper.xml","classpath:spring-mvc.xml"})
@WebAppConfiguration
public class TestDemo {
	@Autowired 
	private VideoAddressMapper addressMapper;
	
	@Autowired
	private  WapVideoAddressController sdf;
	

	@Test
	public void test(){
		
		VideoAddress ss = addressMapper.SelectAddressByVideoId(6);
		
		System.out.println(ss);
		
		VideoAddress address =new VideoAddress();
		address.setCameraPosition("一个大卧室");
		address.setStreamType("sss");
		address.setUnitId(12);
		address.setVideoAddress("http://wx19.sdvideo.cn:9999/3HKCA33014CUQPC_0.m3u8?key=0edb937d1aeac50dd9f4162f2727d810");
		address.setVideoId(7);
		
		
		//ResponseResult<?> GG =sdf.DeleteVideoAddress(8);
		//System.out.println(GG.getMessage());
		
	
		
		
		
		
		

	}
	
} 