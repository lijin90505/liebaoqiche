package com.ibest.pay.entity;

import java.util.Date;

import com.ibest.framework.common.persistence.BaseEntity;

public class PayRefundInfo extends BaseEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

					
	/**
	 * 支付信息主表
	 */ 
	private String payInfoId;
				
	/**
	 * 微信支付信息主表
	 */ 
	private String wechatPayInfoId;
				
	/**
	 * 接入系统标识,01：经销商管理系统；02：APP；03：UBI保险
	 */ 
	private String outSystemId;
				
	/**
	 * 退款渠道；01银联;02微信;03支付宝
	 */ 
	private String refundChannel;
				
	/**
	 * 用户唯一ID
	 */ 
	private String userId;
				
	/**
	 * 退款流水号（成功才有）
	 */ 
	private String refundNo;
				
	/**
	 * 商户订单号
	 */ 
	private String outTradeNo;
				
	/**
	 * 商户退款单号
	 */ 
	private String outRefundNo;
				
	/**
	 * 订单金额
	 */ 
	private String totalFee;
				
	/**
	 * 退款金额
	 */ 
	private String refundFee;
				
	/**
	 * 退款原因
	 */ 
	private String refundDesc;
				
	/**
	 * 回调URL
	 */ 
	private String notifyUrl;
				
	/**
	 * 退款状态；00成功，01失败;02退款关闭;03未知错误;04处理中
	 */ 
	private String refundStatus;
				
	/**
	 * 退款开始时间
	 */ 
	private Date refundStartTime;
				
	/**
	 * 退款结束时间
	 */ 
	private Date refundEndTime;
				
	/**
	 * 退款成功时间
	 */ 
	private Date refundSuccessTime;
				
	/**
	 * 退款入账账户；1退回银行卡({银行名称}{卡类型}{卡尾号});2退回支付用户零钱(支付用户零钱);3退还商户(商户基本账户,商户结算银行账户);4退回支付用户零钱通(支付用户零钱通)针对微信
	 */ 
	private String refundRecvAccout;
				
	/**
	 * 退款资金来源;REFUND_SOURCE_RECHARGE_FUNDS可用余额退款/基本账户;REFUND_SOURCE_UNSETTLED_FUNDS 未结算资金退款(针对微信)
	 */ 
	private String refundAccount;
				
	/**
	 * API接口;VENDOR_PLATFORM商户平台(针对微信)
	 */ 
	private String refundRequestSource;
																	
	public String getPayInfoId(){
		return payInfoId;
	}
	
	public void setPayInfoId(String payInfoId){
		this.payInfoId = payInfoId;
	}
				
	public String getWechatPayInfoId(){
		return wechatPayInfoId;
	}
	
	public void setWechatPayInfoId(String wechatPayInfoId){
		this.wechatPayInfoId = wechatPayInfoId;
	}
				
	public String getOutSystemId(){
		return outSystemId;
	}
	
	public void setOutSystemId(String outSystemId){
		this.outSystemId = outSystemId;
	}
				
	public String getRefundChannel(){
		return refundChannel;
	}
	
	public void setRefundChannel(String refundChannel){
		this.refundChannel = refundChannel;
	}
				
	public String getUserId(){
		return userId;
	}
	
	public void setUserId(String userId){
		this.userId = userId;
	}
				
	public String getRefundNo(){
		return refundNo;
	}
	
	public void setRefundNo(String refundNo){
		this.refundNo = refundNo;
	}
				
	public String getOutTradeNo(){
		return outTradeNo;
	}
	
	public void setOutTradeNo(String outTradeNo){
		this.outTradeNo = outTradeNo;
	}
				
	public String getOutRefundNo(){
		return outRefundNo;
	}
	
	public void setOutRefundNo(String outRefundNo){
		this.outRefundNo = outRefundNo;
	}
				
	public String getTotalFee(){
		return totalFee;
	}
	
	public void setTotalFee(String totalFee){
		this.totalFee = totalFee;
	}
				
	public String getRefundFee(){
		return refundFee;
	}
	
	public void setRefundFee(String refundFee){
		this.refundFee = refundFee;
	}
				
	public String getRefundDesc(){
		return refundDesc;
	}
	
	public void setRefundDesc(String refundDesc){
		this.refundDesc = refundDesc;
	}
				
	public String getNotifyUrl(){
		return notifyUrl;
	}
	
	public void setNotifyUrl(String notifyUrl){
		this.notifyUrl = notifyUrl;
	}
				
	public String getRefundStatus(){
		return refundStatus;
	}
	
	public void setRefundStatus(String refundStatus){
		this.refundStatus = refundStatus;
	}
				
	public Date getRefundStartTime(){
		return refundStartTime;
	}
	
	public void setRefundStartTime(Date refundStartTime){
		this.refundStartTime = refundStartTime;
	}
				
	public Date getRefundEndTime(){
		return refundEndTime;
	}
	
	public void setRefundEndTime(Date refundEndTime){
		this.refundEndTime = refundEndTime;
	}
				
	public Date getRefundSuccessTime(){
		return refundSuccessTime;
	}
	
	public void setRefundSuccessTime(Date refundSuccessTime){
		this.refundSuccessTime = refundSuccessTime;
	}
				
	public String getRefundRecvAccout(){
		return refundRecvAccout;
	}
	
	public void setRefundRecvAccout(String refundRecvAccout){
		this.refundRecvAccout = refundRecvAccout;
	}
				
	public String getRefundAccount(){
		return refundAccount;
	}
	
	public void setRefundAccount(String refundAccount){
		this.refundAccount = refundAccount;
	}
				
	public String getRefundRequestSource(){
		return refundRequestSource;
	}
	
	public void setRefundRequestSource(String refundRequestSource){
		this.refundRequestSource = refundRequestSource;
	}
													
}
