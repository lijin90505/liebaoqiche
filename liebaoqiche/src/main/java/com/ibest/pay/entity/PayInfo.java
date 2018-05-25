package com.ibest.pay.entity;

import java.util.Date;

import com.ibest.framework.common.persistence.BaseEntity;

public class PayInfo extends BaseEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

					
	/**
	 * 商户订单号
	 */ 
	private String orderId;
				
	/**
	 * 流水号
	 */ 
	private String serialNo;
				
	/**
	 * 交易金额,以分为单位
	 */ 
	private String amount;
				
	/**
	 * 00：银联网关；01：支付宝扫码；02：支付宝APP；03：微信扫码；04：微信APP；05：微信公众号
	 */ 
	private String payType;
				
	/**
	 * 01：经销商管理系统；02：APP；03：UBI保险
	 */ 
	private String outSystemId;
				
	/**
	 * 01：PC端；02：APP；03：H5；04：公众号；05：小程序
	 */ 
	private String deviceId;
				
	/**
	 * 回调url(不能带参数)
	 */ 
	private String notifyUrl;
				
	/**
	 * 00:成功；01:失败；02:未知错误请查询交易状态;03申请退款中
	 */ 
	private String orderStatus;
				
	/**
	 * 订单发送时间
	 */ 
	private Date orderSendTime;
				
	/**
	 * 订单成交时间
	 */ 
	private Date doneTime;
				
	/**
	 * 用户id
	 */ 
	private String userId;
																	
	public String getOrderId(){
		return orderId;
	}
	
	public void setOrderId(String orderId){
		this.orderId = orderId;
	}
				
	public String getSerialNo(){
		return serialNo;
	}
	
	public void setSerialNo(String serialNo){
		this.serialNo = serialNo;
	}
				
	public String getAmount(){
		return amount;
	}
	
	public void setAmount(String amount){
		this.amount = amount;
	}
				
	public String getPayType(){
		return payType;
	}
	
	public void setPayType(String payType){
		this.payType = payType;
	}
				
	public String getOutSystemId(){
		return outSystemId;
	}
	
	public void setOutSystemId(String outSystemId){
		this.outSystemId = outSystemId;
	}
				
	public String getDeviceId(){
		return deviceId;
	}
	
	public void setDeviceId(String deviceId){
		this.deviceId = deviceId;
	}
				
	public String getNotifyUrl(){
		return notifyUrl;
	}
	
	public void setNotifyUrl(String notifyUrl){
		this.notifyUrl = notifyUrl;
	}
				
	public String getOrderStatus(){
		return orderStatus;
	}
	
	public void setOrderStatus(String orderStatus){
		this.orderStatus = orderStatus;
	}
				
	public Date getOrderSendTime(){
		return orderSendTime;
	}
	
	public void setOrderSendTime(Date orderSendTime){
		this.orderSendTime = orderSendTime;
	}
				
	public Date getDoneTime(){
		return doneTime;
	}
	
	public void setDoneTime(Date doneTime){
		this.doneTime = doneTime;
	}
				
	public String getUserId(){
		return userId;
	}
	
	public void setUserId(String userId){
		this.userId = userId;
	}
													
}
