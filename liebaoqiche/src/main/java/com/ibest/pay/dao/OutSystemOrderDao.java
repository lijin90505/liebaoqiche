package com.ibest.pay.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ibest.framework.common.persistence.MyBatisDao;
import com.ibest.pay.entity.OutSystemOrder;

import com.ibest.pay.dto.input.OutSystemOrderInputDTO;

@MyBatisDao
public interface OutSystemOrderDao {

	/**
	 * 新增
	 * @param entity
	 * @return
	 */
	public int insert(OutSystemOrder outSystemOrder);
	
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
	public int update(OutSystemOrder outSystemOrder);
	
	/**
	 * 根据Id获取唯一记录
	 * @param id
	 * @return
	 */
	public OutSystemOrder findById(String id);
	
	/**
	 * 根据指定对象查询唯一结果
	 * @param entity
	 * @return
	 */
	public OutSystemOrder findOneByObject(OutSystemOrderInputDTO outSystemOrderInputDto);
	
	/**
	 * 根据对象查询符合条件结果列表
	 * @param entity
	 * @return
	 */
	public List<OutSystemOrder> findByObject(OutSystemOrderInputDTO outSystemOrderInputDto);
	
	
	/**
	 * 根据对象查询符合条件记录总条数
	 * @param entity
	 * @return
	 */
	public long countByObject(OutSystemOrderInputDTO outSystemOrderInputDto);
	
	/**
	 * 根据支付时间
	 * @Title: findByOrderId  
	 * @param: @param orderPayTime
	 * @return:List<OutSystemOrder>
	 * @author: WeiJia
	 * @date:2018年4月24日 下午7:22:22
	 */
	public List<OutSystemOrder> findByOrderPayTime(String orderPayTime);
	
	public List<OutSystemOrder> findByAll();
	
	public List<OutSystemOrder> findByList(OutSystemOrderInputDTO outSystemOrderInputDto);
}