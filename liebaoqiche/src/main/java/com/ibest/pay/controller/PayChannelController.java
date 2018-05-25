package com.ibest.pay.controller;

import java.util.ArrayList;
import java.util.Date;
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
import com.ibest.framework.common.utils.UserUtils;
import com.ibest.framework.system.entity.SysUser;
import com.ibest.pay.dto.input.PayChannelInputDTO;
import com.ibest.pay.entity.PayChannel;
import com.ibest.pay.service.PayChannelService;
import com.ibest.utils.ConstantUtils;

@Controller
@RequestMapping(value="${adminPath}/pay/payChannel")
public class PayChannelController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(PayChannelController.class);
	
	@Autowired
	private PayChannelService payChannelService;
	
	/**
	* 进入到列表页
	*/
	@RequestMapping(value="/")
	public String index(){
		return "module/pay/payChannel/payChannelList";
	}
	
	/**
	* 进入到表单页-创建
	*/
	@RequestMapping(value="/add")
	public String add(){
		
		return "module/pay/payChannel/payChannelForm";
	}
	
	/**
	* 进入到表单页，编辑
	*/
	@RequestMapping(value="/edit")
	public String edit(@RequestParam String id, Model model){
		try {
			if(StringUtils.isNotEmpty(id)){
				PayChannel payChannel = payChannelService.findById(id);
				if(payChannel != null){
					model.addAttribute("payChannel", payChannel);
				}else{
					setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "您查看的信息不存在！", model);
				}
			}else{
				setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "请选择需要编辑的信息！", model);
			}
		} catch (Exception e) {
			setRtnCodeAndMsg(EnumsRtnMapResult.EXCEPTION.getCode(), EnumsRtnMapResult.EXCEPTION.getMsg(), model);
		}
		return "module/pay/payChannel/payChannelForm";
	}
	
	/**
	* 进入到详情页
	*/
	@RequestMapping(value="/view")
	public String view(@RequestParam String id, Model model){
		try {
			if(StringUtils.isNotEmpty(id)){
				PayChannel payChannel = payChannelService.findById(id);
				if(payChannel != null){
					model.addAttribute("payChannel", payChannel);
				}else{
					setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "您查看的信息不存在！", model);
				}
			}else{
				setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "请选择需要查看的信息！", model);
			}
		} catch (Exception e) {
			setRtnCodeAndMsg(EnumsRtnMapResult.EXCEPTION.getCode(), EnumsRtnMapResult.EXCEPTION.getMsg(), model);
		}
		return "module/pay/payChannel/payChannelDetail";
	}

	/**
	* 异步分页查询
	*/
	@ResponseBody
	@RequiresPermissions("payChannel:query")
	@RequestMapping(value="/list")
	public PageList<PayChannel> list(PayChannelInputDTO payChannel, HttpServletRequest request){
		
		PageList<PayChannel> pageList = new PageList<PayChannel>();
		
		try {
			//设置分页参数
			super.setPage(request, pageList);
		
			pageList = payChannelService.findByPage(pageList, payChannel);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pageList;
	}
	
	/**
	* 异步表单提交
	*/
	@ResponseBody
	@RequiresPermissions("payChannel:create")
	@RequestMapping(value="create")
	public Map<String, Object> insert(PayChannel payChannel){

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");
		
		try {
			PayChannel pc = payChannelService.findByPayChannelName(payChannel.getPayChannelName());
			if(null!=pc && pc.getId()!=null) {
				setRtnCodeAndMsgByFailure(rtnMap, payChannel.getPayChannelName()+"重复，请重新输入！");
				return rtnMap;
			}
			SysUser user = UserUtils.getCurrentUser();
			payChannel.setCreater(user.getUsername());
			payChannel.setCreateTime(new Date());
			payChannel.setModifier(user.getUsername());
			payChannel.setModifyTime(new Date());
			payChannel.setIsDelete(ConstantUtils.UPDATE_SET_ZERO);
			int result = payChannelService.insert(payChannel);
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
	@RequiresPermissions("payChannel:update")
	@RequestMapping(value="update")
	public Map<String, Object> update(PayChannel payChannel){

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");
		
		try {
			PayChannel pc = payChannelService.findByPayChannelName(payChannel.getPayChannelName());
			if(null!=pc && pc.getId()!=null) {
				if(!payChannel.getPayChannelName().equals(pc.getPayChannelName())) {
					setRtnCodeAndMsgByFailure(rtnMap, "渠道名称："+payChannel.getPayChannelName()+"重复，请重新输入！");
					return rtnMap;
				}
			}
			SysUser user = UserUtils.getCurrentUser();
			PayChannel channel = new PayChannel();
			channel.setPayChannelName(payChannel.getPayChannelName());
			channel.setId(payChannel.getId());
			channel.setModifier(user.getUsername());
			channel.setModifyTime(new Date());
			int result = payChannelService.update(channel);
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
	@RequiresPermissions("payChannel:delete")
	@RequestMapping(value="delete")
	public Map<String, Object> delete(@RequestParam(required=true) String ids){
		
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "删除成功");
		
		try {
			int result = payChannelService.deleteByIds(ids);
			if(result == 0){
				setRtnCodeAndMsgByFailure(rtnMap, "删除失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
			setRtnCodeAndMsgByException(rtnMap, null);
		}
		return rtnMap;
	}
	
	
	@ResponseBody
	@RequestMapping(value="findByName")
	public String findByName(@RequestParam(required=true) String name){
		List<PayChannel> p = payChannelService.findByName(name);
		List<String> orderId = new ArrayList<String>();
		p.forEach(x -> {
			orderId.add(x.getPayChannelName());
		});
		if(orderId.contains(name))
			return "false";
		return "true";
	}
}
