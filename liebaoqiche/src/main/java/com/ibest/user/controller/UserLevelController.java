package com.ibest.user.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ibest.framework.common.enums.EnumsRtnMapResult;
import com.ibest.framework.common.persistence.BaseController;
import com.ibest.framework.common.utils.PageList;
import com.ibest.user.dto.input.UserLevelInputDTO;
import com.ibest.user.entity.UserLevel;
import com.ibest.user.service.UserLevelService;

@Controller
@RequestMapping(value="${adminPath}/user/userLevel")
public class UserLevelController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserLevelController.class);
	
	@Autowired
	private UserLevelService userLevelService;
	
	/**
	* 进入到列表页
	*/
	@RequestMapping(value="/")
	public String index(){
		return "module/user/userLevel/userLevelList";
	}
	
	/**
	* 进入到表单页-创建
	*/
	@RequestMapping(value="/add")
	public String add(){
		
		return "module/user/userLevel/userLevelForm";
	}
	
	/**
	* 进入到表单页，编辑
	*/
	@RequestMapping(value="/edit")
	public String edit(@RequestParam String id, Model model){
		try {
			if(StringUtils.isNotEmpty(id)){
				UserLevel userLevel = userLevelService.findById(id);
				if(userLevel != null){
					model.addAttribute("userLevel", userLevel);
				}else{
					setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "您查看的信息不存在！", model);
				}
			}else{
				setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "请选择需要编辑的信息！", model);
			}
		} catch (Exception e) {
			setRtnCodeAndMsg(EnumsRtnMapResult.EXCEPTION.getCode(), EnumsRtnMapResult.EXCEPTION.getMsg(), model);
		}
		return "module/user/userLevel/userLevelForm";
	}
	
	/**
	* 进入到详情页
	*/
	@RequestMapping(value="/view")
	public String view(@RequestParam String id, Model model){
		try {
			if(StringUtils.isNotEmpty(id)){
				UserLevel userLevel = userLevelService.findById(id);
				if(userLevel != null){
					model.addAttribute("userLevel", userLevel);
				}else{
					setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "您查看的信息不存在！", model);
				}
			}else{
				setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "请选择需要查看的信息！", model);
			}
		} catch (Exception e) {
			setRtnCodeAndMsg(EnumsRtnMapResult.EXCEPTION.getCode(), EnumsRtnMapResult.EXCEPTION.getMsg(), model);
		}
		return "module/user/userLevel/userLevelDetail";
	}
	
	/**
	 *
	 */
	@ResponseBody
	@RequestMapping(value="/levels")
	public List<UserLevel> levels(UserLevelInputDTO inputDTO, HttpServletRequest request) throws Exception{
		return userLevelService.findAllLevel(inputDTO);
	}

	/**
	* 异步分页查询
	*/
	@ResponseBody
	@RequiresPermissions("userLevel:query")
	@RequestMapping(value="/list")
	public PageList<UserLevel> list(UserLevelInputDTO userLevel, HttpServletRequest request){
		
		PageList<UserLevel> pageList = new PageList<UserLevel>();
		
		try {
			//设置分页参数
			super.setPage(request, pageList);
		
			pageList = userLevelService.findByPage(pageList, userLevel);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pageList;
	}
	
	/**
	* 异步表单提交
	 * @throws Exception 
	*/
	@ResponseBody
	@RequiresPermissions("userLevel:create")
	@RequestMapping(value="create")
	public Map<String, Object> insert(UserLevel userLevel) throws Exception{

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		
		UserLevelInputDTO inputDto = new UserLevelInputDTO();
		List<UserLevel> levels = userLevelService.findByObject(inputDto);
		for (UserLevel level : levels) {
			if(level.getLevel().equals(userLevel.getLevel())) {
				setRtnCodeAndMsgByFailure(rtnMap, "保存失败,用户等级已存在");
				return rtnMap;
			}
			if(level.getLevelName().equals(userLevel.getLevelName())) {
				setRtnCodeAndMsgByFailure(rtnMap, "保存失败,用户等级名称已存在");
				return rtnMap;
			}
		}
		try {
			userLevel.setId(RandomUtils.RandomUUID());
			userLevel.setIsDelete(ConstantUtils.UPDATE_SET_ZERO);
			userLevel.setCreateUserName(UserUtils.getCurrentUser().getRealname());
			userLevel.setCreateTime(new Date());
			userLevel.setModifyUserName(UserUtils.getCurrentUser().getRealname());
			userLevel.setModifyTime(new Date());
			int result = userLevelService.insert(userLevel);
			setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");
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
	@RequiresPermissions("userLevel:update")
	@RequestMapping(value="update")
	public Map<String, Object> update(UserLevel userLevel){

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");
		
		try {
			int result = userLevelService.update(userLevel);
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
	@RequiresPermissions("userLevel:delete")
	@RequestMapping(value="delete")
	public Map<String, Object> delete(@RequestParam(required=true) String ids){
		
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "删除成功");
		
		try {
			int result = userLevelService.deleteByIds(ids);
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
	@RequestMapping(value="/userLevels")
	public List<UserLevel> userLevels(UserLevelInputDTO inputDTO) throws Exception{
		return userLevelService.findByObject(inputDTO);
	}

	/**
	 * 检测认证等级唯一性
	 * @param inputDTO
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="checkLevel")
	public String checkLevel(UserLevelInputDTO inputDTO) {
		boolean isSame=true;

		int userCount = userLevelService.countLevelObject(inputDTO);

		if (userCount == 1) {
			isSame = false;
		}
		return isSame+"";
	}

	/**
	 * 检测认证等级名称唯一性
	 * @param inputDTO
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="checkLevelName")
	public String checkLevelName(UserLevelInputDTO inputDTO) {
		boolean isSame=true;

		int userCount = userLevelService.countLevelNameObject(inputDTO);

		if (userCount == 1) {
			isSame = false;
		}
		return isSame+"";
	}

}
