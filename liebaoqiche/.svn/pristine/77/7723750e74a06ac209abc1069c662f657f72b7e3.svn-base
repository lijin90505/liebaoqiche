package com.ibest.integral.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.ibest.integral.dto.input.PointTypeInputDTO;
import com.ibest.integral.entity.PointType;
import com.ibest.integral.enums.EnumsPointRule;
import com.ibest.integral.service.PointTypeService;
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
import com.ibest.integral.dto.input.PointRuleInputDTO;
import com.ibest.integral.entity.PointRule;
import com.ibest.integral.service.PointRuleService;
import com.ibest.utils.ConstantUtils;
import com.ibest.utils.RandomUtils;

@Controller
@RequestMapping(value="${adminPath}/integral/pointRule")
public class PointRuleController extends BaseController {

	private static final Logger logger = LoggerFactory.getLogger(PointRuleController.class);

	@Autowired
	private PointRuleService pointRuleService;

	@Autowired
	private PointTypeService pointTypeService;

	/**
	* 进入到列表页
	*/
	@RequestMapping(value="/")
	public String index(){
		return "module/integral/pointRule/pointRuleList";
	}

	/**
	* 进入到表单页-创建
	*/
	@RequestMapping(value="/add")
	public String add(){

		return "module/integral/pointRule/pointRuleForm";
	}

	/**
	* 进入到表单页，编辑
	*/
	@RequestMapping(value="/edit")
	public String edit(@RequestParam String id, Model model){
		try {
			if(StringUtils.isNotEmpty(id)){
				PointRule pointRule = pointRuleService.findById(id);
				if(pointRule != null){
					model.addAttribute("pointRule", pointRule);
				}else{
					setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "您查看的信息不存在！", model);
				}
			}else{
				setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "请选择需要编辑的信息！", model);
			}
		} catch (Exception e) {
			setRtnCodeAndMsg(EnumsRtnMapResult.EXCEPTION.getCode(), EnumsRtnMapResult.EXCEPTION.getMsg(), model);
		}
		return "module/integral/pointRule/pointRuleForm";
	}

	/**
	* 进入到详情页
	*/
	@RequestMapping(value="/view")
	public String view(@RequestParam String id, Model model){
		try {
			if(StringUtils.isNotEmpty(id)){
				PointRule pointRule = pointRuleService.findById(id);
				if(pointRule != null){
					model.addAttribute("pointRule", pointRule);
				}else{
					setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "您查看的信息不存在！", model);
				}
			}else{
				setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "请选择需要查看的信息！", model);
			}
		} catch (Exception e) {
			setRtnCodeAndMsg(EnumsRtnMapResult.EXCEPTION.getCode(), EnumsRtnMapResult.EXCEPTION.getMsg(), model);
		}
		return "module/integral/pointRule/pointRuleDetail";
	}

	/**
	* 异步分页查询
	*/
	@ResponseBody
	@RequiresPermissions("pointRule:query")
	@RequestMapping(value="/list")
	public PageList<PointRule> list(PointRuleInputDTO pointRule, HttpServletRequest request){

		PageList<PointRule> pageList = new PageList<PointRule>();

		try {
			//设置分页参数
			super.setPage(request, pageList);

			pageList = pointRuleService.findByPage(pageList, pointRule);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pageList;
	}

	/**
	 * 异步分页查询
	 */
	@ResponseBody
//	@RequiresPermissions("pointRule:query")
	@RequestMapping(value="/pointRules")
	public List<PointRule> pointRules(PointRuleInputDTO pointRule) throws Exception{
		return pointRuleService.findByObject(pointRule);
	}

	/**
	* 异步表单提交
	*/
	@ResponseBody
	@RequiresPermissions("pointRule:create")
	@RequestMapping(value="create")
	public Map<String, Object> insert(PointRule pointRule){

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");

		try {
			pointRule.setIsDelete(ConstantUtils.UPDATE_SET_ZERO);
			pointRule.setId(RandomUtils.RandomUUID());
			PointType type = pointTypeService.findById(pointRule.getPointTypeId());
			pointRule.setPointTypeName(type.getPointTypeName());
			int result = pointRuleService.insert(pointRule);
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
	@RequiresPermissions("pointRule:update")
	@RequestMapping(value="update")
	public Map<String, Object> update(PointRule pointRule){

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");

		try {
			PointType type = pointTypeService.findById(pointRule.getPointTypeId());
			pointRule.setPointTypeName(type.getPointTypeName());
			int result = pointRuleService.update(pointRule);
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
	@RequiresPermissions("pointRule:delete")
	@RequestMapping(value="delete")
	public Map<String, Object> delete(@RequestParam(required=true) String ids){

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "删除成功");

		try {
			int result = pointRuleService.deleteByIds(ids);
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
