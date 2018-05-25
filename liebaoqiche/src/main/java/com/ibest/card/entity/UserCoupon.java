package com.ibest.card.entity;

import java.util.Date;

import com.ibest.framework.common.persistence.BaseEntity;

public class UserCoupon extends BaseEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	// 卡券编号
	private String couponId;
					
	// 卡券名称
	private String couponName;
				
	// 卡券生成编号
	private String couponBuildId;

	// 卡券生成形式名称
	private String couponBuildName;
				
	// 卡券领取编号
	private String couponGetId;

	// 卡券领取形式名称
	private String couponGetName;
				
	// 卡券使用编号
	private String couponUseId;

	// 卡券使用形式名称
	private String couponUseName;
				
	// 数量
	private Integer num;
				
	// 使用数量
	private Integer useNum;
				
	// 剩余数量
	private Integer serplusNum;
				
	// 可用数量
	private Integer usableNum;
				
	// 过期数量
	private Integer overdueNum;
				
	// 用户编号
	private String userId;
				
	// 用户名称
	private String username;
				
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

	public String getCouponId() {
		return couponId;
	}

	public void setCouponId(String couponId) {
		this.couponId = couponId;
	}

	public String getCouponName(){
		return couponName;
	}
	
	public void setCouponName(String couponName){
		this.couponName = couponName;
	}

	public String getCouponBuildId() {
		return couponBuildId;
	}

	public void setCouponBuildId(String couponBuildId) {
		this.couponBuildId = couponBuildId;
	}

	public String getCouponGetId() {
		return couponGetId;
	}

	public void setCouponGetId(String couponGetId) {
		this.couponGetId = couponGetId;
	}

	public String getCouponUseId() {
		return couponUseId;
	}

	public void setCouponUseId(String couponUseId) {
		this.couponUseId = couponUseId;
	}

	public Integer getNum(){
		return num;
	}
	
	public void setNum(Integer num){
		this.num = num;
	}
				
	public Integer getUseNum(){
		return useNum;
	}
	
	public void setUseNum(Integer useNum){
		this.useNum = useNum;
	}
				
	public Integer getSerplusNum(){
		return serplusNum;
	}
	
	public void setSerplusNum(Integer serplusNum){
		this.serplusNum = serplusNum;
	}
				
	public Integer getUsableNum(){
		return usableNum;
	}
	
	public void setUsableNum(Integer usableNum){
		this.usableNum = usableNum;
	}
				
	public Integer getOverdueNum(){
		return overdueNum;
	}
	
	public void setOverdueNum(Integer overdueNum){
		this.overdueNum = overdueNum;
	}
				
	public String getUserId(){
		return userId;
	}
	
	public void setUserId(String userId){
		this.userId = userId;
	}
				
	public String getUsername(){
		return username;
	}
	
	public void setUsername(String username){
		this.username = username;
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

	public String getCouponBuildName() {
		return couponBuildName;
	}

	public void setCouponBuildName(String couponBuildName) {
		this.couponBuildName = couponBuildName;
	}

	public String getCouponGetName() {
		return couponGetName;
	}

	public void setCouponGetName(String couponGetName) {
		this.couponGetName = couponGetName;
	}

	public String getCouponUseName() {
		return couponUseName;
	}

	public void setCouponUseName(String couponUseName) {
		this.couponUseName = couponUseName;
	}
}
