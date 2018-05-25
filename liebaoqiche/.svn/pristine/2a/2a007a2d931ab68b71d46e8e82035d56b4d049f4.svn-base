package com.ibest.user.service;

import java.util.List;

import com.ibest.framework.common.utils.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.ibest.framework.common.utils.PageList;

import com.ibest.user.dao.UserLevelDao;
import com.ibest.user.entity.UserLevel;
import com.ibest.user.dto.input.UserLevelInputDTO;

@Service
@Transactional(readOnly=true)
public class UserLevelService {

	@Autowired
	protected UserLevelDao userLevelDao;
	
	public UserLevel findById(String id) throws Exception{
		return userLevelDao.findById(id);
	}
	
	@Transactional(readOnly=false)
	public int insert(UserLevel userLevel) throws Exception{
		userLevel.preInsert();
		int result = userLevelDao.insert(userLevel);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteById(String id) throws Exception{
		int result = userLevelDao.deleteById(id);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteByIds(String ids) throws Exception{
		int result = userLevelDao.deleteByIds(StringUtils.tokenizeToList(ids));
		return result;
	}
	
	@Transactional(readOnly=false)
	public int update(UserLevel userLevel) throws Exception{
		userLevel.preUpdate();
		int result = userLevelDao.update(userLevel);
		return result;
	}
	
	/**
	 * 分页查询
	 * @param page
	 * @param inputDto
	 * @return
	 * @throws Exception
	 */
	public PageList<UserLevel> findByPage(PageList<UserLevel> page, UserLevelInputDTO inputDto) throws Exception{
		
		if(page == null){
			page = new PageList<UserLevel>();
		}
		
		long totalCount = userLevelDao.countByObject(inputDto);
		if(totalCount > 0){
			// 设置记录总条数
			page.setTotal(totalCount);
			
			// 设置分页参数，查询数据
			inputDto.setLimitStart((page.getPage() - 1) * page.getPageSize());
			inputDto.setLimitSize(page.getPageSize());
			page.setRows(userLevelDao.findByObject(inputDto));
		}
		
		return page;
	}
	
	public List<UserLevel> findAllLevels(UserLevelInputDTO inputDTO) throws Exception{
		return userLevelDao.findAllLevels(inputDTO);
	}
	
	public List<UserLevel> findAllLevel(UserLevelInputDTO inputDTO) throws Exception{
		return userLevelDao.findAllLevel(inputDTO);
	}
	
	/**
	* 查询列表
	*/
	public UserLevel findOneByObject(UserLevelInputDTO inputDto) throws Exception{
		return userLevelDao.findOneByObject(inputDto);
	}

	/**
	 * 查询列表
	 */
	public List<UserLevel> findByObject(UserLevelInputDTO inputDto) throws Exception{
		return userLevelDao.findByObject(inputDto);
	}

	/**
	 * 根据条件对象查询用户个数
	 * @param inputDto
	 * @return
	 */
	public int countLevelObject(UserLevelInputDTO inputDto) {
		return userLevelDao.countLevelObject(inputDto);
	}

	/**
	 * 根据条件对象查询用户个数
	 * @param inputDto
	 * @return
	 */
	public int countLevelNameObject(UserLevelInputDTO inputDto) {
		return userLevelDao.countLevelNameObject(inputDto);
	}

}
