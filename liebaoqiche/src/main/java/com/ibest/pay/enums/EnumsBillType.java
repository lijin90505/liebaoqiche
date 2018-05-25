package com.ibest.pay.enums;

import com.fasterxml.jackson.annotation.JsonValue;
import com.ibest.framework.common.utils.EnumToKeyValue;

/**
 * 账单类型
 * @ClassName: EnumsBillType 
 * @author: WeiJia  
 * @date: 2018年5月4日下午2:09:40
 */
public enum EnumsBillType {

	SUCCESS("支付","SUCCESS"),
	REFUND("退款","REFUND");
	
	private String desc;
	private String value;
	
	private EnumsBillType(String desc, String value) {
		this.desc = desc;
		this.value = value;
	}
	
	public static EnumsBillType getPayType(String value) {
		if(null == value) 
			return null;
		for(EnumsBillType payType : EnumsBillType.values()) {
			if(value.equals(payType.value)) {
				return payType;
			}
		}
		return null;
	}
	
	public static String getDesc(String value) {
		if (value == null)
			return null;
		for (EnumsBillType c : EnumsBillType.values()) {
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
