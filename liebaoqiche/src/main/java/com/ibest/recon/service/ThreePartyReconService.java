package com.ibest.recon.service;

import java.util.ArrayList;
import java.util.List;

import com.ibest.framework.common.utils.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.ibest.framework.common.utils.PageList;

import com.ibest.recon.dao.ThreePartyReconDao;
import com.ibest.recon.entity.ThreePartyRecon;
import com.ibest.recon.dto.input.ThreePartyReconInputDTO;

@Service
@Transactional(readOnly=true)
public class ThreePartyReconService {

	@Autowired
	protected ThreePartyReconDao threePartyReconDao;
	
	public ThreePartyRecon findById(String id) throws Exception{
		return threePartyReconDao.findById(id);
	}
	
	@Transactional(readOnly=false)
	public int insert(ThreePartyRecon threePartyRecon) throws Exception{
		threePartyRecon.preInsert();
		int result = threePartyReconDao.insert(threePartyRecon);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteById(String id) throws Exception{
		int result = threePartyReconDao.deleteById(id);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteByIds(String ids) throws Exception{
		int result = threePartyReconDao.deleteByIds(StringUtils.tokenizeToList(ids));
		return result;
	}
	
	@Transactional(readOnly=false)
	public int update(ThreePartyRecon threePartyRecon) throws Exception{
		threePartyRecon.preUpdate();
		int result = threePartyReconDao.update(threePartyRecon);
		return result;
	}
	
	/**
	 * 分页查询
	 * @param page
	 * @param inputDto
	 * @return
	 * @throws Exception
	 */
	public PageList<ThreePartyRecon> findByPage(PageList<ThreePartyRecon> page, ThreePartyReconInputDTO inputDto) throws Exception{
		
		if(page == null){
			page = new PageList<ThreePartyRecon>();
		}
		
		long totalCount = threePartyReconDao.countByObject(inputDto);
		if(totalCount > 0){
			// 设置记录总条数
			page.setTotal(totalCount);
			
			// 设置分页参数，查询数据
			inputDto.setLimitStart((page.getPage() - 1) * page.getPageSize());
			inputDto.setLimitSize(page.getPageSize());
			page.setRows(threePartyReconDao.findByObject(inputDto));
		}
		
		return page;
	}
	
	/**
	* 查询列表
	*/
	public ThreePartyRecon findByObject(ThreePartyReconInputDTO inputDto) throws Exception{
		return threePartyReconDao.findOneByObject(inputDto);
	}

}
