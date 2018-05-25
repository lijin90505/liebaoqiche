package com.ibest.experience.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ibest.framework.common.persistence.MyBatisDao;
import com.ibest.experience.entity.ExperienceGrade;

import com.ibest.experience.dto.input.ExperienceGradeInputDTO;

@MyBatisDao
public interface ExperienceGradeDao {

	/**
	 * 新增
	 * @param entity
	 * @return
	 */
	public int insert(ExperienceGrade experienceGrade);
	
	/**
	 * 检验名称唯一性
	 * @param name
	 * @return
	 */
	public ExperienceGrade checkNameUnique(String name);
	
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
	public int update(ExperienceGrade experienceGrade);
	
	/**
	 * 根据Id获取唯一记录
	 * @param id
	 * @return
	 */
	public ExperienceGrade findById(String id);
	
	/**
	 * 根据指定对象查询唯一结果
	 * @param entity
	 * @return
	 */
	public ExperienceGrade findOneByObject(ExperienceGradeInputDTO experienceGradeInputDto);
	
	/**
	 * 根据对象查询符合条件结果列表
	 * @param entity
	 * @return
	 */
	public List<ExperienceGrade> findByObject(ExperienceGradeInputDTO experienceGradeInputDto);
	
	/**
	 * 查询最大值
	 * @return
	 */
	public int queryMaxNum();
	
	/**
	 * 根据对象查询符合条件记录总条数
	 * @param entity
	 * @return
	 */
	public long countByObject(ExperienceGradeInputDTO experienceGradeInputDto);
	
}