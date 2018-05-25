package com.ibest.card.dto.input;

import com.ibest.framework.common.persistence.BaseInputDTO;

public class CouponInputDTO extends BaseInputDTO {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	// 卡券名称
	private String couponName;

	// 卡券内容
	private String couponContent;

	public String getCouponName() {
		return couponName;
	}

	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}

	public String getCouponContent() {
		return couponContent;
	}

	public void setCouponContent(String couponContent) {
		this.couponContent = couponContent;
	}
}
