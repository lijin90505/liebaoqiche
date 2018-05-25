package com.ibest.pay.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
import com.ibest.pay.dto.input.PayRefundInfoInputDTO;
import com.ibest.pay.entity.PayRefundInfo;
import com.ibest.pay.service.PayRefundInfoService;

@Controller
@RequestMapping(value="${adminPath}/pay/payRefundInfo")
public class PayRefundInfoController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(PayRefundInfoController.class);
	
	@Autowired
	private PayRefundInfoService payRefundInfoService;
	
	/**
	* 进入到列表页
	*/
	@RequestMapping(value="/")
	public String index(){
		return "module/pay/payRefundInfo/payRefundInfoList";
	}
	
	/**
	* 进入到表单页-创建
	*/
	@RequestMapping(value="/add")
	public String add(){
		
		return "module/pay/payRefundInfo/payRefundInfoForm";
	}
	
	/**
	* 进入到表单页，编辑
	*/
	@RequestMapping(value="/edit")
	public String edit(@RequestParam String id, Model model){
		try {
			if(StringUtils.isNotEmpty(id)){
				PayRefundInfo payRefundInfo = payRefundInfoService.findById(id);
				if(payRefundInfo != null){
					model.addAttribute("payRefundInfo", payRefundInfo);
				}else{
					setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "您查看的信息不存在！", model);
				}
			}else{
				setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "请选择需要编辑的信息！", model);
			}
		} catch (Exception e) {
			setRtnCodeAndMsg(EnumsRtnMapResult.EXCEPTION.getCode(), EnumsRtnMapResult.EXCEPTION.getMsg(), model);
		}
		return "module/pay/payRefundInfo/payRefundInfoForm";
	}
	
	/**
	* 进入到详情页
	*/
	@RequestMapping(value="/view")
	public String view(@RequestParam String id, Model model){
		try {
			if(StringUtils.isNotEmpty(id)){
				PayRefundInfo payRefundInfo = payRefundInfoService.findById(id);
				if(payRefundInfo != null){
					model.addAttribute("payRefundInfo", payRefundInfo);
				}else{
					setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "您查看的信息不存在！", model);
				}
			}else{
				setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "请选择需要查看的信息！", model);
			}
		} catch (Exception e) {
			setRtnCodeAndMsg(EnumsRtnMapResult.EXCEPTION.getCode(), EnumsRtnMapResult.EXCEPTION.getMsg(), model);
		}
		return "module/pay/payRefundInfo/payRefundInfoDetail";
	}

	/**
	* 异步分页查询
	*/
	@ResponseBody
	@RequiresPermissions("payRefundInfo:query")
	@RequestMapping(value="/list")
	public PageList<PayRefundInfo> list(PayRefundInfoInputDTO payRefundInfo, HttpServletRequest request){
		
		PageList<PayRefundInfo> pageList = new PageList<PayRefundInfo>();
		
		try {
			//设置分页参数
			super.setPage(request, pageList);
		
			pageList = payRefundInfoService.findByPage(pageList, payRefundInfo);
			
			List<PayRefundInfo> payInfoList = pageList.getRows();
			List<PayRefundInfo> list = new ArrayList<PayRefundInfo>();
			if(payInfoList!=null && payInfoList.size()>0) {
				for (PayRefundInfo pr : payInfoList) {
					if(pr.getRefundChannel()!=null) {
						if(pr.getRefundChannel().equals("01")) {
							pr.setRefundChannel("银联");
						}else if(pr.getRefundChannel().equals("02")) {
							pr.setRefundChannel("微信");
						}else if(pr.getRefundChannel().equals("03")) {
							pr.setRefundChannel("支付宝");
						}
					}
					//00成功，01失败;02退款关闭;03未知错误;04处理中
					if(pr.getRefundChannel()!=null) {
						if(pr.getRefundStatus().equals("00") || pr.getRefundStatus().equals("REFUND")) {
							pr.setRefundStatus("成功");
						}else if(pr.getRefundStatus().equals("01")) {
							pr.setRefundStatus("失败");
						}else if(pr.getRefundStatus().equals("02")) {
							pr.setRefundStatus("退款关闭");
						}else if(pr.getRefundStatus().equals("03")) {
							pr.setRefundStatus("未知错误");
						}else if(pr.getRefundStatus().equals("04")) {
							pr.setRefundStatus("处理中");
						}
					}
					pr.setRefundFee(BigDecimal.valueOf(Long.valueOf(pr.getRefundFee())).divide(new BigDecimal(100)).toString()+"元");
					list.add(pr);
				}
			}
			pageList.setRows(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pageList;
	}
	
	/**
	* 异步表单提交
	*/
	@ResponseBody
	@RequiresPermissions("payRefundInfo:create")
	@RequestMapping(value="create")
	public Map<String, Object> insert(PayRefundInfo payRefundInfo){

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");
		
		try {
			int result = payRefundInfoService.insert(payRefundInfo);
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
	@RequiresPermissions("payRefundInfo:update")
	@RequestMapping(value="update")
	public Map<String, Object> update(PayRefundInfo payRefundInfo){

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");
		
		try {
			int result = payRefundInfoService.update(payRefundInfo);
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
	@RequiresPermissions("payRefundInfo:delete")
	@RequestMapping(value="delete")
	public Map<String, Object> delete(@RequestParam(required=true) String ids){
		
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "删除成功");
		
		try {
			int result = payRefundInfoService.deleteByIds(ids);
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
