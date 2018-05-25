package com.ibest.experience.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.ibest.framework.common.utils.StringUtils;
import com.ibest.framework.common.utils.UserUtils;
import com.ibest.user.entity.User;
import com.ibest.user.entity.UserCars;
import com.ibest.user.service.UserCarsService;
import com.ibest.utils.RandomUtils;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.ibest.framework.common.utils.PageList;
import com.ibest.card.entity.UserCard;
import com.ibest.experience.dao.UserExperienceDao;
import com.ibest.experience.entity.UserExperience;
import com.ibest.experience.entity.UserExperienceCount;
import com.ibest.experience.dto.input.ExperienceInputDTO;
import com.ibest.experience.dto.input.UserExperienceCountInputDTO;
import com.ibest.experience.dto.input.UserExperienceInputDTO;

@Service
@Transactional(readOnly=true)
public class UserExperienceService {

	@Autowired
	protected UserExperienceDao userExperienceDao;
	
	@Autowired
	protected UserCarsService usercars;
	
	@Autowired
	protected UserExperienceCountService userExperienceCountService;
	
	public UserExperience findById(String id) throws Exception{
		return userExperienceDao.findById(id);
	}
	
	@Transactional(readOnly=false)
	public int insert(UserExperience userExperience) throws Exception{
		userExperience.preInsert();
		int result = userExperienceDao.insert(userExperience);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteById(String id) throws Exception{
		int result = userExperienceDao.deleteById(id);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteByIds(String ids) throws Exception{
		int result = userExperienceDao.deleteByIds(StringUtils.tokenizeToList(ids));
		return result;
	}
	
	@Transactional(readOnly=false)
	public int update(UserExperience userExperience) throws Exception{
		userExperience.preUpdate();
		int result = userExperienceDao.update(userExperience);
		return result;
	}
	
	/**
	 * 修改应用程序标识
	 * @param findByObject
	 */
	public void showAppId(List<UserExperience> findByObject){
		for (UserExperience userExperience : findByObject) {
			if(userExperience.getAppId().equals("00")){
				userExperience.setAppId("APP");
			}
			if(userExperience.getAppId().equals("01")){
				userExperience.setAppId("PC");
			}
			if(userExperience.getAppId().equals("02")){
				userExperience.setAppId("Android");
			}
		}
	}
	
	public List<UserExperience> findByUserId(String userId) throws Exception{
		return userExperienceDao.findByUserId(userId);
	}
	
	@Transactional(readOnly=false)
	public boolean  experienceUpdateFrank(UserExperience userExperience) throws Exception{
		boolean flag=true;
		UserExperience userExperience2=new UserExperience();
		userExperience2.setId(RandomUtils.RandomUUID());
		userExperience2.setAccessSystemId("后台操作系统");
		userExperience2.setAppId("05");
		userExperience2.setUserId(userExperience.getUserId());
		userExperience2.setVinNo(userExperience.getVinNo());
		userExperience2.setConsumeNum(userExperience.getConsumeNum());
		userExperience2.setType(userExperience.getType());
		userExperience2.setCreateDate(new Date());
		userExperience2.setModifyTime(new Date());	
		int insert = this.insert(userExperience2);
		if(insert == 0){
			flag = false;
		}
		
		UserExperienceCountInputDTO inputDto=new UserExperienceCountInputDTO();				
		inputDto.setAccessSystemId("后台操作系统");
		inputDto.setAppId("05");
		inputDto.setUserId(userExperience.getUserId());
		inputDto.setVinNo(userExperience.getVinNo());
		inputDto.setType(userExperience.getType());
		
		UserExperienceCount userExperienceCount=new UserExperienceCount();
		userExperienceCount.setAccessSystemId("后台操作系统");	
		userExperienceCount.setAppId("05");
		userExperienceCount.setUserId(userExperience.getUserId());	
		userExperienceCount.setVinNo(userExperience.getVinNo());
		userExperienceCount.setType(userExperience.getType());
			
		UserExperienceCount userExperienceCount2=userExperienceCountService.findOneByObject(inputDto);
		String type=userExperience.getType();	
		if(userExperienceCount2 == null) {
			userExperienceCount.setId(RandomUtils.RandomUUID());
			if(type.equals("00")) {
				userExperienceCount.setNumber(Integer.valueOf(userExperience.getConsumeNum()));
			}else if (type.equals("01")) {
				userExperienceCount.setNumber(-Integer.valueOf(userExperience.getConsumeNum()));
			}
			userExperienceCount.setCreateDate(new Date());
			userExperienceCount.setModifyTime(new Date());
			int insert2 = userExperienceCountService.insert(userExperienceCount);
			if(insert2 == 0){
				flag = true;
			}
		}else {
			int num=0;
			if(type.equals("00")) {
				num=userExperienceCount2.getNumber()+Integer.valueOf(userExperience.getConsumeNum());
			}else if (type.equals("01")) {
				num=userExperienceCount2.getNumber()-Integer.valueOf(userExperience.getConsumeNum());
			}			
			userExperienceCount2.setNumber(num);
			userExperienceCount2.setModifyTime(new Date());
			int experienceupdate = userExperienceCountService.experienceupdate(userExperienceCount2);
			if(experienceupdate == 0){
				flag = false;
			}
		}
		
		return flag;
	}
	
	
	@Transactional(readOnly=false)
	public boolean experienceUpdate(UserExperience userExperience) throws Exception{
		boolean flag = true;
		List<UserExperience> findByUserId = this.findByUserId(userExperience.getUserId());
		List<UserCars> cars = usercars.findVinNoByUserId(userExperience.getUserId());
		String vinNo =null;
		if(cars!=null && cars.size()>0){
			vinNo =cars.get(0).getVinCode();
		}
		UserExperience newExp = new UserExperience();
		newExp.setId(RandomUtils.RandomUUID());
		if(findByUserId!=null && findByUserId.size()>0){
			UserExperience oldExp = findByUserId.get(0);
			newExp.setAccessSystemId(oldExp.getAccessSystemId());
			newExp.setAppId(oldExp.getAppId());
		}else{
			newExp.setAccessSystemId("后台操作系统");
			newExp.setAppId("05");
		}
			newExp.setUserId(userExperience.getUserId());
			newExp.setVinNo(vinNo==null?"没有车":vinNo);
			newExp.setConsumeNum(userExperience.getConsumeNum());
			newExp.setType(userExperience.getType());
			newExp.setCreater(UserUtils.getCurrentUser().getRealname());
			newExp.setCreateTime(new Date());
			newExp.setModifier(UserUtils.getCurrentUser().getRealname());
			newExp.setModifyTime(new Date());
			int insert = this.insert(newExp);
			if(insert == 0){
				flag = false;
			}
			
			/*List<UserExperienceCount> userExps = 
					userExperienceCountService.findByUserId(newExp.getUserId());
			if(userExps.size() == 0){*/
				String type = newExp.getType();
				UserExperienceCount userCount = new UserExperienceCount();
				userCount.setId(RandomUtils.RandomUUID());
				userCount.setAccessSystemId(newExp.getAccessSystemId());
				userCount.setAppId(newExp.getAppId());
				userCount.setUserId(newExp.getUserId());
				userCount.setVinNo(vinNo==null?"没有车":vinNo);
				userCount.setType(newExp.getType());
				if(type.equals("00")){
					userCount.setNumber(newExp.getConsumeNum());
				}
				if(type.equals("01")){
					String num = "-" + newExp.getConsumeNum();
					userCount.setNumber(Integer.parseInt(num));
				}
				userCount.setCreater(UserUtils.getCurrentUser().getRealname());
				userCount.setCreateTime(new Date());
				userCount.setModifyTime(new Date());
				userCount.setModifier(UserUtils.getCurrentUser().getRealname());
				int ins = userExperienceCountService.insert(userCount);
				if(ins == 0){
					flag = false;
				}
			/*}else{
				UserExperienceCount count = userExps.get(0);
				String type = newExp.getType();
				int num=0;
				if(type.equals("00")){
					num=count.getNumber()+newExp.getConsumeNum();
				}else
				if(type.equals("01")){
					num=count.getNumber()-newExp.getConsumeNum();
				}
				count.setNumber(num);
				count.setModifier(UserUtils.getCurrentUser().getRealname());
				count.setModifyTime(new Date());
				int update = userExperienceCountService.update(count);
				if(update == 0){
					flag =false;
				}
			}*/
			
		return flag;
	}
	
	/**
	 * 分页查询
	 * @param page
	 * @param inputDto
	 * @return
	 * @throws Exception
	 */
	public PageList<UserExperience> findByPage(PageList<UserExperience> page, UserExperienceInputDTO inputDto) throws Exception{
		
		if(page == null){
			page = new PageList<UserExperience>();
		}
		/*List<UserExperience> findByObject = userExperienceDao.findByObject(inputDto);
		this.showAppId(findByObject);*/
		long totalCount = userExperienceDao.countByObject(inputDto);
		if(totalCount > 0){
			// 设置记录总条数
			page.setTotal(totalCount);
			
			// 设置分页参数，查询数据
			inputDto.setLimitStart((page.getPage() - 1) * page.getPageSize());
			inputDto.setLimitSize(page.getPageSize());
			page.setRows(userExperienceDao.findByObject(inputDto));
		}
		
		return page;
	}
	
	/**
	* 查询列表
	*/
	public UserExperience findByObject(UserExperienceInputDTO inputDto) throws Exception{
		return userExperienceDao.findOneByObject(inputDto);
	}

}
