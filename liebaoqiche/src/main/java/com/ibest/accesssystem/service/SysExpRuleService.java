package com.ibest.accesssystem.service;

import com.ibest.framework.common.utils.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.ibest.framework.common.utils.PageList;

import com.ibest.accesssystem.dao.SysExpRuleDao;
import com.ibest.accesssystem.entity.SysExpRule;
import com.ibest.accesssystem.dto.input.SysExpRuleInputDTO;

@Service
@Transactional(readOnly=true)
public class SysExpRuleService {

	@Autowired
	protected SysExpRuleDao sysExpRuleDao;
	
	public SysExpRule findById(String id) throws Exception{
		return sysExpRuleDao.findById(id);
	}
	
	@Transactional(readOnly=false)
	public int insert(SysExpRule sysExpRule) throws Exception{
		sysExpRule.preInsert();
		int result = sysExpRuleDao.insert(sysExpRule);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteById(String id) throws Exception{
		int result = sysExpRuleDao.deleteById(id);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteByIds(String ids) throws Exception{
		int result = sysExpRuleDao.deleteByIds(StringUtils.tokenizeToList(ids));
		return result;
	}
	
	@Transactional(readOnly=false)
	public int update(SysExpRule sysExpRule) throws Exception{
		sysExpRule.preUpdate();
		int result = sysExpRuleDao.update(sysExpRule);
		return result;
	}
	
	/**
	 * 分页查询
	 * @param page
	 * @param inputDto
	 * @return
	 * @throws Exception
	 */
	public PageList<SysExpRule> findByPage(PageList<SysExpRule> page, SysExpRuleInputDTO inputDto) throws Exception{
		
		if(page == null){
			page = new PageList<SysExpRule>();
		}
		
		long totalCount = sysExpRuleDao.countByObject(inputDto);
		if(totalCount > 0){
			// 设置记录总条数
			page.setTotal(totalCount);
			
			// 设置分页参数，查询数据
			inputDto.setLimitStart((page.getPage() - 1) * page.getPageSize());
			inputDto.setLimitSize(page.getPageSize());
			page.setRows(sysExpRuleDao.findByObject(inputDto));
		}
		
		return page;
	}
	
	/**
	* 查询列表
	*/
	public SysExpRule findByObject(SysExpRuleInputDTO inputDto) throws Exception{
		return sysExpRuleDao.findOneByObject(inputDto);
	}

}
