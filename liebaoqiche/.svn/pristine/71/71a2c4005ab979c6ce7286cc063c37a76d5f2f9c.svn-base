package com.ibest.user.enums;

import com.fasterxml.jackson.annotation.JsonValue;
import com.ibest.framework.common.utils.EnumToKeyValue;

public enum EnumsRegisterType {

	USERNAME("用户名", 1), PHONE("手机号", 2), EMAIL("邮箱", 3);

	private String label;
	private Integer value;

	private EnumsRegisterType(String label, int value) {
		this.label = label;
		this.value = value;
	}

	public static String getLabel(Integer value) {
		if (value == null)
			return null;
		for (EnumsRegisterType c : EnumsRegisterType.values()) {
			if (value.equals(c.getValue())) {
				return c.label;
			}
		}
		return null;
	}
	
	public static EnumsRegisterType getType(Integer value) {
		if (value == null)
			return null;
		for (EnumsRegisterType c : EnumsRegisterType.values()) {
			if (value.equals(c.getValue())) {
				return c;
			}
		}
		return null;
	}

	public Integer getValue() {
		return value;
	}

	public void setValue(Integer value) {
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
