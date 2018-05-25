package com.ibest.accesssystem.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ibest.framework.common.persistence.MyBatisDao;
import com.ibest.accesssystem.entity.AccessSystem;

import com.ibest.accesssystem.dto.input.AccessSystemInputDTO;

@MyBatisDao
public interface AccessSystemDao {

	/**
	 * 新增
	 * @param accessSystem
	 * @return
	 */
	public int insert(AccessSystem accessSystem);
	
	/**
	 * 根据主键ID删除
	 * @param id
	 * @return
	 */
	public int deleteById(String id);
	
	/**
	 * 批量删除
	 * @param ids
	 * @return
	 */
	public int deleteByIds(@Param("ids") List<String> ids); 
	
	/**
	 * 修改
	 * @param accessSystem
	 * @return
	 */
	public int update(AccessSystem accessSystem);
	
	/**
	 * 根据Id获取唯一记录
	 * @param id
	 * @return
	 */
	public AccessSystem findById(String id);
	
	public AccessSystem findIdentificationByAccessId(String identification);
	
	/**
	 * 根据指定对象查询唯一结果
	 * @param accessSystemInputDto
	 * @return
	 */
	public AccessSystem findOneByObject(AccessSystemInputDTO accessSystemInputDto);
	
	/**
	 * 根据对象查询符合条件结果列表
	 * @param accessSystemInputDto
	 * @return
	 */
	public List<AccessSystem> findByObject(AccessSystemInputDTO accessSystemInputDto);
	
	
	/**
	 * 根据对象查询符合条件记录总条数
	 * @param accessSystemInputDto
	 * @return
	 */
	public long countByObject(AccessSystemInputDTO accessSystemInputDto);

	/**
	 * 根据条件对象查询个数
	 * @param inputDTO
	 * @return
	 */
	public int countAccessSystemByObject(AccessSystemInputDTO inputDTO);
	
	/**
	 * 查询所有系统标识
	 * @Title: findByAll  
	 * @return:AccessSystem
	 * @author: WeiJia
	 * @date:2018年4月17日 下午8:37:31
	 */
	public List<AccessSystem> findByAll();
}