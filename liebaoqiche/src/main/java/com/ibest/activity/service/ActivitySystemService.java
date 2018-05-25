package com.ibest.activity.service;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibest.activity.dao.ActivityDao;
import com.ibest.activity.dao.ActivityDetailsDao;
import com.ibest.activity.dao.ActivitySystemDao;
import com.ibest.activity.dto.input.ActivityDetailsInputDTO;
import com.ibest.activity.dto.input.ActivityInputDTO;
import com.ibest.activity.dto.input.ActivitySystemInputDTO;
import com.ibest.activity.entity.Activity;
import com.ibest.activity.entity.ActivityDetails;
import com.ibest.activity.entity.ActivitySystem;
import com.ibest.framework.common.utils.DateUtil;
import com.ibest.framework.common.utils.PageList;
import com.ibest.framework.common.utils.StringUtils;

@Service
@Transactional(readOnly=true)
public class ActivitySystemService {

	@Autowired
	protected ActivitySystemDao activitySystemDao;
	
	@Autowired
	protected ActivityDetailsDao activityDetailsDao;
	
	@Autowired
	protected ActivityDao activityDao;
	
	public ActivitySystem findById(String id) throws Exception{
		return activitySystemDao.findById(id);
	}
	
	@Transactional(readOnly=false)
	public int insert(ActivitySystem activitySystem) throws Exception{
		activitySystem.preInsert();
		int result = activitySystemDao.insert(activitySystem);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteById(String id) throws Exception{
		int result = activitySystemDao.deleteById(id);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteByIds(String ids) throws Exception{
		int result = activitySystemDao.deleteByIds(StringUtils.tokenizeToList(ids));
		return result;
	}
	
	@Transactional(readOnly=false)
	public int update(ActivitySystem activitySystem) throws Exception{
		activitySystem.preUpdate();
		int result = activitySystemDao.update(activitySystem);
		return result;
	}
	
	public List<ActivitySystem> findByActivityId(String activityId)throws Exception{
		return activitySystemDao.findByActivityId(activityId);
	}
	
	public List<ActivitySystem> findByAccessId(String accessSystemId) throws Exception{
		return activitySystemDao.findByAccessId(accessSystemId);
	} 
	
	/**
	 * 分页查询
	 * @param page
	 * @param inputDto
	 * @return
	 * @throws Exception
	 */
	public PageList<ActivitySystem> findByPage(PageList<ActivitySystem> page, ActivitySystemInputDTO inputDto) throws Exception{
		
		if(page == null){
			page = new PageList<ActivitySystem>();
		}
		List<ActivitySystem> findByObject = activitySystemDao.findByObject(inputDto);
		this.past(findByObject);
		long totalCount = activitySystemDao.countByObject(inputDto);
		if(totalCount > 0){
			// 设置记录总条数
			page.setTotal(totalCount);
			
			// 设置分页参数，查询数据
			inputDto.setLimitStart((page.getPage() - 1) * page.getPageSize());
			inputDto.setLimitSize(page.getPageSize());
			page.setRows(activitySystemDao.findByObject(inputDto));
		}
		
		return page;
	}
	
	//活动的结束日期和当前日期进行比较
		public boolean compareDate(Date end) {
			boolean flag = false;
			try {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				String rightNow = sdf.format(new Date());
				Date start = sdf.parse(rightNow);
				String entTime = sdf.format(end);
				Date endDate = sdf.parse(entTime);
				if (start.after(endDate)) {
					flag = false;
				}else{
					flag = true;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return flag;
		}
	
		@Transactional(readOnly=false)
		public void past(List<ActivitySystem> findByObject) {
			String activityId = "";
			String activityDetailsId = "";
			String eTime = "";
			ActivityDetailsInputDTO activityDetailsInputDto = new ActivityDetailsInputDTO();
			ActivityInputDTO activityInputDTO = new ActivityInputDTO();
			List<ActivityDetails> activityDetails = activityDetailsDao.findByObject(activityDetailsInputDto);
			List<Activity> activities = activityDao.findByObject(activityInputDTO);
			for(ActivitySystem activitySystem : findByObject) {
					activityId = activitySystem.getActivityId();
				for(Activity activity : activities) {
					activityDetailsId = activity.getActivityDetailsId();
					if(activityId.equals(activity.getId())) {
						for (ActivityDetails details : activityDetails) {
							if(activityDetailsId.equals(details.getId())) {
								//判断时间
								eTime = details.getEndTime();
								if(this.compareDate(DateUtil.parseDate(eTime))==false) {
									if(!activitySystem.getState().equals("3") && !activitySystem.getState().equals("2")) {
										//设置已结束
										activitySystem.setState("3");
										try {
											this.update(activitySystem);
										} catch (Exception e) {
											e.printStackTrace();
										}
									}
								}
							}
						}
					}
				}
			}
		}
	
	/**
	* 查询列表
	*/
	public ActivitySystem findByObject(ActivitySystemInputDTO inputDto) throws Exception{
		return activitySystemDao.findOneByObject(inputDto);
	}

}
