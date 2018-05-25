package com.ibest.user.enums;

import com.fasterxml.jackson.annotation.JsonValue;
import com.ibest.framework.common.utils.EnumToKeyValue;

public enum EnumsLocked {

	UNLOCKED("未锁定", "0"), LOCKED("已锁定", "1")/*, ALL("全部", "")*/;

	private String label;
	private String value;

	private EnumsLocked(String label, String value) {
		this.label = label;
		this.value = value;
	}

	public static String getLabel(String value) {
		if (value == null) return null;
		for (EnumsLocked c : EnumsLocked.values()) {
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
		return new EnumToKeyValue(this.getLabel(), this.getValue().toString());
	}
}
