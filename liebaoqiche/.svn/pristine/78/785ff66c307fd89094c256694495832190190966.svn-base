package com.ibest.activity.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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

import com.ibest.framework.common.enums.EnumsRtnMapResult;
import com.ibest.framework.common.persistence.BaseController;
import com.ibest.framework.common.utils.PageList;
import com.ibest.framework.common.utils.UserUtils;
import com.ibest.utils.ConstantUtils;
import com.ibest.utils.RandomUtils;
import com.ibest.activity.dto.input.UserActivityInputDTO;
import com.ibest.activity.entity.UserActivity;
import com.ibest.activity.service.UserActivityService;

@Controller
@RequestMapping(value="${adminPath}/activity/userActivity")
public class UserActivityController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserActivityController.class);
	
	@Autowired
	private UserActivityService userActivityService;
	
	/**
	* 进入到列表页
	*/
	@RequestMapping(value="/")
	public String index(){
		return "module/activity/userActivity/userActivityList";
	}
	
	/**
	* 进入到表单页-创建
	*/
	@RequestMapping(value="/add")
	public String add(){
		
		return "module/activity/userActivity/userActivityForm";
	}
	
	/**
	* 进入到表单页，编辑
	*/
	@RequestMapping(value="/edit")
	public String edit(@RequestParam String id, Model model){
		try {
			if(StringUtils.isNotEmpty(id)){
				UserActivity userActivity = userActivityService.findById(id);
				if(userActivity != null){
					model.addAttribute("userActivity", userActivity);
				}else{
					setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "您查看的信息不存在！", model);
				}
			}else{
				setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "请选择需要编辑的信息！", model);
			}
		} catch (Exception e) {
			setRtnCodeAndMsg(EnumsRtnMapResult.EXCEPTION.getCode(), EnumsRtnMapResult.EXCEPTION.getMsg(), model);
		}
		return "module/activity/userActivity/userActivityForm";
	}
	
	/**
	* 进入到详情页
	*/
	@RequestMapping(value="/view")
	public String view(@RequestParam String id, Model model){
		try {
			if(StringUtils.isNotEmpty(id)){
				UserActivity userActivity = userActivityService.findById(id);
				if(userActivity != null){
					model.addAttribute("userActivity", userActivity);
				}else{
					setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "您查看的信息不存在！", model);
				}
			}else{
				setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "请选择需要查看的信息！", model);
			}
		} catch (Exception e) {
			setRtnCodeAndMsg(EnumsRtnMapResult.EXCEPTION.getCode(), EnumsRtnMapResult.EXCEPTION.getMsg(), model);
		}
		return "module/activity/userActivity/userActivityDetail";
	}

	/**
	* 异步分页查询
	*/
	@ResponseBody
	@RequiresPermissions("userActivity:query")
	@RequestMapping(value="/list")
	public PageList<UserActivity> list(UserActivityInputDTO userActivity, HttpServletRequest request){
		
		PageList<UserActivity> pageList = new PageList<UserActivity>();
		
		try {
			//设置分页参数
			super.setPage(request, pageList);
		
			pageList = userActivityService.findByPage(pageList, userActivity);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pageList;
	}
	
	/**
	* 异步表单提交
	*/
	@ResponseBody
	@RequiresPermissions("userActivity:create")
	@RequestMapping(value="create")
	public Map<String, Object> insert(UserActivity userActivity){

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");
		
		try {
			userActivity.setId(RandomUtils.RandomUUID());
			userActivity.setCreater(UserUtils.getCurrentUser().getRealname());
			userActivity.setCreateTime(new Date());
			userActivity.setModifier(UserUtils.getCurrentUser().getRealname());
			userActivity.setModifyTime(new Date());
			int result = userActivityService.insert(userActivity);
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
	@RequiresPermissions("userActivity:update")
	@RequestMapping(value="update")
	public Map<String, Object> update(UserActivity userActivity){

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");
		
		try {
			userActivity.setModifier(UserUtils.getCurrentUser().getRealname());
			userActivity.setModifyTime(new Date());
			int result = userActivityService.update(userActivity);
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
	@RequiresPermissions("userActivity:delete")
	@RequestMapping(value="delete")
	public Map<String, Object> delete(@RequestParam(required=true) String ids){
		
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "删除成功");
		
		try {
			int result = userActivityService.deleteByIds(ids);
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
