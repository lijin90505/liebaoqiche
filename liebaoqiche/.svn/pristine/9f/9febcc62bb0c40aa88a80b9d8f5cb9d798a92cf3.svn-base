package com.ibest.card.service;

import java.util.ArrayList;
import java.util.List;

import com.ibest.framework.common.utils.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.ibest.framework.common.utils.PageList;

import com.ibest.card.dao.CardOperationDao;
import com.ibest.card.entity.CardOperation;
import com.ibest.card.dto.input.CardOperationInputDTO;

@Service
@Transactional(readOnly=true)
public class CardOperationService {

	@Autowired
	protected CardOperationDao cardOperationDao;
	
	public CardOperation findById(String id) throws Exception{
		return cardOperationDao.findById(id);
	}
	
	@Transactional(readOnly=false)
	public int insert(CardOperation cardOperation) throws Exception{
		cardOperation.preInsert();
		int result = cardOperationDao.insert(cardOperation);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteById(String id) throws Exception{
		int result = cardOperationDao.deleteById(id);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteByIds(String ids) throws Exception{
		int result = cardOperationDao.deleteByIds(StringUtils.tokenizeToList(ids));
		return result;
	}
	
	@Transactional(readOnly=false)
	public int update(CardOperation cardOperation) throws Exception{
		cardOperation.preUpdate();
		int result = cardOperationDao.update(cardOperation);
		return result;
	}
	
	/**
	 * 分页查询
	 * @param page
	 * @param inputDto
	 * @return
	 * @throws Exception
	 */
	public PageList<CardOperation> findByPage(PageList<CardOperation> page, CardOperationInputDTO inputDto) throws Exception{
		
		if(page == null){
			page = new PageList<CardOperation>();
		}
		
		List<CardOperation> list= cardOperationDao.findByObject(inputDto);
		if(list.size() > 0){
			// 设置记录总条数
			page.setTotal(list.size());
			
			// 设置分页参数，查询数据
			inputDto.setLimitStart((page.getPage() - 1) * page.getPageSize());
			inputDto.setLimitSize(page.getPageSize());
			page.setRows(cardOperationDao.findByObject(inputDto));
		}
		
		return page;
	}
	
	/**
	* 查询列表
	*/
	public CardOperation findByObject(CardOperationInputDTO inputDto) throws Exception{
		return cardOperationDao.findOneByObject(inputDto);
	}

}
