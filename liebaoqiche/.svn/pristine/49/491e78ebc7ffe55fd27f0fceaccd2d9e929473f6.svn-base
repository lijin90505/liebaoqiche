package com.ibest.card.service;

import java.util.List;

import com.ibest.framework.common.utils.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.ibest.framework.common.utils.PageList;

import com.ibest.card.dao.CouponBuildDao;
import com.ibest.card.entity.CouponBuild;
import com.ibest.card.dto.input.CouponBuildInputDTO;

@Service
@Transactional(readOnly=true)
public class CouponBuildService {

	@Autowired
	protected CouponBuildDao couponBuildDao;
	
	public CouponBuild findById(String id) throws Exception{
		return couponBuildDao.findById(id);
	}
	
	@Transactional(readOnly=false)
	public int insert(CouponBuild couponBuild) throws Exception{
		couponBuild.preInsert();
		int result = couponBuildDao.insert(couponBuild);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteById(String id) throws Exception{
		int result = couponBuildDao.deleteById(id);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteByIds(String ids) throws Exception{
		int result = couponBuildDao.deleteByIds(StringUtils.tokenizeToList(ids));
		return result;
	}
	
	@Transactional(readOnly=false)
	public int update(CouponBuild couponBuild) throws Exception{
		couponBuild.preUpdate();
		int result = couponBuildDao.update(couponBuild);
		return result;
	}
	
	/**
	 * 分页查询
	 * @param page
	 * @param inputDto
	 * @return
	 * @throws Exception
	 */
	public PageList<CouponBuild> findByPage(PageList<CouponBuild> page, CouponBuildInputDTO inputDto) throws Exception{
		
		if(page == null){
			page = new PageList<CouponBuild>();
		}
		
		long totalCount = couponBuildDao.countByObject(inputDto);
		if(totalCount > 0){
			// 设置记录总条数
			page.setTotal(totalCount);
			
			// 设置分页参数，查询数据
			inputDto.setLimitStart((page.getPage() - 1) * page.getPageSize());
			inputDto.setLimitSize(page.getPageSize());
			page.setRows(couponBuildDao.findByObject(inputDto));
		}
		
		return page;
	}
	
	/**
	* 查询列表
	*/
	public CouponBuild findOneByObject(CouponBuildInputDTO inputDto) throws Exception{
		return couponBuildDao.findOneByObject(inputDto);
	}

	public List<CouponBuild> findByObject(CouponBuildInputDTO inputDto) throws Exception{
		return couponBuildDao.findByObject(inputDto);
	}

}
