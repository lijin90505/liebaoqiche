package com.ibest.accesssystem.entity;

import java.util.Date;

import com.ibest.framework.common.persistence.BaseEntity;

public class CouponPermissionAssignment extends BaseEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

					
	//卡券编号
	private String couponId;

	//卡券名称
	private String couponName;
				
	// 系统标识
	private String systemSign;
				
	// 系统标识名称
	private String systemSignName;
						
	// 创建人
	private String creater;
				
	// 修改时间
	private Date createTime;
				
	// 修改人
	private String modifier;
				
	// 修改时间
	private Date modifyTime;
				
	// 版本
	private String version;

	public String getCouponId() {
		return couponId;
	}

	public void setCouponId(String couponId) {
		this.couponId = couponId;
	}

	public String getCouponName() {
		return couponName;
	}

	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}

	public String getSystemSign(){
		return systemSign;
	}
	
	public void setSystemSign(String systemSign){
		this.systemSign = systemSign;
	}
				
	public String getSystemSignName(){
		return systemSignName;
	}
	
	public void setSystemSignName(String systemSignName){
		this.systemSignName = systemSignName;
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
