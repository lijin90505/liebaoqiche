package com.ibest.card.controller;

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
import com.ibest.card.dto.input.UserCouponUsedRecordInputDTO;
import com.ibest.card.entity.UserCouponUsedRecord;
import com.ibest.card.service.UserCouponUsedRecordService;

@Controller
@RequestMapping(value="${adminPath}/card/userCouponUsedRecord")
public class UserCouponUsedRecordController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserCouponUsedRecordController.class);
	
	@Autowired
	private UserCouponUsedRecordService userCouponUsedRecordService;
	
	/**
	* 进入到列表页
	*/
	@RequestMapping(value="/")
	public String index(){
		return "module/card/userCouponUsedRecord/userCouponUsedRecordList";
	}
	
	/**
	* 进入到表单页-创建
	*/
	@RequestMapping(value="/add")
	public String add(){
		
		return "module/card/userCouponUsedRecord/userCouponUsedRecordForm";
	}
	
	/**
	* 进入到表单页，编辑
	*/
	@RequestMapping(value="/edit")
	public String edit(@RequestParam String id, Model model){
		try {
			if(StringUtils.isNotEmpty(id)){
				UserCouponUsedRecord userCouponUsedRecord = userCouponUsedRecordService.findById(id);
				if(userCouponUsedRecord != null){
					model.addAttribute("userCouponUsedRecord", userCouponUsedRecord);
				}else{
					setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "您查看的信息不存在！", model);
				}
			}else{
				setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "请选择需要编辑的信息！", model);
			}
		} catch (Exception e) {
			setRtnCodeAndMsg(EnumsRtnMapResult.EXCEPTION.getCode(), EnumsRtnMapResult.EXCEPTION.getMsg(), model);
		}
		return "module/card/userCouponUsedRecord/userCouponUsedRecordForm";
	}
	
	/**
	* 进入到详情页
	*/
	@RequestMapping(value="/view")
	public String view(@RequestParam String id, Model model){
		try {
			if(StringUtils.isNotEmpty(id)){
				UserCouponUsedRecord userCouponUsedRecord = userCouponUsedRecordService.findById(id);
				if(userCouponUsedRecord != null){
					model.addAttribute("userCouponUsedRecord", userCouponUsedRecord);
				}else{
					setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "您查看的信息不存在！", model);
				}
			}else{
				setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "请选择需要查看的信息！", model);
			}
		} catch (Exception e) {
			setRtnCodeAndMsg(EnumsRtnMapResult.EXCEPTION.getCode(), EnumsRtnMapResult.EXCEPTION.getMsg(), model);
		}
		return "module/card/userCouponUsedRecord/userCouponUsedRecordDetail";
	}

	/**
	* 异步分页查询
	*/
	@ResponseBody
	@RequiresPermissions("userCouponUsedRecord:query")
	@RequestMapping(value="/list")
	public PageList<UserCouponUsedRecord> list(UserCouponUsedRecordInputDTO userCouponUsedRecord, HttpServletRequest request){
		
		PageList<UserCouponUsedRecord> pageList = new PageList<UserCouponUsedRecord>();
		
		try {
			//设置分页参数
			super.setPage(request, pageList);
		
			pageList = userCouponUsedRecordService.findByPage(pageList, userCouponUsedRecord);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pageList;
	}
	
	/**
	* 异步表单提交
	*/
	@ResponseBody
	@RequiresPermissions("userCouponUsedRecord:create")
	@RequestMapping(value="create")
	public Map<String, Object> insert(UserCouponUsedRecord userCouponUsedRecord){

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");
		
		try {
			int result = userCouponUsedRecordService.insert(userCouponUsedRecord);
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
	@RequiresPermissions("userCouponUsedRecord:update")
	@RequestMapping(value="update")
	public Map<String, Object> update(UserCouponUsedRecord userCouponUsedRecord){

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");
		
		try {
			int result = userCouponUsedRecordService.update(userCouponUsedRecord);
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
	@RequiresPermissions("userCouponUsedRecord:delete")
	@RequestMapping(value="delete")
	public Map<String, Object> delete(@RequestParam(required=true) String ids){
		
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "删除成功");
		
		try {
			int result = userCouponUsedRecordService.deleteByIds(ids);
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
