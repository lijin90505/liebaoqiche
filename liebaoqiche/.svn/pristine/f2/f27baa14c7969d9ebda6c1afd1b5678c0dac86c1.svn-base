package com.ibest.card.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ibest.framework.common.persistence.MyBatisDao;
import com.ibest.card.entity.CouponUse;

import com.ibest.card.dto.input.ConpouUseInputDTO;

@MyBatisDao
public interface CouponUseDao {

	/**
	 * 新增
	 * @param conpouUse
	 * @return
	 */
	public int insert(CouponUse conpouUse);
	
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
	 * @param conpouUse
	 * @return
	 */
	public int update(CouponUse conpouUse);
	
	/**
	 * 根据Id获取唯一记录
	 * @param id
	 * @return
	 */
	public CouponUse findById(String id);
	
	/**
	 * 根据指定对象查询唯一结果
	 * @param conpouUseInputDto
	 * @return
	 */
	public CouponUse findOneByObject(ConpouUseInputDTO conpouUseInputDto);
	
	/**
	 * 根据对象查询符合条件结果列表
	 * @param conpouUseInputDto
	 * @return
	 */
	public List<CouponUse> findByObject(ConpouUseInputDTO conpouUseInputDto);
	
	
	/**
	 * 根据对象查询符合条件记录总条数
	 * @param conpouUseInputDto
	 * @return
	 */
	public long countByObject(ConpouUseInputDTO conpouUseInputDto);
	
}