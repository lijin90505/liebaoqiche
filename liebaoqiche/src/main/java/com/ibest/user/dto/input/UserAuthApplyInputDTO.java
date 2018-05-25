package com.ibest.user.dto.input;

import com.ibest.framework.common.persistence.BaseInputDTO;

public class UserAuthApplyInputDTO extends BaseInputDTO {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String realname;
	private String levelId;
	private String platform;
	private String outSystemName;

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public String getLevelId() {
		return levelId;
	}

	public void setLevelId(String levelId) {
		this.levelId = levelId;
	}

	public String getPlatform() {
		return platform;
	}

	public void setPlatform(String platform) {
		this.platform = platform;
	}

	public String getOutSystemName() {
		return outSystemName;
	}

	public void setOutSystemName(String outSystemName) {
		this.outSystemName = outSystemName;
	}
}
