package com.ibest.pay.enums;

import com.fasterxml.jackson.annotation.JsonValue;
import com.ibest.framework.common.utils.EnumToKeyValue;

/**
 * 接入系统枚举
 * @ClassName: EnumsAccessSystem 
 * @author: WeiJia  
 * @date: 2018年4月17日下午3:23:40
 */
public enum EnumsAccessSystem {

	APP("APP","APP"),
	UBI("UBI","UBI");
	
	private String desc;
	private String value;
	
	private EnumsAccessSystem(String desc, String value) {
		this.desc = desc;
		this.value = value;
	}
	
	public static EnumsAccessSystem getPayType(String value) {
		if(null == value) 
			return null;
		for(EnumsAccessSystem payType : EnumsAccessSystem.values()) {
			if(value.equals(payType.value)) {
				return payType;
			}
		}
		return null;
	}
	
	public static String getDesc(String value) {
		if (value == null)
			return null;
		for (EnumsAccessSystem c : EnumsAccessSystem.values()) {
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
