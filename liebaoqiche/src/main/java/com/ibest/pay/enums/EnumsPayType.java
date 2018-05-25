package com.ibest.pay.enums;

import com.fasterxml.jackson.annotation.JsonValue;
import com.ibest.framework.common.utils.EnumToKeyValue;

/**
 * 
 * @author Tipoom
 *	支付方式枚举类
 */
public enum EnumsPayType {
	UNION_PC("银联网关支付","00"),
	ALI_SCAN("支付宝电脑网站支付","01"),
	ALI_WAPSCAN("支付宝手机网站支付","06"),
	ALI_F2FSCAN("支付宝面对面扫码支付","07"),
	ALI_APP("支付宝APP支付","11"),
	ALI_BARCODE("支付宝条码支付","02"), 
	WECHAT_SCAN("微信扫码支付","03"),
	WECHAT_APP("微信APP支付","04"),
	WEHCHAT_OA("微信公众号支付","05"),
	WEHCHAT_H5("微信H5支付","10");
	
	private String desc;
	private String value;
	
	private EnumsPayType(String desc, String value) {
		this.desc = desc;
		this.value = value;
	}
	
	public static EnumsPayType getPayType(String value) {
		if(null == value) 
			return null;
		for(EnumsPayType payType : EnumsPayType.values()) {
			if(value.equals(payType.value)) {
				return payType;
			}
		}
		return null;
	}
	
	public static String getDesc(String value) {
		if (value == null)
			return null;
		for (EnumsPayType c : EnumsPayType.values()) {
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
