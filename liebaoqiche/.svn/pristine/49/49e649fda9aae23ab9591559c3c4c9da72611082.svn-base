package com.ibest.integral.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.ibest.integral.enums.EnumsPointType;
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
import com.ibest.integral.dto.input.PointTypeInputDTO;
import com.ibest.integral.entity.PointType;
import com.ibest.integral.service.PointTypeService;
import com.ibest.utils.ConstantUtils;
import com.ibest.utils.RandomUtils;

@Controller
@RequestMapping(value="${adminPath}/integral/pointType")
public class PointTypeController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(PointTypeController.class);
	
	@Autowired
	private PointTypeService pointTypeService;
	
	/**
	* 进入到列表页
	*/
	@RequestMapping(value="/")
	public String index(){
		return "module/integral/pointType/pointTypeList";
	}
	
	/**
	* 进入到表单页-创建
	*/
	@RequestMapping(value="/add")
	public String add(){
		
		return "module/integral/pointType/pointTypeForm";
	}
	
	/**
	* 进入到表单页，编辑
	*/
	@RequestMapping(value="/edit")
	public String edit(@RequestParam String id, Model model){
		try {
			if(StringUtils.isNotEmpty(id)){
				PointType pointType = pointTypeService.findById(id);
				if(pointType != null){
					model.addAttribute("pointType", pointType);
				}else{
					setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "您查看的信息不存在！", model);
				}
			}else{
				setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "请选择需要编辑的信息！", model);
			}
		} catch (Exception e) {
			setRtnCodeAndMsg(EnumsRtnMapResult.EXCEPTION.getCode(), EnumsRtnMapResult.EXCEPTION.getMsg(), model);
		}
		return "module/integral/pointType/pointTypeForm";
	}

	/**
	* 进入到详情页
	*/
	@RequestMapping(value="/view")
	public String view(@RequestParam String id, Model model){
		try {
			if(StringUtils.isNotEmpty(id)){
				PointType pointType = pointTypeService.findById(id);
				if(pointType != null){
					model.addAttribute("pointType", pointType);
				}else{
					setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "您查看的信息不存在！", model);
				}
			}else{
				setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "请选择需要查看的信息！", model);
			}
		} catch (Exception e) {
			setRtnCodeAndMsg(EnumsRtnMapResult.EXCEPTION.getCode(), EnumsRtnMapResult.EXCEPTION.getMsg(), model);
		}
		return "module/integral/pointType/pointTypeDetail";
	}

	/**
	* 异步分页查询
	*/
	@ResponseBody
	@RequiresPermissions("pointType:query")
	@RequestMapping(value="/list")
	public PageList<PointType> list(PointTypeInputDTO pointType, HttpServletRequest request){
		
		PageList<PointType> pageList = new PageList<PointType>();
		
		try {
			//设置分页参数
			super.setPage(request, pageList);
		
			pageList = pointTypeService.findByPage(pageList, pointType);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pageList;
	}

	/**
	 * 异步分页查询
	 */
	@ResponseBody
//	@RequiresPermissions("pointType:query")
	@RequestMapping(value="/types")
	public List<PointType> types(PointTypeInputDTO pointType, HttpServletRequest request) throws Exception{
		return pointTypeService.findByObject(pointType);
	}
	
	/**
	* 异步表单提交
	*/
	@ResponseBody
	@RequiresPermissions("pointType:create")
	@RequestMapping(value="create")
	public Map<String, Object> insert(PointType pointType){

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");
		
		try {
			pointType.setPointTypeId(EnumsPointType.getValue(pointType.getPointTypeName()));
			pointType.setIsDelete(ConstantUtils.UPDATE_SET_ZERO);
			pointType.setId(RandomUtils.RandomUUID());
			int result = pointTypeService.insert(pointType);
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
	@RequiresPermissions("pointType:update")
	@RequestMapping(value="update")
	public Map<String, Object> update(PointType pointType){

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");
		
		try {
			int result = pointTypeService.update(pointType);
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
	@RequiresPermissions("pointType:delete")
	@RequestMapping(value="delete")
	public Map<String, Object> delete(@RequestParam(required=true) String ids){
		
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "删除成功");
		
		try {
			int result = pointTypeService.deleteByIds(ids);
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
