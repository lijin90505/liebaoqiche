package com.ibest.activity.dto.input;

import com.ibest.framework.common.persistence.BaseInputDTO;

public class ActivityCardInputDTO extends BaseInputDTO {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String activityId;

	public String getActivityId() {
		return activityId;
	}

	public void setActivityId(String activityId) {
		this.activityId = activityId;
	}
}
