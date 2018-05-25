package com.ibest.experience.entity;

import java.util.Date;

import com.ibest.framework.common.persistence.BaseEntity;

public class ExperienceGrade extends BaseEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	//终端id
	private String systemId;
					
	// 等级名称
	private String name;
				
	// 经验值左区间
	private Integer preExp;
				
	// 经验值右区间
	private Integer nextExp;
				
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
				
	
	
	public String getSystemId() {
		return systemId;
	}

	public void setSystemId(String systemId) {
		this.systemId = systemId;
	}

	public String getName(){
		return name;
	}
	
	public void setName(String name){
		this.name = name;
	}
				
	public Integer getPreExp(){
		return preExp;
	}
	
	public void setPreExp(Integer preExp){
		this.preExp = preExp;
	}
				
	public Integer getNextExp(){
		return nextExp;
	}
	
	public void setNextExp(Integer nextExp){
		this.nextExp = nextExp;
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
