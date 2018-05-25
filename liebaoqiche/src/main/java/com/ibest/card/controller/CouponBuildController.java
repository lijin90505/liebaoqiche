package com.ibest.card.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
import com.ibest.card.dto.input.CouponBuildInputDTO;
import com.ibest.card.entity.CouponBuild;
import com.ibest.card.service.CouponBuildService;

@Controller
@RequestMapping(value="${adminPath}/card/couponBuild")
public class CouponBuildController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(CouponBuildController.class);
	
	@Autowired
	private CouponBuildService couponBuildService;
	
	/**
	* 进入到列表页
	*/
	@RequestMapping(value="/")
	public String index(){
		return "module/card/couponBuild/couponBuildList";
	}
	
	/**
	* 进入到表单页-创建
	*/
	@RequestMapping(value="/add")
	public String add(){
		
		return "module/card/couponBuild/couponBuildForm";
	}
	
	/**
	* 进入到表单页，编辑
	*/
	@RequestMapping(value="/edit")
	public String edit(@RequestParam String id, Model model){
		try {
			if(StringUtils.isNotEmpty(id)){
				CouponBuild couponBuild = couponBuildService.findById(id);
				if(couponBuild != null){
					model.addAttribute("couponBuild", couponBuild);
				}else{
					setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "您查看的信息不存在！", model);
				}
			}else{
				setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "请选择需要编辑的信息！", model);
			}
		} catch (Exception e) {
			setRtnCodeAndMsg(EnumsRtnMapResult.EXCEPTION.getCode(), EnumsRtnMapResult.EXCEPTION.getMsg(), model);
		}
		return "module/card/couponBuild/couponBuildForm";
	}
	
	/**
	* 进入到详情页
	*/
	@RequestMapping(value="/view")
	public String view(@RequestParam String id, Model model){
		try {
			if(StringUtils.isNotEmpty(id)){
				CouponBuild couponBuild = couponBuildService.findById(id);
				if(couponBuild != null){
					model.addAttribute("couponBuild", couponBuild);
				}else{
					setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "您查看的信息不存在！", model);
				}
			}else{
				setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "请选择需要查看的信息！", model);
			}
		} catch (Exception e) {
			setRtnCodeAndMsg(EnumsRtnMapResult.EXCEPTION.getCode(), EnumsRtnMapResult.EXCEPTION.getMsg(), model);
		}
		return "module/card/couponBuild/couponBuildDetail";
	}

	/**
	* 异步分页查询
	*/
	@ResponseBody
	@RequiresPermissions("couponBuild:query")
	@RequestMapping(value="/list")
	public PageList<CouponBuild> list(CouponBuildInputDTO couponBuild, HttpServletRequest request){
		
		PageList<CouponBuild> pageList = new PageList<CouponBuild>();
		
		try {
			//设置分页参数
			super.setPage(request, pageList);
		
			pageList = couponBuildService.findByPage(pageList, couponBuild);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pageList;
	}

	/**
	 *
	 */
	@ResponseBody
	//	@RequiresPermissions("couponBuild:query")
	@RequestMapping(value="/couponTypes")
	public List<CouponBuild> couponTypes(CouponBuildInputDTO inputDTO, HttpServletRequest request) throws Exception{
		return couponBuildService.findByObject(inputDTO);
	}
	
	/**
	* 异步表单提交
	*/
	@ResponseBody
	@RequiresPermissions("couponBuild:create")
	@RequestMapping(value="create")
	public Map<String, Object> insert(CouponBuild couponBuild){

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");
		
		try {
			couponBuild.setIsDelete(ConstantUtils.UPDATE_SET_ZERO);
			couponBuild.setId(RandomUtils.RandomUUID());
			int result = couponBuildService.insert(couponBuild);
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
	@RequiresPermissions("couponBuild:update")
	@RequestMapping(value="update")
	public Map<String, Object> update(CouponBuild couponBuild){

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");
		
		try {
			int result = couponBuildService.update(couponBuild);
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
	@RequiresPermissions("couponBuild:delete")
	@RequestMapping(value="delete")
	public Map<String, Object> delete(@RequestParam(required=true) String ids){
		
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "删除成功");
		
		try {
			int result = couponBuildService.deleteByIds(ids);
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
