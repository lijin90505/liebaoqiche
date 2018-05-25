package com.ibest.integral.dto.input;

import com.ibest.framework.common.persistence.BaseInputDTO;

public class UserPointInputDTO extends BaseInputDTO {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	// 用户名
	private String userName;

	// 积分类别名称
	private String pointTypeId;

	// 积分规则名称
	private String pointRuleId;

	//系统名称
	private String systemSign;

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPointTypeId() {
		return pointTypeId;
	}

	public void setPointTypeId(String pointTypeId) {
		this.pointTypeId = pointTypeId;
	}

	public String getPointRuleId() {
		return pointRuleId;
	}

	public void setPointRuleId(String pointRuleId) {
		this.pointRuleId = pointRuleId;
	}

	public String getSystemSign() {
		return systemSign;
	}

	public void setSystemSign(String systemSign) {
		this.systemSign = systemSign;
	}
}
