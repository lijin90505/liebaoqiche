package com.ibest.integral.controller;

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
import com.ibest.integral.dto.input.UserPointStatementInputDTO;
import com.ibest.integral.entity.UserPointStatement;
import com.ibest.integral.service.UserPointStatementService;
import com.ibest.utils.ConstantUtils;
import com.ibest.utils.RandomUtils;

@Controller
@RequestMapping(value="${adminPath}/integral/userPointStatement")
public class UserPointStatementController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserPointStatementController.class);
	
	@Autowired
	private UserPointStatementService userPointStatementService;
	
	/**
	* 进入到列表页
	*/
	@RequestMapping(value="/")
	public String index(){
		return "module/integral/userPointStatement/userPointStatementList";
	}
	
	/**
	* 进入到表单页-创建
	*/
	@RequestMapping(value="/add")
	public String add(){
		
		return "module/integral/userPointStatement/userPointStatementForm";
	}
	
	/**
	* 进入到表单页，编辑
	*/
	@RequestMapping(value="/edit")
	public String edit(@RequestParam String id, Model model){
		try {
			if(StringUtils.isNotEmpty(id)){
				UserPointStatement userPointStatement = userPointStatementService.findById(id);
				if(userPointStatement != null){
					model.addAttribute("userPointStatement", userPointStatement);
				}else{
					setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "您查看的信息不存在！", model);
				}
			}else{
				setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "请选择需要编辑的信息！", model);
			}
		} catch (Exception e) {
			setRtnCodeAndMsg(EnumsRtnMapResult.EXCEPTION.getCode(), EnumsRtnMapResult.EXCEPTION.getMsg(), model);
		}
		return "module/integral/userPointStatement/userPointStatementForm";
	}
	
	/**
	* 进入到详情页
	*/
	@RequestMapping(value="/view")
	public String view(@RequestParam String id, Model model){
		try {
			if(StringUtils.isNotEmpty(id)){
				UserPointStatement userPointStatement = userPointStatementService.findById(id);
				if(userPointStatement != null){
					model.addAttribute("userPointStatement", userPointStatement);
				}else{
					setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "您查看的信息不存在！", model);
				}
			}else{
				setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "请选择需要查看的信息！", model);
			}
		} catch (Exception e) {
			setRtnCodeAndMsg(EnumsRtnMapResult.EXCEPTION.getCode(), EnumsRtnMapResult.EXCEPTION.getMsg(), model);
		}
		return "module/integral/userPointStatement/userPointStatementDetail";
	}

	/**
	* 异步分页查询
	*/
	@ResponseBody
	@RequiresPermissions("userPointStatement:query")
	@RequestMapping(value="/list")
	public PageList<UserPointStatement> list(UserPointStatementInputDTO userPointStatement, HttpServletRequest request){
		
		PageList<UserPointStatement> pageList = new PageList<UserPointStatement>();
		
		try {
			//设置分页参数
			super.setPage(request, pageList);
		
			pageList = userPointStatementService.findByPage(pageList, userPointStatement);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pageList;
	}
	
	/**
	* 异步表单提交
	*/
	@ResponseBody
	@RequiresPermissions("userPointStatement:create")
	@RequestMapping(value="create")
	public Map<String, Object> insert(UserPointStatement userPointStatement){

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");
		
		try {
			userPointStatement.setIsDelete(ConstantUtils.UPDATE_SET_ZERO);
			userPointStatement.setId(RandomUtils.RandomUUID());
			int result = userPointStatementService.insert(userPointStatement);
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
	@RequiresPermissions("userPointStatement:update")
	@RequestMapping(value="update")
	public Map<String, Object> update(UserPointStatement userPointStatement){

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");
		
		try {
			int result = userPointStatementService.update(userPointStatement);
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
	@RequiresPermissions("userPointStatement:delete")
	@RequestMapping(value="delete")
	public Map<String, Object> delete(@RequestParam(required=true) String ids){
		
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "删除成功");
		
		try {
			int result = userPointStatementService.deleteByIds(ids);
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
