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
import com.ibest.card.dto.input.CardGetInputDTO;
import com.ibest.card.entity.CardGet;
import com.ibest.card.service.CardGetService;
import com.ibest.card.service.CardService;

@Controller
@RequestMapping(value="${adminPath}/card/cardGet")
public class CardGetController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(CardGetController.class);
	
	@Autowired
	private CardGetService cardGetService;
	
	@Autowired
	private CardService cardService;
	
	/**
	* 进入到列表页
	*/
	@RequestMapping(value="/")
	public String index(){
		return "module/card/cardGet/cardGetList";
	}
	
	/**
	* 进入到表单页-创建
	*/
	@RequestMapping(value="/add")
	public String add(){
		
		return "module/card/cardGet/cardGetForm";
	}
	
	/**
	* 进入到表单页，编辑
	*/
	@RequestMapping(value="/edit")
	public String edit(@RequestParam String id, Model model){
		try {
			if(StringUtils.isNotEmpty(id)){
				CardGet cardGet = cardGetService.findById(id);
				if(cardGet != null){
					model.addAttribute("cardGet", cardGet);
				}else{
					setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "您查看的信息不存在！", model);
				}
			}else{
				setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "请选择需要编辑的信息！", model);
			}
		} catch (Exception e) {
			setRtnCodeAndMsg(EnumsRtnMapResult.EXCEPTION.getCode(), EnumsRtnMapResult.EXCEPTION.getMsg(), model);
		}
		return "module/card/cardGet/cardGetForm";
	}
	
	/**
	* 进入到详情页
	*/
	@RequestMapping(value="/view")
	public String view(@RequestParam String id, Model model){
		try {
			if(StringUtils.isNotEmpty(id)){
				CardGet cardGet = cardGetService.findById(id);
				if(cardGet != null){
					model.addAttribute("cardGet", cardGet);
				}else{
					setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "您查看的信息不存在！", model);
				}
			}else{
				setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "请选择需要查看的信息！", model);
			}
		} catch (Exception e) {
			setRtnCodeAndMsg(EnumsRtnMapResult.EXCEPTION.getCode(), EnumsRtnMapResult.EXCEPTION.getMsg(), model);
		}
		return "module/card/cardGet/cardGetDetail";
	}

	/**
	 *
	 */
	@ResponseBody
	@RequestMapping(value="/cardGets")
	public List<CardGet> couponGetTypes(CardGetInputDTO inputDTO, HttpServletRequest request) throws Exception{
		return cardGetService.findByObject(inputDTO);
	}

	/**
	* 异步分页查询
	*/
	@ResponseBody
	@RequiresPermissions("cardGet:query")
	@RequestMapping(value="/list")
	public PageList<CardGet> list(CardGetInputDTO cardGet, HttpServletRequest request){
		
		PageList<CardGet> pageList = new PageList<CardGet>();
		
		try {
			//设置分页参数
			super.setPage(request, pageList);
		
			pageList = cardGetService.findByPage(pageList, cardGet);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pageList;
	}
	
	/**
	* 异步表单提交
	*/
	@ResponseBody
	@RequiresPermissions("cardGet:create")
	@RequestMapping(value="create")
	public Map<String, Object> insert(CardGet cardGet){

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");
		
		try {
			
			CardGet unique = cardGetService.checkNameUnique(cardGet.getName());
			if(unique!=null){
				setRtnCodeAndMsgByFailure(rtnMap, "保存失败,领取形式已存在！");
			}else{
				cardGet.setIsDelete(ConstantUtils.UPDATE_SET_ZERO);
				cardGet.setId(RandomUtils.RandomUUID());
				cardGet.setCreater(UserUtils.getCurrentUser().getRealname());
				cardGet.setCreateTime(new Date());
				cardGet.setModifier(UserUtils.getCurrentUser().getRealname());
				cardGet.setModifyTime(new Date());
				int result = cardGetService.insert(cardGet);
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
	@RequiresPermissions("cardGet:update")
	@RequestMapping(value="update")
	public Map<String, Object> update(CardGet cardGet){

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");
		
		try {
			String oldName =
					cardGetService.findById(cardGet.getId()).getName();
			if(!oldName.equals(cardGet.getName())){
				CardGet unique = cardGetService.checkNameUnique(cardGet.getName());
				if(unique!=null){
					setRtnCodeAndMsgByFailure(rtnMap, "保存失败,领取形式已存在！");
				}else{
					cardGet.setModifier(UserUtils.getCurrentUser().getRealname());
					cardGet.setModifyTime(new Date());
					int result = cardGetService.update(cardGet);
					if(result == 0){
						setRtnCodeAndMsgByFailure(rtnMap, "保存失败");
					}
				}
			}else{
				cardGet.setModifier(UserUtils.getCurrentUser().getRealname());
				cardGet.setModifyTime(new Date());
				int result = cardGetService.update(cardGet);
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
	@RequiresPermissions("cardGet:delete")
	@RequestMapping(value="delete")
	public Map<String, Object> delete(@RequestParam(required=true) String ids){
		
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "删除成功");
		
		try {
			String[] idS = ids.split(",");
			for (String id : idS) {
				int count = cardService.queryByGetId(id);
				if(count>0){
					setRtnCodeAndMsgByFailure(rtnMap, "选中的卡券领取形式已被卡券使用，不可删除!");
					return rtnMap;
				}
			}
			int result = cardGetService.deleteByIds(ids);
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
