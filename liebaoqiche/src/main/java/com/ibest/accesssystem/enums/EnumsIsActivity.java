package com.ibest.accesssystem.enums;

import com.fasterxml.jackson.annotation.JsonValue;
import com.ibest.framework.common.utils.EnumToKeyValue;

public enum EnumsIsActivity {
	UNDELETE("已关联", "0"), DELETED("未关联", "1");

	private String value;
	private String label;

	private EnumsIsActivity(String label, String value) {
		this.label = label;
		this.value = value;
	}

	public static String getLable(String value) {
		if (value == null || "".equals(value))
			return null;
		for (EnumsIsActivity c : EnumsIsActivity.values()) {
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
