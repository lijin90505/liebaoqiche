package com.ibest.experience.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
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
import com.ibest.activity.entity.Activity;
import com.ibest.activity.service.ActivityService;
import com.ibest.experience.dto.input.ExperienceInputDTO;
import com.ibest.experience.entity.Experience;
import com.ibest.experience.service.ExperienceService;

@Controller
@RequestMapping(value="${adminPath}/experience/experience")
public class ExperienceController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(ExperienceController.class);
	
	@Autowired
	private ExperienceService experienceService;
	
	@Autowired
	private ActivityService activityService;
	
	/**
	* 进入到列表页
	*/
	@RequestMapping(value="/")
	public String index(){
		return "module/experience/experience/experienceList";
	}
	
	/**
	* 进入到表单页-创建
	*/
	@RequestMapping(value="/add")
	public String add(){
		
		return "module/experience/experience/experienceForm";
	}
	
	/**
	* 进入到表单页，编辑
	*/
	@RequestMapping(value="/edit")
	public String edit(@RequestParam String id, Model model){
		try {
			if(StringUtils.isNotEmpty(id)){
				Experience experience = experienceService.findById(id);
				if(experience != null){
					model.addAttribute("experience", experience);
				}else{
					setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "您查看的信息不存在！", model);
				}
			}else{
				setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "请选择需要编辑的信息！", model);
			}
		} catch (Exception e) {
			setRtnCodeAndMsg(EnumsRtnMapResult.EXCEPTION.getCode(), EnumsRtnMapResult.EXCEPTION.getMsg(), model);
		}
		return "module/experience/experience/experienceForm";
	}
	
	/**
	* 进入到详情页
	*/
	@RequestMapping(value="/view")
	public String view(@RequestParam String id, Model model){
		try {
			if(StringUtils.isNotEmpty(id)){
				Experience experience = experienceService.findById(id);
				if(experience != null){
					model.addAttribute("experience", experience);
				}else{
					setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "您查看的信息不存在！", model);
				}
			}else{
				setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "请选择需要查看的信息！", model);
			}
		} catch (Exception e) {
			setRtnCodeAndMsg(EnumsRtnMapResult.EXCEPTION.getCode(), EnumsRtnMapResult.EXCEPTION.getMsg(), model);
		}
		return "module/experience/experience/experienceDetail";
	}

	/**
	* 异步分页查询
	*/
	@ResponseBody
	@RequiresPermissions("experience:query")
	@RequestMapping(value="/list")
	public PageList<Experience> list(ExperienceInputDTO experience, HttpServletRequest request){
		
		PageList<Experience> pageList = new PageList<Experience>();
		
		try {
			//设置分页参数
			super.setPage(request, pageList);
		
			pageList = experienceService.findByPage(pageList, experience);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pageList;
	}
	
	/**
	* 异步表单提交
	*/
	@ResponseBody
	@RequiresPermissions("experience:create")
	@RequestMapping(value="create")
	public Map<String, Object> insert(Experience experience){

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");
		
		try {
			Experience unique = 
					experienceService.checkNameUnique(experience.getName());
			if(unique!=null){
				setRtnCodeAndMsgByFailure(rtnMap, "保存失败,经验值名称已存在!");
			}else{
				experience.setIsDelete(ConstantUtils.UPDATE_SET_ZERO);
				experience.setState("0");
				experience.setId(RandomUtils.RandomUUID());
				experience.setCreater(UserUtils.getCurrentUser().getRealname());
				experience.setCreateTime(new Date());
				experience.setModifier(UserUtils.getCurrentUser().getRealname());
				experience.setModifyTime(new Date());
				int result = experienceService.insert(experience);
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
	@RequiresPermissions("experience:update")
	@RequestMapping(value="updateState")
	public Map<String, Object> updateState(Experience experience){

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");
		
		try{
			String state = experience.getState();
			if(!"0".equals(state)){
				List<Activity> findByExperienceId = activityService.findByExperienceId(experience.getId());
				if(findByExperienceId!=null && findByExperienceId.size()>0){
					setRtnCodeAndMsgByFailure(rtnMap, "操作失败，当前经验值与活动已关联！");
				}else{
					Experience findById = experienceService.findById(experience.getId());
					findById.setState(state);
					int update = experienceService.update(findById);
					if(update == 0){
						setRtnCodeAndMsgByFailure(rtnMap, "修改失败！");
					}
				}
			}
			else{
				Experience findById = experienceService.findById(experience.getId());
				findById.setState(state);
				int update = experienceService.update(findById);
				if(update == 0){
					setRtnCodeAndMsgByFailure(rtnMap, "修改失败！");
				}
			}
		}catch(Exception e){
			e.printStackTrace();
			setRtnCodeAndMsgByException(rtnMap, null);
		}
		return rtnMap;
	}
	
	@ResponseBody
	@RequiresPermissions("experience:update")
	@RequestMapping(value="update")
	public Map<String, Object> update(Experience experience){

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");
		
		try {
			String oldName =
					experienceService.findById(experience.getId()).getName();
			if(!oldName.equals(experience.getName())){
				Experience unique = 
						experienceService.checkNameUnique(experience.getName());
				if(unique!=null){
					setRtnCodeAndMsgByFailure(rtnMap, "保存失败,经验值名称已存在!");
				}else{
					experience.setModifier(UserUtils.getCurrentUser().getRealname());
					experience.setModifyTime(new Date());
					experience.setState("1");
					int result = experienceService.update(experience);
					if(result == 0){
						setRtnCodeAndMsgByFailure(rtnMap, "保存失败");
					}
				}
			}else{
				experience.setModifier(UserUtils.getCurrentUser().getRealname());
				experience.setModifyTime(new Date());
				experience.setState("1");
				int result = experienceService.update(experience);
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
	@RequiresPermissions("experience:delete")
	@RequestMapping(value="delete")
	public Map<String, Object> delete(@RequestParam(required=true) String ids){
		
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "删除成功");
		
		try {
			int result = experienceService.deleteByIds(ids);
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
	@RequestMapping(value="/experiences")
	public List<Experience> experiences(ExperienceInputDTO inputDTO) throws Exception{
		return experienceService.findByObject(inputDTO);
	}
}
