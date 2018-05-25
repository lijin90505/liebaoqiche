package com.ibest.integral.service;

import com.ibest.framework.common.utils.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.ibest.framework.common.utils.PageList;

import com.ibest.integral.dao.PointTypeRuleRelevanceDao;
import com.ibest.integral.entity.PointTypeRuleRelevance;
import com.ibest.integral.dto.input.PointTypeRuleRelevanceInputDTO;

@Service
@Transactional(readOnly=true)
public class PointTypeRuleRelevanceService {

	@Autowired
	protected PointTypeRuleRelevanceDao pointTypeRuleRelevanceDao;
	
	public PointTypeRuleRelevance findById(String id) throws Exception{
		return pointTypeRuleRelevanceDao.findById(id);
	}
	
	@Transactional(readOnly=false)
	public int insert(PointTypeRuleRelevance pointTypeRuleRelevance) throws Exception{
		pointTypeRuleRelevance.preInsert();
		int result = pointTypeRuleRelevanceDao.insert(pointTypeRuleRelevance);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteById(String id) throws Exception{
		int result = pointTypeRuleRelevanceDao.deleteById(id);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteByIds(String ids) throws Exception{
		int result = pointTypeRuleRelevanceDao.deleteByIds(StringUtils.tokenizeToList(ids));
		return result;
	}
	
	@Transactional(readOnly=false)
	public int update(PointTypeRuleRelevance pointTypeRuleRelevance) throws Exception{
		pointTypeRuleRelevance.preUpdate();
		int result = pointTypeRuleRelevanceDao.update(pointTypeRuleRelevance);
		return result;
	}
	
	/**
	 * 分页查询
	 * @param page
	 * @param inputDto
	 * @return
	 * @throws Exception
	 */
	public PageList<PointTypeRuleRelevance> findByPage(PageList<PointTypeRuleRelevance> page, PointTypeRuleRelevanceInputDTO inputDto) throws Exception{
		
		if(page == null){
			page = new PageList<PointTypeRuleRelevance>();
		}
		
		long totalCount = pointTypeRuleRelevanceDao.countByObject(inputDto);
		if(totalCount > 0){
			// 设置记录总条数
			page.setTotal(totalCount);
			
			// 设置分页参数，查询数据
			inputDto.setLimitStart((page.getPage() - 1) * page.getPageSize());
			inputDto.setLimitSize(page.getPageSize());
			page.setRows(pointTypeRuleRelevanceDao.findByObject(inputDto));
		}
		
		return page;
	}
	
	/**
	* 查询列表
	*/
	public PointTypeRuleRelevance findByObject(PointTypeRuleRelevanceInputDTO inputDto) throws Exception{
		return pointTypeRuleRelevanceDao.findOneByObject(inputDto);
	}

}
