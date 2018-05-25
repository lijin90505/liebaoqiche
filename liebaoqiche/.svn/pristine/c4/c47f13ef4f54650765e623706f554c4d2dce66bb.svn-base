package com.ibest.recon.controller;

import java.math.BigDecimal;
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

import com.alibaba.fastjson.JSONObject;
import com.ibest.framework.common.enums.EnumsRtnMapResult;
import com.ibest.framework.common.persistence.BaseController;
import com.ibest.framework.common.utils.PageList;
import com.ibest.framework.common.utils.UserUtils;
import com.ibest.framework.system.entity.SysUser;
import com.ibest.pay.ReconChannelEnum;
import com.ibest.pay.entity.PayInfo;
import com.ibest.pay.entity.PaySystemOrder;
import com.ibest.pay.enums.EnumsBillType;
import com.ibest.pay.enums.EnumsOrderStatus;
import com.ibest.pay.enums.EnumsReconChannel;
import com.ibest.pay.enums.EnumsReconState;
import com.ibest.pay.service.PayInfoService;
import com.ibest.pay.service.PaySystemOrderService;
import com.ibest.recon.dto.input.PaySystemLocalReconInputDTO;
import com.ibest.recon.entity.PaySystemLocalRecon;
import com.ibest.recon.service.PaySystemLocalReconService;
import com.ibest.utils.HttpRequestUtils;

@Controller
@RequestMapping(value="${adminPath}/recon/paySystemLocalRecon")
public class PaySystemLocalReconController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(PaySystemLocalReconController.class);
	
	@Autowired
	private PaySystemLocalReconService paySystemLocalReconService;
	
	@Autowired
	private PayInfoService payInfoService;
	
	@Autowired
	private PaySystemOrderService paySystemOrderService;
	
	/**
	* 进入到列表页
	*/
	@RequestMapping(value="/")
	public String index(){
		return "module/recon/paySystemLocalRecon/paySystemLocalReconList";
	}
	
	/**
	* 进入到表单页-创建
	*/
	@RequestMapping(value="/add")
	public String add(){
		
		return "module/recon/paySystemLocalRecon/paySystemLocalReconForm";
	}
	
	/**
	* 进入到表单页，编辑
	*/
	@RequestMapping(value="/edit")
	public String edit(@RequestParam String id, Model model){
		try {
			if(StringUtils.isNotEmpty(id)){
				PaySystemLocalRecon paySystemLocalRecon = paySystemLocalReconService.findById(id);
				if(paySystemLocalRecon != null){
					model.addAttribute("paySystemLocalRecon", paySystemLocalRecon);
				}else{
					setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "您查看的信息不存在！", model);
				}
			}else{
				setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "请选择需要编辑的信息！", model);
			}
		} catch (Exception e) {
			setRtnCodeAndMsg(EnumsRtnMapResult.EXCEPTION.getCode(), EnumsRtnMapResult.EXCEPTION.getMsg(), model);
		}
		return "module/recon/paySystemLocalRecon/paySystemLocalReconForm";
	}
	
	/**
	* 进入到详情页
	*/
	@RequestMapping(value="/view")
	public String view(@RequestParam String id, Model model){
		try {
			if(StringUtils.isNotEmpty(id)){
				PaySystemLocalRecon paySystemLocalRecon = paySystemLocalReconService.findById(id);
				if(paySystemLocalRecon != null){
					model.addAttribute("paySystemLocalRecon", paySystemLocalRecon);
				}else{
					setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "您查看的信息不存在！", model);
				}
			}else{
				setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "请选择需要查看的信息！", model);
			}
		} catch (Exception e) {
			setRtnCodeAndMsg(EnumsRtnMapResult.EXCEPTION.getCode(), EnumsRtnMapResult.EXCEPTION.getMsg(), model);
		}
		return "module/recon/paySystemLocalRecon/paySystemLocalReconDetail";
	}

	/**
	* 异步分页查询
	*/
	@ResponseBody
	@RequiresPermissions("paySystemLocalRecon:query")
	@RequestMapping(value="/list")
	public PageList<PaySystemLocalRecon> list(PaySystemLocalReconInputDTO paySystemLocalRecon, HttpServletRequest request){
		
		PageList<PaySystemLocalRecon> pageList = new PageList<PaySystemLocalRecon>();
		
		try {
			//设置分页参数
			super.setPage(request, pageList);
		
			pageList = paySystemLocalReconService.findByPage(pageList, paySystemLocalRecon);
			
			List<PaySystemLocalRecon> prList = pageList.getRows();
			List<PaySystemLocalRecon> list = new ArrayList<PaySystemLocalRecon>();
			if(prList!=null && prList.size()>0) {
				for (PaySystemLocalRecon ps : prList) {
					
					ps.setBillType(EnumsBillType.getDesc(ps.getBillType()));

					ps.setRenconType(EnumsReconChannel.getDesc(ps.getRenconType()));
					if(ps.getTradeState()!=null) {
						ps.setTradeState(EnumsOrderStatus.getDesc(ps.getTradeState()));
					}
					if(ps.getReconState()!=null) {
						ps.setReconState(EnumsReconState.getDesc(ps.getReconState()));
					}
					ps.setTradeAmount(changeF2Y(ps.getTradeAmount())+"元");
					list.add(ps);
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
	@RequiresPermissions("paySystemLocalRecon:create")
	@RequestMapping(value="create")
	public Map<String, Object> insert(PaySystemLocalRecon paySystemLocalRecon){

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");
		
		try {
			int result = paySystemLocalReconService.insert(paySystemLocalRecon);
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
	@RequiresPermissions("paySystemLocalRecon:update")
	@RequestMapping(value="update")
	public Map<String, Object> update(PaySystemLocalRecon paySystemLocalRecon){

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");
		
		try {
			int result = paySystemLocalReconService.update(paySystemLocalRecon);
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
	@RequiresPermissions("paySystemLocalRecon:delete")
	@RequestMapping(value="delete")
	public Map<String, Object> delete(@RequestParam(required=true) String ids){
		
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "删除成功");
		
		try {
			int result = paySystemLocalReconService.deleteByIds(ids);
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
	 * 支付系统与本地对账
	 * @Title: recon  
	 * @param: @param billDate
	 * @param: @param billType
	 * @return:Map<String,Object>
	 * @author: WeiJia
	 * @date:2018年4月24日 下午9:17:05
	 */
	@ResponseBody
	@RequiresPermissions("paySystemLocalRecon:recon")
	@RequestMapping(value="recon")
	public Map<String, Object> recon(String billDate,String reconChannel,String billType){
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		try {
			// 获取支付方式
			ReconChannelEnum rce = ReconChannelEnum.getReconChannel(new Integer(reconChannel));
			switch (rce) {
				case WECHATPAY:
					logger.info("进入微信支付对账...");
					billType = "SUCCESS";
					String jsonParam = "{\"reqMap\":{\"billDate\":\""+billDate.replaceAll("-", "")+"\",\"billType\":\""+billType+"\",\"payRecon\":\"02\"}}";
//					String url = "http://localhost:7707/liebaoqiche_interface";
					String url = "http://172.24.102.61:8085/liebaoqiche_interface";
//					String url = "http://123.125.218.30:8085/liebaoqiche_interface";
					String rs = HttpRequestUtils.doJsonRequest(url+"/api/liebao/pay/payRecon", jsonParam, "");
					JSONObject json = JSONObject.parseObject(rs);
					System.out.println(json.toJSONString());
					break;
				case AILPAY:
					logger.info("进入支付宝对账...");
					String payRecon1 = "01";
					String aliJsonParam = "{\"reqMap\":{\"billDate\":\""+billDate.replaceAll("-", "")+"\",\"payRecon\":\""+payRecon1+"\",\"billType\":\""+billType+"\"}}";
//					String url1 = "http://localhost:8080/liebaoqiche_interface";
					String url1 = "http://172.24.102.61:8085/liebaoqiche_interface";
					String rs1 = HttpRequestUtils.doJsonRequest(url1+"/api/liebao/pay/payRecon", aliJsonParam, "");
					JSONObject json1 = JSONObject.parseObject(rs1);
					String returnCode1 = json1.getString("result");
					break;
				case UNIONPAY:	
					logger.info("进入银联对账...");
					String payRecon2 = "01";
					String unJsonParam = "{\"reqMap\":{\"billDate\":\""+billDate.replaceAll("-", "")+"\",\"payRecon\":\""+payRecon2+"\",\"billType\":\""+billType+"\"}}";
//					String url2 = "http://localhost:8080/liebaoqiche_interface";
					String url2 = "http://172.24.102.61:8085/liebaoqiche_interface";
					String rs2 = HttpRequestUtils.doJsonRequest(url2+"/api/liebao/pay/payRecon", unJsonParam, "");
					JSONObject json2 = JSONObject.parseObject(rs2);
					String returnCode2 = json2.getString("result");
					break;
				default:
					break;
			}
			List<PayInfo> payInfoList = payInfoService.findByOrderSendTime(billDate);
			List<PaySystemOrder> paySystemList = paySystemOrderService.findByTradeTime(billDate);
			
			SysUser user = UserUtils.getCurrentUser();
			if((payInfoList!=null && payInfoList.size()>0) && (paySystemList!=null && paySystemList.size()>0)) {
				for (PayInfo payInfo : payInfoList) {
					for (PaySystemOrder ps : paySystemList) {
						if(payInfo.getOrderId().equals(ps.getOrderId())) {
							PaySystemLocalRecon sl = paySystemLocalReconService.findByOrderId(payInfo.getOrderId());
							if(sl==null) {
								sl = new PaySystemLocalRecon();
							}
							if(!payInfo.getOrderStatus().equals(ps.getTradeState())) {//状态是否一致
								sl.setBillType("00");
								sl.setOrderId(ps.getOrderId());
								sl.setRenconTime(billDate);
								sl.setTradeAmount(payInfo.getAmount());
								sl.setTradeTime(ps.getTradeTime());
								sl.setTradeType(payInfo.getPayType());
								sl.setTradeState(payInfo.getOrderStatus());
								sl.setReconState("01");
								sl.setFailMessage("支付系统订单状态与本地系统订单状态不一致");
								sl.setBillType(billType);
								sl.setRenconType(reconChannel);
								if(sl!=null && sl.getId()!=null) {
									sl.setModifier(user.getUsername());
									sl.setModifyTime(new Date());
									paySystemLocalReconService.update(sl);
								}else {
									sl.setCreater(user.getUsername());
									sl.setCreateTime(new Date());
									paySystemLocalReconService.insert(sl);
								}
							}
							
							if(!payInfo.getAmount().equals(ps.getTradeAmount())) {//金额是否一致
								sl.setBillType("00");
								sl.setOrderId(ps.getOrderId());
								sl.setRenconTime(billDate);
								sl.setTradeAmount(payInfo.getAmount());
								sl.setTradeTime(ps.getTradeTime());
								sl.setTradeType(payInfo.getPayType());
								sl.setTradeState(payInfo.getOrderStatus());
								sl.setReconState("02");
								sl.setFailMessage("支付系统订单金额与本地系统订单金额不一致");
								sl.setBillType(billType);
								sl.setRenconType(reconChannel);
								if(sl!=null && sl.getId()!=null) {
									sl.setModifier(user.getUsername());
									sl.setModifyTime(new Date());
									paySystemLocalReconService.update(sl);
								}else {
									sl.setCreater(user.getUsername());
									sl.setCreateTime(new Date());
									paySystemLocalReconService.insert(sl);
								}
							}
						}
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rtnMap;
	}
	
	/**
	 * 分转元
	 * @Title: changeF2Y  
	 * @param: @param amount
	 * @param: @throws Exception
	 * @date:2018年4月27日 上午9:30:16
	 */
	public static String changeF2Y(String amount) throws Exception{    
        return BigDecimal.valueOf(Long.valueOf(amount)).divide(new BigDecimal(100)).toString();    
    }
}
