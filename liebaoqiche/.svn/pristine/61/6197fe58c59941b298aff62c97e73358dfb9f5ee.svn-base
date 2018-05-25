package com.ibest.accesssystem.controller;

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
import com.ibest.accesssystem.dto.input.PointPermissionAssignmentInputDTO;
import com.ibest.accesssystem.entity.PointPermissionAssignment;
import com.ibest.accesssystem.service.PointPermissionAssignmentService;

@Controller
@RequestMapping(value="${adminPath}/accesssystem/pointPermissionAssignment")
public class PointPermissionAssignmentController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(PointPermissionAssignmentController.class);
	
	@Autowired
	private PointPermissionAssignmentService pointPermissionAssignmentService;
	
	/**
	* 进入到列表页
	*/
	@RequestMapping(value="/")
	public String index(){
		return "module/accesssystem/pointPermissionAssignment/pointPermissionAssignmentList";
	}
	
	/**
	* 进入到表单页-创建
	*/
	@RequestMapping(value="/add")
	public String add(){
		
		return "module/accesssystem/pointPermissionAssignment/pointPermissionAssignmentForm";
	}

	/**
	 * 进入到表单页-创建
	 */
	@RequestMapping(value="/permission")
	public String permission(@RequestParam String id, Model model) {
		model.addAttribute("systemSign", id);
		return "module/accesssystem/pointPermissionAssignment/pointPermissionAssignmentForm";
	}
	
	/**
	* 进入到表单页，编辑
	*/
	@RequestMapping(value="/edit")
	public String edit(@RequestParam String id, Model model){
		try {
			if(StringUtils.isNotEmpty(id)){
				PointPermissionAssignment pointPermissionAssignment = pointPermissionAssignmentService.findById(id);
				if(pointPermissionAssignment != null){
					model.addAttribute("pointPermissionAssignment", pointPermissionAssignment);
				}else{
					setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "您查看的信息不存在！", model);
				}
			}else{
				setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "请选择需要编辑的信息！", model);
			}
		} catch (Exception e) {
			setRtnCodeAndMsg(EnumsRtnMapResult.EXCEPTION.getCode(), EnumsRtnMapResult.EXCEPTION.getMsg(), model);
		}
		return "module/accesssystem/pointPermissionAssignment/pointPermissionAssignmentForm";
	}
	
	/**
	* 进入到详情页
	*/
	@RequestMapping(value="/view")
	public String view(@RequestParam String id, Model model){
		try {
			if(StringUtils.isNotEmpty(id)){
				PointPermissionAssignment pointPermissionAssignment = pointPermissionAssignmentService.findById(id);
				if(pointPermissionAssignment != null){
					model.addAttribute("pointPermissionAssignment", pointPermissionAssignment);
				}else{
					setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "您查看的信息不存在！", model);
				}
			}else{
				setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "请选择需要查看的信息！", model);
			}
		} catch (Exception e) {
			setRtnCodeAndMsg(EnumsRtnMapResult.EXCEPTION.getCode(), EnumsRtnMapResult.EXCEPTION.getMsg(), model);
		}
		return "module/accesssystem/pointPermissionAssignment/pointPermissionAssignmentDetail";
	}

	/**
	* 异步分页查询
	*/
	@ResponseBody
	@RequiresPermissions("pointPermissionAssignment:query")
	@RequestMapping(value="/list")
	public PageList<PointPermissionAssignment> list(PointPermissionAssignmentInputDTO pointPermissionAssignment, HttpServletRequest request){
		
		PageList<PointPermissionAssignment> pageList = new PageList<PointPermissionAssignment>();
		
		try {
			//设置分页参数
			super.setPage(request, pageList);
		
			pageList = pointPermissionAssignmentService.findByPage(pageList, pointPermissionAssignment);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pageList;
	}
	
	/**
	* 异步表单提交
	*/
	@ResponseBody
	@RequiresPermissions("pointPermissionAssignment:create")
	@RequestMapping(value="create")
	public Map<String, Object> insert(PointPermissionAssignment pointPermissionAssignment){

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");
		
		try {
			int result = pointPermissionAssignmentService.insert(pointPermissionAssignment);
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
	@RequiresPermissions("pointPermissionAssignment:update")
	@RequestMapping(value="update")
	public Map<String, Object> update(PointPermissionAssignment pointPermissionAssignment){

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");
		
		try {
			int result = pointPermissionAssignmentService.update(pointPermissionAssignment);
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
	@RequiresPermissions("pointPermissionAssignment:delete")
	@RequestMapping(value="delete")
	public Map<String, Object> delete(@RequestParam(required=true) String ids){
		
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "删除成功");
		
		try {
			int result = pointPermissionAssignmentService.deleteByIds(ids);
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
