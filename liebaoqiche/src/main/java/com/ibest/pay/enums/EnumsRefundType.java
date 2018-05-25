package com.ibest.pay.enums;

import com.fasterxml.jackson.annotation.JsonValue;
import com.ibest.framework.common.utils.EnumToKeyValue;

/**
 * 退款类型
 * @ClassName: EnumsRefundType 
 * @author: WeiJia  
 * @date: 2018年5月4日下午2:20:56
 */
public enum EnumsRefundType {

	ORIGINAL("原路退款","ORIGINAL"),
	BALANCE("退回到余额","BALANCE"),
	OTHER_BALANCE("原账户异常退到其他余额账户","OTHER_BALANCE"),
	OTHER_BANKCARD("原银行卡异常退到其他银行卡","OTHER_BANKCARD");
	
	private String desc;
	private String value;
	
	private EnumsRefundType(String desc, String value) {
		this.desc = desc;
		this.value = value;
	}
	
	public static EnumsRefundType getPayType(String value) {
		if(null == value) 
			return null;
		for(EnumsRefundType payType : EnumsRefundType.values()) {
			if(value.equals(payType.value)) {
				return payType;
			}
		}
		return null;
	}
	
	public static String getDesc(String value) {
		if (value == null)
			return null;
		for (EnumsRefundType c : EnumsRefundType.values()) {
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
