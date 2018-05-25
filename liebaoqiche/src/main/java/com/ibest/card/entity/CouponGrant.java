package com.ibest.card.entity;

import java.util.Date;

import com.ibest.framework.common.persistence.BaseEntity;

public class CouponGrant extends BaseEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

					
	// 卡券名称
	private String couponName;
				
	// 数量
	private String grantNum;
				
	// 发放用户编号
	private String grantUserId;
				
	// 发放用户名称
	private String grantUsername;
				
	// 系统标识
	private String signId;
				
	// 系统名称
	private String systemSignName;
				
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
									
	public String getCouponName(){
		return couponName;
	}
	
	public void setCouponName(String couponName){
		this.couponName = couponName;
	}
				
	public String getGrantNum(){
		return grantNum;
	}
	
	public void setGrantNum(String grantNum){
		this.grantNum = grantNum;
	}
				
	public String getGrantUserId(){
		return grantUserId;
	}
	
	public void setGrantUserId(String grantUserId){
		this.grantUserId = grantUserId;
	}
				
	public String getGrantUsername(){
		return grantUsername;
	}
	
	public void setGrantUsername(String grantUsername){
		this.grantUsername = grantUsername;
	}
				
	public String getSignId(){
		return signId;
	}
	
	public void setSignId(String signId){
		this.signId = signId;
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
