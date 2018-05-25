package com.ibest.experience.enums;

import com.fasterxml.jackson.annotation.JsonValue;
import com.ibest.framework.common.utils.EnumToKeyValue;

public enum EnumsExpSourceType {

	LOGIN("登录", 0), SIGNIN("签到", 1), REMOTEOPENAIRCONDITIONER("远程开空调", 2)
	, MAINTAIN("保养", 3) , BUYAUTOINSURANCE("购买车险", 4), UNKNOW("未知", 5);

	private Integer value;
	private String label;

	private EnumsExpSourceType(String label, Integer value) {
		this.label = label;
		this.value = value;
	}

	public static String getLabel(Integer value) {
		if (value == null)
			return null;
		for (EnumsExpSourceType c : EnumsExpSourceType.values()) {
			if (value.equals(c.getValue())) {
				return c.label;
			}
		}
		return null;
	}

	public static Integer getValue(String label) {
		if (label == null || "".equals(label))
			return null;
		for (EnumsExpSourceType c : EnumsExpSourceType.values()) {
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
