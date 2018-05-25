package com.ibest.integral.entity;

import java.util.Date;

import com.ibest.framework.common.persistence.BaseEntity;
import com.ibest.integral.enums.EnumsPointRuleType;

public class PointRule extends BaseEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

					
	// 积分规则名
	private String pointName;

	// 积分类别编号
	private String pointTypeId;

	//积分类别名称
	private String pointTypeName;

	//积分规则类别（汇入/消费）
	private String pointRuleTypeId;

	// 积分规则类别解释字段
	private String pointRuleTypeDesc;
	
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
				
	// 备注
	private String remarks;

	public String getPointName(){
		return pointName;
	}
	
	public void setPointName(String pointName){
		this.pointName = pointName;
	}

	public String getPointTypeId() {
		return pointTypeId;
	}

	public void setPointTypeId(String pointTypeId) {
		this.pointTypeId = pointTypeId;
	}

	public String getPointTypeName() {
		return pointTypeName;
	}

	public void setPointTypeName(String pointTypeName) {
		this.pointTypeName = pointTypeName;
	}

	public String getPointRuleTypeId() {
		return pointRuleTypeId;
	}

	public void setPointRuleTypeId(String pointRuleTypeId) {
		this.pointRuleTypeId = pointRuleTypeId;
	}

	public String getPointRuleTypeDesc() {return pointRuleTypeDesc = EnumsPointRuleType.getLabel(pointRuleTypeId); }

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
				
	public String getRemark(){
		return remarks;
	}

	public void setRemark(String remark){
		this.remarks = remark;
	}

}
