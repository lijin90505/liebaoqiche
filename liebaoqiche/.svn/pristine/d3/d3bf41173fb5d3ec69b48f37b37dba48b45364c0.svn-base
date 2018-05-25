package com.ibest.user.service;

import java.util.List;

import com.ibest.framework.common.utils.StringUtils;
import com.ibest.integral.entity.UserIntegralCount;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.ibest.framework.common.utils.PageList;

import com.ibest.user.dao.UserDao;
import com.ibest.user.entity.User;
import com.ibest.user.dto.input.UserInputDTO;

@Service
@Transactional(readOnly=true)
public class UserService {

	@Autowired
	protected UserDao userDao;
	
	public User findById(String id) throws Exception{
		return userDao.findById(id);
	}
	
	@Transactional(readOnly=false)
	public int insert(User user) throws Exception{
		user.preInsert();
		int result = userDao.insert(user);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteById(String id) throws Exception{
		int result = userDao.deleteById(id);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteByIds(String ids) throws Exception{
		int result = userDao.deleteByIds(StringUtils.tokenizeToList(ids));
		return result;
	}
	
	@Transactional(readOnly=false)
	public int update(User user) throws Exception{
		user.preUpdate();
		int result = userDao.update(user);
		return result;
	}

	/**
	 * 根据条件对象查询用户个数
	 * @param inputDTO
	 * @return
	 */
	public int countUserByObject(UserInputDTO inputDTO) {

		return userDao.countUserByObject(inputDTO);
	}
	
	public User findExpById(String id) throws Exception{
		return userDao.findExpById(id);
	}
	
	public User findInteById(String id) throws Exception{
		return userDao.findInteById(id);
	}
	
	/**
	 * 分页查询
	 * @param page
	 * @param inputDto
	 * @return
	 * @throws Exception
	 */
	public PageList<User> findByPage(PageList<User> page, UserInputDTO inputDto) throws Exception{
		
		if(page == null){
			page = new PageList<User>();
		}
		inputDto.setIsDelete(0);
		
		
		List<User> userList = userDao.findByObject(inputDto);
		
		if(userList.size() > 0){
			// 设置记录总条数
			page.setTotal(userList.size());
			
			// 设置分页参数，查询数据
			inputDto.setLimitStart((page.getPage() - 1) * page.getPageSize());
			inputDto.setLimitSize(page.getPageSize());
			List<User> userList1 = userDao.findByObject(inputDto);
			for (User user : userList1) {
				User exp= this.findExpById(user.getId());
				if(exp!=null){
					user.setExperienceNumber(exp.getExperienceNumber());
				}else {//updateTime:2018-05-07 15：36：24 如果没有值就设置为0 WJ
					user.setExperienceNumber(0);
				}
				User inte = this.findInteById(user.getId());
				if(inte!=null){
					user.setIntegralNumber(inte.getIntegralNumber());
				}else {
					user.setIntegralNumber(0);
				}
			}
			page.setRows(userList1);
		}
		
//		long totalCount = userDao.countByObjectZero(inputDto);
		/*if(userList!=null && userList.size() > 0){
			// 设置记录总条数
			page.setTotal(userList.size());
			
			// 设置分页参数，查询数据
			inputDto.setLimitStart((page.getPage() - 1) * page.getPageSize());
			inputDto.setLimitSize(page.getPageSize());
			
//			List<User> findByObject = userDao.findByObject(inputDto);
			for (User user : userList) {
				User exp= this.findExpById(user.getId());
				if(exp!=null){
					user.setExperienceNumber(exp.getExperienceNumber());
				}else {//updateTime:2018-05-07 15：36：24 如果没有值就设置为0 WJ
					user.setExperienceNumber(0);
				}
				User inte = this.findInteById(user.getId());
				if(inte!=null){
					user.setIntegralNumber(inte.getIntegralNumber());
				}else {
					user.setIntegralNumber(0);
				}
			}
			page.setRows(userList);
		}*/
		
		return page;
	}
	
	/**
	* 查询列表
	*/
	public User findOneByObject(UserInputDTO inputDto) throws Exception{
		return userDao.findOneByObject(inputDto);
	}

	public List<User> findByObject(UserInputDTO inputDTO) throws Exception{
		return userDao.findByObject(inputDTO);
	}
	
	public List<User> findAllUsers(UserInputDTO inputDTO) throws Exception{
		return userDao.findAllUsers(inputDTO);
	}

	public List<User> findCarVinsByObject(UserInputDTO inputDTO) throws Exception{
		return userDao.findCarVinsByObject(inputDTO);
	}
	
	public User findByPhone(String phone) throws Exception{
		return userDao.findByPhone(phone);
	}
	
	public User findByEmail(String email) throws Exception{
		return userDao.findByEmail(email);
	}
	
	public User findByUserName(String username) throws Exception{
		return userDao.findByUserName(username);
	}

	/**
	 * 解锁/锁定
	 *
	 * @param ids
	 * @param locked
	 * @throws Exception
	 */
	@Transactional(readOnly = false)
	public int handle(List<String> ids, Integer locked)
			throws Exception {
		return userDao.handle(ids, locked);
	}
	
	public List<User> findAllUsers() throws Exception{
		return userDao.findAllUsers();
	}

	public List<User> getUserList(UserInputDTO userInputDTO) throws Exception{
		return userDao.getUserList(userInputDTO);
	}
}
