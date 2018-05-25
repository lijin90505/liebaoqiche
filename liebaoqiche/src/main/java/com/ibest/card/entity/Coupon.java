package com.ibest.card.entity;

import java.util.Date;

import com.ibest.framework.common.persistence.BaseEntity;

public class Coupon extends BaseEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

							
	// 卡券名称
	private String couponName;
				
	// 卡券内容
	private String couponContent;
				
	// 卡券形式
	private String couponType;
				
	// 卡券生成编号
	private String couponBuildId;
				
	// 生成券名称
	private String couponBuildName;
				
	// 领取券名称
	private String couponGetName;
				
	// 领取券编号
	private String couponGetId;
				
	// 卡券用途编号
	private String conpouUseId;
				
	// 卡券用途名称
	private String couponUseName;
				
	// 创建人
	private String creater;
				
	// 创建时间
	private Date createTime;
				
	// 修改人
	private String modifier;
				
	// 修改时间
	private Date modifyTime;
				
	// version
	private String version;
											
	public String getCouponName(){
		return couponName;
	}
	
	public void setCouponName(String couponName){
		this.couponName = couponName;
	}
				
	public String getCouponContent(){
		return couponContent;
	}
	
	public void setCouponContent(String couponContent){
		this.couponContent = couponContent;
	}
				
	public String getCouponType(){
		return couponType;
	}
	
	public void setCouponType(String couponType){
		this.couponType = couponType;
	}
				
	public String getCouponBuildId(){
		return couponBuildId;
	}
	
	public void setCouponBuildId(String couponBuildId){
		this.couponBuildId = couponBuildId;
	}
				
	public String getCouponBuildName(){
		return couponBuildName;
	}
	
	public void setCouponBuildName(String couponBuildName){
		this.couponBuildName = couponBuildName;
	}
				
	public String getCouponGetName(){
		return couponGetName;
	}
	
	public void setCouponGetName(String couponGetName){
		this.couponGetName = couponGetName;
	}
				
	public String getCouponGetId(){
		return couponGetId;
	}
	
	public void setCouponGetId(String couponGetId){
		this.couponGetId = couponGetId;
	}
				
	public String getConpouUseId(){
		return conpouUseId;
	}
	
	public void setConpouUseId(String conpouUseId){
		this.conpouUseId = conpouUseId;
	}
				
	public String getCouponUseName(){
		return couponUseName;
	}
	
	public void setCouponUseName(String couponUseName){
		this.couponUseName = couponUseName;
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
