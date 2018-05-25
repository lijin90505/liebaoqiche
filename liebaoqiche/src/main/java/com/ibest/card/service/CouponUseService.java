package com.ibest.card.service;

import java.util.List;

import com.ibest.framework.common.utils.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.ibest.framework.common.utils.PageList;

import com.ibest.card.dao.CouponUseDao;
import com.ibest.card.entity.CouponUse;
import com.ibest.card.dto.input.ConpouUseInputDTO;

@Service
@Transactional(readOnly=true)
public class CouponUseService {

	@Autowired
	protected CouponUseDao conpouUseDao;
	
	public CouponUse findById(String id) throws Exception{
		return conpouUseDao.findById(id);
	}
	
	@Transactional(readOnly=false)
	public int insert(CouponUse conpouUse) throws Exception{
		conpouUse.preInsert();
		int result = conpouUseDao.insert(conpouUse);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteById(String id) throws Exception{
		int result = conpouUseDao.deleteById(id);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteByIds(String ids) throws Exception{
		int result = conpouUseDao.deleteByIds(StringUtils.tokenizeToList(ids));
		return result;
	}
	
	@Transactional(readOnly=false)
	public int update(CouponUse conpouUse) throws Exception{
		conpouUse.preUpdate();
		int result = conpouUseDao.update(conpouUse);
		return result;
	}
	
	/**
	 * 分页查询
	 * @param page
	 * @param inputDto
	 * @return
	 * @throws Exception
	 */
	public PageList<CouponUse> findByPage(PageList<CouponUse> page, ConpouUseInputDTO inputDto) throws Exception{
		
		if(page == null){
			page = new PageList<CouponUse>();
		}
		
		long totalCount = conpouUseDao.countByObject(inputDto);
		if(totalCount > 0){
			// 设置记录总条数
			page.setTotal(totalCount);
			
			// 设置分页参数，查询数据
			inputDto.setLimitStart((page.getPage() - 1) * page.getPageSize());
			inputDto.setLimitSize(page.getPageSize());
			page.setRows(conpouUseDao.findByObject(inputDto));
		}
		
		return page;
	}
	
	/**
	* 查询列表
	*/
	public CouponUse findOneByObject(ConpouUseInputDTO inputDto) throws Exception{
		return conpouUseDao.findOneByObject(inputDto);
	}

	public List<CouponUse> findByObject(ConpouUseInputDTO inputDto) throws Exception{
		return conpouUseDao.findByObject(inputDto);
	}
}
