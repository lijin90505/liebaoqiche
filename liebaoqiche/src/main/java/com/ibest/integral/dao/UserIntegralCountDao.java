package com.ibest.integral.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ibest.framework.common.persistence.MyBatisDao;
import com.ibest.integral.entity.UserIntegralCount;

import com.ibest.integral.dto.input.UserIntegralCountInputDTO;

@MyBatisDao
public interface UserIntegralCountDao {

	/**
	 * 新增
	 * @param entity
	 * @return
	 */
	public int insert(UserIntegralCount userIntegralCount);
	
	/**
	 * 根据主键ID删除
	 * @param id
	 * @return
	 */
	public int deleteById(String id);
	
	public Integer queryIntegralByUserId(String userId);
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
	public int update(UserIntegralCount userIntegralCount);
	
	
	/**
	 * 通过用户id查找
	 * @param userIntegralCount
	 * @return
	 */
	public List<UserIntegralCount> findByUserId(String userId);
	
	
	/**
	 * 查找用户积分对象
	 * @param userIntegralCount
	 * @return
	 */
	public UserIntegralCount findEntityByObject(UserIntegralCount userIntegralCount);
	
	/**
	 * 根据Id获取唯一记录
	 * @param id
	 * @return
	 */
	public UserIntegralCount findById(String id);
	
	/**
	 * 根据指定对象查询唯一结果
	 * @param entity
	 * @return
	 */
	public UserIntegralCount findOneByObject(UserIntegralCountInputDTO userIntegralCountInputDto);
	
	/**
	 * 根据对象查询符合条件结果列表
	 * @param entity
	 * @return
	 */
	public List<UserIntegralCount> findByObject(UserIntegralCountInputDTO userIntegralCountInputDto);
	
	
	/**
	 * 根据对象查询符合条件记录总条数
	 * @param entity
	 * @return
	 */
	public long countByObject(UserIntegralCountInputDTO userIntegralCountInputDto);
	
	public List<UserIntegralCount> countByList(UserIntegralCountInputDTO userIntegralCountInputDto);
}