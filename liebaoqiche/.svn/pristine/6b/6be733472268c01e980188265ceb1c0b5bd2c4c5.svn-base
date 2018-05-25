package com.ibest.user.entity;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.ibest.framework.common.persistence.BaseEntity;
import com.ibest.framework.common.utils.StringUtils;
import com.ibest.framework.system.enums.EnumsSysUserIsLock;
import com.ibest.user.enums.EnumsLocked;
import com.ibest.user.enums.EnumsRegisterType;
import com.ibest.user.enums.EnumsSex;

public class User extends BaseEntity {

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;


	// 用户名
	private String username;

	// 密码
	@JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
	private String password;

	// 姓名
	private String realname;

	// 电话
	private String phone;

	// 邮箱
	private String email;

	// 性别
	private Integer sex;

	/**
	 * 性别解释字段
	 */
	private String sexDesc;

	// 生日
	private String birthday;

	// 实名认证手机号
	private String authPhone;

	// 身份证号
	private String idcard;

	// 汽车VIN码
	private String carVin;

	// 家庭住址
	private String address;

	// 用户注册标识类型（1、用户名，2、手机，3、邮箱）
	private Integer registerType;

	private String registerTypeDesc;

	// 是否已经修改用户名
	private Integer modified;

	// 用户是否锁定
	private String locked;

	private String lockedDesc;

	// 用户认证等级
	private String levelId;
	private String levelName;

	private String integralCountId;
	private Integer integralNumber;

	private String experienceCountId;
	private Integer experienceNumber;

	// 注册时间
	private Date createTime;

	// 修改时间
	private Date modifyTime;

	// 创建人ID
	private String createUserId;

	// 创建人名称
	private String createUserName;

	// 修改人ID
	private String modifyUserId;

	// 修改人名称
	private String modifyUserName;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		if (StringUtils.isBlank(phone)) phone = null;
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		if (StringUtils.isBlank(email)) email = null;
		this.email = email;
	}

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		if (StringUtils.isBlank(birthday)) birthday = null;
		this.birthday = birthday;
	}

	public String getAuthPhone() {
		return authPhone;
	}

	public void setAuthPhone(String authPhone) {
		this.authPhone = authPhone;
	}

	public String getIdcard() {
		return idcard;
	}

	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}

	public String getCarVin() {
		return carVin;
	}

	public void setCarVin(String carVin) {
		this.carVin = carVin;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Integer getRegisterType() {
		return registerType;
	}

	public void setRegisterType(Integer registerType) {
		this.registerType = registerType;
	}

	public Integer getModified() {
		return modified;
	}

	public void setModified(Integer modified) {
		this.modified = modified;
	}

	public String getLocked() {
		return locked;
	}

	public void setLocked(String locked) {
		this.locked = locked;
	}

	public String getLevelId() {
		return levelId;
	}

	public void setLevelId(String levelId) {
		this.levelId = levelId;
	}

	public String getExperienceCountId() {
		return experienceCountId;
	}

	public void setExperienceCountId(String experienceCountId) {
		this.experienceCountId = experienceCountId;
	}

	public Integer getExperienceNumber() {
		return experienceNumber;
	}

	public void setExperienceNumber(Integer experienceNumber) {
		this.experienceNumber = experienceNumber;
	}

	public String getLevelName() {
		return levelName;
	}

	public void setLevelName(String levelName) {
		this.levelName = levelName;
	}

	public String getIntegralCountId() {
		return integralCountId;
	}

	public void setIntegralCountId(String integralCountId) {
		this.integralCountId = integralCountId;
	}

	public Integer getIntegralNumber() {
		return integralNumber;
	}

	public void setIntegralNumber(Integer integralNumber) {
		this.integralNumber = integralNumber;
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

	public String getCreateUserId() {
		return createUserId;
	}

	public void setCreateUserId(String createUserId) {
		this.createUserId = createUserId;
	}

	public String getCreateUserName() {
		return createUserName;
	}

	public void setCreateUserName(String createUserName) {
		this.createUserName = createUserName;
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

	public String getSexDesc() {
		return sexDesc = EnumsSex.getLabel(sex);
	}

	public String getRegisterTypeDesc() {
		return registerTypeDesc = EnumsRegisterType.getLabel(registerType);
	}

	public String getLockedDesc() {
		if (locked == null) locked = "0";
		return lockedDesc = EnumsLocked.getLabel(locked);
	}
}
