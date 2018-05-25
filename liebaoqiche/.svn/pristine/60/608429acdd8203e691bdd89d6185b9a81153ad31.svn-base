package com.ibest.pay;

/**
 * 支付渠道枚举
 * @ClassName: ReconChannelEnum 
 * @author: WeiJia  
 * @date: 2018年4月3日上午10:46:53
 */
public enum ReconChannelEnum {

	WECHATPAY("微信", 0), 
	AILPAY("支付宝", 1), 
	UNIONPAY("银联", 2);

	private String desc;
	private Integer value;

	private ReconChannelEnum(String desc, Integer value) {
		this.desc = desc;
		this.value = value;
	}

	public static ReconChannelEnum getReconChannel(Integer value) {
		if(null == value) 
			return null;
		for(ReconChannelEnum payType : ReconChannelEnum.values()) {
			if(value.equals(payType.value)) {
				return payType;
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

	public Integer getValue() {
		return value;
	}

	public void setValue(Integer value) {
		this.value = value;
	}
}
