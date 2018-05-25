package com.ibest.activity.entity;

import java.util.Date;

import com.ibest.framework.common.enums.EnumsAppType;
import com.ibest.framework.common.persistence.BaseEntity;

public class UserActivity extends BaseEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

					
	// user_id
	private String userId;
	private String userName;

	// vin_no
	private String vinNo;
				
	// activity_system_id
	private String activitySystemId;
				
	//活动名称
	private String activityName;
	
	
	
	public String getActivityName() {
		return activityName;
	}

	public void setActivityName(String activityName) {
		this.activityName = activityName;
	}

	// access_system_id
	private String accessSystemId;
	private String accessSystemName;

	// app_id
	private String appId;
	private String appName;

	// activity_id
	private String activityId;

	//参与活动时间
	private Date participationActivityTime;

	// 创建人
	private String creater;
				
	// 创建时间
	private Date createTime;
				
	// 修改人
	private String modifier;
				
	// 修改时间
	private Date modifyTime;
				
	// 版本
	private String version;
									
	public String getUserId(){
		return userId;
	}
	
	public void setUserId(String userId){
		this.userId = userId;
	}
				
	public String getVinNo(){
		return vinNo;
	}
	
	public void setVinNo(String vinNo){
		this.vinNo = vinNo;
	}
				
	public String getActivitySystemId(){
		return activitySystemId;
	}
	
	public void setActivitySystemId(String activitySystemId){
		this.activitySystemId = activitySystemId;
	}
				
	public String getAccessSystemId(){
		return accessSystemId;
	}
	
	public void setAccessSystemId(String accessSystemId){
		this.accessSystemId = accessSystemId;
	}
				
	public String getAppId(){
		return appId;
	}
	
	public void setAppId(String appId){
		this.appId = appId;
	}

	public String getActivityId() {
		return activityId;
	}

	public void setActivityId(String activityId) {
		this.activityId = activityId;
	}

	public Date getParticipationActivityTime() {
		return participationActivityTime;
	}

	public void setParticipationActivityTime(Date participationActivityTime) {
		this.participationActivityTime = participationActivityTime;
	}

	public String getCreater(){
		return creater;
	}
	
	public void setCreater(String creater){
		this.creater = creater;
	}
				
	public Date getCreateTime(){
		return createTime;
	}
	
	public void setCreateTime(Date createTime){
		this.createTime = createTime;
	}
				
	public String getModifier(){
		return modifier;
	}
	
	public void setModifier(String modifier){
		this.modifier = modifier;
	}
				
	public Date getModifyTime(){
		return modifyTime;
	}
	
	public void setModifyTime(Date modifyTime){
		this.modifyTime = modifyTime;
	}
				
	public String getVersion(){
		return version;
	}
	
	public void setVersion(String version){
		this.version = version;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getAccessSystemName() {
		return accessSystemName;
	}

	public void setAccessSystemName(String accessSystemName) {
		this.accessSystemName = accessSystemName;
	}

	public String getAppName() {
		return appName = EnumsAppType.getLable(this.appId);
	}


}
