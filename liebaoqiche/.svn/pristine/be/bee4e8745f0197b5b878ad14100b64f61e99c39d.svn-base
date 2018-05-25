package com.ibest.pay.enums;

import com.fasterxml.jackson.annotation.JsonValue;
import com.ibest.framework.common.utils.EnumToKeyValue;

public enum EnumsDevice {

	PC("PC端","01"),
	APP("APP","02"),
	H5("H5","03"),
	PUBLIC_NUM("公众号","04"),
	SMALL_ROUTINE("小程序","05");
	
	private String desc;
	private String value;
	
	private EnumsDevice(String desc, String value) {
		this.desc = desc;
		this.value = value;
	}
	
	public static EnumsDevice getPayType(String value) {
		if(null == value) 
			return null;
		for(EnumsDevice payType : EnumsDevice.values()) {
			if(value.equals(payType.value)) {
				return payType;
			}
		}
		return null;
	}
	
	public static String getDesc(String value) {
		if (value == null)
			return null;
		for (EnumsDevice c : EnumsDevice.values()) {
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
