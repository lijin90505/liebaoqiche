package com.ibest.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ibest.framework.common.persistence.MyBatisDao;
import com.ibest.user.entity.UserAuthApply;

import com.ibest.user.dto.input.UserAuthApplyInputDTO;

@MyBatisDao
public interface UserAuthApplyDao {

	/**
	 * 新增
	 *
	 * @param entity
	 * @return
	 */
	public int insert(UserAuthApply userAuthApply);

	/**
	 * 根据主键ID删除
	 *
	 * @param id
	 * @return
	 */
	public int deleteById(String id);

	/**
	 * 批量删除
	 *
	 * @param ids
	 * @return
	 */
	public int deleteByIds(@Param("ids") List<String> ids);

	/**
	 * 修改
	 *
	 * @param entity
	 * @return
	 */
	public int update(UserAuthApply userAuthApply);

	/**
	 * 根据Id获取唯一记录
	 *
	 * @param id
	 * @return
	 */
	public UserAuthApply findById(String id);

	/**
	 * 根据指定对象查询唯一结果
	 *
	 * @param entity
	 * @return
	 */
	public UserAuthApply findOneByObject(UserAuthApplyInputDTO userAuthApplyInputDto);

	/**
	 * 查询所以等级
	 * @param userAuthApplyInputDto
	 * @return
	 */
	public List<UserAuthApply> findAllLevel(UserAuthApplyInputDTO userAuthApplyInputDto);

	/**
	 * 根据对象查询符合条件结果列表
	 *
	 * @param entity
	 * @return
	 */
	public List<UserAuthApply> findByObject(UserAuthApplyInputDTO userAuthApplyInputDto);


	/**
	 * 根据对象查询符合条件记录总条数
	 *
	 * @param entity
	 * @return
	 */
	public long countByObject(UserAuthApplyInputDTO userAuthApplyInputDto);

	/**
	 * 批量处理认证申请，通过/拒绝
	 * @param ids
	 * @param status
	 * @param detail
	 * @return
	 */
	int handle(@Param("ids") List<String> ids, @Param("status") Integer status, @Param("detail") String detail);
}