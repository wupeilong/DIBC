package cn.dibcbks.util;



import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;



/**
* @Title: GetCommonUser.java
* @Package cn.dibcbks.util
* @Description:(用一句话描述该文件做什么)
* @author: ZhouLingZhang
* @date 2019年11月11日
* @Copyright:好前途教育
* @version V1.0
 */
public class GetCommonUser {	
	
	public static String [] getFileName(String path)
    {
        File file = new File(path);
        String [] fileName = file.list();
        return fileName;
    }
    public static void getAllFileName(String path,ArrayList<String> fileName)
    {
        File file = new File(path);       
        File [] files = file.listFiles();
        String [] names = file.list();
        if(names != null)
        fileName.addAll(Arrays.asList(names));
        for(File a:files)
        {
            if(a.isDirectory() && a.getName().endsWith(".log"))
            {            	
                getAllFileName(a.getAbsolutePath(),fileName);
            }
        }       
    }
    public  String uoladimg(MultipartFile file,String uuid)
    {
    	
    	String start=null;
    	String path1=this.getpath();	
    	//long time = new Date().getTime();
    	long time = IDWorkUtil.nextId();
    	String extName=null;
    	//如果是blob类型的文件  扩展名就为.blob
    	if(!file.getOriginalFilename().contains(".")){
    		extName=".jpg";
    	}else{
    		extName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));	  
    	} 

	    try {
	    	File file5 = new File(path1+"/static/images/bks_wap/company_img/"+uuid);
		    if (!file5.exists()) {
		        file5.mkdirs();	       			
		    } 
		    file.transferTo(new File(path1+"/static/images/bks_wap/company_img/"+uuid+"/"+time+extName));
		    start="/static/images/bks_wap/company_img/"+uuid+"/"+time+extName;
		} catch (Exception e) {
			return start;
		}
		return start;		
    }   	
    public  void deluoladimg(String path)
    {
    	String path1=this.getpath();    	
    	File file5 = new File(path1+path);
    	if (file5.exists()) {	    	
    		file5.delete();	    		
    	}   	
    }
	
		//获取项目路径
		public  String getpath(){
			String classpath = this.getClass().getResource("/").getPath(); 				
			String path1 = classpath.replaceAll("/WEB-INF/classes/", "");
			return path1;
		}
	


}
