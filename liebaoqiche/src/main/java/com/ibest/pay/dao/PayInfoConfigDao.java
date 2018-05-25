package com.ibest.pay.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ibest.framework.common.persistence.MyBatisDao;
import com.ibest.pay.entity.PayInfoConfig;

import com.ibest.pay.dto.input.PayInfoConfigInputDTO;

@MyBatisDao
public interface PayInfoConfigDao {

	/**
	 * 新增
	 * @param entity
	 * @return
	 */
	public int insert(PayInfoConfig payInfoConfig);
	
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
	public int update(PayInfoConfig payInfoConfig);
	
	/**
	 * 根据Id获取唯一记录
	 * @param id
	 * @return
	 */
	public PayInfoConfig findById(String id);
	
	/**
	 * 根据指定对象查询唯一结果
	 * @param entity
	 * @return
	 */
	public PayInfoConfig findOneByObject(PayInfoConfigInputDTO payInfoConfigInputDto);
	
	/**
	 * 根据对象查询符合条件结果列表
	 * @param entity
	 * @return
	 */
	public List<PayInfoConfig> findByObject(PayInfoConfigInputDTO payInfoConfigInputDto);
	
	
	/**
	 * 根据对象查询符合条件记录总条数
	 * @param entity
	 * @return
	 */
	public long countByObject(PayInfoConfigInputDTO payInfoConfigInputDto);
	
}