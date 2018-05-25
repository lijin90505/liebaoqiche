package com.ibest.accesssystem.service;

import java.util.ArrayList;
import java.util.List;

import com.ibest.framework.common.utils.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.ibest.framework.common.utils.PageList;

import com.ibest.accesssystem.dao.CouponPermissionAssignmentDao;
import com.ibest.accesssystem.entity.CouponPermissionAssignment;
import com.ibest.accesssystem.dto.input.CouponPermissionAssignmentInputDTO;

@Service
@Transactional(readOnly=true)
public class CouponPermissionAssignmentService {

	@Autowired
	protected CouponPermissionAssignmentDao couponPermissionAssignmentDao;
	
	public CouponPermissionAssignment findById(String id) throws Exception{
		return couponPermissionAssignmentDao.findById(id);
	}
	
	@Transactional(readOnly=false)
	public int insert(CouponPermissionAssignment couponPermissionAssignment) throws Exception{
		couponPermissionAssignment.preInsert();
		int result = couponPermissionAssignmentDao.insert(couponPermissionAssignment);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteById(String id) throws Exception{
		int result = couponPermissionAssignmentDao.deleteById(id);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteByIds(String ids) throws Exception{
		int result = couponPermissionAssignmentDao.deleteByIds(StringUtils.tokenizeToList(ids));
		return result;
	}
	
	@Transactional(readOnly=false)
	public int update(CouponPermissionAssignment couponPermissionAssignment) throws Exception{
		couponPermissionAssignment.preUpdate();
		int result = couponPermissionAssignmentDao.update(couponPermissionAssignment);
		return result;
	}
	
	/**
	 * 分页查询
	 * @param page
	 * @param inputDto
	 * @return
	 * @throws Exception
	 */
	public PageList<CouponPermissionAssignment> findByPage(PageList<CouponPermissionAssignment> page, CouponPermissionAssignmentInputDTO inputDto) throws Exception{
		
		if(page == null){
			page = new PageList<CouponPermissionAssignment>();
		}
		
		long totalCount = couponPermissionAssignmentDao.countByObject(inputDto);
		if(totalCount > 0){
			// 设置记录总条数
			page.setTotal(totalCount);
			
			// 设置分页参数，查询数据
			inputDto.setLimitStart((page.getPage() - 1) * page.getPageSize());
			inputDto.setLimitSize(page.getPageSize());
			page.setRows(couponPermissionAssignmentDao.findByObject(inputDto));
		}
		
		return page;
	}
	
	/**
	* 查询列表
	*/
	public CouponPermissionAssignment findByObject(CouponPermissionAssignmentInputDTO inputDto) throws Exception{
		return couponPermissionAssignmentDao.findOneByObject(inputDto);
	}

}
