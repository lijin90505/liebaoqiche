package com.ibest.accesssystem.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.ibest.framework.common.utils.UserUtils;
import com.ibest.utils.ConstantUtils;
import com.ibest.utils.RandomUtils;
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
import com.ibest.accesssystem.dto.input.SystemActivityInputDTO;
import com.ibest.accesssystem.entity.SystemActivity;

import com.ibest.accesssystem.service.SystemActivityService;
import com.ibest.activity.entity.Activity;
import com.ibest.activity.service.ActivityDetailsService;
import com.ibest.activity.service.ActivityService;

@Controller
@RequestMapping(value="${adminPath}/accesssystem/systemActivity")
public class SystemActivityController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(SystemActivityController.class);
	
	@Autowired
	private SystemActivityService systemActivityService;
	
	@Autowired
	private ActivityDetailsService activityDetailsService;
	
	@Autowired
	private ActivityService activityService;
	
	/**
	* 进入到列表页
	*/
	@RequestMapping(value="/")
	public String index(){
		return "module/accesssystem/systemActivity/systemActivityList";
	}
	
	/**
	* 进入到表单页-创建
	*/
	@RequestMapping(value="/add")
	public String add(){
		
		return "module/accesssystem/systemActivity/systemActivityForm";
	}

	/**
	 * 进入到表单页-分配用户
	 */
	@RequestMapping(value="/assigning")
	public String assigning(@RequestParam String id, Model model) throws Exception{
		SystemActivity systemActivity = systemActivityService.findById(id);
		String identification = systemActivity.getAccessSystemId();
		model.addAttribute("id",id);
		model.addAttribute("identification",identification);
		return "module/accesssystem/systemActivity/systemAssigningUser";
	}

	/**
	* 进入到表单页，编辑
	*/
	@RequestMapping(value="/edit")
	public String edit(@RequestParam String id, Model model){
		try {
			if(StringUtils.isNotEmpty(id)){
				SystemActivity systemActivity = systemActivityService.findById(id);
				if(systemActivity != null){
					model.addAttribute("systemActivity", systemActivity);
				}else{
					setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "您查看的信息不存在！", model);
				}
			}else{
				setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "请选择需要编辑的信息！", model);
			}
		} catch (Exception e) {
			setRtnCodeAndMsg(EnumsRtnMapResult.EXCEPTION.getCode(), EnumsRtnMapResult.EXCEPTION.getMsg(), model);
		}
		return "module/accesssystem/systemActivity/systemActivityForm";
	}
	
	@ResponseBody
	@RequestMapping(value="/updateIsOpen")
	public Map<String, Object> updateIsOpen(SystemActivity systemActivity){
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");
		String isOpen = systemActivity.getState();		
		try {
				systemActivity = systemActivityService.findById(systemActivity.getId());
							
				if(StringUtils.isNotBlank(systemActivity.getActivityId())) {
					Activity  activity =activityService.findById(systemActivity.getActivityId());
					
					if(activity != null && StringUtils.isNotBlank(activity.getActivityDetailsId())) {
						boolean past=activityDetailsService.checkActivityPast(activity.getActivityDetailsId());
						if(past) {
							setRtnCodeAndMsgByFailure(rtnMap, "活动已过期，不可变更状态");
							return rtnMap;						
						}					
					}	
				}
				
				systemActivity.setState(isOpen);
				systemActivity.setRelevance("0");
				int result = systemActivityService.update(systemActivity);
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
				SystemActivity systemActivity = systemActivityService.findById(id);
				if(systemActivity != null){
					model.addAttribute("systemActivity", systemActivity);
				}else{
					setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "您查看的信息不存在！", model);
				}
			}else{
				setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "请选择需要查看的信息！", model);
			}
		} catch (Exception e) {
			setRtnCodeAndMsg(EnumsRtnMapResult.EXCEPTION.getCode(), EnumsRtnMapResult.EXCEPTION.getMsg(), model);
		}
		return "module/accesssystem/systemActivity/systemActivityDetail";
	}

	/**
	* 异步分页查询
	*/
	@ResponseBody
	@RequiresPermissions("systemActivity:query")
	@RequestMapping(value="/list")
	public PageList<SystemActivity> list(SystemActivityInputDTO systemActivity, HttpServletRequest request){
		
		PageList<SystemActivity> pageList = new PageList<SystemActivity>();
		
		try {
			//设置分页参数
			super.setPage(request, pageList);
		
			pageList = systemActivityService.findByPage(pageList, systemActivity);
			List<SystemActivity> list=pageList.getRows();
			
			for (SystemActivity systemActivity2 : list) {
				if(StringUtils.isNotBlank(systemActivity2.getActivityId())) {
					Activity  activity =activityService.findById(systemActivity2.getActivityId());
					
					if(activity != null && StringUtils.isNotBlank(activity.getActivityDetailsId())) {
						boolean past=activityDetailsService.checkActivityPast(activity.getActivityDetailsId());
						if(past) {
							systemActivity2.setState("2");
							systemActivity2.setRelevance("0");
							systemActivityService.update(systemActivity2);
						}					
					}	
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
	@RequiresPermissions("systemActivity:create")
	@RequestMapping(value="create")
	public Map<String, Object> insert(SystemActivity systemActivity){

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");
		
		try {
			systemActivity.setIsDelete(ConstantUtils.UPDATE_SET_ZERO);
			systemActivity.setId(RandomUtils.RandomUUID());
			systemActivity.setState(ConstantUtils.UNBEGIN);
			systemActivity.setCreater(UserUtils.getCurrentUser().getRealname());
			systemActivity.setCreateTime(new Date());
			systemActivity.setModifier(UserUtils.getCurrentUser().getRealname());
			systemActivity.setModifyTime(new Date());
			int result = systemActivityService.insert(systemActivity);
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
	@RequiresPermissions("systemActivity:update")
	@RequestMapping(value="update")
	public Map<String, Object> update(SystemActivity systemActivity){

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");
		
		try {
			systemActivity.setModifier(UserUtils.getCurrentUser().getRealname());
			systemActivity.setModifyTime(new Date());
			int result = systemActivityService.update(systemActivity);
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
	@RequiresPermissions("systemActivity:delete")
	@RequestMapping(value="delete")
	public Map<String, Object> delete(@RequestParam(required=true) String ids){
		
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "删除成功");
		
		try {
			int result = systemActivityService.deleteByIds(ids);
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
	 * 异步分页查询
	 */
	@ResponseBody
	@RequestMapping(value="/systemActivitys")
	public List<SystemActivity> systemActivitys(SystemActivityInputDTO inputDTO) throws Exception{
		return systemActivityService.findByObject(inputDTO);
	}
}
