package com.ibest.user.dto.output;

import java.util.Date;

import com.ibest.framework.common.persistence.BaseOutputDTO;

public class UserLevelOutputDTO extends BaseOutputDTO {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

					
	// 认证等级
	private Integer level;
				
	// 认证等级名称
	private String levelName;
				
	// 接入系统标识
	private String outSystemId;
				
	// 接入系统名称
	private String outSystemName;
				
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
									
	public Integer getLevel(){
		return level;
	}
	
	public void setLevel(Integer level){
		this.level = level;
	}
				
	public String getLevelName(){
		return levelName;
	}
	
	public void setLevelName(String levelName){
		this.levelName = levelName;
	}
				
	public String getOutSystemId(){
		return outSystemId;
	}
	
	public void setOutSystemId(String outSystemId){
		this.outSystemId = outSystemId;
	}
				
	public String getOutSystemName(){
		return outSystemName;
	}
	
	public void setOutSystemName(String outSystemName){
		this.outSystemName = outSystemName;
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
