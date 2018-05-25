package com.ibest.pay.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ibest.framework.common.persistence.MyBatisDao;
import com.ibest.pay.entity.PaySystemOrder;

import com.ibest.pay.dto.input.PaySystemOrderInputDTO;

@MyBatisDao
public interface PaySystemOrderDao {

	/**
	 * 新增
	 * @param entity
	 * @return
	 */
	public int insert(PaySystemOrder paySystemOrder);
	
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
	public int update(PaySystemOrder paySystemOrder);
	
	/**
	 * 根据Id获取唯一记录
	 * @param id
	 * @return
	 */
	public PaySystemOrder findById(String id);
	
	/**
	 * 根据指定对象查询唯一结果
	 * @param entity
	 * @return
	 */
	public PaySystemOrder findOneByObject(PaySystemOrderInputDTO paySystemOrderInputDto);
	
	/**
	 * 根据对象查询符合条件结果列表
	 * @param entity
	 * @return
	 */
	public List<PaySystemOrder> findByObject(PaySystemOrderInputDTO paySystemOrderInputDto);
	
	
	/**
	 * 根据对象查询符合条件记录总条数
	 * @param entity
	 * @return
	 */
	public long countByObject(PaySystemOrderInputDTO paySystemOrderInputDto);
	
	public List<PaySystemOrder> findByTradeTime(String tradeTime);
	
	public List<PaySystemOrder> findByAll();
	
	public List<PaySystemOrder> findByList(PaySystemOrderInputDTO paySystemOrderInputDto);
}