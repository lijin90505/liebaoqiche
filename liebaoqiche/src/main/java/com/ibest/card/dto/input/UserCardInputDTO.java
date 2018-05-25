package com.ibest.card.dto.input;

import com.ibest.framework.common.enums.EnumsAppType;
import com.ibest.framework.common.persistence.BaseInputDTO;

public class UserCardInputDTO extends BaseInputDTO {

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
	private String dealerId;
	private String userName;
	private String vinNo;
	private String cardId;
	private String cardName;
	private String cardNo;
	private String state;
	private String remarks;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSystemName() {
		return systemName;
	}

	public void setSystemName(String systemName) {
		this.systemName = systemName;
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

	public String getCardName() {
		return cardName;
	}

	public void setCardName(String cardName) {
		this.cardName = cardName;
	}
	
	public String getDealerId() {
		return dealerId;
	}

	public void setDealerId(String dealerId) {
		this.dealerId = dealerId;
	}
	
	public String getCardNo() {
		return cardNo;
	}

	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
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

	public String getAccessSystemId() {
		return accessSystemId;
	}

	public void setAccessSystemId(String accessSystemId) {
		this.accessSystemId = accessSystemId;
	}

	public String getAppId() {
		return appId;
	}

	public void setAppId(String appId) {
		this.appId = appId;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
	
	public String getAppName() {
		return appName = EnumsAppType.getLable(this.appId);
	}
}
