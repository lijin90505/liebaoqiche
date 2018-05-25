package com.ibest.card.enums;

import com.fasterxml.jackson.annotation.JsonValue;
import com.ibest.framework.common.utils.EnumToKeyValue;

public enum EnumsCouponUseingStatus {
	USED("已发放", 0), UNUSED("已撤回", 1), OVERDUE("已过期", 2), REFUNDING("退款中", 3), REFUNDED("已退款", 4), NONPAYMENT("未支付", 5), UNKNOW("未知", 6);

	private Integer value;
	private String label;

	private EnumsCouponUseingStatus(String label, Integer value) {
		this.label = label;
		this.value = value;
	}

	public static String getLabel(Integer value) {
		if (value == null) return null;
		for (EnumsCouponUseingStatus c : EnumsCouponUseingStatus.values()) {
			if (value.equals(c.getValue())) {
				return c.label;
			}
		}
		return null;
	}

	public static Integer getValue(String label) {
		if (label == null || "".equals(label)) return null;
		for (EnumsCouponUseingStatus c : EnumsCouponUseingStatus.values()) {
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
