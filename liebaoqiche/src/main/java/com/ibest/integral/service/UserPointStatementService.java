package com.ibest.integral.service;

import com.ibest.framework.common.utils.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.ibest.framework.common.utils.PageList;

import com.ibest.integral.dao.UserPointStatementDao;
import com.ibest.integral.entity.UserPointStatement;
import com.ibest.integral.dto.input.UserPointStatementInputDTO;

@Service
@Transactional(readOnly=true)
public class UserPointStatementService {

	@Autowired
	protected UserPointStatementDao userPointStatementDao;
	
	public UserPointStatement findById(String id) throws Exception{
		return userPointStatementDao.findById(id);
	}
	
	@Transactional(readOnly=false)
	public int insert(UserPointStatement userPointStatement) throws Exception{
		userPointStatement.preInsert();
		int result = userPointStatementDao.insert(userPointStatement);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteById(String id) throws Exception{
		int result = userPointStatementDao.deleteById(id);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteByIds(String ids) throws Exception{
		int result = userPointStatementDao.deleteByIds(StringUtils.tokenizeToList(ids));
		return result;
	}
	
	@Transactional(readOnly=false)
	public int update(UserPointStatement userPointStatement) throws Exception{
		userPointStatement.preUpdate();
		int result = userPointStatementDao.update(userPointStatement);
		return result;
	}
	
	/**
	 * 分页查询
	 * @param page
	 * @param inputDto
	 * @return
	 * @throws Exception
	 */
	public PageList<UserPointStatement> findByPage(PageList<UserPointStatement> page, UserPointStatementInputDTO inputDto) throws Exception{
		
		if(page == null){
			page = new PageList<UserPointStatement>();
		}
		
		long totalCount = userPointStatementDao.countByObject(inputDto);
		if(totalCount > 0){
			// 设置记录总条数
			page.setTotal(totalCount);
			
			// 设置分页参数，查询数据
			inputDto.setLimitStart((page.getPage() - 1) * page.getPageSize());
			inputDto.setLimitSize(page.getPageSize());
			page.setRows(userPointStatementDao.findByObject(inputDto));
		}
		
		return page;
	}
	
	/**
	* 查询列表
	*/
	public UserPointStatement findByObject(UserPointStatementInputDTO inputDto) throws Exception{
		return userPointStatementDao.findOneByObject(inputDto);
	}

}
