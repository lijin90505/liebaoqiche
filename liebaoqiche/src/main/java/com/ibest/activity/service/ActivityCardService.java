package com.ibest.activity.service;

import java.util.ArrayList;
import java.util.List;

import com.ibest.framework.common.utils.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.ibest.framework.common.utils.PageList;

import com.ibest.activity.dao.ActivityCardDao;
import com.ibest.activity.entity.ActivityCard;
import com.ibest.activity.dto.input.ActivityCardInputDTO;

@Service
@Transactional(readOnly=true)
public class ActivityCardService {

	@Autowired
	protected ActivityCardDao activityCardDao;
	
	public ActivityCard findById(String id) throws Exception{
		return activityCardDao.findById(id);
	}
	
	@Transactional(readOnly=false)
	public int insert(ActivityCard activityCard) throws Exception{
		activityCard.preInsert();
		int result = activityCardDao.insert(activityCard);
		return result;
	}
	
	public List<ActivityCard> findByCardId(String cardId) throws Exception{
		return activityCardDao.findByCardId(cardId);
	}
	
	@Transactional(readOnly=false)
	public int deleteById(String id) throws Exception{
		int result = activityCardDao.deleteById(id);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteByIds(String ids) throws Exception{
		int result = activityCardDao.deleteByIds(StringUtils.tokenizeToList(ids));
		return result;
	}
	/**
	 * 查询列表
	 */
	public List<ActivityCard> findByActivityId(String activityId) throws Exception{
		return activityCardDao.findByActivityId(activityId);
	}
	
	@Transactional(readOnly=false)
	public int update(ActivityCard activityCard) throws Exception{
		activityCard.preUpdate();
		int result = activityCardDao.update(activityCard);
		return result;
	}
	
	public int checkByActivityId(String activityId) throws Exception{
		return activityCardDao.checkByActivityId(activityId);
	}
	
	/**
	 * 分页查询
	 * @param page
	 * @param inputDto
	 * @return
	 * @throws Exception
	 */
	public PageList<ActivityCard> findByPage(PageList<ActivityCard> page, ActivityCardInputDTO inputDto) throws Exception{
		
		if(page == null){
			page = new PageList<ActivityCard>();
		}
		
		long totalCount = activityCardDao.countByObject(inputDto);
		if(totalCount > 0){
			// 设置记录总条数
			page.setTotal(totalCount);
			
			// 设置分页参数，查询数据
			inputDto.setLimitStart((page.getPage() - 1) * page.getPageSize());
			inputDto.setLimitSize(page.getPageSize());
			page.setRows(activityCardDao.findByObject(inputDto));
		}
		
		return page;
	}
	
	/**
	* 查询列表
	*/
	public ActivityCard findByObject(ActivityCardInputDTO inputDto) throws Exception{
		return activityCardDao.findOneByObject(inputDto);
	}

}
