package com.ibest.card.service;

import com.ibest.framework.common.utils.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.ibest.framework.common.utils.PageList;

import com.ibest.card.dao.SystemCouponDao;
import com.ibest.card.entity.SystemCoupon;
import com.ibest.card.dto.input.SystemCouponInputDTO;

@Service
@Transactional(readOnly=true)
public class SystemCouponService {

	@Autowired
	protected SystemCouponDao systemCouponDao;
	
	public SystemCoupon findById(String id) throws Exception{
		return systemCouponDao.findById(id);
	}
	
	@Transactional(readOnly=false)
	public int insert(SystemCoupon systemCoupon) throws Exception{
		systemCoupon.preInsert();
		int result = systemCouponDao.insert(systemCoupon);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteById(String id) throws Exception{
		int result = systemCouponDao.deleteById(id);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteByIds(String ids) throws Exception{
		int result = systemCouponDao.deleteByIds(StringUtils.tokenizeToList(ids));
		return result;
	}
	
	@Transactional(readOnly=false)
	public int update(SystemCoupon systemCoupon) throws Exception{
		systemCoupon.preUpdate();
		int result = systemCouponDao.update(systemCoupon);
		return result;
	}
	
	/**
	 * 分页查询
	 * @param page
	 * @param inputDto
	 * @return
	 * @throws Exception
	 */
	public PageList<SystemCoupon> findByPage(PageList<SystemCoupon> page, SystemCouponInputDTO inputDto) throws Exception{
		
		if(page == null){
			page = new PageList<SystemCoupon>();
		}
		
		long totalCount = systemCouponDao.countByObject(inputDto);
		if(totalCount > 0){
			// 设置记录总条数
			page.setTotal(totalCount);
			
			// 设置分页参数，查询数据
			inputDto.setLimitStart((page.getPage() - 1) * page.getPageSize());
			inputDto.setLimitSize(page.getPageSize());
			page.setRows(systemCouponDao.findByObject(inputDto));
		}
		
		return page;
	}
	
	/**
	* 查询列表
	*/
	public SystemCoupon findByObject(SystemCouponInputDTO inputDto) throws Exception{
		return systemCouponDao.findOneByObject(inputDto);
	}

}
