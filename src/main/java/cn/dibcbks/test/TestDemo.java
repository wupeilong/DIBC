package cn.dibcbks.test;

import java.util.List;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import cn.dibcbks.entity.VideoAddress;
import cn.dibcbks.mapper.VideoAddressMapper;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring-mapper.xml","classpath:spring-mvc.xml"})
@WebAppConfiguration
public class TestDemo {
	@Autowired 
	private VideoAddressMapper addressMapper;
	
	

	@Test
	public void test(){
		
		List<VideoAddress> list = addressMapper.SelectVideoAddressById(1);
		
		System.out.println(list);
	
		
		
		
		
		

	}
	
} 