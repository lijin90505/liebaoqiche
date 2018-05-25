package com.ibest.experience.dto.input;

import com.ibest.framework.common.enums.EnumsAppType;
import com.ibest.framework.common.persistence.BaseInputDTO;

public class UserExperienceInputDTO extends BaseInputDTO {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String id;
	private String activitySystemId;
	private String accessSystemId;
	private String systemName;
	private String appId;
	private String appName;
	private String userId;
	private String userName;
	private String vinNo;
	private String experienceId;
	private String experience;
	private String activityId;
	private String access;
	
	

	


	public String getActivityId() {
		return activityId;
	}




	public void setActivityId(String activityId) {
		this.activityId = activityId;
	}




	public String getActivitySystemId() {
		return activitySystemId;
	}




	public void setActivitySystemId(String activitySystemId) {
		this.activitySystemId = activitySystemId;
	}




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




	public String getUserId() {
		return userId;
	}




	public void setUserId(String userId) {
		this.userId = userId;
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




	public String getExperienceId() {
		return experienceId;
	}




	public void setExperienceId(String experienceId) {
		this.experienceId = experienceId;
	}




	public String getExperience() {
		return experience;
	}




	public void setExperience(String experience) {
		this.experience = experience;
	}




	public String getAccess() {
		return access;
	}




	public void setAccess(String access) {
		this.access = access;
	}




	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getAppName() {
		return appName = EnumsAppType.getLable(this.appId);
	}
}
