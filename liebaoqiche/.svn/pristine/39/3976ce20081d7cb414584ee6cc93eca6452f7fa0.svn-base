package com.ibest.user.service;

import com.ibest.framework.common.utils.PageList;
import com.ibest.framework.common.utils.StringUtils;
import com.ibest.user.dao.UserAuthApplyDao;
import com.ibest.user.dto.input.UserAuthApplyInputDTO;
import com.ibest.user.entity.UserAuthApply;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = true)
public class UserAuthApplyService {

	@Autowired
	protected UserAuthApplyDao userAuthApplyDao;

	public UserAuthApply findById(String id)
			throws Exception {
		return userAuthApplyDao.findById(id);
	}

	@Transactional(readOnly = false)
	public int insert(UserAuthApply userAuthApply)
			throws Exception {
		userAuthApply.preInsert();
		int result = userAuthApplyDao.insert(userAuthApply);
		return result;
	}

	@Transactional(readOnly = false)
	public int deleteById(String id)
			throws Exception {
		int result = userAuthApplyDao.deleteById(id);
		return result;
	}

	@Transactional(readOnly = false)
	public int deleteByIds(String ids)
			throws Exception {
		int result = userAuthApplyDao.deleteByIds(StringUtils.tokenizeToList(ids));
		return result;
	}

	@Transactional(readOnly = false)
	public int update(UserAuthApply userAuthApply)
			throws Exception {
		userAuthApply.preUpdate();
		int result = userAuthApplyDao.update(userAuthApply);
		return result;
	}

	/**
	 * 分页查询
	 *
	 * @param page
	 * @param inputDto
	 * @return
	 * @throws Exception
	 */
	public PageList<UserAuthApply> findByPage(PageList<UserAuthApply> page, UserAuthApplyInputDTO inputDto)
			throws Exception {

		if (page == null) {
			page = new PageList<UserAuthApply>();
		}

		long totalCount = userAuthApplyDao.countByObject(inputDto);
		if (totalCount > 0) {
			// 设置记录总条数
			page.setTotal(totalCount);

			// 设置分页参数，查询数据
			inputDto.setLimitStart((page.getPage() - 1) * page.getPageSize());
			inputDto.setLimitSize(page.getPageSize());
			page.setRows(userAuthApplyDao.findByObject(inputDto));
		}

		return page;
	}

	/**
	 * 查询列表
	 */
	public UserAuthApply findByObject(UserAuthApplyInputDTO inputDto)
			throws Exception {
		return userAuthApplyDao.findOneByObject(inputDto);
	}

	/**
	 * 查询所以等级
	 */
	public List<UserAuthApply> findAllLevel(UserAuthApplyInputDTO inputDto)
			throws Exception {
		return userAuthApplyDao.findAllLevel(inputDto);
	}


	/**
	 * 批量处理认证申请，通过/拒绝
	 *
	 * @param ids
	 * @param status
	 * @param detail
	 * @throws Exception
	 */
	@Transactional(readOnly = false)
	public int handle(List<String> ids, Integer status, String detail)
			throws Exception {
		return userAuthApplyDao.handle(ids, status, detail);
	}
}
