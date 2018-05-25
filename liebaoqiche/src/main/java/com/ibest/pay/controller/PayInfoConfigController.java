package com.ibest.pay.controller;

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

import com.ibest.accesssystem.entity.AccessSystem;
import com.ibest.accesssystem.service.AccessSystemService;
import com.ibest.framework.common.enums.EnumsRtnMapResult;
import com.ibest.framework.common.persistence.BaseController;
import com.ibest.framework.common.utils.PageList;
import com.ibest.framework.common.utils.UserUtils;
import com.ibest.framework.system.entity.SysUser;
import com.ibest.pay.dto.input.PayInfoConfigInputDTO;
import com.ibest.pay.entity.PayChannel;
import com.ibest.pay.entity.PayInfoConfig;
import com.ibest.pay.entity.PayType;
import com.ibest.pay.enums.EnumsAccessSystem;
import com.ibest.pay.service.PayChannelService;
import com.ibest.pay.service.PayInfoConfigService;
import com.ibest.pay.service.PayTypeService;

@Controller
@RequestMapping(value="${adminPath}/pay/payInfoConfig")
public class PayInfoConfigController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(PayInfoConfigController.class);
	
	@Autowired
	private PayInfoConfigService payInfoConfigService;
	
	@Autowired
	private AccessSystemService accessSystemService;
	
	@Autowired
	private PayTypeService payTypeService;
	
	@Autowired
	private PayChannelService payChannelService;
	
	/**
	* 进入到列表页
	*/
	@RequestMapping(value="/")
	public String index(Model model){
		List<PayChannel> payChannelList = payChannelService.findByAll();
		model.addAttribute("payChannelList", payChannelList);
		
		List<PayType> payTypeList = payTypeService.findByAll();
		model.addAttribute("payChannelList", payChannelList);
		model.addAttribute("payTypeList", payTypeList);
		return "module/pay/payInfoConfig/payInfoConfigList";
	}
	
	/**
	* 进入到表单页-创建
	*/
	@RequestMapping(value="/add")
	public String add(Model model){
		List<PayChannel> payChannelList = payChannelService.findByAll();
		model.addAttribute("payChannelList", payChannelList);
		return "module/pay/payInfoConfig/payInfoConfigForm";
	}
	
	/**
	* 进入到表单页，编辑
	*/
	@RequestMapping(value="/edit")
	public String edit(@RequestParam String id, Model model){
		try {
			if(StringUtils.isNotEmpty(id)){
				List<PayChannel> payChannelList = payChannelService.findByAll();
				model.addAttribute("payChannelList", payChannelList);
				
				List<PayType> payTypeList = payTypeService.findByAll();
				model.addAttribute("payTypeList", payTypeList);
				PayInfoConfig payInfoConfig = payInfoConfigService.findById(id);
				if(payInfoConfig != null){
					model.addAttribute("payInfoConfig", payInfoConfig);
				}else{
					setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "您查看的信息不存在！", model);
				}
			}else{
				setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "请选择需要编辑的信息！", model);
			}
		} catch (Exception e) {
			setRtnCodeAndMsg(EnumsRtnMapResult.EXCEPTION.getCode(), EnumsRtnMapResult.EXCEPTION.getMsg(), model);
		}
		return "module/pay/payInfoConfig/payInfoConfigForm";
	}
	
	/**
	* 进入到详情页
	*/
	@RequestMapping(value="/view")
	public String view(@RequestParam String id, Model model){
		try {
			if(StringUtils.isNotEmpty(id)){
				PayInfoConfig payInfoConfig = payInfoConfigService.findById(id);
				if(payInfoConfig != null){
					model.addAttribute("payInfoConfig", payInfoConfig);
				}else{
					setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "您查看的信息不存在！", model);
				}
			}else{
				setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "请选择需要查看的信息！", model);
			}
		} catch (Exception e) {
			setRtnCodeAndMsg(EnumsRtnMapResult.EXCEPTION.getCode(), EnumsRtnMapResult.EXCEPTION.getMsg(), model);
		}
		return "module/pay/payInfoConfig/payInfoConfigDetail";
	}

	/**
	* 异步分页查询
	*/
	@ResponseBody
	@RequiresPermissions("payInfoConfig:query")
	@RequestMapping(value="/list")
	public PageList<PayInfoConfig> list(PayInfoConfigInputDTO payInfoConfig, HttpServletRequest request){
		
		PageList<PayInfoConfig> pageList = new PageList<PayInfoConfig>();
		
		try {
			//设置分页参数
			super.setPage(request, pageList);
		
			pageList = payInfoConfigService.findByPage(pageList, payInfoConfig);
			List<PayInfoConfig> configList = pageList.getRows();
			if(configList!=null && configList.size()>0) {
				for (PayInfoConfig pic : configList) {
					if(pic.getPayChannelId()!=null) {
						PayChannel pc = payChannelService.findById(pic.getPayChannelId());
						PayType pt = payTypeService.findById(pic.getPayTypeId());
						if(null!=pc) {
							String payChannelName = pc.getPayChannelName();
							pic.setPayChannelName(payChannelName);
						}
						String payName = pt.getPayName();
						if(null!=payName)
							pic.setPayName(payName);
					}
				}
			}
			pageList.setRows(configList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pageList;
	}
	
	/**
	* 异步表单提交
	*/
	@ResponseBody
	@RequiresPermissions("payInfoConfig:create")
	@RequestMapping(value="create")
	public Map<String, Object> insert(PayInfoConfig payInfoConfig){

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");
		
		try {
			SysUser user = UserUtils.getCurrentUser();
			payInfoConfig.setCreateBy(user.getUsername());
			payInfoConfig.setCreateDate(new Date());
			payInfoConfig.setUpdateBy(user.getUsername());
			payInfoConfig.setUpdateDate(new Date());
			int result = payInfoConfigService.insert(payInfoConfig);
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
	@RequiresPermissions("payInfoConfig:update")
	@RequestMapping(value="update")
	public Map<String, Object> update(PayInfoConfig payInfoConfig){

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");
		
		try {
			SysUser user = UserUtils.getCurrentUser();
			payInfoConfig.setUpdateBy(user.getUsername());
			payInfoConfig.setUpdateDate(new Date());
			int result = payInfoConfigService.update(payInfoConfig);
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
	@RequiresPermissions("payInfoConfig:delete")
	@RequestMapping(value="delete")
	public Map<String, Object> delete(@RequestParam(required=true) String ids){
		
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "删除成功");
		
		try {
			int result = payInfoConfigService.deleteByIds(ids);
			if(result == 0){
				setRtnCodeAndMsgByFailure(rtnMap, "删除失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
			setRtnCodeAndMsgByException(rtnMap, null);
		}
		return rtnMap;
	}
	
	/**
	 * 查询支付类型
	 * @Title: queryByPayType  
	 * @param: @param accessSystemId
	 * @return:Map<String,Object>
	 * @author: WeiJia
	 * @date:2018年4月20日 上午11:12:22
	 */
	@ResponseBody
	@RequestMapping(value="queryByPayType")
	public Map<String, Object> queryByPayType(@RequestParam(required=true) String payChannelId){
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		try {
			List<PayType> payTypeList = payTypeService.findByPayTypes(payChannelId);
			rtnMap.put("payTypeList", payTypeList);
			setRtnCodeAndMsgBySuccess(rtnMap, "操作成功");
		} catch (Exception e) {
			e.printStackTrace();
			setRtnCodeAndMsgByException(rtnMap, null);
		}
		return rtnMap;
	}
}
