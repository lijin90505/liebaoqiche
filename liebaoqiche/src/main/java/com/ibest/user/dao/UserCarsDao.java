package com.ibest.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ibest.framework.common.persistence.MyBatisDao;
import com.ibest.user.entity.UserCars;

import com.ibest.user.dto.input.UserCarsInputDTO;

@MyBatisDao
public interface UserCarsDao {

	/**
	 * 新增
	 * @param entity
	 * @return
	 */
	public int insert(UserCars userCars);
	
	/**
	 * 查询用户汽车
	 * @param userId
	 * @return
	 */
	public List<UserCars> findVinNoByUserId(String userId);
	/**
	 * 查询用户汽车详情
	 * @param userId
	 * @return
	 */
	public List<UserCars> findVinByUserId(String userId);
	
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
	public int update(UserCars userCars);
	
	/**
	 * 根据Id获取唯一记录
	 * @param id
	 * @return
	 */
	public UserCars findById(String id);
	
	/**
	 * 根据指定对象查询唯一结果
	 * @param entity
	 * @return
	 */
	public UserCars findOneByObject(UserCarsInputDTO userCarsInputDto);
	
	/**
	 * 根据对象查询符合条件结果列表
	 * @param entity
	 * @return
	 */
	public List<UserCars> findByObject(UserCarsInputDTO userCarsInputDto);
	
	
	/**
	 * 根据对象查询符合条件记录总条数
	 * @param entity
	 * @return
	 */
	public long countByObject(UserCarsInputDTO userCarsInputDto);
	
}