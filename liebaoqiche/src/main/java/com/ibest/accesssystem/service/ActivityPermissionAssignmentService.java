package com.ibest.accesssystem.service;

import java.util.ArrayList;
import java.util.List;

import com.ibest.framework.common.utils.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.ibest.framework.common.utils.PageList;

import com.ibest.accesssystem.dao.ActivityPermissionAssignmentDao;
import com.ibest.accesssystem.entity.ActivityPermissionAssignment;
import com.ibest.accesssystem.dto.input.ActivityPermissionAssignmentInputDTO;

@Service
@Transactional(readOnly=true)
public class ActivityPermissionAssignmentService {

	@Autowired
	protected ActivityPermissionAssignmentDao activityPermissionAssignmentDao;
	
	public ActivityPermissionAssignment findById(String id) throws Exception{
		return activityPermissionAssignmentDao.findById(id);
	}
	
	@Transactional(readOnly=false)
	public int insert(ActivityPermissionAssignment activityPermissionAssignment) throws Exception{
		activityPermissionAssignment.preInsert();
		int result = activityPermissionAssignmentDao.insert(activityPermissionAssignment);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteById(String id) throws Exception{
		int result = activityPermissionAssignmentDao.deleteById(id);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteByIds(String ids) throws Exception{
		int result = activityPermissionAssignmentDao.deleteByIds(StringUtils.tokenizeToList(ids));
		return result;
	}
	
	@Transactional(readOnly=false)
	public int update(ActivityPermissionAssignment activityPermissionAssignment) throws Exception{
		activityPermissionAssignment.preUpdate();
		int result = activityPermissionAssignmentDao.update(activityPermissionAssignment);
		return result;
	}
	
	/**
	 * 分页查询
	 * @param page
	 * @param inputDto
	 * @return
	 * @throws Exception
	 */
	public PageList<ActivityPermissionAssignment> findByPage(PageList<ActivityPermissionAssignment> page, ActivityPermissionAssignmentInputDTO inputDto) throws Exception{
		
		if(page == null){
			page = new PageList<ActivityPermissionAssignment>();
		}
		
		long totalCount = activityPermissionAssignmentDao.countByObject(inputDto);
		if(totalCount > 0){
			// 设置记录总条数
			page.setTotal(totalCount);
			
			// 设置分页参数，查询数据
			inputDto.setLimitStart((page.getPage() - 1) * page.getPageSize());
			inputDto.setLimitSize(page.getPageSize());
			page.setRows(activityPermissionAssignmentDao.findByObject(inputDto));
		}
		
		return page;
	}
	
	/**
	* 查询列表
	*/
	public ActivityPermissionAssignment findByObject(ActivityPermissionAssignmentInputDTO inputDto) throws Exception{
		return activityPermissionAssignmentDao.findOneByObject(inputDto);
	}

}
