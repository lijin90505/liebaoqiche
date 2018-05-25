package com.ibest.integral.dto.output;

import com.ibest.framework.common.persistence.BaseOutputDTO;

import java.util.Date;

public class PointTypeOutputDTO extends BaseOutputDTO {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	// 积分类别名称
	private Integer pointTypeId;

	// 积分类别名称
	private String pointTypeName;
	
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

	public Integer getPointTypeId() {
		return pointTypeId;
	}

	public void setPointTypeId(Integer pointTypeId) {
		this.pointTypeId = pointTypeId;
	}

	public String getPointTypeName(){
		return pointTypeName;
	}
	
	public void setPointTypeName(String pointTypeName){
		this.pointTypeName = pointTypeName;
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
				
	public String getRemark(){
		return remarks;
	}
	
	public void setRemark(String remark){
		this.remarks = remark;
	}
			
}
