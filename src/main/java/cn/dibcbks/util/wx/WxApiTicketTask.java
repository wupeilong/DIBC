package cn.dibcbks.util.wx;


import cn.dibcbks.entity.WxAccessToken;
import cn.dibcbks.mapper.WxAccessTokenMapper;
import cn.dibcbks.util.DateUtil;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import javax.annotation.Resource;
import java.text.ParseException;
import java.util.Date;

/**
 * @author: wupeilong
 * @version: v1.0.0
 * @className: WxApiTicketTask
 * @description: 微信接口调用凭据保持有效任务
 * @date: 2019/03/04 17:12
 */
@Component
@EnableScheduling
public class WxApiTicketTask {
	private static final Logger logger = LogManager.getLogger(WxApiTicketTask.class.getName());
    @Resource
    private WxAccessTokenMapper wxAccessTokenMapper;

//    @Scheduled(cron = "0 */3 * * * * ")
//    public void executeAccessToken() {
//        try {
//            WxAccessToken token = wxAccessTokenMapper.selectById("1");
//            if(token == null){
//               //首次获取微信token存入数据库
//                AccessTokenOut accessTokenOut = WxApi.getWxAccessToken();
//                WxAccessToken insert = new WxAccessToken();
//                insert.setId("1");
//                insert.setAccessToken(accessTokenOut.getAccessToken());
//                insert.setExpiresIn(accessTokenOut.getExpiresIn());
//                insert.setCreateTime(new Date());
//                wxAccessTokenMapper.insert(insert);
//                logger.info("首次获取微信access_token信息 >>>>>>> " + DateUtil.dateFormat(new Date(),DateUtil.DATE_TIME_PATTERN));
//            } else {
//                //当前时间
//                if(DateUtil.dateCompare(DateUtil.dateAddMinutes(token.getCreateTime(),110),new Date()) < 0) {
//                    //超过有效期，重新获取
//                    AccessTokenOut accessTokenOut = WxApi.getWxAccessToken();
//                    token.setAccessToken(accessTokenOut.getAccessToken());
//                    token.setExpiresIn(accessTokenOut.getExpiresIn());
//                    token.setCreateTime(new Date());
//                    wxAccessTokenMapper.updateById(token);
//                    logger.info("更新微信access_token信息 >>>>>>> " + DateUtil.dateFormat(new Date(),DateUtil.DATE_TIME_PATTERN));
//                }
//            }
//        } catch (ParseException e) {
//            logger.info("处理微信accessToken凭证异常，异常信息：" + e);
//        }
//    }
//
//    @Scheduled(cron = "20 */3 * * * * ")
//    public void executeJsApiTicket() {
//        try {
//            WxAccessToken accessToken = wxAccessTokenMapper.selectById("1");
//            WxAccessToken jsApiTicket = wxAccessTokenMapper.selectById("2");
//            if(jsApiTicket == null){
//                //首次获取微信jsApiTicket存入数据库
//                JsApiTicketOut jsApiTicketOut = WxApi.getJsApiTicket(accessToken.getAccessToken());
//                WxAccessToken insert = new WxAccessToken();
//                insert.setId("2");
//                insert.setAccessToken(jsApiTicketOut.getJsApiTicket());
//                insert.setExpiresIn(jsApiTicketOut.getExpiresIn());
//                insert.setCreateTime(new Date());
//                wxAccessTokenMapper.insert(insert);
//                logger.info("首次获取微信jsAipTicket信息 >>>>>>> " + DateUtil.dateFormat(new Date(),DateUtil.DATE_TIME_PATTERN));
//            } else {
//                //当前时间
//                if(DateUtil.dateCompare(DateUtil.dateAddMinutes(jsApiTicket.getCreateTime(),110),new Date()) < 0) {
//                    //超过有效期，重新获取
//                    JsApiTicketOut jsApiTicketOut = WxApi.getJsApiTicket(accessToken.getAccessToken());
//                    jsApiTicket.setAccessToken(jsApiTicketOut.getJsApiTicket());
//                    jsApiTicket.setExpiresIn(jsApiTicketOut.getExpiresIn());
//                    jsApiTicket.setCreateTime(new Date());
//                    wxAccessTokenMapper.updateById(jsApiTicket);
//                    logger.info("更新微信jsAipTicket信息 >>>>>>> " + DateUtil.dateFormat(new Date(),DateUtil.DATE_TIME_PATTERN));
//                }
//            }
//        } catch (ParseException e) {
//            logger.info("处理微信jsApiTicket凭证异常，异常信息：" + e);
//        }
//    }
//    
//    @Scheduled(fixedDelay = 5000)
//    public void doSomething() { 
//    	System.out.println("asdhgjasdjasghjagsdagsh");
//    }
}
