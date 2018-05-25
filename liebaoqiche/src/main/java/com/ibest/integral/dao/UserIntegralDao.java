package com.ibest.integral.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ibest.framework.common.persistence.MyBatisDao;
import com.ibest.integral.entity.UserIntegral;

import com.ibest.integral.dto.input.UserIntegralInputDTO;

@MyBatisDao
public interface UserIntegralDao {

	/**
	 * 新增
	 * @param entity
	 * @return
	 */
	public int insert(UserIntegral userIntegral);
	
	/**
	 * 通过userId查询用户积分
	 * @param userId
	 * @return
	 */
	public List<UserIntegral> findByUserId(String userId);
	
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
	public int update(UserIntegral userIntegral);
	
	/**
	 * 根据Id获取唯一记录
	 * @param id
	 * @return
	 */
	public UserIntegral findById(String id);
	
	/**
	 * 根据指定对象查询唯一结果
	 * @param entity
	 * @return
	 */
	public UserIntegral findOneByObject(UserIntegralInputDTO userIntegralInputDto);
	
	/**
	 * 根据对象查询符合条件结果列表
	 * @param entity
	 * @return
	 */
	public List<UserIntegral> findByObject(UserIntegralInputDTO userIntegralInputDto);
	
	
	/**
	 * 根据对象查询符合条件记录总条数
	 * @param entity
	 * @return
	 */
	public long countByObject(UserIntegralInputDTO userIntegralInputDto);
	
}