package com.ibest.activity.entity;

import java.util.Date;

import com.ibest.framework.common.persistence.BaseEntity;

public class ActivityCard extends BaseEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

					
	// card_id
	private String cardId;
				
	// activity_id
	private String activityId;
						
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
									
	public String getCardId(){
		return cardId;
	}
	
	public void setCardId(String cardId){
		this.cardId = cardId;
	}
				
	public String getActivityId(){
		return activityId;
	}
	
	public void setActivityId(String activityId){
		this.activityId = activityId;
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
