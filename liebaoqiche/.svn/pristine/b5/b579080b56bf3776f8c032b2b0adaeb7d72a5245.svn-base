package com.ibest.user.entity;

import java.util.Date;

import com.ibest.experience.enums.EnumsPlatformType;
import com.ibest.framework.common.persistence.BaseEntity;
import com.ibest.user.enums.EnumsApplyStatus;

public class UserAuthApply extends BaseEntity {

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;


	// 用户ID
	private String userId;

	// 用户名
	private String username;

	// 用户姓名
	private String realname;

	// 申请等级
	private String levelId;
	private String levelName;

	// 终端平台
	private String platform;
	private String platformDesc;

	// 状态
	private Integer status;

	private String statusDesc;

	// 详情
	private String detail;

	// 接入系统标识
	private String outSystemId;

	// 接入系统名称
	private String outSystemName;

	// 记录时间
	private Date createTime;

	// 操作时间
	private Date modifyTime;

	// 操作人ID
	private String modifyUserId;

	// 操作人名称
	private String modifyUserName;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public String getLevelId() {
		return levelId;
	}

	public void setLevelId(String levelId) {
		this.levelId = levelId;
	}

	public String getLevelName() {
		return levelName;
	}

	public void setLevelName(String levelName) {
		this.levelName = levelName;
	}

	public String getPlatform() {
		return platform;
	}

	public void setPlatform(String platform) {
		this.platform = platform;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getOutSystemId() {
		return outSystemId;
	}

	public void setOutSystemId(String outSystemId) {
		this.outSystemId = outSystemId;
	}

	public String getOutSystemName() {
		return outSystemName;
	}

	public void setOutSystemName(String outSystemName) {
		this.outSystemName = outSystemName;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getModifyTime() {
		return modifyTime;
	}

	public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
	}

	public String getModifyUserId() {
		return modifyUserId;
	}

	public void setModifyUserId(String modifyUserId) {
		this.modifyUserId = modifyUserId;
	}

	public String getModifyUserName() {
		return modifyUserName;
	}

	public void setModifyUserName(String modifyUserName) {
		this.modifyUserName = modifyUserName;
	}

	public String getStatusDesc() {
		return statusDesc = EnumsApplyStatus.getLabel(this.status);
	}

	public String getPlatformDesc() {
		return platformDesc = EnumsPlatformType.getLabel(this.platform);
	}
}
