package com.ibest.card.dto.input;

import com.ibest.framework.common.persistence.BaseInputDTO;

import java.util.Date;

public class SystemCouponInputDTO extends BaseInputDTO {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	// 卡券名称
	private String couponName;

	// 卡券状态
	private Integer couponStatus;

	// 系统标识编号
	private String accessSystemId;

	// 卡券开始时间
	private Date startTime;

	// 卡券截止时间
	private Date endTime;

	public String getCouponName() {
		return couponName;
	}

	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}

	public Integer getCouponStatus() {
		return couponStatus;
	}

	public void setCouponStatus(Integer couponStatus) {
		this.couponStatus = couponStatus;
	}

	public String getAccessSystemId() {
		return accessSystemId;
	}

	public void setAccessSystemId(String accessSystemId) {
		this.accessSystemId = accessSystemId;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
}
