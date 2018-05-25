package com.ibest.activity.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.ibest.framework.common.enums.EnumsRtnMapResult;
import com.ibest.framework.common.persistence.BaseController;
import com.ibest.framework.common.utils.PageList;
import com.ibest.framework.common.utils.UserUtils;
import com.ibest.utils.ConstantUtils;
import com.ibest.utils.RandomUtils;

import com.ibest.accesssystem.dto.input.SystemActivityInputDTO;
import com.ibest.accesssystem.entity.SystemActivity;
import com.ibest.accesssystem.service.SystemActivityService;
import com.ibest.activity.dto.input.ActivityInputDTO;
import com.ibest.activity.entity.Activity;
import com.ibest.activity.service.ActivityDetailsService;
import com.ibest.activity.service.ActivityService;


@Controller
@RequestMapping(value="${adminPath}/activity/activity")
public class ActivityController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(ActivityController.class);
	
	@Autowired
	private ActivityService activityService;
	
	@Autowired
	private SystemActivityService systemActivityService;
	
	@Autowired
	private ActivityDetailsService activityDetailsService;
	
	/**
	* 进入到列表页
	*/
	@RequestMapping(value="/")
	public String index(){
		return "module/activity/activity/activityList";
	}
	
	/**
	* 进入到表单页-创建
	*/
	@RequestMapping(value="/add")
	public String add(){
		
		return "module/activity/activity/activityForm";
	}

	/**
	* 进入到表单页，编辑
	*/
	@RequestMapping(value="/edit")
	public String edit(@RequestParam String id, Model model){
		try {
			if(StringUtils.isNotEmpty(id)){
				Activity activity = activityService.findById(id);
				if(activity != null){
					model.addAttribute("activity", activity);
				}else{
					setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "您查看的信息不存在！", model);
				}
			}else{
				setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "请选择需要编辑的信息！", model);
			}
		} catch (Exception e) {
			setRtnCodeAndMsg(EnumsRtnMapResult.EXCEPTION.getCode(), EnumsRtnMapResult.EXCEPTION.getMsg(), model);
		}
		return "module/activity/activity/activityForm";
	}
	
	@ResponseBody
	@RequestMapping(value="/updateIsOpen")
	public Map<String, Object> updateIsOpen(Activity activity){
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");
		
		try {		
			String state = activity.getState();		
			Activity activity2=activityService.findById(activity.getId());
			if("2".equals(state)) {
				boolean past=activityDetailsService.checkActivityPast(activity2.getActivityDetailsId());
				if(past) {
					setRtnCodeAndMsgByFailure(rtnMap, "活动已过期，不可变更状态");
					return rtnMap;
				}					
			}			
			if("1".equals(state)) {				
				String systemActivityId = "";
				SystemActivityInputDTO inputDto = new SystemActivityInputDTO();
				List<SystemActivity> systemActivities = systemActivityService.findByObject(inputDto);
			
				for (SystemActivity system : systemActivities) {
					systemActivityId = system.getActivityId();
					if (activity.getId().equals(systemActivityId) && "1".equals(system.getState())) {
						setRtnCodeAndMsgByFailure(rtnMap, "系统活动已关联，不可进行活动变更");
						return rtnMap;
					}	
			    }			
			}
			activity2.setState(activity.getState());
			activity2.setModifier(UserUtils.getCurrentUser().getRealname());
			activity2.setModifyTime(new Date());
			int result = activityService.update(activity2);
			if(result == 0){
				setRtnCodeAndMsgByFailure(rtnMap, "保存失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
			setRtnCodeAndMsgByException(rtnMap, null);
		}
		return rtnMap;
	}
	
	/**
	* 进入到详情页
	*/
	@RequestMapping(value="/view")
	public String view(@RequestParam String id, Model model){
		try {
			if(StringUtils.isNotEmpty(id)){
				Activity activity = activityService.findById(id);
				if(activity != null){
					model.addAttribute("activity", activity);
				}else{
					setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "您查看的信息不存在！", model);
				}
			}else{
				setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "请选择需要查看的信息！", model);
			}
		} catch (Exception e) {
			setRtnCodeAndMsg(EnumsRtnMapResult.EXCEPTION.getCode(), EnumsRtnMapResult.EXCEPTION.getMsg(), model);
		}
		return "module/activity/activity/activityDetail";
	}

	/**
	* 异步分页查询
	*/
	@ResponseBody
	@RequiresPermissions("activity:query")
	@RequestMapping(value="/list")
	public PageList<Activity> list(ActivityInputDTO activity, HttpServletRequest request){
		
		PageList<Activity> pageList = new PageList<Activity>();
		
		try {
			//设置分页参数
			super.setPage(request, pageList);
		
			pageList = activityService.findByPage(pageList, activity);
			

			List<Activity> list=pageList.getRows();
			for (Activity activity2 : list) {				
				boolean past=activityDetailsService.checkActivityPast(activity2.getActivityDetailsId());
				if(past) {
					activity2.setState("1");
					activityService.update(activity2);
				}			
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pageList;
	}
	
	/**
	* 异步表单提交
	*/
	@ResponseBody
	@RequiresPermissions("activity:create")
	@RequestMapping(value="create")
	public Map<String, Object> insert(Activity activity){

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");
		
		try {
			activity.setIsDelete(ConstantUtils.UPDATE_SET_ZERO);
			activity.setId(RandomUtils.RandomUUID());
			activity.setCreater(UserUtils.getCurrentUser().getRealname());
			activity.setCreateTime(new Date());
			activity.setModifier(UserUtils.getCurrentUser().getRealname());
			activity.setModifyTime(new Date());
			int result = activityService.insert(activity);
			if(result == 0){
				setRtnCodeAndMsgByFailure(rtnMap, "保存失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
			setRtnCodeAndMsgByException(rtnMap, null);
		}
		return rtnMap;
	}

	/**
	 * 参与活动
	 */
	@ResponseBody
	@RequestMapping(value = "/partakeActivity", method = RequestMethod.POST)
	public Map<String, Object> partakeActivity( HttpServletRequest request) {
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");
		String systemSign = request.getParameter("identification");
		String appSign="06";
		String userId=request.getParameter("userId");
		String vinNo=request.getParameter("vinNo");
		String activitySystemId=request.getParameter("systemActivityId");
		try {
			String info="";
			if(StringUtils.isBlank(systemSign)) {
				info="接入系统标识不能为空";
				setRtnCodeAndMsgBySuccess(rtnMap, info);
				return rtnMap;
			}
			if(StringUtils.isBlank(appSign)) {
				info="终端应用标识不能为空";
				setRtnCodeAndMsgBySuccess(rtnMap, info);
				return rtnMap;
			}
			if(StringUtils.isBlank(userId)) {
				info="用户ID不能为空";
				setRtnCodeAndMsgBySuccess(rtnMap, info);
				return rtnMap;
			}
			if(StringUtils.isBlank(vinNo)) {
				info="车架号不能为空";
				setRtnCodeAndMsgBySuccess(rtnMap, info);
				return rtnMap;
			}
			if(StringUtils.isBlank(activitySystemId)) {
				info="系统活动Id不能为空";
				setRtnCodeAndMsgBySuccess(rtnMap, info);
				return rtnMap;
			}


			ActivityInputDTO activityInputDTO=new ActivityInputDTO();
			activityInputDTO.setSystemSign(systemSign);
			activityInputDTO.setAppSign(appSign);
			activityInputDTO.setUserId(userId);
			activityInputDTO.setVinNo(vinNo);
			activityInputDTO.setActivitySystemId(activitySystemId);
			info = activityService.partakeActivity(activityInputDTO);
			if(!"true".equals(info)) {
				setRtnCodeAndMsgBySuccess(rtnMap, info);
			} else {
				setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.debug(e.toString());
		}
		return rtnMap;
	}
	
	@ResponseBody
	@RequiresPermissions("activity:update")
	@RequestMapping(value="update")
	public Map<String, Object> update(Activity activity){

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");
		
		try {
			activity.setModifier(UserUtils.getCurrentUser().getRealname());
			activity.setModifyTime(new Date());
			int result = activityService.update(activity);
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
	@RequiresPermissions("activity:delete")
	@RequestMapping(value="delete")
	public Map<String, Object> delete(@RequestParam(required=true) String ids){
		
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "删除成功");
		
		try {
			int result = activityService.deleteByIds(ids);
			if(result == 0){
				setRtnCodeAndMsgByFailure(rtnMap, "删除失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
			setRtnCodeAndMsgByException(rtnMap, null);
		}
		return rtnMap;
	}
}
