package com.ibest.card.entity;

import java.util.Date;

import com.ibest.card.enums.EnumsCouponGrantStatus;
import com.ibest.framework.common.persistence.BaseEntity;

public class CouponRecall extends BaseEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

					
	// coupon_name
	private String couponName;
				
	// recall_num
	private String recallNum;
				
	// recall_user_id
	private String recallUserId;
				
	// recall_username
	private String recallUsername;

	private Integer status;

	private String statusDesc;
				
	// sign_id
	private String signId;
				
	// sign_name
	private String signName;
				
	// creater
	private String creater;
				
	// create_time
	private Date createTime;
				
	// modifier
	private String modifier;
				
	// modify_time
	private Date modifyTime;
				
	// version
	private String version;
				
	// remark
	private String remark;
							
	public String getCouponName(){
		return couponName;
	}
	
	public void setCouponName(String couponName){
		this.couponName = couponName;
	}
				
	public String getRecallNum(){
		return recallNum;
	}
	
	public void setRecallNum(String recallNum){
		this.recallNum = recallNum;
	}
				
	public String getRecallUserId(){
		return recallUserId;
	}
	
	public void setRecallUserId(String recallUserId){
		this.recallUserId = recallUserId;
	}
				
	public String getRecallUsername(){
		return recallUsername;
	}
	
	public void setRecallUsername(String recallUsername){
		this.recallUsername = recallUsername;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getStatusDesc() {return statusDesc = EnumsCouponGrantStatus.getLabel(this.status);}

	public String getSignId(){
		return signId;
	}
	
	public void setSignId(String signId){
		this.signId = signId;
	}
				
	public String getSignName(){
		return signName;
	}
	
	public void setSignName(String signName){
		this.signName = signName;
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
		return remark;
	}
	
	public void setRemark(String remark){
		this.remark = remark;
	}
			
}
