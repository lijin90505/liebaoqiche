package com.ibest.card.service;

import com.ibest.framework.common.utils.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.ibest.framework.common.utils.PageList;

import com.ibest.card.dao.CouponDao;
import com.ibest.card.entity.Coupon;
import com.ibest.card.dto.input.CouponInputDTO;

import java.util.List;

@Service
@Transactional(readOnly=true)
public class CouponService {

	@Autowired
	protected CouponDao couponDao;
	
	public Coupon findById(String id) throws Exception{
		return couponDao.findById(id);
	}
	
	@Transactional(readOnly=false)
	public int insert(Coupon coupon) throws Exception{
		coupon.preInsert();
		int result = couponDao.insert(coupon);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteById(String id) throws Exception{
		int result = couponDao.deleteById(id);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteByIds(String ids) throws Exception{
		int result = couponDao.deleteByIds(StringUtils.tokenizeToList(ids));
		return result;
	}
	
	@Transactional(readOnly=false)
	public int update(Coupon coupon) throws Exception{
		coupon.preUpdate();
		int result = couponDao.update(coupon);
		return result;
	}
	
	/**
	 * 分页查询
	 * @param page
	 * @param inputDto
	 * @return
	 * @throws Exception
	 */
	public PageList<Coupon> findByPage(PageList<Coupon> page, CouponInputDTO inputDto) throws Exception{
		
		if(page == null){
			page = new PageList<Coupon>();
		}
		
		long totalCount = couponDao.countByObject(inputDto);
		if(totalCount > 0){
			// 设置记录总条数
			page.setTotal(totalCount);
			
			// 设置分页参数，查询数据
			inputDto.setLimitStart((page.getPage() - 1) * page.getPageSize());
			inputDto.setLimitSize(page.getPageSize());
			page.setRows(couponDao.findByObject(inputDto));
		}
		
		return page;
	}
	
	/**
	* 查询列表
	*/
	public Coupon findOneByObject(CouponInputDTO inputDto) throws Exception{
		return couponDao.findOneByObject(inputDto);
	}

	public List<Coupon> findByObject(CouponInputDTO inputDto) throws Exception{
		return couponDao.findByObject(inputDto);
	}


}
