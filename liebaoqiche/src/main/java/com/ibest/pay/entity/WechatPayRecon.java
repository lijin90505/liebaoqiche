package com.ibest.pay.entity;

import com.ibest.framework.common.persistence.BaseEntity;

public class WechatPayRecon extends BaseEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 对账渠道
	 * 对账渠道;00微信;01支付宝;02银联
	 */
	private String reconChannel;				
				
	/**
	 * 下载对账单的日期，格式：20140603
	 */ 
	private String billDate;
				
	/**
	 * 账单类型;
	 * 账单类型;00支付成功;01退款
	 */ 
	private String billType;
				
	/**
	 * 交易时间
	 */ 
	private String tradeTime;
				
	/**
	 * 公众账号ID
	 */ 
	private String appId;
				
	/**
	 * 商户号
	 */ 
	private String mchId;
				
	/**
	 * 子商户号
	 */ 
	private String subMchId;
				
	/**
	 * 设备号
	 */ 
	private String deviceInfo;
				
	/**
	 * 处理结果订单号
	 */ 
	private String resultOrderNo;
				
	/**
	 * 商户订单号
	 */ 
	private String orderId;
				
	/**
	 * 用户标识
	 */ 
	private String userId;
				
	/**
	 * 交易类型
	 */ 
	private String tradeType;
				
	/**
	 * 交易状态
	 */ 
	private String tradeState;
				
	/**
	 * 付款银行
	 */ 
	private String bankType;
				
	/**
	 * 货币种类
	 */ 
	private String feeType;
				
	/**
	 * 总金额
	 */ 
	private String totalAmount;
				
	/**
	 * 代金券或立减优惠金额
	 */ 
	private String couponFee;
				
	/**
	 * 商户名称
	 */ 
	private String merchantName;
				
	/**
	 * 商户数据包
	 */ 
	private String merchantData;
				
	/**
	 * 手续费
	 */ 
	private String serviceCharge;
				
	/**
	 * 费率
	 */ 
	private String rate;
				
	/**
	 * 对账状态;00成功；01失败
	 */ 
	private String reconState;
				
	/**
	 * 对账失败原因
	 */ 
	private String failMessage;
									
	
	public String getReconChannel() {
		return reconChannel;
	}

	public void setReconChannel(String reconChannel) {
		this.reconChannel = reconChannel;
	}

	public String getBillDate(){
		return billDate;
	}
	
	public void setBillDate(String billDate){
		this.billDate = billDate;
	}
				
	public String getBillType(){
		return billType;
	}
	
	public void setBillType(String billType){
		this.billType = billType;
	}
				
	public String getTradeTime(){
		return tradeTime;
	}
	
	public void setTradeTime(String tradeTime){
		this.tradeTime = tradeTime;
	}
				
	public String getAppId(){
		return appId;
	}
	
	public void setAppId(String appId){
		this.appId = appId;
	}
				
	public String getMchId(){
		return mchId;
	}
	
	public void setMchId(String mchId){
		this.mchId = mchId;
	}
				
	public String getSubMchId(){
		return subMchId;
	}
	
	public void setSubMchId(String subMchId){
		this.subMchId = subMchId;
	}
				
	public String getDeviceInfo(){
		return deviceInfo;
	}
	
	public void setDeviceInfo(String deviceInfo){
		this.deviceInfo = deviceInfo;
	}
				
	public String getResultOrderNo(){
		return resultOrderNo;
	}
	
	public void setResultOrderNo(String resultOrderNo){
		this.resultOrderNo = resultOrderNo;
	}
				
	public String getOrderId(){
		return orderId;
	}
	
	public void setOrderId(String orderId){
		this.orderId = orderId;
	}
				
	public String getUserId(){
		return userId;
	}
	
	public void setUserId(String userId){
		this.userId = userId;
	}
				
	public String getTradeType(){
		return tradeType;
	}
	
	public void setTradeType(String tradeType){
		this.tradeType = tradeType;
	}
				
	public String getTradeState(){
		return tradeState;
	}
	
	public void setTradeState(String tradeState){
		this.tradeState = tradeState;
	}
				
	public String getBankType(){
		return bankType;
	}
	
	public void setBankType(String bankType){
		this.bankType = bankType;
	}
				
	public String getFeeType(){
		return feeType;
	}
	
	public void setFeeType(String feeType){
		this.feeType = feeType;
	}
				
	public String getTotalAmount(){
		return totalAmount;
	}
	
	public void setTotalAmount(String totalAmount){
		this.totalAmount = totalAmount;
	}
				
	public String getCouponFee(){
		return couponFee;
	}
	
	public void setCouponFee(String couponFee){
		this.couponFee = couponFee;
	}
				
	public String getMerchantName(){
		return merchantName;
	}
	
	public void setMerchantName(String merchantName){
		this.merchantName = merchantName;
	}
				
	public String getMerchantData(){
		return merchantData;
	}
	
	public void setMerchantData(String merchantData){
		this.merchantData = merchantData;
	}
				
	public String getServiceCharge(){
		return serviceCharge;
	}
	
	public void setServiceCharge(String serviceCharge){
		this.serviceCharge = serviceCharge;
	}
				
	public String getRate(){
		return rate;
	}
	
	public void setRate(String rate){
		this.rate = rate;
	}
				
	public String getReconState(){
		return reconState;
	}
	
	public void setReconState(String reconState){
		this.reconState = reconState;
	}
				
	public String getFailMessage(){
		return failMessage;
	}
	
	public void setFailMessage(String failMessage){
		this.failMessage = failMessage;
	}
					
}
