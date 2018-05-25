package com.ibest.card.dto.input;

import com.ibest.framework.common.persistence.BaseInputDTO;

public class CouponGetInputDTO extends BaseInputDTO {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	// 卡券获取形式
	private String getType;

	public String getGetType() {
		return getType;
	}

	public void setGetType(String getType) {
		this.getType = getType;
	}
}
