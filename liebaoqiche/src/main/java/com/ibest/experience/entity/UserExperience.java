package com.ibest.experience.entity;

import java.util.Date;

import com.ibest.framework.common.enums.EnumsAppType;
import com.ibest.framework.common.persistence.BaseEntity;

public class UserExperience extends BaseEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

					
	// user_id
	private String userId;
	private String userName;

	// vin_no
	private String vinNo;
				
	// experience_id
	private String experienceId;
	private String experience;
	
	private int number;
	
	// activity_system_id
	private String activitySystemId;
	private String activitySystemName;

	// access_system_id
	private String accessSystemId;

	// app_id
	private String appId;
	private String appName;

	// activity_id
	private String activityId;

	// consume_num
	private int consumeNum;

	// type
	private String type;

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
	
	private String access;
	
	private String remarks;
	
	
									
	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public String getAccess() {
		return access;
	}

	public void setAccess(String access) {
		this.access = access;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

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
				
	public String getExperienceId(){
		return experienceId;
	}
	
	public void setExperienceId(String experienceId){
		this.experienceId = experienceId;
	}
				
	public String getActivitySystemId(){
		return activitySystemId;
	}
	
	public void setActivitySystemId(String activitySystemId){
		this.activitySystemId = activitySystemId;
	}
				
	public String getAppId(){
		return appId;
	}
	
	public void setAppId(String appId){
		this.appId = appId;
	}

	public String getAccessSystemId() {
		return accessSystemId;
	}

	public void setAccessSystemId(String accessSystemId) {
		this.accessSystemId = accessSystemId;
	}

	public String getActivityId() {
		return activityId;
	}

	public void setActivityId(String activityId) {
		this.activityId = activityId;
	}

	public int getConsumeNum() {
		return consumeNum;
	}

	public void setConsumeNum(int consumeNum) {
		this.consumeNum = consumeNum;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
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

	public String getExperience() {
		return experience;
	}

	public void setExperience(String experience) {
		this.experience = experience;
	}

	public String getActivitySystemName() {
		return activitySystemName;
	}

	public void setActivitySystemName(String activitySystemName) {
		this.activitySystemName = activitySystemName;
	}

	public String getAppName() {
		return appName = EnumsAppType.getLable(this.appId);
	}
}
