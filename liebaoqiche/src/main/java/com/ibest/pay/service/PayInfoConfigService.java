package com.ibest.pay.service;

import java.util.ArrayList;
import java.util.List;

import com.ibest.framework.common.utils.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.ibest.framework.common.utils.PageList;

import com.ibest.pay.dao.PayInfoConfigDao;
import com.ibest.pay.entity.PayInfoConfig;
import com.ibest.pay.dto.input.PayInfoConfigInputDTO;

@Service
@Transactional(readOnly=true)
public class PayInfoConfigService {

	@Autowired
	protected PayInfoConfigDao payInfoConfigDao;
	
	public PayInfoConfig findById(String id) throws Exception{
		return payInfoConfigDao.findById(id);
	}
	
	@Transactional(readOnly=false)
	public int insert(PayInfoConfig payInfoConfig) throws Exception{
		payInfoConfig.preInsert();
		int result = payInfoConfigDao.insert(payInfoConfig);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteById(String id) throws Exception{
		int result = payInfoConfigDao.deleteById(id);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteByIds(String ids) throws Exception{
		int result = payInfoConfigDao.deleteByIds(StringUtils.tokenizeToList(ids));
		return result;
	}
	
	@Transactional(readOnly=false)
	public int update(PayInfoConfig payInfoConfig) throws Exception{
		payInfoConfig.preUpdate();
		int result = payInfoConfigDao.update(payInfoConfig);
		return result;
	}
	
	/**
	 * 分页查询
	 * @param page
	 * @param inputDto
	 * @return
	 * @throws Exception
	 */
	public PageList<PayInfoConfig> findByPage(PageList<PayInfoConfig> page, PayInfoConfigInputDTO inputDto) throws Exception{
		
		if(page == null){
			page = new PageList<PayInfoConfig>();
		}
		
		long totalCount = payInfoConfigDao.countByObject(inputDto);
		if(totalCount > 0){
			// 设置记录总条数
			page.setTotal(totalCount);
			
			// 设置分页参数，查询数据
			inputDto.setLimitStart((page.getPage() - 1) * page.getPageSize());
			inputDto.setLimitSize(page.getPageSize());
			page.setRows(payInfoConfigDao.findByObject(inputDto));
		}
		
		return page;
	}
	
	/**
	* 查询列表
	*/
	public PayInfoConfig findByObject(PayInfoConfigInputDTO inputDto) throws Exception{
		return payInfoConfigDao.findOneByObject(inputDto);
	}

	
}
