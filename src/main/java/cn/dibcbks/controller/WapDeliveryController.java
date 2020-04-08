package cn.dibcbks.controller;



import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import cn.dibcbks.entity.Distribution;
import cn.dibcbks.mapper.DistributionMapper;
import cn.dibcbks.mapper.UnitMapper;
import cn.dibcbks.service.IDistributionService;
import cn.dibcbks.util.ResponseResult;


/**
 * H5配送控制器
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/wap_dry")
public class WapDeliveryController {
	
	@Autowired
	private IDistributionService iDistributionService;

	
	/**
	 * 进入配送信息列表页
	 * @return
	 */
	@RequestMapping("/delivery")
	public String delivery(ModelMap modelMap){		
		
		return iDistributionService.distributionListPag(modelMap);
	}
	
	/**
	 * 查询配送信息列表页
	 * @return
	 */
	@RequestMapping("/deliveryList")
	@ResponseBody
	public ResponseResult<List<Distribution>> deliveryList(String unitName){
		System.out.println(unitName);
		return iDistributionService.selectDistributionList(unitName);
	}
	
	/**
	 * 进入配送信息详情页
	 * @return
	 */
	@RequestMapping("/delivery_detal")
	public String deliveryDetal(ModelMap modelMap, String id){				
		
		return iDistributionService.distributionDetailPag(modelMap,id);
	}
	
	
	/**
	 * 确认已送达
	 * @return
	 */
	@RequestMapping("/service")
	@ResponseBody
	public ResponseResult<Void> deliveryService(String id){		
 
		return iDistributionService.confirmDeliver(id);
	}
	
	
	
	/**
	 * 确认已验收
	 * @param id
	 * @param openedPhoto
	 * @param acceptanceResult
	 * @return
	 */
	@RequestMapping("/acceptance")
	@ResponseBody
	public ResponseResult<Void> deliveryService(String id,MultipartFile openedPhoto,String acceptanceResult){
		
		return iDistributionService.confirmAcceptance(id,openedPhoto,acceptanceResult);
	}
	
	
	/**
	 * 进入配送信息添加页
	 * @return
	 */
	@RequestMapping("/delivery_add")
	public String deliveryAdd(ModelMap modelMap){
		
		return iDistributionService.addDistributionlPag(modelMap);
	}

	
	/**
	 * 新增配送信息
	 * @param type
	 * @param mealsUnitId
	 * @param mealsUnitName
	 * @param acceptanceUnitName
	 * @param mealsUserName
	 * @param packingPhoto
	 * @param sealPhoto
	 * @param carPhoto
	 * @param address
	 * @return
	 */
	@RequestMapping("/add")
	@ResponseBody
	public ResponseResult<Void> deliveryAdd(Integer type,
											Integer mealsUnitId,
											String mealsUnitName,
											String acceptanceUnitName,
											String mealsUserName,
											@RequestParam("packingPhoto") MultipartFile packingPhoto,
											@RequestParam("sealPhoto") MultipartFile sealPhoto,
											@RequestParam("carPhoto") MultipartFile carPhoto,
											String address){		
		
		return iDistributionService.addDistributionl(type,mealsUnitId,mealsUnitName,acceptanceUnitName,mealsUserName,packingPhoto,sealPhoto,carPhoto,address);
	}
}
