package com.ibest.pay.entity;

import com.ibest.framework.common.persistence.BaseEntity;

public class PayType extends BaseEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

					
	/**
	 * 支付渠道主键
	 */ 
	private String payChannelId;
	
	private String payChannelName;
				
	/**
	 * 支付类型；银联网关支付：00,支付宝电脑网站支付：01,支付宝手机网站支付：06,支付宝当面扫码支付：07,
	 * 支付宝APP支付：11,支付宝条码支付：02, 微信扫码支付：03,微信APP支付：04,微信公众号支付：05
	 */ 
	private String payType;
				
	/**
	 * 支付类型名称
	 */ 
	private String payName;
	
	private String updateBy;
	
	private String createBy;
	
	public String getPayChannelName() {
		return payChannelName;
	}

	public void setPayChannelName(String payChannelName) {
		this.payChannelName = payChannelName;
	}

	public String getPayChannelId(){
		return payChannelId;
	}
	
	public void setPayChannelId(String payChannelId){
		this.payChannelId = payChannelId;
	}
	
				
	public String getPayType(){
		return payType;
	}
	
	public void setPayType(String payType){
		this.payType = payType;
	}
	
				
	public String getPayName(){
		return payName;
	}
	
	public void setPayName(String payName){
		this.payName = payName;
	}

	public String getUpdateBy() {
		return updateBy;
	}

	public void setUpdateBy(String updateBy) {
		this.updateBy = updateBy;
	}

	public String getCreateBy() {
		return createBy;
	}

	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}
}
