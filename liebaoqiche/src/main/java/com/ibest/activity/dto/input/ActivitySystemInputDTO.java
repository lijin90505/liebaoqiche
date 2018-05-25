package com.ibest.activity.dto.input;

import com.ibest.framework.common.persistence.BaseInputDTO;

public class ActivitySystemInputDTO extends BaseInputDTO {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String activityId;

	private String accessSystemId;

	private String state;

	private String identification;

	public String getActivityId() {
		return activityId;
	}

	public void setActivityId(String activityId) {
		this.activityId = activityId;
	}

	public String getAccessSystemId() {
		return accessSystemId;
	}

	public void setAccessSystemId(String accessSystemId) {
		this.accessSystemId = accessSystemId;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getIdentification() {
		return identification;
	}

	public void setIdentification(String identification) {
		this.identification = identification;
	}
}
