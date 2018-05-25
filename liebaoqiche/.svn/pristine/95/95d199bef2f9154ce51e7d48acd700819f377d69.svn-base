package com.ibest.integral.service;

import java.util.ArrayList;
import java.util.List;

import com.ibest.framework.common.utils.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.ibest.framework.common.utils.PageList;

import com.ibest.integral.dao.SystemPointStatisticsDao;
import com.ibest.integral.entity.SystemPointStatistics;
import com.ibest.integral.dto.input.SystemPointStatisticsInputDTO;

@Service
@Transactional(readOnly=true)
public class SystemPointStatisticsService {

	@Autowired
	protected SystemPointStatisticsDao systemPointStatisticsDao;
	
	public SystemPointStatistics findById(String id) throws Exception{
		return systemPointStatisticsDao.findById(id);
	}
	
	@Transactional(readOnly=false)
	public int insert(SystemPointStatistics systemPointStatistics) throws Exception{
		systemPointStatistics.preInsert();
		int result = systemPointStatisticsDao.insert(systemPointStatistics);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteById(String id) throws Exception{
		int result = systemPointStatisticsDao.deleteById(id);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteByIds(String ids) throws Exception{
		int result = systemPointStatisticsDao.deleteByIds(StringUtils.tokenizeToList(ids));
		return result;
	}
	
	@Transactional(readOnly=false)
	public int update(SystemPointStatistics systemPointStatistics) throws Exception{
		systemPointStatistics.preUpdate();
		int result = systemPointStatisticsDao.update(systemPointStatistics);
		return result;
	}
	
	/**
	 * 分页查询
	 * @param page
	 * @param inputDto
	 * @return
	 * @throws Exception
	 */
	public PageList<SystemPointStatistics> findByPage(PageList<SystemPointStatistics> page, SystemPointStatisticsInputDTO inputDto) throws Exception{
		
		if(page == null){
			page = new PageList<SystemPointStatistics>();
		}
		
		long totalCount = systemPointStatisticsDao.countByObject(inputDto);
		if(totalCount > 0){
			// 设置记录总条数
			page.setTotal(totalCount);
			
			// 设置分页参数，查询数据
			inputDto.setLimitStart((page.getPage() - 1) * page.getPageSize());
			inputDto.setLimitSize(page.getPageSize());
			page.setRows(systemPointStatisticsDao.findByObject(inputDto));
		}
		
		return page;
	}
	
	/**
	* 查询列表
	*/
	public SystemPointStatistics findByObject(SystemPointStatisticsInputDTO inputDto) throws Exception{
		return systemPointStatisticsDao.findOneByObject(inputDto);
	}

}
