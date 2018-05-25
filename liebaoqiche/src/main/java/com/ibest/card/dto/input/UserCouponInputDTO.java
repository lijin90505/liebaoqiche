package com.ibest.card.dto.input;

import com.ibest.framework.common.persistence.BaseInputDTO;

public class UserCouponInputDTO extends BaseInputDTO {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	// 卡券名称
	private String couponName;

	// 卡券生成编号
	private Integer couponBuildId;

	// 卡券领取编号
	private Integer couponGetId;

	// 卡券使用形式名称
	private String couponUseId;

	// 用户名称
	private String username;

	// 系统标识
	private String signId;

	public String getCouponName() {
		return couponName;
	}

	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}

	public Integer getCouponBuildId() {
		return couponBuildId;
	}

	public void setCouponBuildId(Integer couponBuildId) {
		this.couponBuildId = couponBuildId;
	}

	public Integer getCouponGetId() {
		return couponGetId;
	}

	public void setCouponGetId(Integer couponGetId) {
		this.couponGetId = couponGetId;
	}

	public String getCouponUseId() {
		return couponUseId;
	}

	public void setCouponUseId(String couponUseId) {
		this.couponUseId = couponUseId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getSignId() {
		return signId;
	}

	public void setSignId(String signId) {
		this.signId = signId;
	}
}
