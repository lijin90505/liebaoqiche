package com.ibest.accesssystem.service;

import java.util.*;

import com.ibest.activity.dao.ActivityDao;
import com.ibest.activity.dao.ActivityDetailsDao;
import com.ibest.activity.dto.input.ActivityDetailsInputDTO;
import com.ibest.activity.dto.input.ActivityInputDTO;
import com.ibest.activity.dto.input.UserActivityInputDTO;
import com.ibest.activity.entity.*;
import com.ibest.activity.service.ActivityCardService;
import com.ibest.activity.service.ActivityDetailsService;
import com.ibest.activity.service.ActivityIntegralService;
import com.ibest.activity.service.UserActivityService;
import com.ibest.card.dto.input.UserCardCountInputDTO;
import com.ibest.card.entity.Card;
import com.ibest.card.entity.UserCard;
import com.ibest.card.entity.UserCardCount;
import com.ibest.card.service.CardService;
import com.ibest.card.service.UserCardCountService;
import com.ibest.card.service.UserCardService;
import com.ibest.experience.dto.input.UserExperienceCountInputDTO;
import com.ibest.experience.entity.Experience;
import com.ibest.experience.entity.UserExperience;
import com.ibest.experience.entity.UserExperienceCount;
import com.ibest.experience.service.ExperienceService;
import com.ibest.experience.service.UserExperienceCountService;
import com.ibest.experience.service.UserExperienceService;
import com.ibest.framework.common.utils.StringUtils;
import com.ibest.integral.dto.input.UserIntegralCountInputDTO;
import com.ibest.integral.entity.Integral;
import com.ibest.integral.entity.IntegralCategory;
import com.ibest.integral.entity.UserIntegral;
import com.ibest.integral.entity.UserIntegralCount;
import com.ibest.integral.service.IntegralCategoryService;
import com.ibest.integral.service.IntegralService;
import com.ibest.integral.service.UserIntegralCountService;
import com.ibest.integral.service.UserIntegralService;
import com.ibest.user.entity.User;
import com.ibest.user.service.UserService;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.ibest.framework.common.utils.PageList;

import com.ibest.accesssystem.dao.SystemActivityDao;
import com.ibest.accesssystem.entity.SystemActivity;
import com.ibest.accesssystem.dto.input.SystemActivityInputDTO;

@Service
@Transactional(readOnly=true)
public class SystemActivityService {

	@Autowired
	protected SystemActivityDao systemActivityDao;

	@Autowired
	protected ActivityDetailsDao activityDetailsDao;

	@Autowired
	protected ActivityDao activityDao;
	
	public SystemActivity findById(String id) throws Exception{
		return systemActivityDao.findById(id);
	}
	
	public SystemActivity findByFrankId(String id) throws Exception{
		return systemActivityDao.findByFrankId(id);
	}
	
	@Transactional(readOnly=false)
	public int insert(SystemActivity systemActivity) throws Exception{
		systemActivity.preInsert();
		int result = systemActivityDao.insert(systemActivity);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteById(String id) throws Exception{
		int result = systemActivityDao.deleteById(id);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteByIds(String ids) throws Exception{
		int result = systemActivityDao.deleteByIds(StringUtils.tokenizeToList(ids));
		return result;
	}
	
	@Transactional(readOnly=false)
	public int update(SystemActivity systemActivity) throws Exception{
		systemActivity.preUpdate();
		int result = systemActivityDao.update(systemActivity);
		return result;
	}
	
	/**
	 * 分页查询
	 * @param page
	 * @param inputDto
	 * @return
	 * @throws Exception
	 */
	public PageList<SystemActivity> findByPage(PageList<SystemActivity> page, SystemActivityInputDTO inputDto) throws Exception{
		
		if(page == null){
			page = new PageList<SystemActivity>();
		}

		long totalCount = systemActivityDao.countByObject(inputDto);
		if(totalCount > 0){
			// 设置记录总条数
			page.setTotal(totalCount);
			// 设置分页参数，查询数据
			inputDto.setLimitStart((page.getPage() - 1) * page.getPageSize());
			inputDto.setLimitSize(page.getPageSize());

			List<SystemActivity> systemActivitieList = getSystemActivities(inputDto);
			page.setRows(systemActivitieList);
		}
		
		return page;
	}
	
	/**
	 * 构建系统活动对象
	 * @param inputDto
	 * @return
	 */
	private List<SystemActivity> getSystemActivities(SystemActivityInputDTO inputDto) {
		String activityId;
		String id;
		String activityDetailId;
		ActivityDetailsInputDTO detailsInputDTO = new ActivityDetailsInputDTO();
		ActivityInputDTO activityInputDTO = new ActivityInputDTO();
		List<SystemActivity> systemActivitieList = systemActivityDao.findByObject(inputDto);
		
		
		List<Activity> activitieList = activityDao.findByObject(activityInputDTO);
		List<ActivityDetails> activityDetailsList = activityDetailsDao.findByObject(detailsInputDTO);
		for (SystemActivity systemActivity : systemActivitieList) {
			activityId = systemActivity.getActivityId();
			for (Activity activity : activitieList) {
				id = activity.getId();
				if (activityId.equals(id)) {
					activityDetailId=activity.getActivityDetailsId();
					for (ActivityDetails activityDetails : activityDetailsList) {
						if (activityDetailId.equals(activityDetails.getId())) {
							systemActivity.setActivityName(activityDetails.getActivityName());
							systemActivity.setActivityDetailsId(activityDetails.getId());
						}
					}
				}
			}
		}
		return systemActivitieList;
	}

	private List<SystemActivity> getSystemActivitieList(SystemActivityInputDTO inputDto) {
		String activityId;
		String id;
		String activityDetailId;
		ActivityDetailsInputDTO detailsInputDTO = new ActivityDetailsInputDTO();
		ActivityInputDTO activityInputDTO = new ActivityInputDTO();
		List<SystemActivity> systemActivitieList = systemActivityDao.findByObject(inputDto);
		List<Activity> activitieList = activityDao.findByObject(activityInputDTO);
		List<ActivityDetails> activityDetailsList = activityDetailsDao.findByObject(detailsInputDTO);
		for (SystemActivity systemActivity : systemActivitieList) {
			activityId = systemActivity.getActivityId();
			for (Activity activity : activitieList) {
				id = activity.getId();
				if (activityId.equals(id)) {
					activityDetailId=activity.getActivityDetailsId();
					for (ActivityDetails activityDetails : activityDetailsList) {
						if (activityDetailId.equals(activityDetails.getId())) {
							systemActivity.setActivityName(activityDetails.getActivityName());
							systemActivity.setActivityDetailsId(activityDetails.getId());
						}
					}
				}
			}
		}

		List<SystemActivity> systemActivities = new ArrayList<SystemActivity>();
		HashMap<String,Object> map = new HashMap<String,Object>();
		if(systemActivitieList!=null && systemActivitieList.size()>0){
			for (SystemActivity systemActivity : systemActivitieList) {
				map.put(systemActivity.getActivityDetailsId(),systemActivity);
			}
		}

		for (String key :map.keySet()){
			SystemActivity sa = (SystemActivity) map.get(key);
			systemActivities.add(sa);
		}

		return systemActivities;
	}

	/**
	* 查询列表
	*/
	public SystemActivity findOneByObject(SystemActivityInputDTO inputDto) throws Exception{
		return systemActivityDao.findOneByObject(inputDto);
	}

	/**
	 * 查询列表
	 */
	public List<SystemActivity> findByObject(SystemActivityInputDTO inputDto) throws Exception{
		List<SystemActivity> systemActivitieList = getSystemActivitieList(inputDto);
		return systemActivitieList;
	}

}
