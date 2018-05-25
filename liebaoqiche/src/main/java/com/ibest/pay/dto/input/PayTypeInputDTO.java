package com.ibest.pay.dto.input;

import com.ibest.framework.common.persistence.BaseInputDTO;

public class PayTypeInputDTO extends BaseInputDTO {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String payType;
	
	private String payName;

	public String getPayType() {
		return payType;
	}

	public void setPayType(String payType) {
		this.payType = payType;
	}

	public String getPayName() {
		return payName;
	}

	public void setPayName(String payName) {
		this.payName = payName;
	}
}
