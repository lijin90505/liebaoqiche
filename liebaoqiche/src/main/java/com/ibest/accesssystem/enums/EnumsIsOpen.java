package com.ibest.accesssystem.enums;

import com.fasterxml.jackson.annotation.JsonValue;
import com.ibest.framework.common.utils.EnumToKeyValue;

public enum EnumsIsOpen {
	OPEN("开启", "0"), CLOSE("关闭", "1");

	private String value;
	private String label;

	private EnumsIsOpen(String label, String value) {
		this.label = label;
		this.value = value;
	}

	public static String getLable(String value) {
		if (value == null || "".equals(value))
			return null;
		for (EnumsIsOpen c : EnumsIsOpen.values()) {
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
