package com.ibest.pay.dto.input;

import com.ibest.framework.common.persistence.BaseInputDTO;

public class WechatPayRefundReconInputDTO extends BaseInputDTO {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private String orderId;
	
	private String billDate;
	
	private String tradeTime;
	
	private String reconChannel;
	
	private String reconState;
	
	private String resultRefundOrderNo;

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getBillDate() {
		return billDate;
	}

	public void setBillDate(String billDate) {
		if(billDate!=null) {
			billDate = billDate.replaceAll("-", "");
		}
		this.billDate = billDate;
	}

	public String getTradeTime() {
		return tradeTime;
	}

	public void setTradeTime(String tradeTime) {
		this.tradeTime = tradeTime;
	}

	public String getReconChannel() {
		return reconChannel;
	}

	public void setReconChannel(String reconChannel) {
		this.reconChannel = reconChannel;
	}

	public String getReconState() {
		return reconState;
	}

	public void setReconState(String reconState) {
		this.reconState = reconState;
	}

	public String getResultRefundOrderNo() {
		return resultRefundOrderNo;
	}

	public void setResultRefundOrderNo(String resultRefundOrderNo) {
		this.resultRefundOrderNo = resultRefundOrderNo;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("WechatPayRefundReconInputDTO [orderId=");
		builder.append(orderId);
		builder.append(", billDate=");
		builder.append(billDate);
		builder.append(", tradeTime=");
		builder.append(tradeTime);
		builder.append(", reconChannel=");
		builder.append(reconChannel);
		builder.append(", reconState=");
		builder.append(reconState);
		builder.append(", resultRefundOrderNo=");
		builder.append(resultRefundOrderNo);
		builder.append("]");
		return builder.toString();
	}
	
	
}
