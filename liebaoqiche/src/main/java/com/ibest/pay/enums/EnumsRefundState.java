package com.ibest.pay.enums;

import com.fasterxml.jackson.annotation.JsonValue;
import com.ibest.framework.common.utils.EnumToKeyValue;

/**
 * 退款状态
 * @ClassName: EnumsRefundState 
 * @author: WeiJia  
 * @date: 2018年5月4日下午2:23:43
 */
public enum EnumsRefundState {

	SUCCESS("退款成功","SUCCESS"),
	REFUNDCLOSE("退款关闭","REFUNDCLOSE"),
	PROCESSING("退款处理中","PROCESSING"),
	CHANGE("退款异常","CHANGE");
	
	private String desc;
	private String value;
	
	private EnumsRefundState(String desc, String value) {
		this.desc = desc;
		this.value = value;
	}
	
	public static EnumsRefundState getPayType(String value) {
		if(null == value) 
			return null;
		for(EnumsRefundState payType : EnumsRefundState.values()) {
			if(value.equals(payType.value)) {
				return payType;
			}
		}
		return null;
	}
	
	public static String getDesc(String value) {
		if (value == null)
			return null;
		for (EnumsRefundState c : EnumsRefundState.values()) {
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
