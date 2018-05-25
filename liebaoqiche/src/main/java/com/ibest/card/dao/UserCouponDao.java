package com.ibest.card.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ibest.framework.common.persistence.MyBatisDao;
import com.ibest.card.entity.UserCoupon;

import com.ibest.card.dto.input.UserCouponInputDTO;

@MyBatisDao
public interface UserCouponDao {

	/**
	 * 新增
	 * @param entity
	 * @return
	 */
	public int insert(UserCoupon userCoupon);
	
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
	public int update(UserCoupon userCoupon);
	
	/**
	 * 根据Id获取唯一记录
	 * @param id
	 * @return
	 */
	public UserCoupon findById(String id);
	
	/**
	 * 根据指定对象查询唯一结果
	 * @param entity
	 * @return
	 */
	public UserCoupon findOneByObject(UserCouponInputDTO userCouponInputDto);
	
	/**
	 * 根据对象查询符合条件结果列表
	 * @param entity
	 * @return
	 */
	public List<UserCoupon> findByObject(UserCouponInputDTO userCouponInputDto);
	
	
	/**
	 * 根据对象查询符合条件记录总条数
	 * @param entity
	 * @return
	 */
	public long countByObject(UserCouponInputDTO userCouponInputDto);
	
}