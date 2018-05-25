package com.ibest.card.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ibest.framework.common.persistence.MyBatisDao;
import com.ibest.card.entity.CouponRecall;

import com.ibest.card.dto.input.CouponRecallInputDTO;

@MyBatisDao
public interface CouponRecallDao {

	/**
	 * 新增
	 * @param entity
	 * @return
	 */
	public int insert(CouponRecall couponRecall);
	
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
	public int update(CouponRecall couponRecall);
	
	/**
	 * 根据Id获取唯一记录
	 * @param id
	 * @return
	 */
	public CouponRecall findById(String id);
	
	/**
	 * 根据指定对象查询唯一结果
	 * @param entity
	 * @return
	 */
	public CouponRecall findOneByObject(CouponRecallInputDTO couponRecallInputDto);
	
	/**
	 * 根据对象查询符合条件结果列表
	 * @param entity
	 * @return
	 */
	public List<CouponRecall> findByObject(CouponRecallInputDTO couponRecallInputDto);
	
	
	/**
	 * 根据对象查询符合条件记录总条数
	 * @param entity
	 * @return
	 */
	public long countByObject(CouponRecallInputDTO couponRecallInputDto);
	
}