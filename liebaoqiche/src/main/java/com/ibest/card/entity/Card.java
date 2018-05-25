package com.ibest.card.entity;

import java.util.Date;

import com.ibest.card.enums.EnumsCouponOpenStatus;
import com.ibest.framework.common.persistence.BaseEntity;

public class Card extends BaseEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

					
	// 卡券名称
	private String name;
				
	// 卡券内容
	private String content;
				
	// 图片url
	private String imageUrl;
				
	// 卡券生成编号
	private String buildId;
				
	// 生成券名称
	private String buildName;
				
	// 领取券名称
	private String getName;
				
	// 领取券编号
	private String getId;
				
	// 卡券用途编号
	private String useId;
				
	// 卡券用途名称
	private String useName;

	private String state;
	private String stateDesc;

	// 卡券生成最大数量
	private Integer num;
				
	// 单次领取数量
	private Integer numTimeMax;
				
	// 单车领取最大次数
	private Integer numVinMax;

	//卡券生效日期
	private Date effectiveDate;

	private String startTime;

	//卡券截止日期
	private Date endDate;

	private String endTime;

	//卡券有效期
	private String expiryDays;
						
	// 创建人
	private String creater;
				
	// 创建时间
	private Date createTime;
				
	// 修改人
	private String modifier;
				
	// 修改时间
	private Date modifyTime;
				
	// version
	private String version;
									
	public String getName(){
		return name;
	}
	
	public void setName(String name){
		this.name = name;
	}
				
	public String getContent(){
		return content;
	}
	
	public void setContent(String content){
		this.content = content;
	}
				
	public String getImageUrl(){
		return imageUrl;
	}
	
	public void setImageUrl(String imageUrl){
		this.imageUrl = imageUrl;
	}
				
	public String getBuildId(){
		return buildId;
	}
	
	public void setBuildId(String buildId){
		this.buildId = buildId;
	}
				
	public String getBuildName(){
		return buildName;
	}
	
	public void setBuildName(String buildName){
		this.buildName = buildName;
	}
				
	public String getGetName(){
		return getName;
	}
	
	public void setGetName(String getName){
		this.getName = getName;
	}
				
	public String getGetId(){
		return getId;
	}
	
	public void setGetId(String getId){
		this.getId = getId;
	}
				
	public String getUseId(){
		return useId;
	}
	
	public void setUseId(String useId){
		this.useId = useId;
	}
				
	public String getUseName(){
		return useName;
	}
	
	public void setUseName(String useName){
		this.useName = useName;
	}
				
	public Integer getNum(){
		return num;
	}
	
	public void setNum(Integer num){
		this.num = num;
	}
				
	public Integer getNumTimeMax(){
		return numTimeMax;
	}
	
	public void setNumTimeMax(Integer numTimeMax){
		this.numTimeMax = numTimeMax;
	}
				
	public Integer getNumVinMax(){
		return numVinMax;
	}
	
	public void setNumVinMax(Integer numVinMax){
		this.numVinMax = numVinMax;
	}

	public Date getEffectiveDate() {
		return effectiveDate;
	}

	public void setEffectiveDate(Date effectiveDate) {
		this.effectiveDate = effectiveDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	
	public String getExpiryDays() {
		return expiryDays;
	}

	public void setExpiryDays(String expiryDays) {
		this.expiryDays = expiryDays;
	}

	public String getCreater(){
		return creater;
	}
	
	public void setCreater(String creater){
		this.creater = creater;
	}
				
	public Date getCreateTime(){
		return createTime;
	}
	
	public void setCreateTime(Date createTime){
		this.createTime = createTime;
	}
				
	public String getModifier(){
		return modifier;
	}
	
	public void setModifier(String modifier){
		this.modifier = modifier;
	}
				
	public Date getModifyTime(){
		return modifyTime;
	}
	
	public void setModifyTime(Date modifyTime){
		this.modifyTime = modifyTime;
	}
				
	public String getVersion(){
		return version;
	}
	
	public void setVersion(String version){
		this.version = version;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getStateDesc() {
		return stateDesc = EnumsCouponOpenStatus.getLabel(this.state);
	}
}
