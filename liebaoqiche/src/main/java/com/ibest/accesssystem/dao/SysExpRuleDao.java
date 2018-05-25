package com.ibest.accesssystem.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ibest.framework.common.persistence.MyBatisDao;
import com.ibest.accesssystem.entity.SysExpRule;

import com.ibest.accesssystem.dto.input.SysExpRuleInputDTO;

@MyBatisDao
public interface SysExpRuleDao {

	/**
	 * 新增
	 * @param
	 * @return
	 */
	public int insert(SysExpRule sysExpRule);
	
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
	 * @param
	 * @return
	 */
	public int update(SysExpRule sysExpRule);
	
	/**
	 * 根据Id获取唯一记录
	 * @param id
	 * @return
	 */
	public SysExpRule findById(String id);
	
	/**
	 * 根据指定对象查询唯一结果
	 * @param
	 * @return
	 */
	public SysExpRule findOneByObject(SysExpRuleInputDTO sysExpRuleInputDto);
	
	/**
	 * 根据对象查询符合条件结果列表
	 * @param
	 * @return
	 */
	public List<SysExpRule> findByObject(SysExpRuleInputDTO sysExpRuleInputDto);
	
	
	/**
	 * 根据对象查询符合条件记录总条数
	 * @param
	 * @return
	 */
	public long countByObject(SysExpRuleInputDTO sysExpRuleInputDto);
	
}