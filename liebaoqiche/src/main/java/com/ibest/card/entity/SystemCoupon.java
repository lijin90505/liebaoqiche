package com.ibest.card.entity;

import java.util.Date;

import com.ibest.card.enums.EnumsCouponEditStatus;
import com.ibest.card.enums.EnumsCouponIsAppointments;
import com.ibest.card.enums.EnumsCouponIsSingleUse;
import com.ibest.card.enums.EnumsCouponOpenStatus;
import com.ibest.framework.common.persistence.BaseEntity;

public class SystemCoupon extends BaseEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

							
	// 卡券编号
	private String couponId;
				
	// 接入系统标识
	private String accessSystemId;
				
	// 接入系统名称
	private String accessSystemName;
				
	// 卡券使用记录编号
	private String couponUsedRecordId;
				
	// 卡券名称
	private String couponName;
				
	// 卡券内容
	private String couponContent;
				
	// 卡券开始时间
	private Date startTime;
				
	// 卡券截止时间
	private Date endTime;
				
	// 卡券识别码
	private String couponCheckCode;
				
	// 卡券状态
	private String couponStatus;

	private String couponStatusDesc;
				
	// 卡券编辑状态
	private String editStatus;

	private String editStatusDesc;
				
	// 卡券预发数量
	private Integer conponNum;
				
	// 卡券领取数量
	private Integer getCouponNum;
				
	// 卡券使用数量
	private Integer couponUsedNum;
				
	// 卡券最大领取数量
	private Integer maxGetConpouNum;
				
	// 卡券剩余数量
	private Integer conpouSurplusNum;
				
	// 是否需要预约
	private String isAppointments;
	private String isAppointmentsDesc;

	// 最低消费金额
	private Integer mininumConsumption;

	// 是否单次限用
	private String singleUseRefund;
	private String singleUseRefundDesc;

	// 卡券url
	private String couponUrl;
				
	// 图片url
	private String pictureUrl;
				
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
											
	public String getCouponId(){
		return couponId;
	}
	
	public void setCouponId(String couponId){
		this.couponId = couponId;
	}
				
	public String getAccessSystemId(){
		return accessSystemId;
	}
	
	public void setAccessSystemId(String accessSystemId){
		this.accessSystemId = accessSystemId;
	}
				
	public String getAccessSystemName(){
		return accessSystemName;
	}
	
	public void setAccessSystemName(String accessSystemName){
		this.accessSystemName = accessSystemName;
	}
				
	public String getCouponUsedRecordId(){
		return couponUsedRecordId;
	}
	
	public void setCouponUsedRecordId(String couponUsedRecordId){
		this.couponUsedRecordId = couponUsedRecordId;
	}
				
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
				
	public Date getStartTime(){
		return startTime;
	}
	
	public void setStartTime(Date startTime){
		this.startTime = startTime;
	}
				
	public Date getEndTime(){
		return endTime;
	}
	
	public void setEndTime(Date endTime){
		this.endTime = endTime;
	}
				
	public String getCouponCheckCode(){
		return couponCheckCode;
	}
	
	public void setCouponCheckCode(String couponCheckCode){
		this.couponCheckCode = couponCheckCode;
	}

	public String getCouponStatus() {
		return couponStatus;
	}

	public void setCouponStatus(String couponStatus) {
		this.couponStatus = couponStatus;
	}

	public String getEditStatus() {
		return editStatus;
	}

	public void setEditStatus(String editStatus) {
		this.editStatus = editStatus;
	}

	public Integer getConponNum(){
		return conponNum;
	}
	
	public void setConponNum(Integer conponNum){
		this.conponNum = conponNum;
	}
				
	public Integer getGetCouponNum(){
		return getCouponNum;
	}
	
	public void setGetCouponNum(Integer getCouponNum){
		this.getCouponNum = getCouponNum;
	}
				
	public Integer getCouponUsedNum(){
		return couponUsedNum;
	}
	
	public void setCouponUsedNum(Integer couponUsedNum){
		this.couponUsedNum = couponUsedNum;
	}
				
	public Integer getMaxGetConpouNum(){
		return maxGetConpouNum;
	}
	
	public void setMaxGetConpouNum(Integer maxGetConpouNum){
		this.maxGetConpouNum = maxGetConpouNum;
	}
				
	public Integer getConpouSurplusNum(){
		return conpouSurplusNum;
	}
	
	public void setConpouSurplusNum(Integer conpouSurplusNum){
		this.conpouSurplusNum = conpouSurplusNum;
	}
				
	public Integer getMininumConsumption(){
		return mininumConsumption;
	}
	
	public void setMininumConsumption(Integer mininumConsumption){
		this.mininumConsumption = mininumConsumption;
	}

	public String getIsAppointments() {
		return isAppointments;
	}

	public void setIsAppointments(String isAppointments) {
		this.isAppointments = isAppointments;
	}

	public String getSingleUseRefund() {
		return singleUseRefund;
	}

	public void setSingleUseRefund(String singleUseRefund) {
		this.singleUseRefund = singleUseRefund;
	}

	public String getCouponUrl(){
		return couponUrl;
	}
	
	public void setCouponUrl(String couponUrl){
		this.couponUrl = couponUrl;
	}
				
	public String getPictureUrl(){
		return pictureUrl;
	}
	
	public void setPictureUrl(String pictureUrl){
		this.pictureUrl = pictureUrl;
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


	public String getCouponStatusDesc() {
		return couponStatusDesc = EnumsCouponOpenStatus.getLabel(this.couponStatus);
	}

	public String getEditStatusDesc() {
		return editStatusDesc = EnumsCouponEditStatus.getLabel(this.editStatus);
	}

	public String getIsAppointmentsDesc() {return isAppointmentsDesc = EnumsCouponIsAppointments.getLabel(this.isAppointments);}

	public String getSingleUseRefundDesc() {return singleUseRefundDesc = EnumsCouponIsSingleUse.getLabel(this.isAppointments);}
}
