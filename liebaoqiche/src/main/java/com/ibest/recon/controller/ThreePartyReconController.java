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

import com.ibest.framework.common.enums.EnumsRtnMapResult;
import com.ibest.framework.common.persistence.BaseController;
import com.ibest.framework.common.utils.PageList;
import com.ibest.framework.common.utils.UserUtils;
import com.ibest.framework.system.entity.SysUser;
import com.ibest.pay.entity.OutSystemOrder;
import com.ibest.pay.entity.PayInfo;
import com.ibest.pay.entity.PaySystemOrder;
import com.ibest.pay.service.OutSystemOrderService;
import com.ibest.pay.service.PayInfoService;
import com.ibest.pay.service.PaySystemOrderService;
import com.ibest.recon.dto.input.ThreePartyReconInputDTO;
import com.ibest.recon.entity.ThreePartyRecon;
import com.ibest.recon.service.ThreePartyReconService;

@Controller
@RequestMapping(value="${adminPath}/recon/threePartyRecon")
public class ThreePartyReconController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(ThreePartyReconController.class);
	
	@Autowired
	private ThreePartyReconService threePartyReconService;
	
	@Autowired
	private PayInfoService payInfoService;
	
	@Autowired
	private PaySystemOrderService paySystemOrderService;
	
	@Autowired
	private OutSystemOrderService outSystemOrderService;
	
	/**
	* 进入到列表页
	*/
	@RequestMapping(value="/")
	public String index(){
		return "module/recon/threePartyRecon/threePartyReconList";
	}
	
	/**
	* 进入到表单页-创建
	*/
	@RequestMapping(value="/add")
	public String add(){
		
		return "module/recon/threePartyRecon/threePartyReconForm";
	}
	
	/**
	* 进入到表单页，编辑
	*/
	@RequestMapping(value="/edit")
	public String edit(@RequestParam String id, Model model){
		try {
			if(StringUtils.isNotEmpty(id)){
				ThreePartyRecon threePartyRecon = threePartyReconService.findById(id);
				if(threePartyRecon != null){
					model.addAttribute("threePartyRecon", threePartyRecon);
				}else{
					setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "您查看的信息不存在！", model);
				}
			}else{
				setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "请选择需要编辑的信息！", model);
			}
		} catch (Exception e) {
			setRtnCodeAndMsg(EnumsRtnMapResult.EXCEPTION.getCode(), EnumsRtnMapResult.EXCEPTION.getMsg(), model);
		}
		return "module/recon/threePartyRecon/threePartyReconForm";
	}
	
	/**
	* 进入到详情页
	*/
	@RequestMapping(value="/view")
	public String view(@RequestParam String id, Model model){
		try {
			if(StringUtils.isNotEmpty(id)){
				ThreePartyRecon threePartyRecon = threePartyReconService.findById(id);
				if(threePartyRecon != null){
					model.addAttribute("threePartyRecon", threePartyRecon);
				}else{
					setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "您查看的信息不存在！", model);
				}
			}else{
				setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "请选择需要查看的信息！", model);
			}
		} catch (Exception e) {
			setRtnCodeAndMsg(EnumsRtnMapResult.EXCEPTION.getCode(), EnumsRtnMapResult.EXCEPTION.getMsg(), model);
		}
		return "module/recon/threePartyRecon/threePartyReconDetail";
	}

	/**
	* 异步分页查询
	*/
	@ResponseBody
	@RequiresPermissions("threePartyRecon:query")
	@RequestMapping(value="/list")
	public PageList<ThreePartyRecon> list(ThreePartyReconInputDTO threePartyRecon, HttpServletRequest request){
		
		PageList<ThreePartyRecon> pageList = new PageList<ThreePartyRecon>();
		
		try {
			//设置分页参数
			super.setPage(request, pageList);
		
			pageList = threePartyReconService.findByPage(pageList, threePartyRecon);
			
			List<ThreePartyRecon> tpList = pageList.getRows();
			
			List<ThreePartyRecon> list = new ArrayList<ThreePartyRecon>();
			if(tpList!=null && tpList.size()>0) {
				for (ThreePartyRecon info : tpList) {
					if(info.getBillType().equals("00")) {
						info.setBillType("支付");
					}else {
						info.setBillType("退款");
					}
					if(info.getTradeState()!=null) {
						if(info.getTradeState().equals("00")) {
							info.setTradeState("支付成功");
						}else if(info.getTradeState().equals("01")) {
							info.setTradeState("失败");
						}else if(info.getTradeState().equals("02")) {
							info.setTradeState("未知错误请查询交易状态");
						}else if(info.getTradeState().equals("03")) {
							info.setTradeState("申请退款中");
						}else if(info.getTradeState().equals("04")) {
							info.setTradeState("未支付");
						}else if(info.getTradeState().equals("09")) {
							info.setTradeState("已退款");
						}else if(info.getTradeState().equals("08")) {
							info.setTradeState("全额退款，交易关闭");
						}
					}
					
					if(info.getBillType()!=null) {
						if(info.getReconState().equals("00")) {
							info.setReconState("成功");
						}else if(info.getReconState().equals("01")) {
							info.setReconState("订单状态不一致");
						}else if(info.getReconState().equals("02")) {
							info.setReconState("订单金额不一致");
						}
					}
					info.setTradeAmount(changeF2Y(info.getTradeAmount())+"元");
					list.add(info);
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
	@RequiresPermissions("threePartyRecon:create")
	@RequestMapping(value="create")
	public Map<String, Object> insert(ThreePartyRecon threePartyRecon){

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");
		
		try {
			int result = threePartyReconService.insert(threePartyRecon);
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
	@RequiresPermissions("threePartyRecon:update")
	@RequestMapping(value="update")
	public Map<String, Object> update(ThreePartyRecon threePartyRecon){

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");
		
		try {
			int result = threePartyReconService.update(threePartyRecon);
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
	@RequiresPermissions("threePartyRecon:delete")
	@RequestMapping(value="delete")
	public Map<String, Object> delete(@RequestParam(required=true) String ids){
		
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "删除成功");
		
		try {
			int result = threePartyReconService.deleteByIds(ids);
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
	@RequiresPermissions("paySystemLocalRecon:recon")
	@RequestMapping(value="recon")
	public Map<String, Object> recon(String billDate){
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		try {
			List<PayInfo> payInfoList = payInfoService.findByOrderSendTime(billDate);
			List<PaySystemOrder> paySystemList = paySystemOrderService.findByTradeTime(billDate);
			List<OutSystemOrder> outSystemList = outSystemOrderService.findByOrderPayTime(billDate);
			
			SysUser user = UserUtils.getCurrentUser();
			if((payInfoList!=null && payInfoList.size()>0) && (paySystemList!=null && paySystemList.size()>0) && (outSystemList!=null && outSystemList.size()>0)) {
				for (PayInfo payInfo : payInfoList) {
					for (PaySystemOrder ps : paySystemList) {
						for (OutSystemOrder os : outSystemList) {
							ThreePartyRecon sl = new ThreePartyRecon();
							if(payInfo.getOrderId().equals(ps.getOrderId()) && payInfo.getOrderId().equals(os.getOrderId())) {
								
								if(!payInfo.getOrderStatus().equals(ps.getTradeState()) && !payInfo.getOrderStatus().equals(os.getOrderStatus())) {
									sl.setBillType("00");
									sl.setOrderId(ps.getOrderId());
									sl.setRenconTime(billDate);
									sl.setTradeAmount(payInfo.getAmount());
									sl.setTradeTime(ps.getTradeTime());
									sl.setTradeType(payInfo.getPayType());
									sl.setTradeState(payInfo.getOrderStatus());
									sl.setReconState("01");
									sl.setFailMessage("订单状态不一致");
									sl.setCreater(user.getUsername());
									sl.setCreateTime(new Date());
									sl.setModifier(user.getUsername());
									sl.setModifyTime(new Date());
									threePartyReconService.insert(sl);
								}
								
								if(!payInfo.getAmount().equals(ps.getTradeAmount()) && !payInfo.getAmount().equals(os.getAmount())) {
									sl.setBillType("00");
									sl.setOrderId(ps.getOrderId());
									sl.setRenconTime(billDate);
									sl.setTradeAmount(payInfo.getAmount());
									sl.setTradeTime(ps.getTradeTime());
									sl.setTradeType(payInfo.getPayType());
									sl.setTradeState(payInfo.getOrderStatus());
									sl.setReconState("02");
									sl.setFailMessage("订单金额不一致");
									sl.setCreater(user.getUsername());
									sl.setCreateTime(new Date());
									sl.setModifier(user.getUsername());
									sl.setModifyTime(new Date());
									threePartyReconService.insert(sl);
								}
							}
						}
					}
				}
			}
		}catch (Exception e) {
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
