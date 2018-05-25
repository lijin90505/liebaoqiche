package com.ibest.pay.enums;

import com.fasterxml.jackson.annotation.JsonValue;
import com.ibest.framework.common.utils.EnumToKeyValue;

/**
 * 对账渠道
 * @ClassName: EnumsReconChannel 
 * @author: WeiJia  
 * @date: 2018年5月4日下午2:08:24
 */
public enum EnumsReconChannel {

	WECHAT("微信","00"),
	AIPAY("支付宝","01"),
	UNPAY("银联","02");
	
	private String desc;
	private String value;
	
	private EnumsReconChannel(String desc, String value) {
		this.desc = desc;
		this.value = value;
	}
	
	public static EnumsReconChannel getPayType(String value) {
		if(null == value) 
			return null;
		for(EnumsReconChannel payType : EnumsReconChannel.values()) {
			if(value.equals(payType.value)) {
				return payType;
			}
		}
		return null;
	}
	
	public static String getDesc(String value) {
		if (value == null)
			return null;
		for (EnumsReconChannel c : EnumsReconChannel.values()) {
			if (value.equals(c.getValue())) {
				return c.desc;
			}
		}
		return null;
	}
	
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	
	@JsonValue
	public EnumToKeyValue getJson() {
		return new EnumToKeyValue(this.getDesc(), this.getValue().toString());
	}
}
