package com.ibest.card.service;

import java.util.List;

import com.ibest.framework.common.utils.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.ibest.framework.common.utils.PageList;

import com.ibest.card.dao.CouponGetDao;
import com.ibest.card.entity.CouponGet;
import com.ibest.card.dto.input.CouponGetInputDTO;

@Service
@Transactional(readOnly=true)
public class CouponGetService {

	@Autowired
	protected CouponGetDao couponGetDao;
	
	public CouponGet findById(String id) throws Exception{
		return couponGetDao.findById(id);
	}
	
	@Transactional(readOnly=false)
	public int insert(CouponGet couponGet) throws Exception{
		couponGet.preInsert();
		int result = couponGetDao.insert(couponGet);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteById(String id) throws Exception{
		int result = couponGetDao.deleteById(id);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteByIds(String ids) throws Exception{
		int result = couponGetDao.deleteByIds(StringUtils.tokenizeToList(ids));
		return result;
	}
	
	@Transactional(readOnly=false)
	public int update(CouponGet couponGet) throws Exception{
		couponGet.preUpdate();
		int result = couponGetDao.update(couponGet);
		return result;
	}
	
	/**
	 * 分页查询
	 * @param page
	 * @param inputDto
	 * @return
	 * @throws Exception
	 */
	public PageList<CouponGet> findByPage(PageList<CouponGet> page, CouponGetInputDTO inputDto) throws Exception{
		
		if(page == null){
			page = new PageList<CouponGet>();
		}
		
		long totalCount = couponGetDao.countByObject(inputDto);
		if(totalCount > 0){
			// 设置记录总条数
			page.setTotal(totalCount);
			
			// 设置分页参数，查询数据
			inputDto.setLimitStart((page.getPage() - 1) * page.getPageSize());
			inputDto.setLimitSize(page.getPageSize());
			page.setRows(couponGetDao.findByObject(inputDto));
		}
		
		return page;
	}
	
	/**
	* 查询列表
	*/
	public CouponGet findOneByObject(CouponGetInputDTO inputDto) throws Exception{
		return couponGetDao.findOneByObject(inputDto);
	}

	public List<CouponGet> findByObject(CouponGetInputDTO inputDto) throws Exception{
		return couponGetDao.findByObject(inputDto);
	}
}
