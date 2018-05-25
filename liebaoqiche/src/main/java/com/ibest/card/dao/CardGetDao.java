package com.ibest.card.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ibest.framework.common.persistence.MyBatisDao;
import com.ibest.card.entity.CardGet;

import com.ibest.card.dto.input.CardGetInputDTO;

@MyBatisDao
public interface CardGetDao {

	/**
	 * 新增
	 * @param entity
	 * @return
	 */
	public int insert(CardGet cardGet);
	
	/**
	 * 检验名称唯一
	 * @param name
	 * @return
	 */
	public CardGet checkNameUnique(String name);
	
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
	public int update(CardGet cardGet);
	
	/**
	 * 根据Id获取唯一记录
	 * @param id
	 * @return
	 */
	public CardGet findById(String id);
	
	/**
	 * 根据指定对象查询唯一结果
	 * @param entity
	 * @return
	 */
	public CardGet findOneByObject(CardGetInputDTO cardGetInputDto);
	
	/**
	 * 根据对象查询符合条件结果列表
	 * @param entity
	 * @return
	 */
	public List<CardGet> findByObject(CardGetInputDTO cardGetInputDto);
	
	
	/**
	 * 根据对象查询符合条件记录总条数
	 * @param entity
	 * @return
	 */
	public long countByObject(CardGetInputDTO cardGetInputDto);
	
}