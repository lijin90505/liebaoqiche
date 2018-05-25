package com.ibest.integral.entity;

import java.util.Date;

import com.ibest.framework.common.persistence.BaseEntity;
import com.ibest.integral.enums.EnumsPointRuleType;
import com.ibest.integral.enums.EnumsPointType;

public class IntegralCategory extends BaseEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

					
	// 类别名称
	private String categoryName;
				
	// 类型：0加积分 1减积分
	private String type;
	private String typeDesc;
						
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
	
	//备注
	private String remarks;
	
	
									
	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getCategoryName(){
		return categoryName;
	}
	
	public void setCategoryName(String categoryName){
		this.categoryName = categoryName;
	}
				
	public String getType(){
		return type;
	}
	
	public void setType(String type){
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
	
	public String getTypeDesc() {
		return EnumsPointRuleType.getLabel(type);
	}
}
