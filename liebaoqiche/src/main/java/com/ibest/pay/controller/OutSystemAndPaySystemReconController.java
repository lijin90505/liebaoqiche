package com.ibest.pay.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ibest.framework.common.persistence.BaseController;
import com.ibest.framework.common.utils.PageList;
import com.ibest.pay.dto.input.OutSystemAndPaySystemReconInputDTO;
import com.ibest.pay.dto.input.OutSystemOrderInputDTO;
import com.ibest.pay.dto.input.PayInfoInputDTO;
import com.ibest.pay.dto.input.WechatPayReconInputDTO;
import com.ibest.pay.dto.output.OutSystemAndPaySystemReconOutputDTO;
import com.ibest.pay.entity.OutSystemOrder;
import com.ibest.pay.entity.PayInfo;
import com.ibest.pay.entity.WechatPayRecon;
import com.ibest.pay.service.OutSystemOrderService;
import com.ibest.pay.service.PayInfoService;
import com.ibest.pay.service.WechatPayReconService;

/**
 * 接入系统和支付系统对账
 * @ClassName: OutSystemAndPaySystemReconController 
 * @author: WeiJia  
 * @date: 2018年4月12日上午10:58:39
 */
@Controller
@RequestMapping(value="${adminPath}/pay/outSystemAndPaySystemRecon")
public class OutSystemAndPaySystemReconController extends BaseController{
	
	@Autowired
	private OutSystemOrderService outSystemOrderService; 
	
	@Autowired
	private PayInfoService payInfoService;
	
	@Autowired
	private WechatPayReconService wechatPayReconService;
	
	/**
	* 进入到列表页
	*/
	@RequestMapping(value="/")
	public String index(){
		return "module/pay/outSystemAndPaySystemRecon/outSystemAndPaySystemReconList";
	}

	/**
	* 异步分页查询
	 * @throws Exception 
	*/
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequiresPermissions("outSystemAndPaySystemRecon:query")
	@RequestMapping(value="/list")
	public PageList<OutSystemAndPaySystemReconOutputDTO> list(OutSystemAndPaySystemReconInputDTO input ,HttpServletRequest request) throws Exception{
		PageList<OutSystemAndPaySystemReconOutputDTO> pageList = new PageList<OutSystemAndPaySystemReconOutputDTO>();
		
		
		PageList<PayInfo> payPageList = payInfoService.findByPage(new PageList<PayInfo>(), new PayInfoInputDTO());
		List<PayInfo> payInfoList = payPageList.getRows();
		
		PageList<OutSystemOrder> outSysPageList = outSystemOrderService.findByPage(new PageList<OutSystemOrder>(), new OutSystemOrderInputDTO());
		List<OutSystemOrder> outSysOrderList = outSysPageList.getRows();
		
		PageList<WechatPayRecon> payReconPageList = wechatPayReconService.findByPage(new PageList<WechatPayRecon>(), new WechatPayReconInputDTO());
		List<WechatPayRecon> payReconList = payReconPageList.getRows();
		
		List<OutSystemAndPaySystemReconOutputDTO> list = new ArrayList<OutSystemAndPaySystemReconOutputDTO>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if(payPageList.getRows()!=null && outSysPageList.getRows()!=null && payReconPageList.getRows()!=null) {
			for (PayInfo  pi :payInfoList) {
				for (WechatPayRecon wp : payReconList) {
					for (OutSystemOrder os : outSysOrderList) {
						OutSystemAndPaySystemReconOutputDTO oas = new OutSystemAndPaySystemReconOutputDTO(); 
						if(pi.getOrderId().equals(wp.getOrderId()) && pi.getOrderId().equals(os.getOrderId())) {
							oas.setOrderAmount(pi.getAmount());
							oas.setOrderId(pi.getOrderId());
							oas.setOrderStatus(pi.getOrderStatus());
							oas.setOsOrderAmount(os.getAmount());
							oas.setOsOrderStatus(os.getOrderStatus());
							oas.setPayTime(sdf.format(pi.getOrderSendTime()));
							oas.setPsOrderAmount(wp.getTotalAmount());
							oas.setPsPayTime(wp.getTradeTime());
							oas.setPsOrderStatus(wp.getTradeState());
							oas.setPayType(pi.getPayType());
							list.add(oas);
						}
					}
				}
			}
		}
		pageList.setRows(list);
		return pageList;
	}
}
