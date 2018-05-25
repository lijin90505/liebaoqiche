package com.ibest.card.enums;

import com.fasterxml.jackson.annotation.JsonValue;
import com.ibest.framework.common.utils.EnumToKeyValue;

public enum EnumsCouponIsSingleUse {
	YES("是", "0"), NO("否", "1"), UNKNOW("未知", "");
	private String value;
	private String label;

	private EnumsCouponIsSingleUse(String label, String value) {
		this.label = label;
		this.value = value;
	}

	public static String getLabel(String value) {
		if (value == null)
			return null;
		for (EnumsCouponIsSingleUse c : EnumsCouponIsSingleUse.values()) {
			if (value.equals(c.getValue())) {
				return c.label;
			}
		}
		return null;
	}

	public static String getValue(String label) {
		if (label == null || "".equals(label))
			return null;
		for (EnumsCouponIsSingleUse c : EnumsCouponIsSingleUse.values()) {
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

