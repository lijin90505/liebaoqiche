package com.ibest.card.service;

import com.ibest.framework.common.utils.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.ibest.framework.common.utils.PageList;

import com.ibest.card.dao.CouponRecallDao;
import com.ibest.card.entity.CouponRecall;
import com.ibest.card.dto.input.CouponRecallInputDTO;

@Service
@Transactional(readOnly=true)
public class CouponRecallService {

	@Autowired
	protected CouponRecallDao couponRecallDao;
	
	public CouponRecall findById(String id) throws Exception{
		return couponRecallDao.findById(id);
	}
	
	@Transactional(readOnly=false)
	public int insert(CouponRecall couponRecall) throws Exception{
		couponRecall.preInsert();
		int result = couponRecallDao.insert(couponRecall);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteById(String id) throws Exception{
		int result = couponRecallDao.deleteById(id);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteByIds(String ids) throws Exception{
		int result = couponRecallDao.deleteByIds(StringUtils.tokenizeToList(ids));
		return result;
	}
	
	@Transactional(readOnly=false)
	public int update(CouponRecall couponRecall) throws Exception{
		couponRecall.preUpdate();
		int result = couponRecallDao.update(couponRecall);
		return result;
	}
	
	/**
	 * 分页查询
	 * @param page
	 * @param inputDto
	 * @return
	 * @throws Exception
	 */
	public PageList<CouponRecall> findByPage(PageList<CouponRecall> page, CouponRecallInputDTO inputDto) throws Exception{
		
		if(page == null){
			page = new PageList<CouponRecall>();
		}
		
		long totalCount = couponRecallDao.countByObject(inputDto);
		if(totalCount > 0){
			// 设置记录总条数
			page.setTotal(totalCount);
			
			// 设置分页参数，查询数据
			inputDto.setLimitStart((page.getPage() - 1) * page.getPageSize());
			inputDto.setLimitSize(page.getPageSize());
			page.setRows(couponRecallDao.findByObject(inputDto));
		}
		
		return page;
	}
	
	/**
	* 查询列表
	*/
	public CouponRecall findByObject(CouponRecallInputDTO inputDto) throws Exception{
		return couponRecallDao.findOneByObject(inputDto);
	}

}
