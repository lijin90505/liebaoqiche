package com.ibest.pay.enums;

import com.fasterxml.jackson.annotation.JsonValue;
import com.ibest.framework.common.utils.EnumToKeyValue;

/**
 * 对账状态
 * @ClassName: EnumsReconState 
 * @author: WeiJia  
 * @date: 2018年5月4日下午2:14:02
 */
public enum EnumsReconState {
	SUCCESS("成功","00"),
	PAY_STATUS_DISTINCT("状态不一致","01"),
	PAY_AMOUNT_DISTNCT("金额不一致","02"),
	FAIL("对账失败","03");
	
	private String desc;
	private String value;
	
	private EnumsReconState(String desc, String value) {
		this.desc = desc;
		this.value = value;
	}
	
	public static EnumsReconState getPayType(String value) {
		if(null == value) 
			return null;
		for(EnumsReconState payType : EnumsReconState.values()) {
			if(value.equals(payType.value)) {
				return payType;
			}
		}
		return null;
	}
	
	public static String getDesc(String value) {
		if (value == null)
			return null;
		for (EnumsReconState c : EnumsReconState.values()) {
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
