package com.ibest.user.entity;

import java.util.Date;

import com.ibest.framework.common.persistence.BaseEntity;

public class UserLevel extends BaseEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

					
	// 认证等级
	private String level;
				
	// 认证等级名称
	private String levelName;
				
	// 创建时间
	private Date createTime;
				
	// 修改时间
	private Date modifyTime;
				
	// 创建人ID
	private String createUserId;
				
	// 创建人名称
	private String createUserName;
				
	// 修改人ID
	private String modifyUserId;
				
	// 修改人名称
	private String modifyUserName;

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public String getLevelName(){
		return levelName;
	}
	
	public void setLevelName(String levelName){
		this.levelName = levelName;
	}
				
	public Date getCreateTime(){
		return createTime;
	}
	
	public void setCreateTime(Date createTime){
		this.createTime = createTime;
	}
				
	public Date getModifyTime(){
		return modifyTime;
	}
	
	public void setModifyTime(Date modifyTime){
		this.modifyTime = modifyTime;
	}
				
	public String getCreateUserId(){
		return createUserId;
	}
	
	public void setCreateUserId(String createUserId){
		this.createUserId = createUserId;
	}
				
	public String getCreateUserName(){
		return createUserName;
	}
	
	public void setCreateUserName(String createUserName){
		this.createUserName = createUserName;
	}
				
	public String getModifyUserId(){
		return modifyUserId;
	}
	
	public void setModifyUserId(String modifyUserId){
		this.modifyUserId = modifyUserId;
	}
				
	public String getModifyUserName(){
		return modifyUserName;
	}
	
	public void setModifyUserName(String modifyUserName){
		this.modifyUserName = modifyUserName;
	}
					
}
