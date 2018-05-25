package com.ibest.pay.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ibest.framework.common.persistence.MyBatisDao;
import com.ibest.pay.entity.PayRefundInfo;

import com.ibest.pay.dto.input.PayRefundInfoInputDTO;

@MyBatisDao
public interface PayRefundInfoDao {

	/**
	 * 新增
	 * @param entity
	 * @return
	 */
	public int insert(PayRefundInfo payRefundInfo);
	
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
	public int update(PayRefundInfo payRefundInfo);
	
	/**
	 * 根据Id获取唯一记录
	 * @param id
	 * @return
	 */
	public PayRefundInfo findById(String id);
	
	/**
	 * 根据指定对象查询唯一结果
	 * @param entity
	 * @return
	 */
	public PayRefundInfo findOneByObject(PayRefundInfoInputDTO payRefundInfoInputDto);
	
	/**
	 * 根据对象查询符合条件结果列表
	 * @param entity
	 * @return
	 */
	public List<PayRefundInfo> findByObject(PayRefundInfoInputDTO payRefundInfoInputDto);
	
	
	/**
	 * 根据对象查询符合条件记录总条数
	 * @param entity
	 * @return
	 */
	public long countByObject(PayRefundInfoInputDTO payRefundInfoInputDto);
	
}