package com.ibest.accesssystem.service;

import java.util.ArrayList;
import java.util.List;

import com.ibest.framework.common.utils.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.ibest.framework.common.utils.PageList;

import com.ibest.accesssystem.dao.PointPermissionAssignmentDao;
import com.ibest.accesssystem.entity.PointPermissionAssignment;
import com.ibest.accesssystem.dto.input.PointPermissionAssignmentInputDTO;

@Service
@Transactional(readOnly=true)
public class PointPermissionAssignmentService {

	@Autowired
	protected PointPermissionAssignmentDao pointPermissionAssignmentDao;
	
	public PointPermissionAssignment findById(String id) throws Exception{
		return pointPermissionAssignmentDao.findById(id);
	}
	
	@Transactional(readOnly=false)
	public int insert(PointPermissionAssignment pointPermissionAssignment) throws Exception{
		pointPermissionAssignment.preInsert();
		int result = pointPermissionAssignmentDao.insert(pointPermissionAssignment);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteById(String id) throws Exception{
		int result = pointPermissionAssignmentDao.deleteById(id);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteByIds(String ids) throws Exception{
		int result = pointPermissionAssignmentDao.deleteByIds(StringUtils.tokenizeToList(ids));
		return result;
	}
	
	@Transactional(readOnly=false)
	public int update(PointPermissionAssignment pointPermissionAssignment) throws Exception{
		pointPermissionAssignment.preUpdate();
		int result = pointPermissionAssignmentDao.update(pointPermissionAssignment);
		return result;
	}
	
	/**
	 * 分页查询
	 * @param page
	 * @param inputDto
	 * @return
	 * @throws Exception
	 */
	public PageList<PointPermissionAssignment> findByPage(PageList<PointPermissionAssignment> page, PointPermissionAssignmentInputDTO inputDto) throws Exception{
		
		if(page == null){
			page = new PageList<PointPermissionAssignment>();
		}
		
		long totalCount = pointPermissionAssignmentDao.countByObject(inputDto);
		if(totalCount > 0){
			// 设置记录总条数
			page.setTotal(totalCount);
			
			// 设置分页参数，查询数据
			inputDto.setLimitStart((page.getPage() - 1) * page.getPageSize());
			inputDto.setLimitSize(page.getPageSize());
			page.setRows(pointPermissionAssignmentDao.findByObject(inputDto));
		}
		
		return page;
	}
	
	/**
	* 查询列表
	*/
	public PointPermissionAssignment findByObject(PointPermissionAssignmentInputDTO inputDto) throws Exception{
		return pointPermissionAssignmentDao.findOneByObject(inputDto);
	}

}
