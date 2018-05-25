package com.ibest.integral.service;

import java.util.ArrayList;
import java.util.List;

import com.ibest.framework.common.utils.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.ibest.framework.common.utils.PageList;

import com.ibest.integral.dao.IntegralDao;
import com.ibest.integral.entity.Integral;
import com.ibest.integral.dto.input.IntegralInputDTO;

@Service
@Transactional(readOnly=true)
public class IntegralService {

	@Autowired
	protected IntegralDao integralDao;
	
	public Integral findById(String id) throws Exception{
		return integralDao.findById(id);
	}
	
	@Transactional(readOnly=false)
	public int insert(Integral integral) throws Exception{
		integral.preInsert();
		int result = integralDao.insert(integral);
		return result;
	}
	
	public Integral checkNameUnique(String name) throws Exception{
		return integralDao.checkNameUnique(name);
	}
	
	@Transactional(readOnly=false)
	public int deleteById(String id) throws Exception{
		int result = integralDao.deleteById(id);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteByIds(String ids) throws Exception{
		int result = integralDao.deleteByIds(StringUtils.tokenizeToList(ids));
		return result;
	}
	
	@Transactional(readOnly=false)
	public int update(Integral integral) throws Exception{
		integral.preUpdate();
		int result = integralDao.update(integral);
		return result;
	}
	
	public int queryByCategoryId(String integralCategoryId) throws Exception{
		return integralDao.queryByCategoryId(integralCategoryId);
	}
	
	/**
	 * 分页查询
	 * @param page
	 * @param inputDto
	 * @return
	 * @throws Exception
	 */
	public PageList<Integral> findByPage(PageList<Integral> page, IntegralInputDTO inputDto) throws Exception{
		
		if(page == null){
			page = new PageList<Integral>();
		}
		
		long totalCount = integralDao.countByObject(inputDto);
		if(totalCount > 0){
			// 设置记录总条数
			page.setTotal(totalCount);
			
			// 设置分页参数，查询数据
			inputDto.setLimitStart((page.getPage() - 1) * page.getPageSize());
			inputDto.setLimitSize(page.getPageSize());
			page.setRows(integralDao.findByObject(inputDto));
		}
		
		return page;
	}
	
	/**
	* 查询列表
	*/
	public Integral findOneByObject(IntegralInputDTO inputDto) throws Exception{
		return integralDao.findOneByObject(inputDto);
	}

	/**
	 * 查询列表
	 */
	public List<Integral> findByObject(IntegralInputDTO inputDto) throws Exception{
		return integralDao.findByObject(inputDto);
	}

}
