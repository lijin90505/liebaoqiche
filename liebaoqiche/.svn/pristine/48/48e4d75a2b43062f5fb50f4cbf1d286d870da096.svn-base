package com.ibest.integral.service;

import com.ibest.framework.common.utils.PageList;
import com.ibest.framework.common.utils.StringUtils;
import com.ibest.integral.dao.PointRuleDao;
import com.ibest.integral.dto.input.PointRuleInputDTO;
import com.ibest.integral.entity.PointRule;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly=true)
public class PointRuleService {

	@Autowired
	protected PointRuleDao pointRuleDao;
	
	public PointRule findById(String id) throws Exception{
		return pointRuleDao.findById(id);
	}
	
	@Transactional(readOnly=false)
	public int insert(PointRule pointRule) throws Exception{
		pointRule.preInsert();
		int result = pointRuleDao.insert(pointRule);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteById(String id) throws Exception{
		int result = pointRuleDao.deleteById(id);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteByIds(String ids) throws Exception{
		int result = pointRuleDao.deleteByIds(StringUtils.tokenizeToList(ids));
		return result;
	}
	
	@Transactional(readOnly=false)
	public int update(PointRule pointRule) throws Exception{
		pointRule.preUpdate();
		int result = pointRuleDao.update(pointRule);
		return result;
	}
	
	/**
	 * 分页查询
	 * @param page
	 * @param inputDto
	 * @return
	 * @throws Exception
	 */
	public PageList<PointRule> findByPage(PageList<PointRule> page, PointRuleInputDTO inputDto) throws Exception{
		
		if(page == null){
			page = new PageList<PointRule>();
		}
		
		long totalCount = pointRuleDao.countByObject(inputDto);
		if(totalCount > 0){
			// 设置记录总条数
			page.setTotal(totalCount);
			
			// 设置分页参数，查询数据
			inputDto.setLimitStart((page.getPage() - 1) * page.getPageSize());
			inputDto.setLimitSize(page.getPageSize());
			page.setRows(pointRuleDao.findByObject(inputDto));
		}
		
		return page;
	}
	
	/**
	 * 查询列表
	 */
	public List<PointRule> findByObject(PointRuleInputDTO inputDto) throws Exception{
		return pointRuleDao.findByObject(inputDto);
	}

	public PointRule findOneByObject(PointRuleInputDTO inputDto) throws Exception{
		return pointRuleDao.findOneByObject(inputDto);
	}

}
