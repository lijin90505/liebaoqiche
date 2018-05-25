package com.ibest.card.dto.input;

import com.ibest.framework.common.enums.EnumsAppType;
import com.ibest.framework.common.persistence.BaseInputDTO;

public class UserCardCountInputDTO extends BaseInputDTO {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String id;
	private String accessSystemId;
	private String systemName;
	private String appId;
	private String appName;
	private String userId;
	private String userName;
	//车牌号
	private String vinNo;
	private String cardId;
	private String number;
	private String cardName;
	//未使用
	private String noUsed;
	//已使用
	private String used;
	//已过期
	private String past;
	//总数量
	private String totalNum;
	private String remarks;
	
	
	
	public String getPast() {
		return past;
	}

	public void setPast(String past) {
		this.past = past;
	}

	public String getNoUsed() {
		return noUsed;
	}

	public void setNoUsed(String noUsed) {
		this.noUsed = noUsed;
	}

	public String getUsed() {
		return used;
	}

	public void setUsed(String used) {
		this.used = used;
	}

	public String getTotalNum() {
		return totalNum;
	}

	public void setTotalNum(String totalNum) {
		this.totalNum = totalNum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAccessSystemId() {
		return accessSystemId;
	}

	public void setAccessSystemId(String accessSystemId) {
		this.accessSystemId = accessSystemId;
	}

	public String getSystemName() {
		return systemName;
	}

	public void setSystemName(String systemName) {
		this.systemName = systemName;
	}

	public String getAppId() {
		return appId;
	}

	public void setAppId(String appId) {
		this.appId = appId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getVinNo() {
		return vinNo;
	}

	public void setVinNo(String vinNo) {
		this.vinNo = vinNo;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getCardName() {
		return cardName;
	}

	public void setCardName(String cardName) {
		this.cardName = cardName;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getCardId() {
		return cardId;
	}

	public void setCardId(String cardId) {
		this.cardId = cardId;
	}
	
	public String getAppName() {
		return appName = EnumsAppType.getLable(this.appId);
	}
}
