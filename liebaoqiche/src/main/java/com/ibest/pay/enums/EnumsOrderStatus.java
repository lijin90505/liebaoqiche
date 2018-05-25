package com.ibest.pay.enums;

import com.fasterxml.jackson.annotation.JsonValue;
import com.ibest.framework.common.utils.EnumToKeyValue;

public enum EnumsOrderStatus {

	SUCCESS("支付成功","00"),
	PAYERROR("支付失败","01"),
	UNKNOWN_ERROR("未知错误请查询交易状态","02"),
	APPLY_REFUND("转入退款","03"),
	NOTPAY("未支付","04"),
	REFUND("已退款","09"), 
	REFUND_SUCCESS("全额退款，交易关闭","08");
	
	private String desc;
	private String value;
	
	private EnumsOrderStatus(String desc, String value) {
		this.desc = desc;
		this.value = value;
	}
	
	public static EnumsOrderStatus getPayType(String value) {
		if(null == value) 
			return null;
		for(EnumsOrderStatus payType : EnumsOrderStatus.values()) {
			if(value.equals(payType.value)) {
				return payType;
			}
		}
		return null;
	}
	
	public static String getDesc(String value) {
		if (value == null)
			return null;
		for (EnumsOrderStatus c : EnumsOrderStatus.values()) {
			if (value.equals(c.getValue())) {
				return c.desc;
			}
		}
		return null;
	}
	
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	
	@JsonValue
	public EnumToKeyValue getJson() {
		return new EnumToKeyValue(this.getDesc(), this.getValue().toString());
	}
}
