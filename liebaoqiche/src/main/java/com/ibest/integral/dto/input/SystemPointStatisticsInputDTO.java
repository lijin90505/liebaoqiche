package com.ibest.integral.dto.input;

import com.ibest.framework.common.persistence.BaseInputDTO;

import java.util.Date;

public class SystemPointStatisticsInputDTO extends BaseInputDTO {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	// point_type_id
	private String pointTypeId;

	// point_rule_id
	private String pointRuleId;

	// system_id
	private String systemId;

	// start_time
	private Date startTime;

	// end_time
	private Date endTime;

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

	public String getSystemId() {
		return systemId;
	}

	public void setSystemId(String systemId) {
		this.systemId = systemId;
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
