package com.ibest.card.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import com.ibest.framework.common.utils.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.ibest.framework.common.utils.PageList;

import com.ibest.card.dao.UserCardDao;
import com.ibest.card.entity.Card;
import com.ibest.card.entity.UserCard;
import com.ibest.card.dto.input.UserCardInputDTO;

@Service
@Transactional(readOnly=true)
public class UserCardService {

	@Autowired
	protected UserCardDao userCardDao;
	
	@Autowired
	private CardService cardService;
	
	public UserCard findById(String id) throws Exception{
		return userCardDao.findById(id);
	}
	
	@Transactional(readOnly=false)
	public int insert(UserCard userCard) throws Exception{
		userCard.preInsert();
		int result = userCardDao.insert(userCard);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteById(String id) throws Exception{
		int result = userCardDao.deleteById(id);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteByIds(String ids) throws Exception{
		int result = userCardDao.deleteByIds(StringUtils.tokenizeToList(ids));
		return result;
	}
	
	@Transactional(readOnly=false)
	public int update(UserCard userCard) throws Exception{
		userCard.preUpdate();
		int result = userCardDao.update(userCard);
		return result;
	}
	
	//卡券的结束日期和当前日期进行比较
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
	public void past(List<UserCard> findByObject){
		try{
			
			for (UserCard userCard : findByObject) {
				String cardId = userCard.getCardId();
				Card card = cardService.findById(cardId);
				//有效期时间
				if(card.getExpiryDays()!=null && !"".equals(card.getExpiryDays())){
					Integer expiryDays = Integer.parseInt(card.getExpiryDays());
					Date createDate = userCard.getCreateTime();
					Calendar calendar = Calendar.getInstance();
					calendar.setTime(createDate);
					calendar.add(Calendar.DAY_OF_MONTH, expiryDays);
					Date date = calendar.getTime();
					Date now = new Date();
					if(date.before(now)){
						if(!userCard.getState().equals("2") && !userCard.getState().equals("3")){
							//设置过期
							userCard.setState("3");
							this.update(userCard);
						}
					};
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 分页查询
	 * @param page
	 * @param inputDto
	 * @return
	 * @throws Exception
	 */
	@Transactional(readOnly=false)
	public PageList<UserCard> findByPage(PageList<UserCard> page, UserCardInputDTO inputDto) throws Exception{
		
		if(page == null){
			page = new PageList<UserCard>();
		}
		List<UserCard> findByObject = userCardDao.findByObject(inputDto);
		this.past(findByObject);
		long totalCount = userCardDao.countByObject(inputDto);
		if(totalCount > 0){
			// 设置记录总条数
			page.setTotal(totalCount);
			// 设置分页参数，查询数据
			inputDto.setLimitStart((page.getPage() - 1) * page.getPageSize());
			inputDto.setLimitSize(page.getPageSize());
			//查询有效期
			List<UserCard> list = userCardDao.findByObject(inputDto);
			for (UserCard userCard : list) {
				String cardId = userCard.getCardId();
				Card card = cardService.findById(cardId);
				if(card.getExpiryDays()!=null && !"".equals(card.getExpiryDays())){
					Integer expiryDays = Integer.parseInt(card.getExpiryDays());
					Date createDate = userCard.getCreateTime();
					Calendar calendar = Calendar.getInstance();
					calendar.setTime(createDate);
					calendar.add(Calendar.DAY_OF_MONTH, expiryDays);
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					String time = sdf.format(calendar.getTime());
					userCard.setExpiryDate(time);
				}else{
					userCard.setExpiryDate("永久有效");
				}
			}
			page.setRows(list);
		}
		
		return page;
	}
	
	/**
	* 查询列表
	*/
	public UserCard findByObject(UserCardInputDTO inputDto) throws Exception{
		return userCardDao.findOneByObject(inputDto);
	}

}
