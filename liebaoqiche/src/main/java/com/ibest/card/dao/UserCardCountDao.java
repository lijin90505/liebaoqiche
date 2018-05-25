package com.ibest.card.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ibest.framework.common.persistence.MyBatisDao;
import com.ibest.card.entity.UserCardCount;

import com.ibest.card.dto.input.UserCardCountInputDTO;

@MyBatisDao
public interface UserCardCountDao {

	/**
	 * 新增
	 * @param entity
	 * @return
	 */
	public int insert(UserCardCount userCardCount);
	
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
	public int update(UserCardCount userCardCount);
	
	public UserCardCount queryCardState(UserCardCount userCardCount);
	
	/**
	 * 根据Id获取唯一记录
	 * @param id
	 * @return
	 */
	public UserCardCount findById(String id);
	
	/**
	 * 根据指定对象查询唯一结果
	 * @param entity
	 * @return
	 */
	public UserCardCount findOneByObject(UserCardCountInputDTO userCardCountInputDto);
	
	/**
	 * 根据对象查询符合条件结果列表
	 * @param entity
	 * @return
	 */
	public List<UserCardCount> findByObject(UserCardCountInputDTO userCardCountInputDto);
	
	
	/**
	 * 根据对象查询符合条件记录总条数
	 * @param entity
	 * @return
	 */
	public long countByObject(UserCardCountInputDTO userCardCountInputDto);
	
}