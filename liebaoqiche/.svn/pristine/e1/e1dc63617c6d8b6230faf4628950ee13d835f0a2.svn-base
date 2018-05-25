package com.ibest.card.service;

import java.util.ArrayList;
import java.util.List;

import com.ibest.framework.common.utils.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.ibest.framework.common.utils.PageList;

import com.ibest.card.dao.CardUseDao;
import com.ibest.card.entity.CardUse;
import com.ibest.card.dto.input.CardUseInputDTO;

@Service
@Transactional(readOnly=true)
public class CardUseService {

	@Autowired
	protected CardUseDao cardUseDao;
	
	public CardUse findById(String id) throws Exception{
		return cardUseDao.findById(id);
	}
	
	@Transactional(readOnly=false)
	public int insert(CardUse cardUse) throws Exception{
		cardUse.preInsert();
		int result = cardUseDao.insert(cardUse);
		return result;
	}
	
	public CardUse checkNameUnique(String name) throws Exception{
		return cardUseDao.checkNameUnique(name);
	}
	
	@Transactional(readOnly=false)
	public int deleteById(String id) throws Exception{
		int result = cardUseDao.deleteById(id);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteByIds(String ids) throws Exception{
		int result = cardUseDao.deleteByIds(StringUtils.tokenizeToList(ids));
		return result;
	}
	
	@Transactional(readOnly=false)
	public int update(CardUse cardUse) throws Exception{
		cardUse.preUpdate();
		int result = cardUseDao.update(cardUse);
		return result;
	}
	
	/**
	 * 分页查询
	 * @param page
	 * @param inputDto
	 * @return
	 * @throws Exception
	 */
	public PageList<CardUse> findByPage(PageList<CardUse> page, CardUseInputDTO inputDto) throws Exception{
		
		if(page == null){
			page = new PageList<CardUse>();
		}
		
		long totalCount = cardUseDao.countByObject(inputDto);
		if(totalCount > 0){
			// 设置记录总条数
			page.setTotal(totalCount);
			
			// 设置分页参数，查询数据
			inputDto.setLimitStart((page.getPage() - 1) * page.getPageSize());
			inputDto.setLimitSize(page.getPageSize());
			page.setRows(cardUseDao.findByObject(inputDto));
		}
		
		return page;
	}
	
	/**
	* 查询列表
	*/
	public CardUse findOneByObject(CardUseInputDTO inputDto) throws Exception{
		return cardUseDao.findOneByObject(inputDto);
	}

	/**
	 * 查询列表
	 */
	public List<CardUse> findByObject(CardUseInputDTO inputDto) throws Exception{
		return cardUseDao.findByObject(inputDto);
	}
}
