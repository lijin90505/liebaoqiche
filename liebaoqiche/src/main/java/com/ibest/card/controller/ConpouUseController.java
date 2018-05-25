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
import com.ibest.card.dto.input.ConpouUseInputDTO;
import com.ibest.card.entity.CouponUse;
import com.ibest.card.service.CouponUseService;

@Controller
@RequestMapping(value="${adminPath}/card/conpouUse")
public class ConpouUseController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(ConpouUseController.class);
	
	@Autowired
	private CouponUseService conpouUseService;
	
	/**
	* 进入到列表页
	*/
	@RequestMapping(value="/")
	public String index(){
		return "module/card/conpouUse/conpouUseList";
	}
	
	/**
	* 进入到表单页-创建
	*/
	@RequestMapping(value="/add")
	public String add(){
		
		return "module/card/conpouUse/conpouUseForm";
	}
	
	/**
	* 进入到表单页，编辑
	*/
	@RequestMapping(value="/edit")
	public String edit(@RequestParam String id, Model model){
		try {
			if(StringUtils.isNotEmpty(id)){
				CouponUse conpouUse = conpouUseService.findById(id);
				if(conpouUse != null){
					model.addAttribute("conpouUse", conpouUse);
				}else{
					setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "您查看的信息不存在！", model);
				}
			}else{
				setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "请选择需要编辑的信息！", model);
			}
		} catch (Exception e) {
			setRtnCodeAndMsg(EnumsRtnMapResult.EXCEPTION.getCode(), EnumsRtnMapResult.EXCEPTION.getMsg(), model);
		}
		return "module/card/conpouUse/conpouUseForm";
	}
	
	/**
	* 进入到详情页
	*/
	@RequestMapping(value="/view")
	public String view(@RequestParam String id, Model model){
		try {
			if(StringUtils.isNotEmpty(id)){
				CouponUse conpouUse = conpouUseService.findById(id);
				if(conpouUse != null){
					model.addAttribute("conpouUse", conpouUse);
				}else{
					setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "您查看的信息不存在！", model);
				}
			}else{
				setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "请选择需要查看的信息！", model);
			}
		} catch (Exception e) {
			setRtnCodeAndMsg(EnumsRtnMapResult.EXCEPTION.getCode(), EnumsRtnMapResult.EXCEPTION.getMsg(), model);
		}
		return "module/card/conpouUse/conpouUseDetail";
	}

	/**
	* 异步分页查询
	*/
	@ResponseBody
	@RequiresPermissions("conpouUse:query")
	@RequestMapping(value="/list")
	public PageList<CouponUse> list(ConpouUseInputDTO conpouUse, HttpServletRequest request){
		
		PageList<CouponUse> pageList = new PageList<CouponUse>();
		
		try {
			//设置分页参数
			super.setPage(request, pageList);
		
			pageList = conpouUseService.findByPage(pageList, conpouUse);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pageList;
	}

	/**
	 *
	 */
	@ResponseBody
	//	@RequiresPermissions("conpouUse:query")
	@RequestMapping(value="/couponUseTypes")
	public List<CouponUse> couponUseTypes(ConpouUseInputDTO inputDTO, HttpServletRequest request) throws Exception{
		return conpouUseService.findByObject(inputDTO);
	}
	
	/**
	* 异步表单提交
	*/
	@ResponseBody
	@RequiresPermissions("conpouUse:create")
	@RequestMapping(value="create")
	public Map<String, Object> insert(CouponUse couponUse){

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");
		
		try {
			couponUse.setIsDelete(ConstantUtils.UPDATE_SET_ZERO);
			couponUse.setId(RandomUtils.RandomUUID());
			int result = conpouUseService.insert(couponUse);
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
	@RequiresPermissions("conpouUse:update")
	@RequestMapping(value="update")
	public Map<String, Object> update(CouponUse conpouUse){

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");
		
		try {
			int result = conpouUseService.update(conpouUse);
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
	@RequiresPermissions("conpouUse:delete")
	@RequestMapping(value="delete")
	public Map<String, Object> delete(@RequestParam(required=true) String ids){
		
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "删除成功");
		
		try {
			int result = conpouUseService.deleteByIds(ids);
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
