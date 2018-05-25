package com.ibest.integral.service;

import com.ibest.framework.common.utils.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.ibest.framework.common.utils.PageList;

import com.ibest.integral.dao.PointTypeDao;
import com.ibest.integral.entity.PointType;
import com.ibest.integral.dto.input.PointTypeInputDTO;

import java.util.List;

@Service
@Transactional(readOnly=true)
public class PointTypeService {

	@Autowired
	protected PointTypeDao pointTypeDao;
	
	public PointType findById(String id) throws Exception{
		return pointTypeDao.findById(id);
	}
	
	@Transactional(readOnly=false)
	public int insert(PointType pointType) throws Exception{
		pointType.preInsert();
		int result = pointTypeDao.insert(pointType);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteById(String id) throws Exception{
		int result = pointTypeDao.deleteById(id);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int deleteByIds(String ids) throws Exception{
		int result = pointTypeDao.deleteByIds(StringUtils.tokenizeToList(ids));
		return result;
	}
	
	@Transactional(readOnly=false)
	public int update(PointType pointType) throws Exception{
		pointType.preUpdate();
		int result = pointTypeDao.update(pointType);
		return result;
	}
	
	/**
	 * 分页查询
	 * @param page
	 * @param inputDto
	 * @return
	 * @throws Exception
	 */
	public PageList<PointType> findByPage(PageList<PointType> page, PointTypeInputDTO inputDto) throws Exception{
		
		if(page == null){
			page = new PageList<PointType>();
		}
		
		long totalCount = pointTypeDao.countByObject(inputDto);
		if(totalCount > 0){
			// 设置记录总条数
			page.setTotal(totalCount);
			
			// 设置分页参数，查询数据
			inputDto.setLimitStart((page.getPage() - 1) * page.getPageSize());
			inputDto.setLimitSize(page.getPageSize());
			page.setRows(pointTypeDao.findByObject(inputDto));
		}
		
		return page;
	}

	/**
	* 查询列表
	*/
	public PointType findOneByObject(PointTypeInputDTO inputDto) throws Exception{
		return pointTypeDao.findOneByObject(inputDto);
	}

	public List<PointType> findByObject(PointTypeInputDTO inputDto) throws Exception{
		return pointTypeDao.findByObject(inputDto);
	}

}
