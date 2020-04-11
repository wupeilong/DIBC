package cn.dibcbks.quartz;

import java.text.ParseException;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import cn.dibcbks.util.CommonUtil;
import cn.dibcbks.util.DateUtil;
import cn.dibcbks.util.WxOauthInfo;

//@Component
public class QuartzManager {
	
	private static final Logger logger = LogManager.getLogger(QuartzManager.class.getName());
	
    public void  quartz() throws ParseException {
    	WxOauthInfo  wxOauthInfo = null;    	  	
        Date currentTime = new Date();
        Iterator<Map.Entry<String, WxOauthInfo>> it = CommonUtil.codeHashMap.entrySet().iterator();
        while(it.hasNext()){
            Entry<String, WxOauthInfo> entry = it.next();
            wxOauthInfo = entry.getValue();
            entry.getValue().getExpirationDate();
            if(DateUtil.dateCompare(currentTime,wxOauthInfo.getExpirationDate()) > 0 ){
            	it.remove();
        		logger.info("删除CodeHashMap中缓存的微信用户信息：" + JSON.toJSONStringWithDateFormat(wxOauthInfo,"yyyy-MM-dd HH:mm:ss", SerializerFeature.WriteMapNullValue,SerializerFeature.WriteNullNumberAsZero));
        	}
       }       
    }
    
    public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("classpath:spring-quartz.xml");
	}
}
