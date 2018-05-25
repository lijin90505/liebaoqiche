package com.ibest.pay.service;

import java.util.ArrayList;
import java.util.List;

import com.ibest.framework.common.utils.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.ibest.framework.common.utils.PageList;

import com.ibest.pay.dao.WechatPayReconDao;
import com.ibest.pay.entity.WechatPayRecon;
import com.ibest.pay.dto.input.WechatPayReconInputDTO;

@Service
@Transactional(readOnly=true)
public class WechatPayReconService {

	@Autowired
	protected WechatPayReconDao wechatPayReconDao;
	
	public WechatPayRecon findById(String id) throws Exception{
		return wechatPayReconDao.findById(id);
	}
	
	@Transactional(readOnly=false)
	public int insert(WechatPayRecon wechatPayRecon) throws Exception{
		wechatPayRecon.preInsert();
		int result = wechatPayReconDao.insert(wechatPayRecon);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteById(String id) throws Exception{
		int result = wechatPayReconDao.deleteById(id);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteByIds(String ids) throws Exception{
		int result = wechatPayReconDao.deleteByIds(StringUtils.tokenizeToList(ids));
		return result;
	}
	
	@Transactional(readOnly=false)
	public int update(WechatPayRecon wechatPayRecon) throws Exception{
		wechatPayRecon.preUpdate();
		int result = wechatPayReconDao.update(wechatPayRecon);
		return result;
	}
	
	/**
	 * 分页查询
	 * @param page
	 * @param inputDto
	 * @return
	 * @throws Exception
	 */
	public PageList<WechatPayRecon> findByPage(PageList<WechatPayRecon> page, WechatPayReconInputDTO inputDto) throws Exception{
		
		if(page == null){
			page = new PageList<WechatPayRecon>();
		}
		
		long totalCount = wechatPayReconDao.countByObject(inputDto);
		if(totalCount > 0){
			// 设置记录总条数
			page.setTotal(totalCount);
			
			// 设置分页参数，查询数据
			inputDto.setLimitStart((page.getPage() - 1) * page.getPageSize());
			inputDto.setLimitSize(page.getPageSize());
			page.setRows(wechatPayReconDao.findByObject(inputDto));
		}
		
		return page;
	}
	
	/**
	* 查询列表
	*/
	public WechatPayRecon findByObject(WechatPayReconInputDTO inputDto) throws Exception{
		return wechatPayReconDao.findOneByObject(inputDto);
	}

}
