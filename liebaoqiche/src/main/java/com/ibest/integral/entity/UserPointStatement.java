package com.ibest.integral.entity;

import java.util.Date;

import com.ibest.framework.common.persistence.BaseEntity;

public class UserPointStatement extends BaseEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

					
	// 用户积分编号
	private String userPointId;

	//消耗积分
	private String consumePoint;
				
	// 汇入积分
	private Integer joinPoint;
				
	// 积分
	private Integer userPointCount;
				
	// 用户编号
	private String userId;
				
	// 用户名
	private String userName;
				
	// 积分类别编号
	private String pointTypeId;
				
	// 积分类别名称
	private String pointTypeName;
				
	// 积分规则编号
	private String pointRuleId;

	// 积分规则名称
	private String pointRuleName;

	//活动编号
	private String activityId;

	//活动名称
	private String activityName;

	// 终端类别
	private String terminalType;
				
	// 终端类别名称
	private String terminalTypeName;
				
	// 系统标识编号
	private String systemSign;
				
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
				
	public String getUserPointId(){
		return userPointId;
	}
	
	public void setUserPointId(String userPointId){
		this.userPointId = userPointId;
	}

	public String getConsumePoint() {
		return consumePoint;
	}

	public void setConsumePoint(String consumePoint) {
		this.consumePoint = consumePoint;
	}

	public Integer getJoinPoint(){
		return joinPoint;
	}
	
	public void setJoinPoint(Integer joinPoint){
		this.joinPoint = joinPoint;
	}
				
	public Integer getUserPointCount(){
		return userPointCount;
	}
	
	public void setUserPointCount(Integer userPointCount){
		this.userPointCount = userPointCount;
	}
				
	public String getUserId(){
		return userId;
	}
	
	public void setUserId(String userId){
		this.userId = userId;
	}
				
	public String getUserName(){
		return userName;
	}
	
	public void setUserName(String userName){
		this.userName = userName;
	}
				
	public String getPointTypeId(){
		return pointTypeId;
	}
	
	public void setPointTypeId(String pointTypeId){
		this.pointTypeId = pointTypeId;
	}
				
	public String getPointTypeName(){
		return pointTypeName;
	}
	
	public void setPointTypeName(String pointTypeName){
		this.pointTypeName = pointTypeName;
	}
				
	public String getPointRuleId(){
		return pointRuleId;
	}
	
	public void setPointRuleId(String pointRuleId){
		this.pointRuleId = pointRuleId;
	}
				
	public String getPointRuleName(){
		return pointRuleName;
	}
	
	public void setPointRuleName(String pointRuleName){
		this.pointRuleName = pointRuleName;
	}

	public String getActivityId() {
		return activityId;
	}

	public void setActivityId(String activityId) {
		this.activityId = activityId;
	}

	public String getActivityName() {
		return activityName;
	}

	public void setActivityName(String activityName) {
		this.activityName = activityName;
	}

	public String getTerminalType(){
		return terminalType;
	}
	
	public void setTerminalType(String terminalType){
		this.terminalType = terminalType;
	}
				
	public String getTerminalTypeName(){
		return terminalTypeName;
	}
	
	public void setTerminalTypeName(String terminalTypeName){
		this.terminalTypeName = terminalTypeName;
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
