package com.ibest.pay.dto.input;

import com.ibest.framework.common.persistence.BaseInputDTO;

public class PayInfoInputDTO extends BaseInputDTO {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String orderId;
	
	private String orderSendTime;
	
	private String orderStatus;
	
	private String serialNo;

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getOrderSendTime() {
		return orderSendTime;
	}

	public void setOrderSendTime(String orderSendTime) {
		this.orderSendTime = orderSendTime;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public String getSerialNo() {
		return serialNo;
	}

	public void setSerialNo(String serialNo) {
		this.serialNo = serialNo;
	}
}
