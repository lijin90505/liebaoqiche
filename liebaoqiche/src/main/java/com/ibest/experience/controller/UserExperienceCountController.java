package com.ibest.experience.controller;

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
import com.ibest.experience.dto.input.UserExperienceCountInputDTO;
import com.ibest.experience.entity.UserExperienceCount;
import com.ibest.experience.service.UserExperienceCountService;

@Controller
@RequestMapping(value="${adminPath}/experience/userExperienceCount")
public class UserExperienceCountController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserExperienceCountController.class);
	
	@Autowired
	private UserExperienceCountService userExperienceCountService;
	
	/**
	* 进入到列表页
	*/
	@RequestMapping(value="/")
	public String index(){
		return "module/experience/userExperienceCount/userExperienceCountList";
	}
	
	/**
	* 进入到表单页-创建
	*/
	@RequestMapping(value="/add")
	public String add(){
		
		return "module/experience/userExperienceCount/userExperienceCountForm";
	}
	
	/**
	* 进入到表单页，编辑
	*/
	@RequestMapping(value="/edit")
	public String edit(@RequestParam String id, Model model){
		try {
			if(StringUtils.isNotEmpty(id)){
				UserExperienceCount userExperienceCount = userExperienceCountService.findById(id);
				if(userExperienceCount != null){
					model.addAttribute("userExperienceCount", userExperienceCount);
				}else{
					setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "您查看的信息不存在！", model);
				}
			}else{
				setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "请选择需要编辑的信息！", model);
			}
		} catch (Exception e) {
			setRtnCodeAndMsg(EnumsRtnMapResult.EXCEPTION.getCode(), EnumsRtnMapResult.EXCEPTION.getMsg(), model);
		}
		return "module/experience/userExperienceCount/userExperienceCountForm";
	}
	
	/**
	* 进入到详情页
	*/
	@RequestMapping(value="/view")
	public String view(@RequestParam String id, Model model){
		try {
			if(StringUtils.isNotEmpty(id)){
				UserExperienceCount userExperienceCount = userExperienceCountService.findById(id);
				if(userExperienceCount != null){
					model.addAttribute("userExperienceCount", userExperienceCount);
				}else{
					setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "您查看的信息不存在！", model);
				}
			}else{
				setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "请选择需要查看的信息！", model);
			}
		} catch (Exception e) {
			setRtnCodeAndMsg(EnumsRtnMapResult.EXCEPTION.getCode(), EnumsRtnMapResult.EXCEPTION.getMsg(), model);
		}
		return "module/experience/userExperienceCount/userExperienceCountDetail";
	}

	/**
	* 异步分页查询
	*/
	@ResponseBody
	@RequiresPermissions("userExperienceCount:query")
	@RequestMapping(value="/list")
	public PageList<UserExperienceCount> list(UserExperienceCountInputDTO userExperienceCount, HttpServletRequest request){
		
		PageList<UserExperienceCount> pageList = new PageList<UserExperienceCount>();
		
		try {
			//设置分页参数
			super.setPage(request, pageList);
		
			pageList = userExperienceCountService.findByPage(pageList, userExperienceCount);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pageList;
	}
	
	/**
	* 异步表单提交
	*/
	@ResponseBody
	@RequiresPermissions("userExperienceCount:create")
	@RequestMapping(value="create")
	public Map<String, Object> insert(UserExperienceCount userExperienceCount){

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");
		
		try {
			userExperienceCount.setId(RandomUtils.RandomUUID());
			userExperienceCount.setCreater(UserUtils.getCurrentUser().getRealname());
			userExperienceCount.setCreateTime(new Date());
			userExperienceCount.setModifier(UserUtils.getCurrentUser().getRealname());
			userExperienceCount.setModifyTime(new Date());
			int result = userExperienceCountService.insert(userExperienceCount);
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
	@RequiresPermissions("userExperienceCount:update")
	@RequestMapping(value="update")
	public Map<String, Object> update(UserExperienceCount userExperienceCount){

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");
		
		try {
			SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd");
			userExperienceCount.setModifier(UserUtils.getCurrentUser().getRealname());
			userExperienceCount.setModifyTime(dateFormat.parse(dateFormat.format(new Date())));
			int result = userExperienceCountService.update(userExperienceCount);
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
	@RequiresPermissions("userExperienceCount:delete")
	@RequestMapping(value="delete")
	public Map<String, Object> delete(@RequestParam(required=true) String ids){
		
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "删除成功");
		
		try {
			int result = userExperienceCountService.deleteByIds(ids);
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
