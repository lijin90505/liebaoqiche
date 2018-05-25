package com.ibest.integral.service;

import com.ibest.framework.common.utils.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.ibest.framework.common.utils.PageList;

import com.ibest.integral.dao.UserPointDao;
import com.ibest.integral.entity.UserPoint;
import com.ibest.integral.dto.input.UserPointInputDTO;

@Service
@Transactional(readOnly=true)
public class UserPointService {

	@Autowired
	protected UserPointDao userPointDao;
	
	public UserPoint findById(String id) throws Exception{
		return userPointDao.findById(id);
	}
	
	@Transactional(readOnly=false)
	public int insert(UserPoint userPoint) throws Exception{
		userPoint.preInsert();
		int result = userPointDao.insert(userPoint);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteById(String id) throws Exception{
		int result = userPointDao.deleteById(id);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteByIds(String ids) throws Exception{
		int result = userPointDao.deleteByIds(StringUtils.tokenizeToList(ids));
		return result;
	}
	
	@Transactional(readOnly=false)
	public int update(UserPoint userPoint) throws Exception{
		userPoint.preUpdate();
		int result = userPointDao.update(userPoint);
		return result;
	}
	
	/**
	 * 分页查询
	 * @param page
	 * @param inputDto
	 * @return
	 * @throws Exception
	 */
	public PageList<UserPoint> findByPage(PageList<UserPoint> page, UserPointInputDTO inputDto) throws Exception{
		
		if(page == null){
			page = new PageList<UserPoint>();
		}
		
		long totalCount = userPointDao.countByObject(inputDto);
		if(totalCount > 0){
			// 设置记录总条数
			page.setTotal(totalCount);
			
			// 设置分页参数，查询数据
			inputDto.setLimitStart((page.getPage() - 1) * page.getPageSize());
			inputDto.setLimitSize(page.getPageSize());
			page.setRows(userPointDao.findByObject(inputDto));
		}
		
		return page;
	}
	
	/**
	* 查询列表
	*/
	public UserPoint findByObject(UserPointInputDTO inputDto) throws Exception{
		return userPointDao.findOneByObject(inputDto);
	}

}
