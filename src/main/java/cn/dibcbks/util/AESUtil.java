package cn.dibcbks.util;

import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.util.Base64Utils;

public class AESUtil {
	private static final Logger logger = LogManager.getLogger(AESUtil.class.getName());
	private static final String KEY_ALGORITHM = "AES";
    private static final String DEFAULT_CIPHER_ALGORITHM = "AES/ECB/PKCS5Padding";//默认的加密算法    
    public static final String ASSETS_DEV_PWD_FIELD = PropsUtil.loadProps("config.properties").getProperty("cookie_secret_key");//自定义密码

    /**
     * AES 加密操作
     *
     * @param content  待加密内容
     * @param secretkey 加密秘钥
     * @return 返回Base64转码后的加密数据
     */
    public static String encrypt(String content, String secretkey) {
        try {
            Cipher cipher = Cipher.getInstance(DEFAULT_CIPHER_ALGORITHM);// 创建密码器

            byte[] byteContent = content.getBytes("utf-8");

            cipher.init(Cipher.ENCRYPT_MODE, getSecretKey(secretkey));// 初始化为加密模式的密码器

            byte[] result = cipher.doFinal(byteContent);// 加密

            return Base64Utils.encodeToString(result);//通过Base64转码返回
        } catch (Exception ex) {
        	ex.printStackTrace();
            logger.error("AES 加密异常:" + ex.getMessage());
        }

        return null;
    }

    /**
     * AES 解密操作
     *
     * @param content
     * @param secretkey
     * @return
     */
    public static String decrypt(String content, String secretkey) {

        try {
            //实例化
            Cipher cipher = Cipher.getInstance(DEFAULT_CIPHER_ALGORITHM);

            //使用密钥初始化，设置为解密模式
            cipher.init(Cipher.DECRYPT_MODE, getSecretKey(secretkey));

            //执行操作
            byte[] result = cipher.doFinal(Base64Utils.decodeFromString(content));
            String s = new String(result, "utf-8");
            return s;
        } catch (Exception ex) {
            ex.printStackTrace();
            logger.error("AES 解密异常:" + ex.getMessage());
        }

        return null;
    }

    /**
     * 生成加密秘钥
     *
     * @return
     */
    private static SecretKeySpec getSecretKey(String secretkey) {
        //返回生成指定算法密钥生成器的 KeyGenerator 对象
        KeyGenerator kg = null;
        try {
            kg = KeyGenerator.getInstance(KEY_ALGORITHM);
            SecureRandom random = SecureRandom.getInstance("SHA1PRNG");
            random.setSeed(secretkey.getBytes());
            //AES 要求密钥长度为 128
            kg.init(128, random);
            //生成一个密钥
            SecretKey secretKey = kg.generateKey();
            return new SecretKeySpec(secretKey.getEncoded(), KEY_ALGORITHM);// 转换为AES专用密钥
        } catch (NoSuchAlgorithmException ex) {
        	ex.printStackTrace();
        	logger.error("生成加密秘钥:" + ex.getMessage());
        }
        return null;
    }

    public static void main(String[] args) {
        String origin = "12345689";
        String encrypt = AESUtil.encrypt(origin, AESUtil.ASSETS_DEV_PWD_FIELD);
        String decrypt = AESUtil.decrypt(encrypt, AESUtil.ASSETS_DEV_PWD_FIELD);
        System.out.println(origin);
        System.out.println(encrypt);
        System.out.println(decrypt);
    }
}
