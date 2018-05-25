package com.ibest.recon.service;

import java.util.ArrayList;
import java.util.List;

import com.ibest.framework.common.utils.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.ibest.framework.common.utils.PageList;

import com.ibest.recon.dao.OutSystemLocalReconDao;
import com.ibest.recon.entity.OutSystemLocalRecon;
import com.ibest.recon.dto.input.OutSystemLocalReconInputDTO;

@Service
@Transactional(readOnly=true)
public class OutSystemLocalReconService {

	@Autowired
	protected OutSystemLocalReconDao outSystemLocalReconDao;
	
	public OutSystemLocalRecon findById(String id) throws Exception{
		return outSystemLocalReconDao.findById(id);
	}
	
	@Transactional(readOnly=false)
	public int insert(OutSystemLocalRecon outSystemLocalRecon) throws Exception{
		outSystemLocalRecon.preInsert();
		int result = outSystemLocalReconDao.insert(outSystemLocalRecon);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteById(String id) throws Exception{
		int result = outSystemLocalReconDao.deleteById(id);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteByIds(String ids) throws Exception{
		int result = outSystemLocalReconDao.deleteByIds(StringUtils.tokenizeToList(ids));
		return result;
	}
	
	@Transactional(readOnly=false)
	public int update(OutSystemLocalRecon outSystemLocalRecon) throws Exception{
		outSystemLocalRecon.preUpdate();
		int result = outSystemLocalReconDao.update(outSystemLocalRecon);
		return result;
	}
	
	/**
	 * 分页查询
	 * @param page
	 * @param inputDto
	 * @return
	 * @throws Exception
	 */
	public PageList<OutSystemLocalRecon> findByPage(PageList<OutSystemLocalRecon> page, OutSystemLocalReconInputDTO inputDto) throws Exception{
		
		if(page == null){
			page = new PageList<OutSystemLocalRecon>();
		}
		
		long totalCount = outSystemLocalReconDao.countByObject(inputDto);
		if(totalCount > 0){
			// 设置记录总条数
			page.setTotal(totalCount);
			
			// 设置分页参数，查询数据
			inputDto.setLimitStart((page.getPage() - 1) * page.getPageSize());
			inputDto.setLimitSize(page.getPageSize());
			page.setRows(outSystemLocalReconDao.findByObject(inputDto));
		}
		
		return page;
	}
	
	/**
	* 查询列表
	*/
	public OutSystemLocalRecon findByObject(OutSystemLocalReconInputDTO inputDto) throws Exception{
		return outSystemLocalReconDao.findOneByObject(inputDto);
	}

}
