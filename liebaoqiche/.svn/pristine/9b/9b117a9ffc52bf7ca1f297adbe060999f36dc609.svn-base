package com.ibest.user.service;

import java.util.ArrayList;
import java.util.List;

import com.ibest.framework.common.utils.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.ibest.framework.common.utils.PageList;

import com.ibest.user.dao.UserLogDao;
import com.ibest.user.entity.UserLog;
import com.ibest.user.dto.input.UserLogInputDTO;

@Service
@Transactional(readOnly=true)
public class UserLogService {

	@Autowired
	protected UserLogDao userLogDao;
	
	public UserLog findById(String id) throws Exception{
		return userLogDao.findById(id);
	}
	
	@Transactional(readOnly=false)
	public int insert(UserLog userLog) throws Exception{
		userLog.preInsert();
		int result = userLogDao.insert(userLog);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteById(String id) throws Exception{
		int result = userLogDao.deleteById(id);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteByIds(String ids) throws Exception{
		int result = userLogDao.deleteByIds(StringUtils.tokenizeToList(ids));
		return result;
	}
	
	@Transactional(readOnly=false)
	public int update(UserLog userLog) throws Exception{
		userLog.preUpdate();
		int result = userLogDao.update(userLog);
		return result;
	}
	
	/**
	 * 分页查询
	 * @param page
	 * @param inputDto
	 * @return
	 * @throws Exception
	 */
	public PageList<UserLog> findByPage(PageList<UserLog> page, UserLogInputDTO inputDto) throws Exception{
		
		if(page == null){
			page = new PageList<UserLog>();
		}
		
		long totalCount = userLogDao.countByObject(inputDto);
		if(totalCount > 0){
			// 设置记录总条数
			page.setTotal(totalCount);
			
			// 设置分页参数，查询数据
			inputDto.setLimitStart((page.getPage() - 1) * page.getPageSize());
			inputDto.setLimitSize(page.getPageSize());
			page.setRows(userLogDao.findByObject(inputDto));
		}
		
		return page;
	}
	
	/**
	* 查询列表
	*/
	public UserLog findByObject(UserLogInputDTO inputDto) throws Exception{
		return userLogDao.findOneByObject(inputDto);
	}

}
