package com.ibest.accesssystem.dto.input;

import com.ibest.framework.common.persistence.BaseInputDTO;

public class PayChannelPermissionAssignmentInputDTO extends BaseInputDTO {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String systemSign;
	
	private String systemSignName;
	
	private String payTypeId;
	
	
	public String getSystemSign() {
		return systemSign;
	}

	public void setSystemSign(String systemSign) {
		this.systemSign = systemSign;
	}

	public String getSystemSignName() {
		return systemSignName;
	}

	public void setSystemSignName(String systemSignName) {
		this.systemSignName = systemSignName;
	}

	public String getPayTypeId() {
		return payTypeId;
	}

	public void setPayTypeId(String payTypeId) {
		this.payTypeId = payTypeId;
	}
}
