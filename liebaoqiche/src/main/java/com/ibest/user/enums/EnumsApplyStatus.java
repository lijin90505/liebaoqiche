package com.ibest.user.enums;

import com.fasterxml.jackson.annotation.JsonValue;
import com.ibest.framework.common.utils.EnumToKeyValue;

public enum EnumsApplyStatus {

	UNSET("未处理", null), REJECT("拒绝", 0), PASS("通过", 1);

	private Integer value;
	private String label;

	private EnumsApplyStatus(String label, Integer value) {
		this.label = label;
		this.value = value;
	}

	public static String getLabel(Integer value) {
		if (value == null) return UNSET.label;
		for (EnumsApplyStatus c : EnumsApplyStatus.values()) {
			if (value.equals(c.getValue())) {
				return c.label;
			}
		}
		return null;
	}

	public static Integer getValue(String label) {
		if (label == null || "".equals(label)) return null;
		for (EnumsApplyStatus c : EnumsApplyStatus.values()) {
			if (label.equals(c.getLabel())) {
				return c.value;
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
		return new EnumToKeyValue(this.getLabel(), this.getValue() == null ? null : this.getValue().toString());
	}
}
