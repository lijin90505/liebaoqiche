package com.ibest.activity.entity;

import java.util.Date;

import com.ibest.framework.common.persistence.BaseEntity;

public class Activity extends BaseEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

					
	// 活动id
	private String activityDetailsId;
				
	// 活动名称
	private String activityDetailsName;

	// 积分id
	private String integralId;

	// 积分名称
	private String integralName;

	// 卡券id
	private String cardId;

	// 卡券名称
	private String cardName;

	// 经验值id
	private String experienceId;
				
	// 经验值名称
	private String experienceName;
	private String isIntegral;
	private String isCard;
	private String isExperience;

	// 状态；0可用，1不可用
	private String state;
				
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
									
	public String getActivityDetailsId(){
		return activityDetailsId;
	}
	
	public void setActivityDetailsId(String activityDetailsId){
		this.activityDetailsId = activityDetailsId;
	}
				
	public String getActivityDetailsName(){
		return activityDetailsName;
	}

	public void setActivityDetailsName(String activityDetailsName){
		this.activityDetailsName = activityDetailsName;
	}

	public String getIntegralId(){
		return integralId;
	}

	public void setIntegralId(String integralId){
		this.integralId = integralId;
	}

	public String getIntegralName(){
		return integralName;
	}

	public void setIntegralName(String integralName){
		this.integralName = integralName;
	}

	public String getCardId(){
		return cardId;
	}

	public void setCardId(String cardId){
		this.cardId = cardId;
	}
	
	

	

	public String getIsIntegral() {
		return isIntegral;
	}

	public void setIsIntegral(String isIntegral) {
		this.isIntegral = isIntegral;
	}

	public String getIsCard() {
		return isCard;
	}

	public void setIsCard(String isCard) {
		this.isCard = isCard;
	}

	public String getIsExperience() {
		return isExperience;
	}

	public void setIsExperience(String isExperience) {
		this.isExperience = isExperience;
	}

	public String getCardName(){
		return cardName;
	}

	public void setCardName(String cardName){
		this.cardName = cardName;
	}

	public String getExperienceId(){
		return experienceId;
	}
	
	public void setExperienceId(String experienceId){
		this.experienceId = experienceId;
	}
				
	public String getExperienceName(){
		return experienceName;
	}

	public void setExperienceName(String experienceName){
		this.experienceName = experienceName;
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
					
}
