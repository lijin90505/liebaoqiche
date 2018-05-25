package com.ibest.card.entity;

import java.util.Date;

import com.ibest.experience.enums.EnumsPlatformType;
import com.ibest.framework.common.persistence.BaseEntity;

public class UserCardCount extends BaseEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

					
	// user_id
	private String userId;
	private String userName;

	// access_system_id
	private String accessSystemId;

	// app_id
	private String appId;
	private String appIdDesc;

	// vin_no
	private String vinNo;

	// card_id
	private String cardId;
	private String cardName;

	// number
	private Integer number;
			
	//未使用
	private String noUsed;
	//使用中
	private String useing;
	//使用
	private String used;
	//过期
	private String past;
	//总数量
	private String totalNum;
	private String remarks;
	
	
	public String getUseing() {
		return useing;
	}

	public void setUseing(String useing) {
		this.useing = useing;
	}

	public String getNoUsed() {
		return noUsed;
	}

	public void setNoUsed(String noUsed) {
		this.noUsed = noUsed;
	}

	public String getUsed() {
		return used;
	}

	public void setUsed(String used) {
		this.used = used;
	}

	public String getPast() {
		return past;
	}

	public void setPast(String past) {
		this.past = past;
	}

	public String getTotalNum() {
		return totalNum;
	}

	public void setTotalNum(String totalNum) {
		this.totalNum = totalNum;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
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

	public String getAccessSystemId() {
		return accessSystemId;
	}

	public void setAccessSystemId(String accessSystemId) {
		this.accessSystemId = accessSystemId;
	}

	public String getAppId() {
		return appId;
	}

	public void setAppId(String appId) {
		this.appId = appId;
	}

	public String getCardId(){
		return cardId;
	}
	
	public void setCardId(String cardId){
		this.cardId = cardId;
	}
				
	public Integer getNumber(){
		return number;
	}
	
	public void setNumber(Integer number){
		this.number = number;
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
	
	public String getAppIdDesc() {
		return appIdDesc = EnumsPlatformType.getLabel(appId);
	}
}
