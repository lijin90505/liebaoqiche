package com.ibest.experience.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ibest.framework.common.persistence.MyBatisDao;
import com.ibest.experience.entity.Experience;

import com.ibest.experience.dto.input.ExperienceInputDTO;

@MyBatisDao
public interface ExperienceDao {

	/**
	 * 新增
	 * @param entity
	 * @return
	 */
	public int insert(Experience experience);
	
	/**
	 * 根据主键ID删除
	 * @param id
	 * @return
	 */
	public int deleteById(String id);
	
	public Experience checkNameUnique(String name);
	
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
	public int update(Experience experience);
	
	/**
	 * 根据Id获取唯一记录
	 * @param id
	 * @return
	 */
	public Experience findById(String id);
	
	/**
	 * 根据指定对象查询唯一结果
	 * @param entity
	 * @return
	 */
	public Experience findOneByObject(ExperienceInputDTO experienceInputDto);
	
	/**
	 * 根据对象查询符合条件结果列表
	 * @param entity
	 * @return
	 */
	public List<Experience> findUnChoosedExperience();
	
	
	/**
	 * 根据对象查询符合条件结果列表
	 * @param entity
	 * @return
	 */
	public List<Experience> findByObject(ExperienceInputDTO experienceInputDto);
	
	
	/**
	 * 根据对象查询符合条件记录总条数
	 * @param entity
	 * @return
	 */
	public long countByObject(ExperienceInputDTO experienceInputDto);
	
}