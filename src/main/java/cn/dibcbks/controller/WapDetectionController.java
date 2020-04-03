package cn.dibcbks.controller;



import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import cn.dibcbks.entity.Detection;
import cn.dibcbks.service.IDetectionService;
import cn.dibcbks.util.ResponseResult;

/**
 * @author: wupeilong
 * @version: v1.0.0
 * @ClassName: DetectionController
 * @Description: H5多频检查控制器
 * @Date: 2020-03-24 15:39
 */
@Controller
@RequestMapping("/wap_det")
public class WapDetectionController {
		
	@Autowired
	private IDetectionService iDetectionService;

	
	/**
	 * 进入多频检查记录列表页
	 * @return
	 */
	@RequestMapping("/detection_list")
	public String detectionList(ModelMap modelMap){	
		
		return iDetectionService.selectDetectionListPage(modelMap);
	}
	
	/**
	 * 进入多频检查记录表添加页
	 * @return
	 */
	@RequestMapping("/detection_add")
	public String detectionAdd(ModelMap modelMap){			
		
		return iDetectionService.addDetectionPag(modelMap);
	}
	
	/**
	 * 新增多频检查信息记录
	 * @param unitId
	 * @param unitName
	 * @param samplName
	 * @param specifications
	 * @param bath
	 * @param item
	 * @param result
	 * @param remark
	 * @param file
	 * @return
	 */
	@RequestMapping("/detection_regadd")
	@ResponseBody
	public ResponseResult<Void> registeradd(
						@RequestParam(value="unitId",required = true) Integer unitId,
						@RequestParam(value="unitName",required = true) String unitName,
						@RequestParam(value="samplName",required = true) String samplName,
						@RequestParam(value="specifications",required = true) String specifications,
						@RequestParam(value="bath",required = true) String bath, 
						@RequestParam(value="item",required = true) String item,			
						@RequestParam(value="result",required = true) String result,
						@RequestParam(value="remark",required = true) String remark,
						@RequestParam(value="detectionPhoto",required=false)MultipartFile file){
		
		return iDetectionService.addDetection(unitId,unitName,samplName,specifications,bath,item,result,remark,file);
	}
	
	/**
	 * 进入多频检查信息详情
	 * @return
	 */
	@RequestMapping("/detection_detal")
	public String detectionDetal(ModelMap modelMap,Integer id){	
		
		return iDetectionService.selectDetectionDetailPag(modelMap,id);
	}
	
	
	
	/**
	 * 查询多频次检查信息列表
	 * @param unitId
	 * @return
	 */
	@RequestMapping("/queryList")
	@ResponseBody()
	public ResponseResult<List<Detection>> queryDetectionList(ModelMap modelMap,Integer unitId){
		
		return iDetectionService.selectDetectionList(modelMap,unitId);
	}
	
		


}
