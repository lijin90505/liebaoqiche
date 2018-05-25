package com.ibest.card.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ibest.framework.common.persistence.MyBatisDao;
import com.ibest.card.entity.CouponGrant;

import com.ibest.card.dto.input.CouponGrantInputDTO;

@MyBatisDao
public interface CouponGrantDao {

	/**
	 * 新增
	 * @param entity
	 * @return
	 */
	public int insert(CouponGrant couponGrant);
	
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
	public int update(CouponGrant couponGrant);
	
	/**
	 * 根据Id获取唯一记录
	 * @param id
	 * @return
	 */
	public CouponGrant findById(String id);
	
	/**
	 * 根据指定对象查询唯一结果
	 * @param entity
	 * @return
	 */
	public CouponGrant findOneByObject(CouponGrantInputDTO couponGrantInputDto);
	
	/**
	 * 根据对象查询符合条件结果列表
	 * @param entity
	 * @return
	 */
	public List<CouponGrant> findByObject(CouponGrantInputDTO couponGrantInputDto);
	
	
	/**
	 * 根据对象查询符合条件记录总条数
	 * @param entity
	 * @return
	 */
	public long countByObject(CouponGrantInputDTO couponGrantInputDto);
	
}