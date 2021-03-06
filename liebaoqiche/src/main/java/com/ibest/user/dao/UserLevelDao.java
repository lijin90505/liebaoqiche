package com.ibest.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ibest.framework.common.persistence.MyBatisDao;
import com.ibest.user.entity.UserLevel;
import com.ibest.user.dto.input.UserLevelInputDTO;

@MyBatisDao
public interface UserLevelDao {

	/**
	 * 新增
	 * @param entity
	 * @return
	 */
	public int insert(UserLevel userLevel);
	
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
	public int update(UserLevel userLevel);
	
	/**
	 * 根据Id获取唯一记录
	 * @param id
	 * @return
	 */
	public UserLevel findById(String id);
	
	/**
	 * 根据指定对象查询唯一结果
	 * @param entity
	 * @return
	 */
	public UserLevel findOneByObject(UserLevelInputDTO userLevelInputDto);
	
	
	/**
	 * 根据对象查询符合条件结果列表
	 * @param entity
	 * @return
	 */
	public List<UserLevel> findAllLevels(UserLevelInputDTO userLevelInputDto);
	
	/**
	 * 根据对象查询未删除结果列表
	 * @param entity
	 * @return
	 */
	public List<UserLevel> findAllLevel(UserLevelInputDTO userLevelInputDto);
	
	/**
	 * 根据对象查询符合条件结果列表
	 * @param entity
	 * @return
	 */
	public List<UserLevel> findByObject(UserLevelInputDTO userLevelInputDto);
	
	
	/**
	 * 根据对象查询符合条件记录总条数
	 * @param entity
	 * @return
	 */
	public long countByObject(UserLevelInputDTO userLevelInputDto);

	/**
	 * 根据条件对象查询个数
	 * @param inputDTO
	 * @return
	 */
	public int countLevelObject(UserLevelInputDTO userLevelInputDto);

	/**
	 * 根据条件对象查询个数
	 * @param inputDTO
	 * @return
	 */
	public int countLevelNameObject(UserLevelInputDTO userLevelInputDto);
	
}