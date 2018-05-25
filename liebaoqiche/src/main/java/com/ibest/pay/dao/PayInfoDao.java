package com.ibest.pay.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ibest.framework.common.persistence.MyBatisDao;
import com.ibest.pay.entity.PayInfo;
import com.ibest.pay.dto.input.PayInfoCount;
import com.ibest.pay.dto.input.PayInfoInputDTO;
import com.ibest.pay.dto.input.PayInfoTime;

@MyBatisDao
public interface PayInfoDao {

	/**
	 * 新增
	 * @param entity
	 * @return
	 */
	public int insert(PayInfo payInfo);
	
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
	public int update(PayInfo payInfo);
	
	/**
	 * 根据Id获取唯一记录
	 * @param id
	 * @return
	 */
	public PayInfo findById(String id);
	
	/**
	 * 根据指定对象查询唯一结果
	 * @param entity
	 * @return
	 */
	public PayInfo findOneByObject(PayInfoInputDTO payInfoInputDto);
	
	/**
	 * 根据对象查询符合条件结果列表
	 * @param entity
	 * @return
	 */
	public List<PayInfo> findByObject(PayInfoInputDTO payInfoInputDto);
	
	
	/**
	 * 根据对象查询符合条件记录总条数
	 * @param entity
	 * @return
	 */
	public long countByObject(PayInfoInputDTO payInfoInputDto);

	public List<PayInfo> findAllOrderId();

	public String countAmount(PayInfoTime infoTime);

	public String countPayInfoNum(PayInfoTime payInfoTime);

	public String countPayInfoTime(PayInfoTime payInfoTime);

	public String countPayInfoRate(PayInfoTime payInfoTime);
	
	public List<PayInfo> findByOrderSendTime(String orderSendTime);

	public List<PayInfoCount> countAmounts(PayInfoTime payInfoTime);

	public List<PayInfoCount> countNums(PayInfoTime payInfoTime);

	public List<PayInfoCount> countTimes(PayInfoTime payInfoTime);

	public List<PayInfoCount> countRates(PayInfoTime payInfoTime);
	
	public List<PayInfo> findByList(PayInfoInputDTO payInfoInputDto);
}