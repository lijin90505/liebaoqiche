package com.ibest.accesssystem.dao;

import java.util.List;

import com.ibest.activity.entity.Activity;
import org.apache.ibatis.annotations.Param;

import com.ibest.framework.common.persistence.MyBatisDao;
import com.ibest.accesssystem.entity.ActivityPermissionAssignment;

import com.ibest.accesssystem.dto.input.ActivityPermissionAssignmentInputDTO;

@MyBatisDao
public interface ActivityPermissionAssignmentDao {

	/**
	 * 新增
	 * @param entity
	 * @return
	 */
	public int insert(ActivityPermissionAssignment activityPermissionAssignment);
	
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
	public int update(ActivityPermissionAssignment activityPermissionAssignment);
	
	/**
	 * 根据Id获取唯一记录
	 * @param id
	 * @return
	 */
	public ActivityPermissionAssignment findById(String id);
	
	/**
	 * 根据指定对象查询唯一结果
	 * @param entity
	 * @return
	 */
	public ActivityPermissionAssignment findOneByObject(ActivityPermissionAssignmentInputDTO activityPermissionAssignmentInputDto);
	
	/**
	 * 根据对象查询符合条件结果列表
	 * @param entity
	 * @return
	 */
	public List<ActivityPermissionAssignment> findByObject(ActivityPermissionAssignmentInputDTO activityPermissionAssignmentInputDto);
	
	
	/**
	 * 根据对象查询符合条件记录总条数
	 * @param entity
	 * @return
	 */
	public long countByObject(ActivityPermissionAssignmentInputDTO activityPermissionAssignmentInputDto);

	/**
	 * 根据系统标识删除
	 * @param systemSign
	 * @return
	 */
	public int deleteBySystemSign(String systemSign);

	/**
	 * 根据系統标识查询已经选择活动
	 * @param inputDTO
	 * @returngetChoosedRole
	 */
	public List<Activity> getChoosedActivity(ActivityPermissionAssignmentInputDTO inputDTO);

	/**
	 * 根据系統标识查询未选择的活动
	 * @param inputDTO
	 * @return
	 */
	public List<Activity> getUnChoosedActivity(ActivityPermissionAssignmentInputDTO inputDTO);

}