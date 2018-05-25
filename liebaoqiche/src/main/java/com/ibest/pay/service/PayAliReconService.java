package com.ibest.pay.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibest.framework.common.utils.PageList;
import com.ibest.framework.common.utils.StringUtils;
import com.ibest.pay.dao.PayAliReconDao;
import com.ibest.pay.dto.input.PayAliReconInputDTO;
import com.ibest.pay.entity.PayAliRecon;

@Service
@Transactional(readOnly=true)
public class PayAliReconService {

	@Autowired
	protected PayAliReconDao payAliReconDao;
	
	public PayAliRecon findById(String id) throws Exception{
		return payAliReconDao.findById(id);
	}
	
	@Transactional(readOnly=false)
	public int insert(PayAliRecon payAliRecon) throws Exception{
		payAliRecon.preInsert();
		int result = payAliReconDao.insert(payAliRecon);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteById(String id) throws Exception{
		int result = payAliReconDao.deleteById(id);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteByIds(String ids) throws Exception{
		int result = payAliReconDao.deleteByIds(StringUtils.tokenizeToList(ids));
		return result;
	}
	
	@Transactional(readOnly=false)
	public int update(PayAliRecon payAliRecon) throws Exception{
		payAliRecon.preUpdate();
		int result = payAliReconDao.update(payAliRecon);
		return result;
	}
	
	/**
	 * 分页查询
	 * @param page
	 * @param inputDto
	 * @return
	 * @throws Exception
	 */
	public PageList<PayAliRecon> findByPage(PageList<PayAliRecon> page, PayAliReconInputDTO inputDto) throws Exception{
		
		if(page == null){
			page = new PageList<PayAliRecon>();
		}
		
		long totalCount = payAliReconDao.countByObject(inputDto);
		if(totalCount > 0){
			// 设置记录总条数
			page.setTotal(totalCount);
			
			// 设置分页参数，查询数据
			inputDto.setLimitStart((page.getPage() - 1) * page.getPageSize());
			inputDto.setLimitSize(page.getPageSize());
			page.setRows(payAliReconDao.findByObject(inputDto));
		}
		
		return page;
	}
	
	/**
	* 查询列表
	*/
	public PayAliRecon findByObject(PayAliReconInputDTO inputDto) throws Exception{
		return payAliReconDao.findOneByObject(inputDto);
	}

}
