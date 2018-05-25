package com.ibest.integral.controller;

import com.ibest.activity.entity.ActivityIntegral;
import com.ibest.activity.service.ActivityIntegralService;
import com.ibest.framework.common.enums.EnumsRtnMapResult;
import com.ibest.framework.common.persistence.BaseController;
import com.ibest.framework.common.utils.PageList;
import com.ibest.framework.common.utils.UserUtils;
import com.ibest.integral.dto.input.IntegralInputDTO;
import com.ibest.integral.entity.Integral;
import com.ibest.integral.service.IntegralService;
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

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value="${adminPath}/integral/integral")
public class IntegralController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(IntegralController.class);
	
	@Autowired
	private IntegralService integralService;
	@Autowired
	private ActivityIntegralService activityIntegralService;
	/**
	* 进入到列表页
	*/
	@RequestMapping(value="/")
	public String index(){
		return "module/integral/integral/integralList";
	}
	
	/**
	* 进入到表单页-创建
	*/
	@RequestMapping(value="/add")
	public String add(){
		
		return "module/integral/integral/integralForm";
	}
	
	/**
	* 进入到表单页，编辑
	*/
	@RequestMapping(value="/edit")
	public String edit(@RequestParam String id, Model model){
		try {
			if(StringUtils.isNotEmpty(id)){
				Integral integral = integralService.findById(id);
				if(integral != null){
					model.addAttribute("integral", integral);
				}else{
					setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "您查看的信息不存在！", model);
				}
			}else{
				setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "请选择需要编辑的信息！", model);
			}
		} catch (Exception e) {
			setRtnCodeAndMsg(EnumsRtnMapResult.EXCEPTION.getCode(), EnumsRtnMapResult.EXCEPTION.getMsg(), model);
		}
		return "module/integral/integral/integralForm";
	}
	
	/**
	* 进入到详情页
	*/
	@RequestMapping(value="/view")
	public String view(@RequestParam String id, Model model){
		try {
			if(StringUtils.isNotEmpty(id)){
				Integral integral = integralService.findById(id);
				if(integral != null){
					model.addAttribute("integral", integral);
				}else{
					setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "您查看的信息不存在！", model);
				}
			}else{
				setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "请选择需要查看的信息！", model);
			}
		} catch (Exception e) {
			setRtnCodeAndMsg(EnumsRtnMapResult.EXCEPTION.getCode(), EnumsRtnMapResult.EXCEPTION.getMsg(), model);
		}
		return "module/integral/integral/integralDetail";
	}

	/**
	* 异步分页查询
	*/
	@ResponseBody
	@RequiresPermissions("integral:query")
	@RequestMapping(value="/list")
	public PageList<Integral> list(IntegralInputDTO integral, HttpServletRequest request){
		
		PageList<Integral> pageList = new PageList<Integral>();
		
		try {
			//设置分页参数
			super.setPage(request, pageList);
		
			pageList = integralService.findByPage(pageList, integral);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pageList;
	}
	
	@ResponseBody
	@RequiresPermissions("integral:update")
	@RequestMapping(value="updateState")
	public Map<String, Object> updateState(Integral integral){

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");
		
		try{
			String state =integral.getState();
			if(!"0".equals(state)){
				List<ActivityIntegral> findByIntegralId = activityIntegralService.findByIntegralId(integral.getId());
				if(findByIntegralId!=null && findByIntegralId.size()>0){
					setRtnCodeAndMsgByFailure(rtnMap, "修改失败！");
				}else{
					Integral findById = integralService.findById(integral.getId());
					findById.setState(state);
					int update = integralService.update(findById);
					if(update == 0){
						setRtnCodeAndMsgByFailure(rtnMap, "修改失败！");
					}
				}
			}
			else{
				Integral findById = integralService.findById(integral.getId());
				findById.setState(state);
				int update = integralService.update(findById);
				if(update == 0){
					setRtnCodeAndMsgByFailure(rtnMap, "修改失败！");
				}
			}
		}catch(Exception e){
			e.printStackTrace();
			setRtnCodeAndMsgByException(rtnMap, null);
		}
		return rtnMap;
	}
	/**
	* 异步表单提交
	*/
	@ResponseBody
	@RequiresPermissions("integral:create")
	@RequestMapping(value="create")
	public Map<String, Object> insert(Integral integral){

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");
		
		try {
			Integral unique = integralService.checkNameUnique(integral.getName());
			if(unique!=null){
				setRtnCodeAndMsgByFailure(rtnMap, "保存失败,积分名称已存在！");
			}else{
				integral.setState("0");
				integral.setIsDelete(ConstantUtils.UPDATE_SET_ZERO);
				integral.setId(RandomUtils.RandomUUID());
				integral.setCreater(UserUtils.getCurrentUser().getRealname());
				integral.setCreateTime(new Date());
				integral.setModifier(UserUtils.getCurrentUser().getRealname());
				integral.setModifyTime(new Date());
				int result = integralService.insert(integral);
				if(result == 0){
					setRtnCodeAndMsgByFailure(rtnMap, "保存失败");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			setRtnCodeAndMsgByException(rtnMap, null);
		}
		return rtnMap;
	}
	
	@ResponseBody
	@RequiresPermissions("integral:update")
	@RequestMapping(value="update")
	public Map<String, Object> update(Integral integral){

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");
		
		try {
			String oldName =
					integralService.findById(integral.getId()).getName();
			if(!oldName.equals(integral.getName())){
				Integral unique = integralService.checkNameUnique(integral.getName());
				if(unique!=null){
					setRtnCodeAndMsgByFailure(rtnMap, "保存失败,积分名称已存在！");
				}else{
					integral.setModifier(UserUtils.getCurrentUser().getRealname());
					integral.setModifyTime(new Date());
					integral.setState("1");
					int result = integralService.update(integral);
					if(result == 0){
						setRtnCodeAndMsgByFailure(rtnMap, "保存失败");
					}
				}
			}else{
				integral.setModifier(UserUtils.getCurrentUser().getRealname());
				integral.setModifyTime(new Date());
				integral.setState("1");
				int result = integralService.update(integral);
				if(result == 0){
					setRtnCodeAndMsgByFailure(rtnMap, "保存失败");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			setRtnCodeAndMsgByException(rtnMap, null);
		}
		return rtnMap;
	}
	
	@ResponseBody
	@RequiresPermissions("integral:delete")
	@RequestMapping(value="delete")
	public Map<String, Object> delete(@RequestParam(required=true) String ids){
		
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "删除成功");
		
		try {
			int result = integralService.deleteByIds(ids);
			if(result == 0){
				setRtnCodeAndMsgByFailure(rtnMap, "删除失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
			setRtnCodeAndMsgByException(rtnMap, null);
		}
		return rtnMap;
	}

	/**
	 * 异步分页查询
	 */
	@ResponseBody
	@RequestMapping(value="/integrals")
	public List<Integral> integrals(IntegralInputDTO inputDTO) throws Exception{
		return integralService.findByObject(inputDTO);
	}
}
