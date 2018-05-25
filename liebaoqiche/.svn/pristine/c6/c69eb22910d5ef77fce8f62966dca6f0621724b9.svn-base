package com.ibest.card.service;

import com.ibest.framework.common.utils.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.ibest.framework.common.utils.PageList;

import com.ibest.card.dao.CouponGrantDao;
import com.ibest.card.entity.CouponGrant;
import com.ibest.card.dto.input.CouponGrantInputDTO;

@Service
@Transactional(readOnly=true)
public class CouponGrantService {

	@Autowired
	protected CouponGrantDao couponGrantDao;
	
	public CouponGrant findById(String id) throws Exception{
		return couponGrantDao.findById(id);
	}
	
	@Transactional(readOnly=false)
	public int insert(CouponGrant couponGrant) throws Exception{
		couponGrant.preInsert();
		int result = couponGrantDao.insert(couponGrant);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteById(String id) throws Exception{
		int result = couponGrantDao.deleteById(id);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteByIds(String ids) throws Exception{
		int result = couponGrantDao.deleteByIds(StringUtils.tokenizeToList(ids));
		return result;
	}
	
	@Transactional(readOnly=false)
	public int update(CouponGrant couponGrant) throws Exception{
		couponGrant.preUpdate();
		int result = couponGrantDao.update(couponGrant);
		return result;
	}
	
	/**
	 * 分页查询
	 * @param page
	 * @param inputDto
	 * @return
	 * @throws Exception
	 */
	public PageList<CouponGrant> findByPage(PageList<CouponGrant> page, CouponGrantInputDTO inputDto) throws Exception{
		
		if(page == null){
			page = new PageList<CouponGrant>();
		}
		
		long totalCount = couponGrantDao.countByObject(inputDto);
		if(totalCount > 0){
			// 设置记录总条数
			page.setTotal(totalCount);
			
			// 设置分页参数，查询数据
			inputDto.setLimitStart((page.getPage() - 1) * page.getPageSize());
			inputDto.setLimitSize(page.getPageSize());
			page.setRows(couponGrantDao.findByObject(inputDto));
		}
		
		return page;
	}
	
	/**
	* 查询列表
	*/
	public CouponGrant findByObject(CouponGrantInputDTO inputDto) throws Exception{
		return couponGrantDao.findOneByObject(inputDto);
	}

}
