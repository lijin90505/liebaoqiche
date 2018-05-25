package com.ibest.card.service;

import com.ibest.framework.common.utils.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.ibest.framework.common.utils.PageList;

import com.ibest.card.dao.UserCouponDao;
import com.ibest.card.entity.UserCoupon;
import com.ibest.card.dto.input.UserCouponInputDTO;

@Service
@Transactional(readOnly=true)
public class UserCouponService {

	@Autowired
	protected UserCouponDao userCouponDao;
	
	public UserCoupon findById(String id) throws Exception{
		return userCouponDao.findById(id);
	}
	
	@Transactional(readOnly=false)
	public int insert(UserCoupon userCoupon) throws Exception{
		userCoupon.preInsert();
		int result = userCouponDao.insert(userCoupon);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteById(String id) throws Exception{
		int result = userCouponDao.deleteById(id);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteByIds(String ids) throws Exception{
		int result = userCouponDao.deleteByIds(StringUtils.tokenizeToList(ids));
		return result;
	}
	
	@Transactional(readOnly=false)
	public int update(UserCoupon userCoupon) throws Exception{
		userCoupon.preUpdate();
		int result = userCouponDao.update(userCoupon);
		return result;
	}
	
	/**
	 * 分页查询
	 * @param page
	 * @param inputDto
	 * @return
	 * @throws Exception
	 */
	public PageList<UserCoupon> findByPage(PageList<UserCoupon> page, UserCouponInputDTO inputDto) throws Exception{
		
		if(page == null){
			page = new PageList<UserCoupon>();
		}
		
		long totalCount = userCouponDao.countByObject(inputDto);
		if(totalCount > 0){
			// 设置记录总条数
			page.setTotal(totalCount);
			
			// 设置分页参数，查询数据
			inputDto.setLimitStart((page.getPage() - 1) * page.getPageSize());
			inputDto.setLimitSize(page.getPageSize());
			page.setRows(userCouponDao.findByObject(inputDto));
		}
		
		return page;
	}
	
	/**
	* 查询列表
	*/
	public UserCoupon findByObject(UserCouponInputDTO inputDto) throws Exception{
		return userCouponDao.findOneByObject(inputDto);
	}

}
