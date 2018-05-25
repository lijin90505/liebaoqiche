package com.ibest.card.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.ibest.card.entity.CouponBuild;
import com.ibest.card.entity.CouponGet;
import com.ibest.card.entity.CouponUse;
import com.ibest.card.service.CouponBuildService;
import com.ibest.card.service.CouponGetService;
import com.ibest.card.service.CouponUseService;
import com.ibest.utils.ConstantUtils;
import com.ibest.utils.RandomUtils;
import org.apache.commons.lang3.StringUtils;
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
import com.ibest.card.dto.input.CouponInputDTO;
import com.ibest.card.entity.Coupon;
import com.ibest.card.service.CouponService;

@Controller
@RequestMapping(value = "${adminPath}/card/coupon")
public class CouponController extends BaseController {

	private static final Logger logger = LoggerFactory.getLogger(CouponController.class);

	@Autowired
	private CouponService couponService;

	@Autowired
	private CouponBuildService couponBuildService;

	@Autowired
	private CouponGetService couponGetService;

	@Autowired
	private CouponUseService couponUseService;

	/**
	 * 进入到列表页
	 */
	@RequestMapping(value = "/")
	public String index() {
		return "module/card/coupon/couponList";
	}

	/**
	 * 进入到表单页-创建
	 */
	@RequestMapping(value = "/add")
	public String add() {

		return "module/card/coupon/couponForm";
	}

	/**
	 * 进入到表单页，编辑
	 */
	@RequestMapping(value = "/edit")
	public String edit(@RequestParam String id, Model model) {
		try {
			if (StringUtils.isNotEmpty(id)) {
				Coupon coupon = couponService.findById(id);
				if (coupon != null) {
					model.addAttribute("coupon", coupon);
				} else {
					setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "您查看的信息不存在！", model);
				}
			} else {
				setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "请选择需要编辑的信息！", model);
			}
		} catch (Exception e) {
			setRtnCodeAndMsg(EnumsRtnMapResult.EXCEPTION.getCode(), EnumsRtnMapResult.EXCEPTION.getMsg(), model);
		}
		return "module/card/coupon/couponForm";
	}

	/**
	 * 进入到详情页
	 */
	@RequestMapping(value = "/view")
	public String view(@RequestParam String id, Model model) {
		try {
			if (StringUtils.isNotEmpty(id)) {
				Coupon coupon = couponService.findById(id);
				if (coupon != null) {
					model.addAttribute("coupon", coupon);
				} else {
					setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "您查看的信息不存在！", model);
				}
			} else {
				setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "请选择需要查看的信息！", model);
			}
		} catch (Exception e) {
			setRtnCodeAndMsg(EnumsRtnMapResult.EXCEPTION.getCode(), EnumsRtnMapResult.EXCEPTION.getMsg(), model);
		}
		return "module/card/coupon/couponDetail";
	}

	/**
	 * 异步分页查询
	 */
	@ResponseBody
	@RequiresPermissions("coupon:query")
	@RequestMapping(value = "/list")
	public PageList<Coupon> list(CouponInputDTO coupon, HttpServletRequest request) {

		PageList<Coupon> pageList = new PageList<Coupon>();

		try {
			//设置分页参数
			super.setPage(request, pageList);

			pageList = couponService.findByPage(pageList, coupon);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pageList;
	}

	/**
	 * 异步表单提交
	 */
	@ResponseBody
	@RequiresPermissions("coupon:create")
	@RequestMapping(value = "create")
	public Map<String, Object> insert(Coupon coupon) {

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");

		try {
			getBuildAndUseAndGet(coupon);
			coupon.setIsDelete(ConstantUtils.UPDATE_SET_ZERO);
			coupon.setId(RandomUtils.RandomUUID());
			int result = couponService.insert(coupon);
			if (result == 0) {
				setRtnCodeAndMsgByFailure(rtnMap, "保存失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
			setRtnCodeAndMsgByException(rtnMap, null);
		}
		return rtnMap;
	}

	/**
	 * 获取系统名称
	 *
	 * @param coupon
	 * @throws Exception
	 */
	private void getBuildAndUseAndGet(Coupon coupon)
			throws Exception {
		CouponBuild couponBuild = couponBuildService.findById(coupon.getCouponBuildId());
		CouponGet couponGet = couponGetService.findById(coupon.getCouponGetId());
		CouponUse couponUse = couponUseService.findById(coupon.getConpouUseId());
		coupon.setCouponBuildName(couponBuild.getBuildType());
		coupon.setCouponGetName(couponGet.getGetType());
		coupon.setCouponUseName(couponUse.getCouponUseName());
	}

	@ResponseBody
	@RequiresPermissions("coupon:update")
	@RequestMapping(value = "update")
	public Map<String, Object> update(Coupon coupon) {

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");

		try {
			getBuildAndUseAndGet(coupon);
			int result = couponService.update(coupon);
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
	@RequiresPermissions("coupon:delete")
	@RequestMapping(value = "delete")
	public Map<String, Object> delete(@RequestParam(required = true) String ids) {

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "删除成功");

		try {
			int result = couponService.deleteByIds(ids);
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
	 * 查询卡券列表
	 */
	@ResponseBody
//	@RequiresPermissions("coupon:query")
	@RequestMapping(value = "/coupons")
	public List<Coupon> coupons(CouponInputDTO inputDTO)
			throws Exception {
		return couponService.findByObject(inputDTO);
	}
}
