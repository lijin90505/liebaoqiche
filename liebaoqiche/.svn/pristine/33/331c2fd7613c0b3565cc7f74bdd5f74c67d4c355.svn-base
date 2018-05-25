package com.ibest.accesssystem.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibest.accesssystem.dao.PayChannelPermissionAssignmentDao;
import com.ibest.accesssystem.dto.input.PayChannelPermissionAssignmentInputDTO;
import com.ibest.accesssystem.entity.PayChannelPermissionAssignment;
import com.ibest.framework.common.utils.PageList;
import com.ibest.framework.common.utils.StringUtils;

@Service
@Transactional(readOnly=true)
public class PayChannelPermissionAssignmentService {

	@Autowired
	protected PayChannelPermissionAssignmentDao payChannelPermissionAssignmentDao;
	
	public PayChannelPermissionAssignment findById(String id) throws Exception{
		return payChannelPermissionAssignmentDao.findById(id);
	}
	
	@Transactional(readOnly=false)
	public int insert(PayChannelPermissionAssignment payChannelPermissionAssignment) throws Exception{
		payChannelPermissionAssignment.preInsert();
		int result = payChannelPermissionAssignmentDao.insert(payChannelPermissionAssignment);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteById(String id) throws Exception{
		int result = payChannelPermissionAssignmentDao.deleteById(id);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteByIds(String ids) throws Exception{
		int result = payChannelPermissionAssignmentDao.deleteByIds(StringUtils.tokenizeToList(ids));
		return result;
	}
	
	@Transactional(readOnly=false)
	public int update(PayChannelPermissionAssignment payChannelPermissionAssignment) throws Exception{
		payChannelPermissionAssignment.preUpdate();
		int result = payChannelPermissionAssignmentDao.update(payChannelPermissionAssignment);
		return result;
	}
	
	/**
	 * 分页查询
	 * @param page
	 * @param inputDto
	 * @return
	 * @throws Exception
	 */
	public PageList<PayChannelPermissionAssignment> findByPage(PageList<PayChannelPermissionAssignment> page, PayChannelPermissionAssignmentInputDTO inputDto) throws Exception{
		
		if(page == null){
			page = new PageList<PayChannelPermissionAssignment>();
		}
		
		long totalCount = payChannelPermissionAssignmentDao.countByObject(inputDto);
		if(totalCount > 0){
			// 设置记录总条数
			page.setTotal(totalCount);
			
			// 设置分页参数，查询数据
			inputDto.setLimitStart((page.getPage() - 1) * page.getPageSize());
			inputDto.setLimitSize(page.getPageSize());
			page.setRows(payChannelPermissionAssignmentDao.findByObject(inputDto));
		}
		
		return page;
	}
	
	/**
	* 查询列表
	*/
	public PayChannelPermissionAssignment findByObject(PayChannelPermissionAssignmentInputDTO inputDto) throws Exception{
		return payChannelPermissionAssignmentDao.findOneByObject(inputDto);
	}

	public List<PayChannelPermissionAssignment> findByAll(){
		return payChannelPermissionAssignmentDao.findByAll();
	}

	public int updateIsOpen(PayChannelPermissionAssignment payChannelPermissionAssignment) {
		return payChannelPermissionAssignmentDao.updateIsOpen(payChannelPermissionAssignment);
	}

}
