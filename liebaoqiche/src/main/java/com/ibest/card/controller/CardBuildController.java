package com.ibest.card.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
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
import com.ibest.utils.ConstantUtils;
import com.ibest.utils.RandomUtils;
import com.ibest.card.dto.input.CardBuildInputDTO;
import com.ibest.card.entity.CardBuild;
import com.ibest.card.service.CardBuildService;
import com.ibest.card.service.CardService;

@Controller
@RequestMapping(value="${adminPath}/card/cardBuild")
public class CardBuildController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(CardBuildController.class);
	
	@Autowired
	private CardBuildService cardBuildService;
	
	@Autowired
	private CardService cardService;
	
	/**
	* 进入到列表页
	*/
	@RequestMapping(value="/")
	public String index(){
		return "module/card/cardBuild/cardBuildList";
	}
	
	/**
	* 进入到表单页-创建
	*/
	@RequestMapping(value="/add")
	public String add(){
		
		return "module/card/cardBuild/cardBuildForm";
	}
	
	/**
	* 进入到表单页，编辑
	*/
	@RequestMapping(value="/edit")
	public String edit(@RequestParam String id, Model model){
		try {
			if(StringUtils.isNotEmpty(id)){
				CardBuild cardBuild = cardBuildService.findById(id);
				if(cardBuild != null){
					model.addAttribute("cardBuild", cardBuild);
				}else{
					setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "您查看的信息不存在！", model);
				}
			}else{
				setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "请选择需要编辑的信息！", model);
			}
		} catch (Exception e) {
			setRtnCodeAndMsg(EnumsRtnMapResult.EXCEPTION.getCode(), EnumsRtnMapResult.EXCEPTION.getMsg(), model);
		}
		return "module/card/cardBuild/cardBuildForm";
	}
	
	/**
	* 进入到详情页
	*/
	@RequestMapping(value="/view")
	public String view(@RequestParam String id, Model model){
		try {
			if(StringUtils.isNotEmpty(id)){
				CardBuild cardBuild = cardBuildService.findById(id);
				if(cardBuild != null){
					model.addAttribute("cardBuild", cardBuild);
				}else{
					setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "您查看的信息不存在！", model);
				}
			}else{
				setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "请选择需要查看的信息！", model);
			}
		} catch (Exception e) {
			setRtnCodeAndMsg(EnumsRtnMapResult.EXCEPTION.getCode(), EnumsRtnMapResult.EXCEPTION.getMsg(), model);
		}
		return "module/card/cardBuild/cardBuildDetail";
	}

	/**
	 *
	 */
	@ResponseBody
	@RequestMapping(value="/cardBuilds")
	public List<CardBuild> couponTypes(CardBuildInputDTO inputDTO, HttpServletRequest request) throws Exception{
		return cardBuildService.findByObject(inputDTO);
	}

	/**
	* 异步分页查询
	*/
	@ResponseBody
	@RequiresPermissions("cardBuild:query")
	@RequestMapping(value="/list")
	public PageList<CardBuild> list(CardBuildInputDTO cardBuild, HttpServletRequest request){
		
		PageList<CardBuild> pageList = new PageList<CardBuild>();
		
		try {
			//设置分页参数
			super.setPage(request, pageList);
		
			pageList = cardBuildService.findByPage(pageList, cardBuild);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pageList;
	}
	
	/**
	* 异步表单提交
	*/
	@ResponseBody
	@RequiresPermissions("cardBuild:create")
	@RequestMapping(value="create")
	public Map<String, Object> insert(CardBuild cardBuild){

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");
		
		try {
			CardBuild unique = 
					cardBuildService.checkNameUnique(cardBuild.getName());
			if(unique!=null){
				setRtnCodeAndMsgByFailure(rtnMap, "保存失败,卡券形式已存在！");
			}else{
				cardBuild.setIsDelete(ConstantUtils.UPDATE_SET_ZERO);
				cardBuild.setId(RandomUtils.RandomUUID());
				cardBuild.setCreater(UserUtils.getCurrentUser().getRealname());
				cardBuild.setCreateTime(new Date());
				cardBuild.setModifier(UserUtils.getCurrentUser().getRealname());
				cardBuild.setModifyTime(new Date());
				int result = cardBuildService.insert(cardBuild);
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
	@RequiresPermissions("cardBuild:update")
	@RequestMapping(value="update")
	public Map<String, Object> update(CardBuild cardBuild){

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");
		
		try {
			
			String oldName=
					cardBuildService.findById(cardBuild.getId()).getName();
			if(!oldName.equals(cardBuild.getName())){
				CardBuild unique = 
						cardBuildService.checkNameUnique(cardBuild.getName());
				if(unique!=null){
					setRtnCodeAndMsgByFailure(rtnMap, "保存失败,卡券形式已存在！");
				}else{
					cardBuild.setModifier(UserUtils.getCurrentUser().getRealname());
					cardBuild.setModifyTime(new Date());
					int result = cardBuildService.update(cardBuild);
					if(result == 0){
						setRtnCodeAndMsgByFailure(rtnMap, "保存失败");
					}
				}
			}else{
				cardBuild.setModifier(UserUtils.getCurrentUser().getRealname());
				cardBuild.setModifyTime(new Date());
				int result = cardBuildService.update(cardBuild);
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
	@RequiresPermissions("cardBuild:delete")
	@RequestMapping(value="delete")
	public Map<String, Object> delete(@RequestParam(required=true) String ids){
		
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "删除成功");
		
		try {
			String[] idS = ids.split(",");
			for (String id : idS) {
				int count = cardService.queryByBuildId(id);
				if(count>0){
					setRtnCodeAndMsgByFailure(rtnMap, "选中的卡券形式已被卡券使用，不可删除!");
					return rtnMap;
				}
			}
			int result = cardBuildService.deleteByIds(ids);
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
