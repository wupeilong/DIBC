package cn.dibcbks.util.wx;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;

import cn.dibcbks.util.CommonUtil;
import cn.dibcbks.util.PropsUtil;
import java.security.MessageDigest;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * @author: huangz
 * @version: v1.0.0
 * @className: WxApi
 * @description: 微信接口
 * @date: 2019/03/04 15:13
 */
public class WxApi {
	private static final Logger logger = LogManager.getLogger(WxApi.class.getName());
    /**
     * @author: huangz
     * @description: 微信js-sdk签名
     * @date: 2019/3/20 0020 13:30
     * @param: [decript]
     * @return: java.lang.String
     */
    public static String SHA1(String decript) {
        try {
            MessageDigest digest = java.security.MessageDigest.getInstance("SHA-1");
            digest.update(decript.getBytes());
            byte messageDigest[] = digest.digest();
            // Create Hex String
            StringBuffer hexString = new StringBuffer();
            // 字节数组转换为 十六进制 数
            for (int i = 0; i < messageDigest.length; i++) {
                String shaHex = Integer.toHexString(messageDigest[i] & 0xFF);
                if (shaHex.length() < 2) {
                    hexString.append(0);
                }
                hexString.append(shaHex);
            }
            return hexString.toString();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }

    /**
     * @author: huangz
     * @description: 获取微信JS接口调用凭证
     * @date: 2019/3/20 0020 12:47
     * @param: [accessToken]
     * @return: com.xznc.msc.weixin.dto.out.JsApiTicketOut
     */
    public static JsApiTicketOut getJsApiTicket(String accessToken){
        String requestUrl = WxApiAddressUtil.GET_JSAPI_TICKET_URL
                .replace("ACCESS_TOKEN",accessToken);
        JSONObject jsonObject = HttpRequestUtil.httpRequest(requestUrl, "GET", null);
        logger.info("调用获取微信JsApiTicket接口返回：" + JSON.toJSONStringWithDateFormat(jsonObject,
                //指定时间格式
                "yyyy-MM-dd HH:mm:ss",
                //空值输出null
                //SerializerFeature.PrettyFormat,
                SerializerFeature.WriteMapNullValue,
                SerializerFeature.WriteNullNumberAsZero));
        if(jsonObject.getString("errmsg").equals("ok")){
            JsApiTicketOut jsApiTicket = new JsApiTicketOut();
            jsApiTicket.setJsApiTicket(jsonObject.getString("ticket"));
            jsApiTicket.setExpiresIn(jsonObject.getInteger("expires_in"));
            return jsApiTicket;
        }
        // 获取微信JsApiTicket失败
        logger.info("获取微信JsApiTicket失败 errcode：" + jsonObject.getInteger("errcode") + " errmsg：" + jsonObject.getString("errmsg"));
        return null;
    }

    /**
     * @author: huangz
     * @description: 获取微信用户信息
     * @date: 2019/3/20 0020 11:50
     * @param: [oauth2Token]
     * @return: com.xznc.msc.weixin.dto.out.WxUserInfoOut
     */
    public static WxUserInfoOut getWxUserInfo(Oauth2TokenOut oauth2Token){
        if(oauth2Token != null){
            String requestUrl = WxApiAddressUtil.GET_WX_USER_INFO_URL
                    .replace("ACCESS_TOKEN",oauth2Token.getAccessToken())
                    .replace("OPENID",oauth2Token.getOpenid());
            JSONObject jsonObject = HttpRequestUtil.httpRequest(requestUrl, "GET", null);
            logger.info("调用获取微信用户信息接口返回：" + JSON.toJSONStringWithDateFormat(jsonObject,
                    //指定时间格式
                    "yyyy-MM-dd HH:mm:ss",
                    //空值输出null
                    //SerializerFeature.PrettyFormat,
                    SerializerFeature.WriteMapNullValue,
                    SerializerFeature.WriteNullNumberAsZero));
            // 如果请求成功
            if (null != jsonObject && jsonObject.getString("openid") != null) {
                WxUserInfoOut wxUserInfo = new WxUserInfoOut();
                wxUserInfo.setOpenId(jsonObject.getString("openid"));
                wxUserInfo.setNickname(jsonObject.getString("nickname"));
                wxUserInfo.setSex(jsonObject.getInteger("sex"));
                wxUserInfo.setProvince(jsonObject.getString("province"));
                wxUserInfo.setCity(jsonObject.getString("city"));
                wxUserInfo.setCountry(jsonObject.getString("country"));
                wxUserInfo.setHeadimgurl(jsonObject.getString("headimgurl"));
                wxUserInfo.setPrivilege(jsonObject.getString("privilege"));
                wxUserInfo.setUnionid(jsonObject.getString("unionid"));                
                return wxUserInfo;                
            }
            // 获取token失败
            logger.info("获取微信用户信息失败 errcode：" + jsonObject.getInteger("errcode") + " errmsg：" + jsonObject.getString("errmsg"));
        }
        return null;
    }

    /**
     * 获取access_token
     *
     * @param appid     凭证
     * @param appsecret 密钥
     * @return Oauth2TokenOut 返回网页授权token
     */
    public static Oauth2TokenOut getOauth2Token(String code) {
        Oauth2TokenOut oauth2TokenOut = null;
        String requestUrl = WxApiAddressUtil.GET_OAUTH2_TOKEN_URL
                .replace("APPID", PropsUtil.loadProps("config.properties").getProperty("wx_appid"))
                .replace("APPSECRET", PropsUtil.loadProps("config.properties").getProperty("wx_appsecret"))
                .replace("CODE",code);
        JSONObject jsonObject = HttpRequestUtil.httpRequest(requestUrl, "GET", null);
        logger.info("调用获取微信oauth2_token接口返回：" + JSON.toJSONStringWithDateFormat(jsonObject,
                //指定时间格式
                "yyyy-MM-dd HH:mm:ss",
                //空值输出null
                //SerializerFeature.PrettyFormat,
                SerializerFeature.WriteMapNullValue,
                SerializerFeature.WriteNullNumberAsZero));
        // 如果请求成功
        if (null != jsonObject && jsonObject.getString("access_token") != null) {
            oauth2TokenOut = new Oauth2TokenOut();
            oauth2TokenOut.setAccessToken(jsonObject.getString("access_token"));
            oauth2TokenOut.setExpiresIn(jsonObject.getInteger("expires_in"));
            oauth2TokenOut.setOpenid(jsonObject.getString("openid"));
            oauth2TokenOut.setRefreshToken(jsonObject.getString("refresh_token"));
            oauth2TokenOut.setScope(jsonObject.getString("scope"));
            //RedisUtil redisUtil = (RedisUtil) SpringContextUtil.getBean("redisUtil");
            //redisUtil.set(RedisUtil.REDIS_OAUTH2_TOKEN_KEY + jsonObject.getString("openid"),oauth2TokenOut,7000);暂时不用存入缓存
            return oauth2TokenOut;
        }
        // 获取token失败
        logger.info("获取oauth2Token失败 errcode：" + jsonObject.getInteger("errcode") + " errmsg：" + jsonObject.getString("errmsg"));
        return null;
    }

    /**
     * 获取access_token
     *
     * @param appid     凭证
     * @param appsecret 密钥
     * @return AccessTokenOut 返回接口凭证
     */
    public static AccessTokenOut getWxAccessToken() {
        AccessTokenOut accessTokenOut = null;
        String requestUrl = WxApiAddressUtil.GET_ACCESS_TOKEN_URL
                .replace("APPID", PropsUtil.loadProps("config.properties").getProperty("wx_appid"))
                .replace("APPSECRET", PropsUtil.loadProps("config.properties").getProperty("wx_appsecret"));
        JSONObject jsonObject = HttpRequestUtil.httpRequest(requestUrl, "GET", null);
        logger.info("调用获取微信token接口返回：" + JSON.toJSONStringWithDateFormat(jsonObject,
                //指定时间格式
                "yyyy-MM-dd HH:mm:ss",
                //空值输出null
                //SerializerFeature.PrettyFormat,
                SerializerFeature.WriteMapNullValue,
                SerializerFeature.WriteNullNumberAsZero));
        // 如果请求成功
        if (null != jsonObject && jsonObject.getString("access_token") != null) {
            accessTokenOut = new AccessTokenOut();
            accessTokenOut.setAccessToken(jsonObject.getString("access_token"));
            accessTokenOut.setExpiresIn(jsonObject.getInteger("expires_in"));
            return accessTokenOut;
        }
        // 获取token失败
        logger.info("获取accessToken失败 errcode：" + jsonObject.getInteger("errcode") + " errmsg：" + jsonObject.getString("errmsg"));
        return null;
    }

    /**
     * @author: huangz
     * @description: 长链接转短链接地址
     * @date: 2019/3/14 0014 16:08
     * @param: [url]
     * @return: java.lang.String
     */
    public static String getWxShortUrl(String url,String accessToken) {
        String requestUrl = WxApiAddressUtil.GET_LONG_2_SHORT_URL.replace("ACCESS_TOKEN",accessToken);
        Map<String,Object> paramMap = new HashMap<>();
        paramMap.put("action","long2short");
        paramMap.put("long_url",url);
        JSONObject jsonObject = HttpRequestUtil.httpRequest(requestUrl, "POST", JSON.toJSONString(paramMap));
        logger.info("调用微信长链接转短链接接口返回：" + JSON.toJSONStringWithDateFormat(jsonObject,
                //指定时间格式
                "yyyy-MM-dd HH:mm:ss",
                //空值输出null
                //SerializerFeature.PrettyFormat,
                SerializerFeature.WriteMapNullValue,
                SerializerFeature.WriteNullNumberAsZero));
        if(jsonObject != null && jsonObject.getString("short_url") != null){
            return jsonObject.getString("short_url");
        }
        logger.info("获取短连接失败 errcode：" + jsonObject.getInteger("errcode") + " errmsg：" + jsonObject.getString("errmsg"));
        return null;
    }

    /**
     * @author: huangz
     * @description: 获取网页授权地址
     * @date: 2019/3/14 0014 16:36
     * @param: []
     * @return: java.lang.String
     */
    public static String getOAuth2Url(String accessToken){
        String requestUrl = WxApiAddressUtil.GET_OAUTH2_CODE_URL
                .replace("APPID", PropsUtil.loadProps("config.properties").getProperty("wx_appid"))
                .replace("REDIRECT_URI", PropsUtil.loadProps("config.properties").getProperty("oauth2_redirect_url"));
        if(StringUtils.isEmpty(accessToken)){
        	return requestUrl;
        }
        return getWxShortUrl(requestUrl,accessToken);
    }
}
