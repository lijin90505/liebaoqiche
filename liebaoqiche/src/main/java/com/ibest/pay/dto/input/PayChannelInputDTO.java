package com.ibest.pay.dto.input;

import com.ibest.framework.common.persistence.BaseInputDTO;

public class PayChannelInputDTO extends BaseInputDTO {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	// 支付渠道名称
	private String payChannelName;

	public String getPayChannelName() {
		return payChannelName;
	}

	public void setPayChannelName(String payChannelName) {
		this.payChannelName = payChannelName;
	}

	
}
