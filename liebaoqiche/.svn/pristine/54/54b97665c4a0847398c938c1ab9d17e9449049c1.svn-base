package com.ibest.pay.service;

import java.util.ArrayList;
import java.util.List;

import com.ibest.framework.common.utils.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.ibest.framework.common.utils.PageList;

import com.ibest.pay.dao.PayRefundInfoDao;
import com.ibest.pay.entity.PayRefundInfo;
import com.ibest.pay.dto.input.PayRefundInfoInputDTO;

@Service
@Transactional(readOnly=true)
public class PayRefundInfoService {

	@Autowired
	protected PayRefundInfoDao payRefundInfoDao;
	
	public PayRefundInfo findById(String id) throws Exception{
		return payRefundInfoDao.findById(id);
	}
	
	@Transactional(readOnly=false)
	public int insert(PayRefundInfo payRefundInfo) throws Exception{
		payRefundInfo.preInsert();
		int result = payRefundInfoDao.insert(payRefundInfo);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteById(String id) throws Exception{
		int result = payRefundInfoDao.deleteById(id);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteByIds(String ids) throws Exception{
		int result = payRefundInfoDao.deleteByIds(StringUtils.tokenizeToList(ids));
		return result;
	}
	
	@Transactional(readOnly=false)
	public int update(PayRefundInfo payRefundInfo) throws Exception{
		payRefundInfo.preUpdate();
		int result = payRefundInfoDao.update(payRefundInfo);
		return result;
	}
	
	/**
	 * 分页查询
	 * @param page
	 * @param inputDto
	 * @return
	 * @throws Exception
	 */
	public PageList<PayRefundInfo> findByPage(PageList<PayRefundInfo> page, PayRefundInfoInputDTO inputDto) throws Exception{
		
		if(page == null){
			page = new PageList<PayRefundInfo>();
		}
		
		long totalCount = payRefundInfoDao.countByObject(inputDto);
		if(totalCount > 0){
			// 设置记录总条数
			page.setTotal(totalCount);
			
			// 设置分页参数，查询数据
			inputDto.setLimitStart((page.getPage() - 1) * page.getPageSize());
			inputDto.setLimitSize(page.getPageSize());
			page.setRows(payRefundInfoDao.findByObject(inputDto));
		}
		
		return page;
	}
	
	/**
	* 查询列表
	*/
	public PayRefundInfo findByObject(PayRefundInfoInputDTO inputDto) throws Exception{
		return payRefundInfoDao.findOneByObject(inputDto);
	}

}
