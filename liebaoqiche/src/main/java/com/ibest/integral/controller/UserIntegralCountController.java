package com.ibest.integral.controller;

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
import com.ibest.integral.dto.input.UserIntegralCountInputDTO;
import com.ibest.integral.entity.UserIntegralCount;
import com.ibest.integral.service.UserIntegralCountService;
import com.ibest.utils.ConstantUtils;
import com.ibest.utils.RandomUtils;

@Controller
@RequestMapping(value="${adminPath}/integral/userIntegralCount")
public class UserIntegralCountController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserIntegralCountController.class);
	
	@Autowired
	private UserIntegralCountService userIntegralCountService;
	
	/**
	* 进入到列表页
	*/
	@RequestMapping(value="/")
	public String index(){
		return "module/integral/userIntegralCount/userIntegralCountList";
	}
	
	/**
	* 进入到表单页-创建
	*/
	@RequestMapping(value="/add")
	public String add(){
		
		return "module/integral/userIntegralCount/userIntegralCountForm";
	}
	
	/**
	* 进入到表单页，编辑
	*/
	@RequestMapping(value="/edit")
	public String edit(@RequestParam String id, Model model){
		try {
			if(StringUtils.isNotEmpty(id)){
				UserIntegralCount userIntegralCount = userIntegralCountService.findById(id);
				if(userIntegralCount != null){
					model.addAttribute("userIntegralCount", userIntegralCount);
				}else{
					setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "您查看的信息不存在！", model);
				}
			}else{
				setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "请选择需要编辑的信息！", model);
			}
		} catch (Exception e) {
			setRtnCodeAndMsg(EnumsRtnMapResult.EXCEPTION.getCode(), EnumsRtnMapResult.EXCEPTION.getMsg(), model);
		}
		return "module/integral/userIntegralCount/userIntegralCountForm";
	}
	
	/**
	* 进入到详情页
	*/
	@RequestMapping(value="/view")
	public String view(@RequestParam String id, Model model){
		try {
			if(StringUtils.isNotEmpty(id)){
				UserIntegralCount userIntegralCount = userIntegralCountService.findById(id);
				if(userIntegralCount != null){
					model.addAttribute("userIntegralCount", userIntegralCount);
				}else{
					setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "您查看的信息不存在！", model);
				}
			}else{
				setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "请选择需要查看的信息！", model);
			}
		} catch (Exception e) {
			setRtnCodeAndMsg(EnumsRtnMapResult.EXCEPTION.getCode(), EnumsRtnMapResult.EXCEPTION.getMsg(), model);
		}
		return "module/integral/userIntegralCount/userIntegralCountDetail";
	}

	/**
	* 异步分页查询
	*/
	@ResponseBody
	@RequiresPermissions("userIntegralCount:query")
	@RequestMapping(value="/list")
	public PageList<UserIntegralCount> list(UserIntegralCountInputDTO userIntegralCount, HttpServletRequest request){
		
		PageList<UserIntegralCount> pageList = new PageList<UserIntegralCount>();
		
		try {
			//设置分页参数
			super.setPage(request, pageList);
		
			pageList = userIntegralCountService.findByPage(pageList, userIntegralCount);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pageList;
	}
	
	/**
	* 异步表单提交
	*/
	@ResponseBody
	@RequiresPermissions("userIntegralCount:create")
	@RequestMapping(value="create")
	public Map<String, Object> insert(UserIntegralCount userIntegralCount){

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");
		
		try {
			userIntegralCount.setId(RandomUtils.RandomUUID());
			userIntegralCount.setCreater(UserUtils.getCurrentUser().getRealname());
			userIntegralCount.setCreateTime(new Date());
			userIntegralCount.setModifier(UserUtils.getCurrentUser().getRealname());
			userIntegralCount.setModifyTime(new Date());
			int result = userIntegralCountService.insert(userIntegralCount);
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
	@RequiresPermissions("userIntegralCount:update")
	@RequestMapping(value="update")
	public Map<String, Object> update(UserIntegralCount userIntegralCount){

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");
		
		try {
			userIntegralCount.setModifier(UserUtils.getCurrentUser().getRealname());
			userIntegralCount.setModifyTime(new Date());
			int result = userIntegralCountService.update(userIntegralCount);
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
	@RequiresPermissions("userIntegralCount:delete")
	@RequestMapping(value="delete")
	public Map<String, Object> delete(@RequestParam(required=true) String ids){
		
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "删除成功");
		
		try {
			int result = userIntegralCountService.deleteByIds(ids);
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
