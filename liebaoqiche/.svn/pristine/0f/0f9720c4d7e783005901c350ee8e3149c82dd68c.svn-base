package com.ibest.activity.entity;

import java.util.Date;

import com.ibest.activity.enums.EnumsActivityStatus;
import com.ibest.framework.common.persistence.BaseEntity;

public class ActivitySystem extends BaseEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

					
	// activity_id
	private String activityId;
	private String activityName;

	// access_system_id
	private String accessSystemId;
	private String accessSystemName;

	// 状态；0未开始，1进行中，2关闭
	private String state;
	private String stateDesc;
	
	private String relevance;
	
	public String getRelevance() {
		return relevance;
	}

	public void setRelevance(String relevance) {
		this.relevance = relevance;
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
									
	public String getActivityId(){
		return activityId;
	}
	
	public void setActivityId(String activityId){
		this.activityId = activityId;
	}
				
	public String getAccessSystemId(){
		return accessSystemId;
	}
	
	public void setAccessSystemId(String accessSystemId){
		this.accessSystemId = accessSystemId;
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


	public String getActivityName() {
		return activityName;
	}

	public void setActivityName(String activityName) {
		this.activityName = activityName;
	}

	public String getAccessSystemName() {
		return accessSystemName;
	}

	public void setAccessSystemName(String accessSystemName) {
		this.accessSystemName = accessSystemName;
	}

	public String getStateDesc() {
		return stateDesc = EnumsActivityStatus.getLabel(this.state);
	}
}
