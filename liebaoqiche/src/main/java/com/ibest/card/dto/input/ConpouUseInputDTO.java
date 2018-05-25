package com.ibest.card.dto.input;

import com.ibest.framework.common.persistence.BaseInputDTO;

public class ConpouUseInputDTO extends BaseInputDTO {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	// 卡券用途
	private String couponUseName;

	public String getCouponUseName() {
		return couponUseName;
	}

	public void setCouponUseName(String couponUseName) {
		this.couponUseName = couponUseName;
	}
}
