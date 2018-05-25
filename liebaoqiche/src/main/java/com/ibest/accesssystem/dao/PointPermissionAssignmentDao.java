package com.ibest.accesssystem.dao;

import java.util.List;

import com.ibest.accesssystem.dto.input.PayChannelPermissionAssignmentInputDTO;
import com.ibest.integral.entity.PointRule;
import org.apache.ibatis.annotations.Param;

import com.ibest.framework.common.persistence.MyBatisDao;
import com.ibest.accesssystem.entity.PointPermissionAssignment;

import com.ibest.accesssystem.dto.input.PointPermissionAssignmentInputDTO;

@MyBatisDao
public interface PointPermissionAssignmentDao {

	/**
	 * 新增
	 * @param entity
	 * @return
	 */
	public int insert(PointPermissionAssignment pointPermissionAssignment);
	
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
	public int update(PointPermissionAssignment pointPermissionAssignment);
	
	/**
	 * 根据Id获取唯一记录
	 * @param id
	 * @return
	 */
	public PointPermissionAssignment findById(String id);
	
	/**
	 * 根据指定对象查询唯一结果
	 * @param entity
	 * @return
	 */
	public PointPermissionAssignment findOneByObject(PointPermissionAssignmentInputDTO pointPermissionAssignmentInputDto);
	
	/**
	 * 根据对象查询符合条件结果列表
	 * @param entity
	 * @return
	 */
	public List<PointPermissionAssignment> findByObject(PointPermissionAssignmentInputDTO pointPermissionAssignmentInputDto);
	
	
	/**
	 * 根据对象查询符合条件记录总条数
	 * @param entity
	 * @return
	 */
	public long countByObject(PointPermissionAssignmentInputDTO pointPermissionAssignmentInputDto);

	/**
	 * 根据系统标识删除
	 * @param systemSign
	 * @return
	 */
	public int deleteBySystemSign(String systemSign);

	/**
	 * 根据系統标识查询已经选择积分规则
	 * @param inputDTO
	 * @returngetChoosedRole
	 */
	public List<PointRule> getChoosedPointRule(PointPermissionAssignmentInputDTO inputDTO);

	/**
	 * 根据系統标识查询未选择的积分规则
	 * @param inputDTO
	 * @return
	 */
	public List<PointRule> getUnChoosedPointRule(PointPermissionAssignmentInputDTO inputDTO);

}