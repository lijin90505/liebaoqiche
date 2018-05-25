package com.ibest.user.entity;

import java.util.Date;

import com.ibest.framework.common.persistence.BaseEntity;

public class UserLog extends BaseEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

					
	// 用户访问URL
	private String url;
				
	// 用户访问ip
	private String ip;
				
	// 操作事件
	private String event;
				
	// 操作记录详情
	private String detail;
				
	// 记录时间
	private Date createTime;
				
	// 操作用户uuid
	private String userId;
				
	// 操作用户名
	private String username;
									
	public String getUrl(){
		return url;
	}
	
	public void setUrl(String url){
		this.url = url;
	}
				
	public String getIp(){
		return ip;
	}
	
	public void setIp(String ip){
		this.ip = ip;
	}
				
	public String getEvent(){
		return event;
	}
	
	public void setEvent(String event){
		this.event = event;
	}
				
	public String getDetail(){
		return detail;
	}
	
	public void setDetail(String detail){
		this.detail = detail;
	}
				
	public Date getCreateTime(){
		return createTime;
	}
	
	public void setCreateTime(Date createTime){
		this.createTime = createTime;
	}
				
	public String getUserId(){
		return userId;
	}
	
	public void setUserId(String userId){
		this.userId = userId;
	}
				
	public String getUsername(){
		return username;
	}
	
	public void setUsername(String username){
		this.username = username;
	}
					
}
