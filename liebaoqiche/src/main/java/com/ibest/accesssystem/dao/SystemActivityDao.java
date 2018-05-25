package com.ibest.accesssystem.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ibest.framework.common.persistence.MyBatisDao;
import com.ibest.accesssystem.entity.SystemActivity;

import com.ibest.accesssystem.dto.input.SystemActivityInputDTO;

@MyBatisDao
public interface SystemActivityDao {

	/**
	 * 新增
	 * @param entity
	 * @return
	 */
	public int insert(SystemActivity systemActivity);
	
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
	 * @param entity
	 * @return
	 */
	public int update(SystemActivity systemActivity);
	
	/**
	 * 根据Id获取唯一记录
	 * @param id
	 * @return
	 */
	public SystemActivity findById(String id);
	
	
	
	/**
	 * 根据Id获取唯一记录
	 * @param id
	 * @return
	 */
	public SystemActivity findByFrankId(String id);
	
	/**
	 * 根据指定对象查询唯一结果
	 * @param entity
	 * @return
	 */
	public SystemActivity findOneByObject(SystemActivityInputDTO systemActivityInputDto);
	
	/**
	 * 根据对象查询符合条件结果列表
	 * @param entity
	 * @return
	 */
	public List<SystemActivity> findByObject(SystemActivityInputDTO systemActivityInputDto);
	
	/**
	 * 根据对象查询符合条件结果列表
	 * @param entity
	 * @return
	 */
	public List<SystemActivity> findAll(String accessSystemId);
	/**
	 * 根据对象查询符合条件记录总条数
	 * @param entity
	 * @return
	 */
	public long countByObject(SystemActivityInputDTO systemActivityInputDto);
	
}