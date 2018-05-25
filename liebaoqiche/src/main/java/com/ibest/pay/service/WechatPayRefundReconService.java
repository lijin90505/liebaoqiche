package com.ibest.pay.service;

import java.util.ArrayList;
import java.util.List;

import com.ibest.framework.common.utils.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.ibest.framework.common.utils.PageList;

import com.ibest.pay.dao.WechatPayRefundReconDao;
import com.ibest.pay.entity.WechatPayRefundRecon;
import com.ibest.pay.dto.input.WechatPayRefundReconInputDTO;

@Service
@Transactional(readOnly=true)
public class WechatPayRefundReconService {

	@Autowired
	protected WechatPayRefundReconDao wechatPayRefundReconDao;
	
	public WechatPayRefundRecon findById(String id) throws Exception{
		return wechatPayRefundReconDao.findById(id);
	}
	
	@Transactional(readOnly=false)
	public int insert(WechatPayRefundRecon wechatPayRefundRecon) throws Exception{
		wechatPayRefundRecon.preInsert();
		int result = wechatPayRefundReconDao.insert(wechatPayRefundRecon);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteById(String id) throws Exception{
		int result = wechatPayRefundReconDao.deleteById(id);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteByIds(String ids) throws Exception{
		int result = wechatPayRefundReconDao.deleteByIds(StringUtils.tokenizeToList(ids));
		return result;
	}
	
	@Transactional(readOnly=false)
	public int update(WechatPayRefundRecon wechatPayRefundRecon) throws Exception{
		wechatPayRefundRecon.preUpdate();
		int result = wechatPayRefundReconDao.update(wechatPayRefundRecon);
		return result;
	}
	
	/**
	 * 分页查询
	 * @param page
	 * @param inputDto
	 * @return
	 * @throws Exception
	 */
	public PageList<WechatPayRefundRecon> findByPage(PageList<WechatPayRefundRecon> page, WechatPayRefundReconInputDTO inputDto) throws Exception{
		
		if(page == null){
			page = new PageList<WechatPayRefundRecon>();
		}
		
		long totalCount = wechatPayRefundReconDao.countByObject(inputDto);
		if(totalCount > 0){
			// 设置记录总条数
			page.setTotal(totalCount);
			
			// 设置分页参数，查询数据
			inputDto.setLimitStart((page.getPage() - 1) * page.getPageSize());
			inputDto.setLimitSize(page.getPageSize());
			page.setRows(wechatPayRefundReconDao.findByObject(inputDto));
		}
		
		return page;
	}
	
	/**
	* 查询列表
	*/
	public WechatPayRefundRecon findByObject(WechatPayRefundReconInputDTO inputDto) throws Exception{
		return wechatPayRefundReconDao.findOneByObject(inputDto);
	}

}
