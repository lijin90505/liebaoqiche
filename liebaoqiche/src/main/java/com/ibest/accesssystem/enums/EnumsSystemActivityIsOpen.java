package com.ibest.accesssystem.enums;

import com.fasterxml.jackson.annotation.JsonValue;
import com.ibest.framework.common.utils.EnumToKeyValue;

public enum EnumsSystemActivityIsOpen {
	OPEN("开启", "1"), CLOSE("关闭", "2");

	private String value;
	private String label;

	private EnumsSystemActivityIsOpen(String label, String value) {
		this.label = label;
		this.value = value;
	}

	public static String getLable(String value) {
		if (value == null || "".equals(value))
			return null;
		for (EnumsSystemActivityIsOpen c : EnumsSystemActivityIsOpen.values()) {
			if (value.equals(c.getValue())) {
				return c.label;
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
		return new EnumToKeyValue(this.getLabel(), this.getValue());
	}

}
