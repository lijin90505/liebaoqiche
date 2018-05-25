package com.ibest.integral.dto.input;

import com.ibest.framework.common.enums.EnumsAppType;
import com.ibest.framework.common.persistence.BaseInputDTO;

public class UserIntegralCountInputDTO extends BaseInputDTO {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String id;
	private String accessSystemId;
	private String systemName;
	private String appId;
	private String integralId;
	private String appName;
	private String userId;
	private String userName;
	private String vinNo;
	private String number;
	private String categoryName;
	private String remarks;
	private String type;
	
	

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAccessSystemId() {
		return accessSystemId;
	}

	public void setAccessSystemId(String accessSystemId) {
		this.accessSystemId = accessSystemId;
	}

	public String getSystemName() {
		return systemName;
	}

	public void setSystemName(String systemName) {
		this.systemName = systemName;
	}

	public String getAppId() {
		return appId;
	}

	public void setAppId(String appId) {
		this.appId = appId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getVinNo() {
		return vinNo;
	}

	public void setVinNo(String vinNo) {
		this.vinNo = vinNo;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getAppName() {
		return appName = EnumsAppType.getLable(this.appId);
	}

	public String getIntegralId() {
		return integralId;
	}

	public void setIntegralId(String integralId) {
		this.integralId = integralId;
	}
	
	
}
