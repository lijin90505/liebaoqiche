package com.ibest.card.enums;

import com.fasterxml.jackson.annotation.JsonValue;
import com.ibest.framework.common.utils.EnumToKeyValue;

public enum EnumsCouponGrantStatus {
	GRANTED("已发放", 0), RECALLED("已撤回", 1), OVERDUE("已过期", 2)
	, UNKNOW("未知", 3);

	private Integer value;
	private String label;

	private EnumsCouponGrantStatus(String label, Integer value) {
		this.label = label;
		this.value = value;
	}

	public static String getLabel(Integer value) {
		if (value == null)
			return null;
		for (EnumsCouponGrantStatus c : EnumsCouponGrantStatus.values()) {
			if (value.equals(c.getValue())) {
				return c.label;
			}
		}
		return null;
	}

	public static Integer getValue(String label) {
		if (label == null || "".equals(label))
			return null;
		for (EnumsCouponGrantStatus c : EnumsCouponGrantStatus.values()) {
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
		return new EnumToKeyValue(this.getLabel(), this.getValue().toString());
	}

}
