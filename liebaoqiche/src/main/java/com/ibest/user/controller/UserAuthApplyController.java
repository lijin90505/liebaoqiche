package com.ibest.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ibest.framework.common.enums.EnumsRtnMapResult;
import com.ibest.framework.common.persistence.BaseController;
import com.ibest.framework.common.utils.PageList;
import com.ibest.user.dto.input.UserAuthApplyInputDTO;
import com.ibest.user.entity.UserAuthApply;
import com.ibest.user.service.UserAuthApplyService;

@Controller
@RequestMapping(value = "${adminPath}/user/userAuthApply")
public class UserAuthApplyController extends BaseController {

	private static final Logger logger = LoggerFactory.getLogger(UserAuthApplyController.class);

	@Autowired
	private UserAuthApplyService userAuthApplyService;

	/**
	 * 进入到列表页
	 */
	@RequestMapping(value = "/")
	public String index() {
		return "module/user/userAuthApply/userAuthApplyList";
	}

	/**
	 * 进入到表单页-创建
	 */
	@RequestMapping(value = "/add")
	public String add() {

		return "module/user/userAuthApply/userAuthApplyForm";
	}

	/**
	 * 进入到表单页，编辑
	 */
	@RequestMapping(value = "/edit")
	public String edit(@RequestParam String id, Model model) {
		try {
			if (StringUtils.isNotEmpty(id)) {
				UserAuthApply userAuthApply = userAuthApplyService.findById(id);
				if (userAuthApply != null) {
					model.addAttribute("userAuthApply", userAuthApply);
				} else {
					setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "您查看的信息不存在！", model);
				}
			} else {
				setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "请选择需要编辑的信息！", model);
			}
		} catch (Exception e) {
			setRtnCodeAndMsg(EnumsRtnMapResult.EXCEPTION.getCode(), EnumsRtnMapResult.EXCEPTION.getMsg(), model);
		}
		return "module/user/userAuthApply/userAuthApplyForm";
	}

	/**
	 *
	 */
	@ResponseBody
	@RequestMapping(value="/findAllLevel")
	public List<UserAuthApply> findAllLevel(UserAuthApplyInputDTO inputDTO, HttpServletRequest request) throws Exception{
		return userAuthApplyService.findAllLevel(inputDTO);
	}

	/**
	 * 进入到详情页
	 */
	@RequestMapping(value = "/view")
	public String view(@RequestParam String id, Model model) {
		try {
			if (StringUtils.isNotEmpty(id)) {
				UserAuthApply userAuthApply = userAuthApplyService.findById(id);
				if (userAuthApply != null) {
					model.addAttribute("userAuthApply", userAuthApply);
				} else {
					setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "您查看的信息不存在！", model);
				}
			} else {
				setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "请选择需要查看的信息！", model);
			}
		} catch (Exception e) {
			setRtnCodeAndMsg(EnumsRtnMapResult.EXCEPTION.getCode(), EnumsRtnMapResult.EXCEPTION.getMsg(), model);
		}
		return "module/user/userAuthApply/userAuthApplyDetail";
	}

	/**
	 * 异步分页查询
	 */
	@ResponseBody
	@RequiresPermissions("userAuthApply:query")
	@RequestMapping(value = "/list")
	public PageList<UserAuthApply> list(UserAuthApplyInputDTO userAuthApply, HttpServletRequest request) {

		PageList<UserAuthApply> pageList = new PageList<UserAuthApply>();

		try {
			//设置分页参数
			super.setPage(request, pageList);

			pageList = userAuthApplyService.findByPage(pageList, userAuthApply);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pageList;
	}

	/**
	 * 异步表单提交
	 */
	@ResponseBody
	@RequiresPermissions("userAuthApply:create")
	@RequestMapping(value = "create")
	public Map<String, Object> insert(UserAuthApply userAuthApply) {

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");

		try {
			int result = userAuthApplyService.insert(userAuthApply);
			if (result == 0) {
				setRtnCodeAndMsgByFailure(rtnMap, "保存失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
			setRtnCodeAndMsgByException(rtnMap, null);
		}
		return rtnMap;
	}

	@ResponseBody
	@RequiresPermissions("userAuthApply:update")
	@RequestMapping(value = "update")
	public Map<String, Object> update(UserAuthApply userAuthApply) {

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");

		try {
			int result = userAuthApplyService.update(userAuthApply);
			if (result == 0) {
				setRtnCodeAndMsgByFailure(rtnMap, "保存失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
			setRtnCodeAndMsgByException(rtnMap, null);
		}
		return rtnMap;
	}

	@ResponseBody
	@RequiresPermissions("userAuthApply:delete")
	@RequestMapping(value = "delete")
	public Map<String, Object> delete(@RequestParam(required = true) String ids) {

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "删除成功");

		try {
			int result = userAuthApplyService.deleteByIds(ids);
			if (result == 0) {
				setRtnCodeAndMsgByFailure(rtnMap, "删除失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
			setRtnCodeAndMsgByException(rtnMap, null);
		}
		return rtnMap;
	}

	/**
	 * 批量处理认证申请，通过/拒绝
	 *
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequiresPermissions(value = {"userAuthApply:batchPass", "userAuthApply:batchReject"}, logical = Logical.OR)
	@RequestMapping(value = "handle")
	public Object handle(@RequestParam List<String> ids, @RequestParam Integer status, String detail) {
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "处理成功");

		try {
			userAuthApplyService.handle(ids, status, detail);
		} catch (Exception e) {
			e.printStackTrace();
			setRtnCodeAndMsgByException(rtnMap, null);
		}

		return rtnMap;
	}
}
