package com.ibest.accesssystem.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

import javax.servlet.http.HttpServletRequest;

import com.ibest.accesssystem.dto.input.PayChannelPermissionAssignmentInputDTO;
import com.ibest.accesssystem.dto.input.SystemActivityInputDTO;
import com.ibest.accesssystem.entity.SystemActivity;
import com.ibest.accesssystem.service.SystemActivityService;
import com.ibest.activity.entity.ActivitySystem;
import com.ibest.activity.service.ActivitySystemService;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ibest.accesssystem.dto.input.AccessSystemInputDTO;
import com.ibest.accesssystem.dto.input.SystemActivityInputDTO;
import com.ibest.accesssystem.dto.output.TreeChildrenModel;
import com.ibest.accesssystem.dto.output.TreeModel;
import com.ibest.accesssystem.entity.AccessSystem;
import com.ibest.accesssystem.entity.PayChannelPermissionAssignment;
import com.ibest.accesssystem.entity.SystemActivity;
import com.ibest.accesssystem.service.AccessSystemService;
import com.ibest.accesssystem.service.PayChannelPermissionAssignmentService;
import com.ibest.accesssystem.service.SystemActivityService;
import com.ibest.framework.common.enums.EnumsRtnMapResult;
import com.ibest.framework.common.persistence.BaseController;
import com.ibest.framework.common.utils.PageList;
import com.ibest.framework.common.utils.UserUtils;
import com.ibest.pay.entity.PayChannel;
import com.ibest.pay.entity.PayType;
import com.ibest.pay.service.PayChannelService;
import com.ibest.pay.service.PayTypeService;
import com.ibest.user.dto.input.UserInputDTO;
import com.ibest.utils.ConstantUtils;
import com.ibest.utils.RandomUtils;

@Controller
@RequestMapping(value="${adminPath}/accesssystem/accessSystem")
public class AccessSystemController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(AccessSystemController.class);
	
	@Autowired
	private AccessSystemService accessSystemService;
	
	@Autowired
	private PayChannelService payChannelService;
	
	@Autowired
	private PayTypeService payTypeService;
	
	@Autowired
	private PayChannelPermissionAssignmentService payChannelPermissionAssignmentService;

	@Autowired
	private SystemActivityService systemActivityService;
	
	@Autowired
	private ActivitySystemService activitySystemService;
	
	/**
	* 进入到列表页
	*/
	@RequestMapping(value="/")
	public String index(){
		return "module/accesssystem/accessSystem/accessSystemList";
	}
	
	/**
	* 进入到表单页-创建
	*/
	@RequestMapping(value="/add")
	public String add(){
		
		return "module/accesssystem/accessSystem/accessSystemForm";
	}
	
	/**
	* 进入到表单页，编辑
	*/
	@RequestMapping(value="/edit")
	public String edit(@RequestParam String id, Model model){
		try {
			if(StringUtils.isNotEmpty(id)){
				AccessSystem accessSystem = accessSystemService.findById(id);
				if(accessSystem != null){
					model.addAttribute("accessSystem", accessSystem);
				}else{
					setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "您查看的信息不存在！", model);
				}
			}else{
				setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "请选择需要编辑的信息！", model);
			}
		} catch (Exception e) {
			setRtnCodeAndMsg(EnumsRtnMapResult.EXCEPTION.getCode(), EnumsRtnMapResult.EXCEPTION.getMsg(), model);
		}
		return "module/accesssystem/accessSystem/accessSystemForm";
	}
	
	/**
	* 进入到详情页
	*/
	@RequestMapping(value="/view")
	public String view(@RequestParam String id, Model model){
		try {
			if(StringUtils.isNotEmpty(id)){
				AccessSystem accessSystem = accessSystemService.findById(id);
				SystemActivityInputDTO systemActivityInputDTO = new SystemActivityInputDTO();
				List<PayChannelPermissionAssignment> payChannelPermissionAssignments = payChannelPermissionAssignmentService.findByAll();
				List<SystemActivity> systemActivities = systemActivityService.findByObject(systemActivityInputDTO);
				String activitySystemSign;
				String systemSign;
				String payChannelSystemSign;
				if(accessSystem != null){
					//是否已关联活动
					systemSign = accessSystem.getIdentification();
					for (SystemActivity activity : systemActivities) {
						activitySystemSign = activity.getAccessSystemId();
						if (systemSign.equals(activitySystemSign)) {
							accessSystem.setIsActivity("已关联");
							break;
						} else {
							accessSystem.setIsActivity("未关联");
							continue;
						}
					}

					//是否已关联支付渠道
					systemSign = accessSystem.getId();
					for (PayChannelPermissionAssignment payChannel : payChannelPermissionAssignments) {
						payChannelSystemSign = payChannel.getSystemSign();
						if (systemSign.equals(payChannelSystemSign)) {
							accessSystem.setIsChannel("已关联");
							break;
						} else {
							accessSystem.setIsChannel("未关联");
							continue;
						}
					}
					model.addAttribute("accessSystem", accessSystem);
					model.addAttribute("id", id);
				}else{
					setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "您查看的信息不存在！", model);
				}
			}else{
				setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "请选择需要查看的信息！", model);
			}
		} catch (Exception e) {
			setRtnCodeAndMsg(EnumsRtnMapResult.EXCEPTION.getCode(), EnumsRtnMapResult.EXCEPTION.getMsg(), model);
		}
		return "module/accesssystem/accessSystem/accessSystemDetail";
	}
	
	/**
	 * 查询系统拥有的活动规则
	 * @param accessSystemId
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "activityList")
	public AccessSystem activityList(@RequestParam("accessSystemId") String accessSystemId) {
		AccessSystem accessSystem = null;
		try {
			accessSystem = accessSystemService.getSystemActivity(accessSystemId);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			e.printStackTrace();
		}
		return accessSystem;
	}

	/**
	* 异步分页查询
	*/
	@ResponseBody
	@RequiresPermissions("accessSystem:query")
	@RequestMapping(value="/list")
	public PageList<AccessSystem> list(AccessSystemInputDTO accessSystem, HttpServletRequest request){
		
		PageList<AccessSystem> pageList = new PageList<AccessSystem>();
		
		try {
			//设置分页参数
			super.setPage(request, pageList);
		
			pageList = accessSystemService.findByPage(pageList, accessSystem);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pageList;
	}

	/**
	 * 进入到表单页-创建 活动
	 */
	@RequestMapping(value="/permissionActivity")
	public String permissionActivity(@RequestParam String id, Model model,AccessSystemInputDTO inputDto) {
		
		try{
			model.addAttribute("systemSign", id);
		}catch(Exception e){
			
		}
		return "module/accesssystem/accessSystem/permissionActivity";
	}

	/**
	 * 进入到表单页-创建 支付渠道
	 */
	@RequestMapping(value="/permissionChannel")
	public String permissionChannel(@RequestParam String id,String name, Model model) {
		try {
			//查询所有的支付渠道
			List<PayChannel> payChannelList = payChannelService.findByAll();
			
			//查询所有的的分配权限
			List<PayChannelPermissionAssignment> permissionList = payChannelPermissionAssignmentService.findByAll();
			
			List<TreeModel> treeModel = new ArrayList<TreeModel>();
			if(payChannelList!=null && payChannelList.size()>0) {
				for (PayChannel py : payChannelList) {
					List<TreeChildrenModel> children = new ArrayList<>();
					TreeModel tm = new TreeModel();
					tm.setId(py.getId());
					tm.setText(py.getPayChannelName());
					List<PayType> payList =payTypeService.findByPayChannelId(py.getId());
					if(payList!=null && payList.size()>0) {
						for (PayType payType : payList) {
							TreeChildrenModel tcm = new TreeChildrenModel();
							tcm.setId(payType.getId());
							tcm.setText(payType.getPayName());
							children.add(tcm);
						}
					}
					tm.setChildren(children);
					treeModel.add(tm);
				}
			}
			//已经授权的支付类型
			for (TreeModel tm : treeModel) {
				List<TreeChildrenModel> child = tm.getChildren();
				if(child!=null && child.size()>0) {
					for (TreeChildrenModel tc : child) {
						for (PayChannelPermissionAssignment pp : permissionList) {
							if(tc.getId().equals(pp.getPayTypeId()) && pp.getSystemSign().equals(id)) {
								tc.setChecked(true);
							}
						}
					}
				}
			}
			model.addAttribute("treeModel", treeModel);
			model.addAttribute("permissionList", permissionList);
			model.addAttribute("systemSign", id);
			model.addAttribute("systemSignName", name);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "module/accesssystem/accessSystem/permissionPayChannel";
	}

	/**
	 * 异步分页查询
	 */
	@ResponseBody
	@RequestMapping(value="/accessSystems")
	public List<AccessSystem> accessSystems(AccessSystemInputDTO inputDTO) throws Exception{
		return accessSystemService.findByObject(inputDTO);
	}

	/**
	 * 检测系统标识唯一性
	 * @param inputDTO
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="checkIdentification")
	public String checkIdentification(AccessSystemInputDTO inputDTO) {
		boolean isSame=true;

		int userCount = accessSystemService.countAccessSystemByObject(inputDTO);

		if (userCount != 0) {
			isSame = false;
		}
		return isSame+"";
	}
	
	/**
	 * 检测用户名唯一性
	 * 
	 * @param inputDTO
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "checkIdentificationIsLower")
	public String checkUsernameIsUpper(AccessSystemInputDTO inputDTO) {
		String identification = inputDTO.getIdentification();
		Scanner sc = new Scanner(identification);
		String str = sc.nextLine();
		boolean isLower = false;
		for (int i = 0; i < str.length(); i++) {
			char c = str.charAt(i);
			if (Character.isLowerCase(c))
				continue;
			else {
				isLower = true;
				break;
			}
		}
		return isLower+"";
	}

	/**
	* 异步表单提交
	 * @throws Exception 
	*/
	@ResponseBody
	@RequiresPermissions("accessSystem:create")
	@RequestMapping(value="create")
	public Map<String, Object> insert(AccessSystem accessSystem) throws Exception{

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		AccessSystemInputDTO inputDTO = new AccessSystemInputDTO();
		List<AccessSystem> lists = accessSystemService.findByObject(inputDTO);
		for (AccessSystem system : lists) {
			if(system.getIdentification().equals(accessSystem.getIdentification())) {
				setRtnCodeAndMsgByFailure(rtnMap, "保存失败,系统标识已存在");
				return rtnMap;
			}
		}
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");
		
		try {
			accessSystem.setIsDelete(ConstantUtils.UPDATE_SET_ZERO);
			accessSystem.setId(RandomUtils.RandomUUID());
			accessSystem.setIsOpen("1");
			accessSystem.setCreater(UserUtils.getCurrentUser().getRealname());
			accessSystem.setCreateTime(new Date());
			accessSystem.setModifier(UserUtils.getCurrentUser().getRealname());
			accessSystem.setModifyTime(new Date());
			int result = accessSystemService.insert(accessSystem);
			if(result == 0){
				setRtnCodeAndMsgByFailure(rtnMap, "保存失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
			setRtnCodeAndMsgByException(rtnMap, null);
		}
		return rtnMap;
	}
	
	@ResponseBody
	@RequestMapping(value="/updateIsOpen")
	public Map<String, Object> updateIsOpen(AccessSystem accessSystem){
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");
		
		String isOpen = accessSystem.getIsOpen();
		try {
			String systemId = accessSystemService.findById(accessSystem.getId()).getIdentification();
			if(isOpen.equals("1")){
				List<ActivitySystem> findByAccessId = 
						activitySystemService.findByAccessId(systemId);
				if(findByAccessId!=null && findByAccessId.size()>0){
					for (ActivitySystem activitySystem : findByAccessId) {
						if(activitySystem.getState().equals("1")){
							setRtnCodeAndMsgByFailure(rtnMap, "保存失败");
							return rtnMap;
						}else{
							accessSystem = accessSystemService.findById(accessSystem.getId());
							accessSystem.setIsOpen(isOpen);
							int result = accessSystemService.update(accessSystem);
							if(result == 0){
								setRtnCodeAndMsgByFailure(rtnMap, "保存失败");
							}
						}
					}
				}else{
					accessSystem = accessSystemService.findById(accessSystem.getId());
					accessSystem.setIsOpen(isOpen);
					int result = accessSystemService.update(accessSystem);
					if(result == 0){
						setRtnCodeAndMsgByFailure(rtnMap, "保存失败");
					}
				}
			}else{
				accessSystem = accessSystemService.findById(accessSystem.getId());
				accessSystem.setIsOpen(isOpen);
				int result = accessSystemService.update(accessSystem);
				if(result == 0){
					setRtnCodeAndMsgByFailure(rtnMap, "保存失败");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			setRtnCodeAndMsgByException(rtnMap, null);
		}
		return rtnMap;
	}
	
	@ResponseBody
	@RequiresPermissions("accessSystem:update")
	@RequestMapping(value="update")
	public Map<String, Object> update(AccessSystem accessSystem) throws Exception{

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		AccessSystemInputDTO inputDTO = new AccessSystemInputDTO();
		List<AccessSystem> lists = accessSystemService.findByObject(inputDTO);
		for (AccessSystem system : lists) {
			if(system.getIdentification().equals(accessSystem.getIdentification())) {
				setRtnCodeAndMsgByFailure(rtnMap, "保存失败,系统标识已存在");
				return rtnMap;
			}
		}
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");
		
		try {
			AccessSystem access = accessSystemService.findById(accessSystem.getId());
			accessSystem.setIsOpen("1");
			accessSystem.setModifier(UserUtils.getCurrentUser().getRealname());
			accessSystem.setModifyTime(new Date());
			accessSystem.setIdentification(access.getIdentification());
			int result = accessSystemService.update(accessSystem);
			if(result == 0){
				setRtnCodeAndMsgByFailure(rtnMap, "保存失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
			setRtnCodeAndMsgByException(rtnMap, null);
		}
		return rtnMap;
	}
	
	@ResponseBody
	@RequiresPermissions("accessSystem:distributionActivity")
	@RequestMapping(value="allocation")
	public Map<String, Object> allocation(@RequestParam(required=true) String id){
		
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "删除成功");
		
		try {
			List<ActivitySystem> state = activitySystemService.findByAccessId(id);
			if(state!=null && state.size()>0){
				for (ActivitySystem activitySystem : state) {
					if(activitySystem.getState().equals("1")){
						setRtnCodeAndMsgByFailure(rtnMap, "删除失败");
						return rtnMap;
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			setRtnCodeAndMsgByException(rtnMap, null);
		}
		return rtnMap;
	}
	
	@ResponseBody
	@RequiresPermissions("accessSystem:delete")
	@RequestMapping(value="delete")
	public Map<String, Object> delete(@RequestParam(required=true) String ids){
		
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "删除成功");
		
		try {
			int result = accessSystemService.deleteByIds(ids);
			if(result == 0){
				setRtnCodeAndMsgByFailure(rtnMap, "删除失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
			setRtnCodeAndMsgByException(rtnMap, null);
		}
		return rtnMap;
	}

	/**
	 * 查询系统拥有的支付渠道
	 * @param systemSign
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "sysPaychannel")
	public AccessSystem systemPayChannnel(@RequestParam("systemSign") String systemSign) {
		AccessSystem accessSystem = null;
		try {
			accessSystem = accessSystemService.getSystemPayChannnel(systemSign);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			e.printStackTrace();
		}
		return accessSystem;
	}

	/**
	 * 授权支付系统
	 * @param systemSign 系统id
	 * @param payTypeId 支付渠道id
	 * @param systemSignName 支付渠道id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="accredit")
	public Map<String,Object> accredit(@RequestParam(value="systemSign", required=true) String systemSign,@RequestParam("systemSignName") String systemSignName, @RequestParam("payTypeId") String payTypeId) {

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "授权成功");
		try {
			//进行授权
			accessSystemService.accredit(systemSign, systemSignName,payTypeId);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			e.printStackTrace();
			setRtnCodeAndMsgByException(rtnMap, null);
		}
		return rtnMap;
	}

	//`````````````````````````````积分`````````````````````````````````
	/**
	 * 查询系统拥有的积分规则
	 * @param systemSign
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "sysPointRule")
	public AccessSystem sysPointRule(@RequestParam("systemSign") String systemSign) {
		AccessSystem accessSystem = null;
		try {
			accessSystem = accessSystemService.getSystemPointRule(systemSign);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			e.printStackTrace();
		}
		return accessSystem;
	}

	/**
	 * 授权积分规则
	 * @param systemSign 系统id
	 * @param allPointRulesId 积分规则id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="accreditPoint")
	public Map<String,Object> accreditPoint(@RequestParam(value="systemSign", required=true) String systemSign, @RequestParam("allPointRulesId") String allPointRulesId) {

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "授权成功");

		try {
			//进行授权
			accessSystemService.accreditPoint(systemSign, allPointRulesId);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			e.printStackTrace();
			setRtnCodeAndMsgByException(rtnMap, null);
		}
		return rtnMap;
	}

	//`````````````````````````````卡券`````````````````````````````````
	/**
	 * 查询系统拥有的积分规则
	 * @param systemSign
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "sysCoupon")
	public AccessSystem sysCoupon(@RequestParam("systemSign") String systemSign) {
		AccessSystem accessSystem = null;
		try {
			accessSystem = accessSystemService.getSystemCoupon(systemSign);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			e.printStackTrace();
		}
		return accessSystem;
	}

	/**
	 * 授权积分规则
	 * @param systemSign 系统id
	 * @param allCouponsId 积分规则id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="accreditCoupon")
	public Map<String,Object> accreditCoupon(@RequestParam(value="systemSign", required=true) String systemSign, @RequestParam("allCouponsId") String allCouponsId) {

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "授权成功");

		try {
			//进行授权
			accessSystemService.accreditCoupon(systemSign, allCouponsId);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			e.printStackTrace();
			setRtnCodeAndMsgByException(rtnMap, null);
		}
		return rtnMap;
	}

	//`````````````````````````````活动`````````````````````````````````
	/**
	 * 查询系统拥有的活动规则
	 * @param accessSystemId
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "sysActivity")
	public AccessSystem sysActivity(@RequestParam("accessSystemId") String accessSystemId) {
		AccessSystem accessSystem = null;
		try {
			accessSystem = accessSystemService.getSystemActivityFrank(accessSystemId);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			e.printStackTrace();
		}
		return accessSystem;
	}

	/**
	 * 授权积分规则
	 * @param accessSystemId 系统id
	 * @param allActivitysId 积分规则id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="accreditActivity")
	public Map<String,Object> accreditActivity(@RequestParam(value="accessSystemId", required=true) String accessSystemId, @RequestParam("allActivitysId") String allActivitysId) {

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "授权成功");

		try {
			//进行授权
			accessSystemService.accreditActivity(accessSystemId, allActivitysId);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			e.printStackTrace();
			setRtnCodeAndMsgByException(rtnMap, null);
		}
		return rtnMap;
	}
}
