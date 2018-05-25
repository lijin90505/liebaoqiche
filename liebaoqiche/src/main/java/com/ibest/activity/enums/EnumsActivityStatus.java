package com.ibest.activity.enums;

import com.fasterxml.jackson.annotation.JsonValue;
import com.ibest.framework.common.utils.EnumToKeyValue;

public enum EnumsActivityStatus {
	EDITED("已关联", "0"), UNEDIT("未关联", "1"), ISPUBLISH("已发布", "2");

	private String value;
	private String label;

	private EnumsActivityStatus(String label, String value) {
		this.label = label;
		this.value = value;
	}

	public static String getLabel(String value) {
		if (value == null) return null;
		for (EnumsActivityStatus c : EnumsActivityStatus.values()) {
			if (value.equals(c.getValue())) {
				return c.label;
			}
		}
		return null;
	}

	public static String getValue(String label) {
		if (label == null || "".equals(label)) return null;
		for (EnumsActivityStatus c : EnumsActivityStatus.values()) {
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
