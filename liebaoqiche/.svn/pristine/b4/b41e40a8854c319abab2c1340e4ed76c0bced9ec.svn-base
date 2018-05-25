package com.ibest.pay.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibest.framework.common.utils.PageList;
import com.ibest.framework.common.utils.StringUtils;
import com.ibest.pay.dao.PayUnionReconDao;
import com.ibest.pay.dto.input.PayUnionReconInputDTO;
import com.ibest.pay.entity.PayUnionRecon;

@Service
@Transactional(readOnly=true)
public class PayUnionReconService {

	@Autowired
	protected PayUnionReconDao payUnionReconDao;
	
	public PayUnionRecon findById(String id) throws Exception{
		return payUnionReconDao.findById(id);
	}
	
	@Transactional(readOnly=false)
	public int insert(PayUnionRecon payUnionRecon) throws Exception{
		payUnionRecon.preInsert();
		int result = payUnionReconDao.insert(payUnionRecon);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteById(String id) throws Exception{
		int result = payUnionReconDao.deleteById(id);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteByIds(String ids) throws Exception{
		int result = payUnionReconDao.deleteByIds(StringUtils.tokenizeToList(ids));
		return result;
	}
	
	@Transactional(readOnly=false)
	public int update(PayUnionRecon payUnionRecon) throws Exception{
		payUnionRecon.preUpdate();
		int result = payUnionReconDao.update(payUnionRecon);
		return result;
	}
	
	/**
	 * 分页查询
	 * @param page
	 * @param inputDto
	 * @return
	 * @throws Exception
	 */
	public PageList<PayUnionRecon> findByPage(PageList<PayUnionRecon> page, PayUnionReconInputDTO inputDto) throws Exception{
		
		if(page == null){
			page = new PageList<PayUnionRecon>();
		}
		
		long totalCount = payUnionReconDao.countByObject(inputDto);
		if(totalCount > 0){
			// 设置记录总条数
			page.setTotal(totalCount);
			
			// 设置分页参数，查询数据
			inputDto.setLimitStart((page.getPage() - 1) * page.getPageSize());
			inputDto.setLimitSize(page.getPageSize());
			page.setRows(payUnionReconDao.findByObject(inputDto));
		}
		
		return page;
	}
	
	/**
	* 查询列表
	*/
	public PayUnionRecon findByObject(PayUnionReconInputDTO inputDto) throws Exception{
		return payUnionReconDao.findOneByObject(inputDto);
	}

}
