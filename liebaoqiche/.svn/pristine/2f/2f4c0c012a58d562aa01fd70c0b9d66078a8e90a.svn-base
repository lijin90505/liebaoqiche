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
import com.ibest.card.dto.input.CouponGetInputDTO;
import com.ibest.card.entity.CouponGet;
import com.ibest.card.service.CouponGetService;

@Controller
@RequestMapping(value="${adminPath}/card/couponGet")
public class CouponGetController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(CouponGetController.class);
	
	@Autowired
	private CouponGetService couponGetService;
	
	/**
	* 进入到列表页
	*/
	@RequestMapping(value="/")
	public String index(){
		return "module/card/couponGet/couponGetList";
	}
	
	/**
	* 进入到表单页-创建
	*/
	@RequestMapping(value="/add")
	public String add(){
		
		return "module/card/couponGet/couponGetForm";
	}
	
	/**
	* 进入到表单页，编辑
	*/
	@RequestMapping(value="/edit")
	public String edit(@RequestParam String id, Model model){
		try {
			if(StringUtils.isNotEmpty(id)){
				CouponGet couponGet = couponGetService.findById(id);
				if(couponGet != null){
					model.addAttribute("couponGet", couponGet);
				}else{
					setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "您查看的信息不存在！", model);
				}
			}else{
				setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "请选择需要编辑的信息！", model);
			}
		} catch (Exception e) {
			setRtnCodeAndMsg(EnumsRtnMapResult.EXCEPTION.getCode(), EnumsRtnMapResult.EXCEPTION.getMsg(), model);
		}
		return "module/card/couponGet/couponGetForm";
	}
	
	/**
	* 进入到详情页
	*/
	@RequestMapping(value="/view")
	public String view(@RequestParam String id, Model model){
		try {
			if(StringUtils.isNotEmpty(id)){
				CouponGet couponGet = couponGetService.findById(id);
				if(couponGet != null){
					model.addAttribute("couponGet", couponGet);
				}else{
					setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "您查看的信息不存在！", model);
				}
			}else{
				setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "请选择需要查看的信息！", model);
			}
		} catch (Exception e) {
			setRtnCodeAndMsg(EnumsRtnMapResult.EXCEPTION.getCode(), EnumsRtnMapResult.EXCEPTION.getMsg(), model);
		}
		return "module/card/couponGet/couponGetDetail";
	}

	/**
	 *
	 */
	@ResponseBody
	//	@RequiresPermissions("couponGet:query")
	@RequestMapping(value="/couponGetTypes")
	public List<CouponGet> couponGetTypes(CouponGetInputDTO inputDTO, HttpServletRequest request) throws Exception{
		return couponGetService.findByObject(inputDTO);
	}

	/**
	* 异步分页查询
	*/
	@ResponseBody
	@RequiresPermissions("couponGet:query")
	@RequestMapping(value="/list")
	public PageList<CouponGet> list(CouponGetInputDTO couponGet, HttpServletRequest request){
		
		PageList<CouponGet> pageList = new PageList<CouponGet>();
		
		try {
			//设置分页参数
			super.setPage(request, pageList);
		
			pageList = couponGetService.findByPage(pageList, couponGet);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pageList;
	}
	
	/**
	* 异步表单提交
	*/
	@ResponseBody
	@RequiresPermissions("couponGet:create")
	@RequestMapping(value="create")
	public Map<String, Object> insert(CouponGet couponGet){

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");
		
		try {
			couponGet.setIsDelete(ConstantUtils.UPDATE_SET_ZERO);
			couponGet.setId(RandomUtils.RandomUUID());
			int result = couponGetService.insert(couponGet);
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
	@RequiresPermissions("couponGet:update")
	@RequestMapping(value="update")
	public Map<String, Object> update(CouponGet couponGet){

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");
		
		try {
			int result = couponGetService.update(couponGet);
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
	@RequiresPermissions("couponGet:delete")
	@RequestMapping(value="delete")
	public Map<String, Object> delete(@RequestParam(required=true) String ids){
		
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "删除成功");
		
		try {
			int result = couponGetService.deleteByIds(ids);
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
