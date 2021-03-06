package com.ibest.experience.enums;

import com.fasterxml.jackson.annotation.JsonValue;
import com.ibest.framework.common.utils.EnumToKeyValue;

public enum EnumsPlatformType {
	PC("PC", "00"), ANDROID("安卓", "01"), IOS("IOS", "02"), WECHAT_PUBLIC_ACCOUNT("微信公众号", "03"), 
	WECHAT_PROGRAM("微信小程序", "04"), MANAGEMENT_SYSTEM("管理系统", "05"),ACTIVITY_SYSTEM("活动系统", "06");
	private String value;
	private String label;

	private EnumsPlatformType(String label, String value) {
		this.label = label;
		this.value = value;
	}

	public static String getLabel(String value) {
		if (value == null)
			return null;
		for (EnumsPlatformType c : EnumsPlatformType.values()) {
			if (value.equals(c.getValue())) {
				return c.label;
			}
		}
		return null;
	}

	public static String getValue(String label) {
		if (label == null || "".equals(label))
			return null;
		for (EnumsPlatformType c : EnumsPlatformType.values()) {
			if (label.equals(c.getLabel())) {
				return c.value;
			}
		}
		return null;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	@JsonValue
	public EnumToKeyValue getJson() {
		return new EnumToKeyValue(this.getLabel(), this.getValue().toString());
	}
}
