package com.ibest.pay.entity;

import com.ibest.framework.common.persistence.BaseEntity;

public class PayAliRecon extends BaseEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

					
	// pay_recon_id
	private String payReconId;
				
	// bill_date
	private String billDate;
				
	// 交易类型
	private String billType;
				
	// trade_time
	private String tradeTime;
				
	// app_id
	private String appId;
				
	// mch_id
	private String mchId;
				
	// sub_mch_id
	private String subMchId;
				
	// device_Info
	private String deviceInfo;
				
	// 支付宝交易号
	private String tradeNo;
				
	// 订单号
	private String orderId;
				
	// 用户ID
	private String userId;
				
	// 交易类型
	private String tradeType;
				
	// trade_state
	private String tradeState;
				
	// bank_type
	private String bankType;
				
	// fee_type
	private String feeType;
				
	// 订单金额
	private String totalAmount;
				
	// 优惠金额
	private String couponFee;
				
	// result_refund_order_no
	private String resultRefundOrderNo;
				
	// 退款订单号
	private String refundOrderNo;
				
	// apply_refund_time
	private String applyRefundTime;
				
	// 退款成功时间
	private String refundSuccessTime;
				
	// 退款批次号/请求号
	private String resultRefundNo;
				
	// 退款号
	private String refundNo;
				
	// 退款金额
	private String refundAmount;
				
	// refund_coupon_fee
	private String refundCouponFee;
				
	// refund_type
	private String refundType;
				
	// 退款状态
	private String refundState;
				
	// merchant_name
	private String merchantName;
				
	// merchant_data
	private String merchantData;
				
	// 服务费
	private String serviceCharge;
				
	// rate
	private String rate;
						
	// 对账状态
	private String reconState;
				
	// 失败信息
	private String failMessage;
				
	// 实收金额
	private String collectedAmount;
							
	public String getPayReconId(){
		return payReconId;
	}
	
	public void setPayReconId(String payReconId){
		this.payReconId = payReconId;
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
				
	public String getTradeNo(){
		return tradeNo;
	}
	
	public void setTradeNo(String tradeNo){
		this.tradeNo = tradeNo;
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
				
	public String getResultRefundOrderNo(){
		return resultRefundOrderNo;
	}
	
	public void setResultRefundOrderNo(String resultRefundOrderNo){
		this.resultRefundOrderNo = resultRefundOrderNo;
	}
				
	public String getRefundOrderNo(){
		return refundOrderNo;
	}
	
	public void setRefundOrderNo(String refundOrderNo){
		this.refundOrderNo = refundOrderNo;
	}
				
	public String getApplyRefundTime(){
		return applyRefundTime;
	}
	
	public void setApplyRefundTime(String applyRefundTime){
		this.applyRefundTime = applyRefundTime;
	}
				
	public String getRefundSuccessTime(){
		return refundSuccessTime;
	}
	
	public void setRefundSuccessTime(String refundSuccessTime){
		this.refundSuccessTime = refundSuccessTime;
	}
				
	public String getResultRefundNo(){
		return resultRefundNo;
	}
	
	public void setResultRefundNo(String resultRefundNo){
		this.resultRefundNo = resultRefundNo;
	}
				
	public String getRefundNo(){
		return refundNo;
	}
	
	public void setRefundNo(String refundNo){
		this.refundNo = refundNo;
	}
				
	public String getRefundAmount(){
		return refundAmount;
	}
	
	public void setRefundAmount(String refundAmount){
		this.refundAmount = refundAmount;
	}
				
	public String getRefundCouponFee(){
		return refundCouponFee;
	}
	
	public void setRefundCouponFee(String refundCouponFee){
		this.refundCouponFee = refundCouponFee;
	}
				
	public String getRefundType(){
		return refundType;
	}
	
	public void setRefundType(String refundType){
		this.refundType = refundType;
	}
				
	public String getRefundState(){
		return refundState;
	}
	
	public void setRefundState(String refundState){
		this.refundState = refundState;
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
				
	public String getCollectedAmount(){
		return collectedAmount;
	}
	
	public void setCollectedAmount(String collectedAmount){
		this.collectedAmount = collectedAmount;
	}

	@Override
	public String toString() {
		return "PayAliRecon [payReconId=" + payReconId + ", billDate=" + billDate + ", billType=" + billType
				+ ", tradeTime=" + tradeTime + ", appId=" + appId + ", mchId=" + mchId + ", subMchId=" + subMchId
				+ ", deviceInfo=" + deviceInfo + ", tradeNo=" + tradeNo + ", orderId=" + orderId + ", userId=" + userId
				+ ", tradeType=" + tradeType + ", tradeState=" + tradeState + ", bankType=" + bankType + ", feeType="
				+ feeType + ", totalAmount=" + totalAmount + ", couponFee=" + couponFee + ", resultRefundOrderNo="
				+ resultRefundOrderNo + ", refundOrderNo=" + refundOrderNo + ", applyRefundTime=" + applyRefundTime
				+ ", refundSuccessTime=" + refundSuccessTime + ", resultRefundNo=" + resultRefundNo + ", refundNo="
				+ refundNo + ", refundAmount=" + refundAmount + ", refundCouponFee=" + refundCouponFee + ", refundType="
				+ refundType + ", refundState=" + refundState + ", merchantName=" + merchantName + ", merchantData="
				+ merchantData + ", serviceCharge=" + serviceCharge + ", rate=" + rate + ", reconState=" + reconState
				+ ", failMessage=" + failMessage + ", collectedAmount=" + collectedAmount + "]";
	}
			
	
}
