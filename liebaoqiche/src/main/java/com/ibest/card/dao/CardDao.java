package com.ibest.card.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ibest.framework.common.persistence.MyBatisDao;
import com.ibest.card.entity.Card;

import com.ibest.card.dto.input.CardInputDTO;

@MyBatisDao
public interface CardDao {

	/**
	 * 新增
	 * @param entity
	 * @return
	 */
	public int insert(Card card);
	
	/**
	 * 检验卡券名称唯一
	 * @param name
	 * @return
	 */
	public Card checkNameUnique(String name);
	
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
	
	public int queryByUseId(String useId);
	
	public int queryByGetId(String getId);
	
	public int queryByBuildId(String buildId);
	
	/**
	 * 修改
	 * @param entity
	 * @return
	 */
	public int update(Card card);
	
	/**
	 * 根据Id获取唯一记录
	 * @param id
	 * @return
	 */
	public Card findById(String id);
	
	/**
	 * 根据指定对象查询唯一结果
	 * @param entity
	 * @return
	 */
	public Card findOneByObject(CardInputDTO cardInputDto);
	
	/**
	 * 根据对象查询符合条件结果列表
	 * @param entity
	 * @return
	 */
	public List<Card> findByObject(CardInputDTO cardInputDto);
	
	
	/**
	 * 根据对象查询符合条件记录总条数
	 * @param entity
	 * @return
	 */
	public long countByObject(CardInputDTO cardInputDto);
	
}