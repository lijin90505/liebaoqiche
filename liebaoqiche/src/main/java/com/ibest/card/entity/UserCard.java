package com.ibest.card.entity;

import java.util.Date;

import com.ibest.card.enums.EnumsCardUseStatus;
import com.ibest.framework.common.enums.EnumsAppType;
import com.ibest.framework.common.persistence.BaseEntity;

public class UserCard extends BaseEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

					
	// user_id
	private String userId;
	private String userName;

	// vin_no
	private String vinNo;
				
	// card_id
	private String cardId;
	private String cardName;

	// access_system_id
	private String accessSystemId;
	private String accessSystemName;

	//经销商id
	private String dealerId;
	
	// app_id
	private String appId;
	private String appName;

	// activity_system_id
	private String activitySystemId;

	// card_no
	private String cardNo;

	// activity_id
	private String activityId;

	// 状态；0未使用，1已使用
	private String state;
	private String stateDesc;

	//新增sql共同的字段
	private String systemName;
	private String remarks;
	
	//卡券有效期
	private String expiryDate;
	
	
	
	public String getDealerId() {
		return dealerId;
	}

	public void setDealerId(String dealerId) {
		this.dealerId = dealerId;
	}

	public String getExpiryDate() {
		return expiryDate;
	}

	public void setExpiryDate(String expiryDate) {
		this.expiryDate = expiryDate;
	}

	public String getSystemName() {
		return systemName;
	}

	public void setSystemName(String systemName) {
		this.systemName = systemName;
	}


	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getActivitySystemId() {
		return activitySystemId;
	}

	public void setActivitySystemId(String activitySystemId) {
		this.activitySystemId = activitySystemId;
	}

	public String getCardNo() {
		return cardNo;
	}

	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}

	public String getActivityId() {
		return activityId;
	}

	public void setActivityId(String activityId) {
		this.activityId = activityId;
	}

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
				
	public String getCardId(){
		return cardId;
	}
	
	public void setCardId(String cardId){
		this.cardId = cardId;
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
				
	public String getState(){
		return state;
	}
	
	public void setState(String state){
		this.state = state;
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

	public String getCardName() {
		return cardName;
	}

	public void setCardName(String cardName) {
		this.cardName = cardName;
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

	public String getStateDesc() {
		return stateDesc = EnumsCardUseStatus.getLabel(this.state);
	}
}
