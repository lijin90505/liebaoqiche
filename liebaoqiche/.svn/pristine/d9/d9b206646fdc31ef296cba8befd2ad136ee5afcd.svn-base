package com.ibest.card.service;

import com.ibest.framework.common.utils.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.ibest.framework.common.utils.PageList;

import com.ibest.card.dao.UserCouponUsedRecordDao;
import com.ibest.card.entity.UserCouponUsedRecord;
import com.ibest.card.dto.input.UserCouponUsedRecordInputDTO;

@Service
@Transactional(readOnly=true)
public class UserCouponUsedRecordService {

	@Autowired
	protected UserCouponUsedRecordDao userCouponUsedRecordDao;
	
	public UserCouponUsedRecord findById(String id) throws Exception{
		return userCouponUsedRecordDao.findById(id);
	}
	
	@Transactional(readOnly=false)
	public int insert(UserCouponUsedRecord userCouponUsedRecord) throws Exception{
		userCouponUsedRecord.preInsert();
		int result = userCouponUsedRecordDao.insert(userCouponUsedRecord);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteById(String id) throws Exception{
		int result = userCouponUsedRecordDao.deleteById(id);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteByIds(String ids) throws Exception{
		int result = userCouponUsedRecordDao.deleteByIds(StringUtils.tokenizeToList(ids));
		return result;
	}
	
	@Transactional(readOnly=false)
	public int update(UserCouponUsedRecord userCouponUsedRecord) throws Exception{
		userCouponUsedRecord.preUpdate();
		int result = userCouponUsedRecordDao.update(userCouponUsedRecord);
		return result;
	}
	
	/**
	 * 分页查询
	 * @param page
	 * @param inputDto
	 * @return
	 * @throws Exception
	 */
	public PageList<UserCouponUsedRecord> findByPage(PageList<UserCouponUsedRecord> page, UserCouponUsedRecordInputDTO inputDto) throws Exception{
		
		if(page == null){
			page = new PageList<UserCouponUsedRecord>();
		}
		
		long totalCount = userCouponUsedRecordDao.countByObject(inputDto);
		if(totalCount > 0){
			// 设置记录总条数
			page.setTotal(totalCount);
			
			// 设置分页参数，查询数据
			inputDto.setLimitStart((page.getPage() - 1) * page.getPageSize());
			inputDto.setLimitSize(page.getPageSize());
			page.setRows(userCouponUsedRecordDao.findByObject(inputDto));
		}
		
		return page;
	}
	
	/**
	* 查询列表
	*/
	public UserCouponUsedRecord findByObject(UserCouponUsedRecordInputDTO inputDto) throws Exception{
		return userCouponUsedRecordDao.findOneByObject(inputDto);
	}

}
