package com.ibest.integral.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
import com.ibest.framework.common.utils.UserUtils;
import com.ibest.integral.dto.input.UserIntegralInputDTO;
import com.ibest.integral.entity.IntegralCategory;
import com.ibest.integral.entity.UserIntegral;
import com.ibest.integral.entity.UserIntegralCount;
import com.ibest.integral.service.UserIntegralCountService;
import com.ibest.integral.service.UserIntegralService;
import com.ibest.utils.ConstantUtils;
import com.ibest.utils.RandomUtils;

@Controller
@RequestMapping(value="${adminPath}/integral/userIntegral")
public class UserIntegralController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserIntegralController.class);
	
	@Autowired
	private UserIntegralService userIntegralService;
	
	@Autowired
	private UserIntegralCountService userIntegralCountService;
	
	/**
	* 进入到列表页
	*/
	@RequestMapping(value="/")
	public String index(){
		return "module/integral/userIntegral/userIntegralList";
	}
	
	/**
	* 进入到表单页-创建
	*/
	@RequestMapping(value="/add")
	public String add(){
		
		return "module/integral/userIntegral/userIntegralForm";
	}
	
	/**
	* 进入到表单页，编辑
	*/
	@RequestMapping(value="/edit")
	public String edit(@RequestParam String id, Model model){
		try {
			if(StringUtils.isNotEmpty(id)){
				UserIntegral userIntegral = userIntegralService.findById(id);
				if(userIntegral != null){
					model.addAttribute("userIntegral", userIntegral);
				}else{
					setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "您查看的信息不存在！", model);
				}
			}else{
				setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "请选择需要编辑的信息！", model);
			}
		} catch (Exception e) {
			setRtnCodeAndMsg(EnumsRtnMapResult.EXCEPTION.getCode(), EnumsRtnMapResult.EXCEPTION.getMsg(), model);
		}
		return "module/integral/userIntegral/userIntegralForm";
	}
	
	/**
	 * 进入积分操作页面
	 */
	@RequestMapping(value="/integralQuery")
	public String integralEdit(Model model){
		
		return "module/integral/userIntegral/userIntegralEdit";
	}
	
	/**
	 * 积分操作
	 */
	@ResponseBody
	@RequiresPermissions("userIntegral:operation")
	@RequestMapping(value="operation")
	public Map<String, Object> operation(UserIntegral userIntegral){

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "操作成功");
		
		try {
			Integer integral = 
					userIntegralCountService.queryIntegralByUserId(userIntegral.getUserId());
			if(userIntegral.getType().equals("01")){
				if(integral == null){
					setRtnCodeAndMsgByFailure(rtnMap, "操作失败,当前用户未获得积分!");
				}else{
					int before = integral.intValue();
					int now = userIntegral.getConsumeNum();
					if(now>before){
						setRtnCodeAndMsgByFailure(rtnMap, "操作失败,当前用户积分不够!");
					}else{
						boolean flag = userIntegralService.integralUpdateFrank(userIntegral);
						if(flag==false){
							setRtnCodeAndMsgBySuccess(rtnMap, "操作失败");
						}
					}
				}
			}else{
				boolean flag = userIntegralService.integralUpdateFrank(userIntegral);
				if(flag==false){
					setRtnCodeAndMsgBySuccess(rtnMap, "操作失败");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			setRtnCodeAndMsgByException(rtnMap, null);
		}
		return rtnMap;
	}
	
	/**
	* 进入到详情页
	*/
	@RequestMapping(value="/view")
	public String view(@RequestParam String id, Model model){
		try {
			if(StringUtils.isNotEmpty(id)){
				UserIntegral userIntegral = userIntegralService.findById(id);
				if(userIntegral != null){
					model.addAttribute("userIntegral", userIntegral);
				}else{
					setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "您查看的信息不存在！", model);
				}
			}else{
				setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "请选择需要查看的信息！", model);
			}
		} catch (Exception e) {
			setRtnCodeAndMsg(EnumsRtnMapResult.EXCEPTION.getCode(), EnumsRtnMapResult.EXCEPTION.getMsg(), model);
		}
		return "module/integral/userIntegral/userIntegralDetail";
	}

	/**
	* 异步分页查询
	*/
	@ResponseBody
	@RequiresPermissions("userIntegral:query")
	@RequestMapping(value="/list")
	public PageList<UserIntegral> list(UserIntegralInputDTO userIntegral, HttpServletRequest request){
		
		PageList<UserIntegral> pageList = new PageList<UserIntegral>();
		
		try {
			//设置分页参数
			super.setPage(request, pageList);
		
			pageList = userIntegralService.findByPage(pageList, userIntegral);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pageList;
	}
	
	/**
	* 异步表单提交
	*/
	@ResponseBody
	@RequiresPermissions("userIntegral:create")
	@RequestMapping(value="create")
	public Map<String, Object> insert(UserIntegral userIntegral){

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");
		
		try {
			userIntegral.setCreater(UserUtils.getCurrentUser().getRealname());
			userIntegral.setCreateTime(new Date());
			userIntegral.setModifier(UserUtils.getCurrentUser().getRealname());
			userIntegral.setModifyTime(new Date());
			userIntegral.setId(RandomUtils.RandomUUID());
			int result = userIntegralService.insert(userIntegral);
			if(result == 0){
				setRtnCodeAndMsgByFailure(rtnMap, "保存失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
			setRtnCodeAndMsgByException(rtnMap, null);
		}
		return rtnMap;
	}
	
	
	
	@ResponseBody
	@RequiresPermissions("userIntegral:update")
	@RequestMapping(value="update")
	public Map<String, Object> update(UserIntegral userIntegral){

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");
		
		try {
			SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd");
			userIntegral.setModifier(UserUtils.getCurrentUser().getRealname());
			userIntegral.setModifyTime(dateFormat.parse(dateFormat.format(new Date())));
			int result = userIntegralService.update(userIntegral);
			if(result == 0){
				setRtnCodeAndMsgByFailure(rtnMap, "保存失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
			setRtnCodeAndMsgByException(rtnMap, null);
		}
		return rtnMap;
	}
	
	@ResponseBody
	@RequestMapping(value="queryName")
	public void queryUserName(@RequestParam String name){
		
	}
	
	@ResponseBody
	@RequiresPermissions("userIntegral:delete")
	@RequestMapping(value="delete")
	public Map<String, Object> delete(@RequestParam(required=true) String ids){
		
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "删除成功");
		
		try {
			int result = userIntegralService.deleteByIds(ids);
			if(result == 0){
				setRtnCodeAndMsgByFailure(rtnMap, "删除失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
			setRtnCodeAndMsgByException(rtnMap, null);
		}
		return rtnMap;
	}
}
