package com.ibest.integral.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ibest.framework.common.persistence.MyBatisDao;
import com.ibest.integral.entity.UserPointStatement;

import com.ibest.integral.dto.input.UserPointStatementInputDTO;

@MyBatisDao
public interface UserPointStatementDao {

	/**
	 * 新增
	 * @param
	 * @return
	 */
	public int insert(UserPointStatement userPointStatement);
	
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
	 * @param
	 * @return
	 */
	public int update(UserPointStatement userPointStatement);
	
	/**
	 * 根据Id获取唯一记录
	 * @param id
	 * @return
	 */
	public UserPointStatement findById(String id);
	
	/**
	 * 根据指定对象查询唯一结果
	 * @param
	 * @return
	 */
	public UserPointStatement findOneByObject(UserPointStatementInputDTO userPointStatementInputDto);
	
	/**
	 * 根据对象查询符合条件结果列表
	 * @param
	 * @return
	 */
	public List<UserPointStatement> findByObject(UserPointStatementInputDTO userPointStatementInputDto);
	
	
	/**
	 * 根据对象查询符合条件记录总条数
	 * @param
	 * @return
	 */
	public long countByObject(UserPointStatementInputDTO userPointStatementInputDto);
	
}