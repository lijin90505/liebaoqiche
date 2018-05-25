package com.ibest.pay.dto.input;

import com.ibest.framework.common.persistence.BaseInputDTO;

public class WechatPayReconInputDTO extends BaseInputDTO {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String orderId;
	
	private String billDate;
	
	private String tradeTime;
	
	private String reconChannel;
	
	private String tradeState;
	
	private String resultOrderNo;

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

	public String getTradeState() {
		return tradeState;
	}

	public void setTradeState(String tradeState) {
		this.tradeState = tradeState;
	}
	
	public String getResultOrderNo() {
		return resultOrderNo;
	}

	public void setResultOrderNo(String resultOrderNo) {
		this.resultOrderNo = resultOrderNo;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("WechatPayReconInputDTO [orderId=");
		builder.append(orderId);
		builder.append(", billDate=");
		builder.append(billDate);
		builder.append(", tradeTime=");
		builder.append(tradeTime);
		builder.append(", reconChannel=");
		builder.append(reconChannel);
		builder.append(", tradeState=");
		builder.append(tradeState);
		builder.append(", resultOrderNo=");
		builder.append(resultOrderNo);
		builder.append("]");
		return builder.toString();
	}

}
