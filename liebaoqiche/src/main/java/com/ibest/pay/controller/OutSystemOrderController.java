package com.ibest.pay.controller;

import java.io.File;
import java.io.InputStream;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
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
import com.ibest.framework.common.utils.ExcelUtils;
import com.ibest.framework.common.utils.PageList;
import com.ibest.pay.dto.input.OutSystemOrderInputDTO;
import com.ibest.pay.entity.OutSystemOrder;
import com.ibest.pay.enums.EnumsAccessSystem;
import com.ibest.pay.enums.EnumsDevice;
import com.ibest.pay.enums.EnumsOrderStatus;
import com.ibest.pay.enums.EnumsPayType;
import com.ibest.pay.service.OutSystemOrderService;

@Controller
@RequestMapping(value="${adminPath}/pay/outSystemOrder")
public class OutSystemOrderController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(OutSystemOrderController.class);
	
	private static final String TEMPLATE_EXPORT = "outSystemOrderExportTemplate.xlsx";
	
	@Autowired
	private OutSystemOrderService outSystemOrderService;
	
	/**
	* 进入到列表页
	*/
	@RequestMapping(value="/")
	public String index(){
		return "module/pay/outSystemOrder/outSystemOrderList";
	}
	
	/**
	* 进入到表单页-创建
	*/
	@RequestMapping(value="/add")
	public String add(){
		
		return "module/pay/outSystemOrder/outSystemOrderForm";
	}
	
	/**
	* 进入到表单页，编辑
	*/
	@RequestMapping(value="/edit")
	public String edit(@RequestParam String id, Model model){
		try {
			if(StringUtils.isNotEmpty(id)){
				OutSystemOrder outSystemOrder = outSystemOrderService.findById(id);
				if(outSystemOrder != null){
					model.addAttribute("outSystemOrder", outSystemOrder);
				}else{
					setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "您查看的信息不存在！", model);
				}
			}else{
				setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "请选择需要编辑的信息！", model);
			}
		} catch (Exception e) {
			setRtnCodeAndMsg(EnumsRtnMapResult.EXCEPTION.getCode(), EnumsRtnMapResult.EXCEPTION.getMsg(), model);
		}
		return "module/pay/outSystemOrder/outSystemOrderForm";
	}
	
	/**
	* 进入到详情页
	*/
	@RequestMapping(value="/view")
	public String view(@RequestParam String id, Model model){
		try {
			if(StringUtils.isNotEmpty(id)){
				OutSystemOrder outSystemOrder = outSystemOrderService.findById(id);
				if(outSystemOrder != null){
					model.addAttribute("outSystemOrder", outSystemOrder);
				}else{
					setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "您查看的信息不存在！", model);
				}
			}else{
				setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "请选择需要查看的信息！", model);
			}
		} catch (Exception e) {
			setRtnCodeAndMsg(EnumsRtnMapResult.EXCEPTION.getCode(), EnumsRtnMapResult.EXCEPTION.getMsg(), model);
		}
		return "module/pay/outSystemOrder/outSystemOrderDetail";
	}

	/**
	* 异步分页查询
	*/
	@ResponseBody
	@RequiresPermissions("outSystemOrder:query")
	@RequestMapping(value="/list")
	public PageList<OutSystemOrder> list(OutSystemOrderInputDTO outSystemOrder, HttpServletRequest request){
		
		PageList<OutSystemOrder> pageList = new PageList<OutSystemOrder>();
		
		try {
			//设置分页参数
			super.setPage(request, pageList);
		
			pageList = outSystemOrderService.findByPage(pageList, outSystemOrder);
			
			List<OutSystemOrder> osList = pageList.getRows();
			List<OutSystemOrder> list = new ArrayList<OutSystemOrder>();
			if(osList!=null && osList.size()>0) {
				for (OutSystemOrder info : osList) {
					//支付类型
					if(info.getPayType()!=null) {
						info.setPayType(EnumsPayType.getDesc(info.getPayType()));
					}
					
					if(info.getDeviceId()!=null) {
						info.setDeviceId(EnumsDevice.getDesc(info.getDeviceId()));
					}
					//订单状态
					if(info.getOrderStatus()!=null) {
						info.setOrderStatus(EnumsOrderStatus.getDesc(info.getOrderStatus()));
					}
					info.setAmount(changeF2Y(info.getAmount())+"元");
					list.add(info);
				}
			}
			pageList.setRows(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pageList;
	}
	
	/**
	* 异步表单提交
	*/
	@ResponseBody
	@RequiresPermissions("outSystemOrder:create")
	@RequestMapping(value="create")
	public Map<String, Object> insert(OutSystemOrder outSystemOrder){

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");
		
		try {
			int result = outSystemOrderService.insert(outSystemOrder);
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
	@RequiresPermissions("outSystemOrder:update")
	@RequestMapping(value="update")
	public Map<String, Object> update(OutSystemOrder outSystemOrder){

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");
		
		try {
			int result = outSystemOrderService.update(outSystemOrder);
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
	@RequiresPermissions("outSystemOrder:delete")
	@RequestMapping(value="delete")
	public Map<String, Object> delete(@RequestParam(required=true) String ids){
		
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "删除成功");
		
		try {
			int result = outSystemOrderService.deleteByIds(ids);
			if(result == 0){
				setRtnCodeAndMsgByFailure(rtnMap, "删除失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
			setRtnCodeAndMsgByException(rtnMap, null);
		}
		return rtnMap;
	}
	
	@ResponseBody
	@RequestMapping(value = "exportoOutSystemOrder")
	@RequiresPermissions("outSystemOrder:exportoOutSystemOrder")
	public String exportPayInfo(HttpServletResponse response,HttpSession session,OutSystemOrderInputDTO outSystemOrder) {
		try {
			List<OutSystemOrder> details = outSystemOrderService.findByList(outSystemOrder);
			String rootPath = session.getServletContext().getRealPath("/");
			File file = new File(rootPath+"resources"+File.separator + "template" + File.separator + TEMPLATE_EXPORT);
			InputStream is = FileUtils.openInputStream(file);
			//创建workbook对象
			Workbook wb = ExcelUtils.creteWorkbook(TEMPLATE_EXPORT, is);
			Sheet sheet=wb.getSheetAt(0);
			Row rootRow = sheet.getRow(1);
			if(details != null){
				for (int j = 0; j < details.size(); j++) {
					Row row = getRow(rootRow,j+2,sheet,25);
					createCell(row, rootRow, 8);
					OutSystemOrder info = details.get(j);
					row.getCell(0).setCellValue(info.getOrderId());//订单号
					row.getCell(1).setCellValue(changeF2Y(info.getAmount())+"元");//订单金额
					
					//支付类型
					if(info.getPayType()!=null) {
						row.getCell(2).setCellValue(EnumsPayType.getDesc(info.getPayType()));
					}
					//接入系统 
					row.getCell(3).setCellValue(EnumsAccessSystem.getDesc(info.getOutSystemId())); 
					if(info.getDeviceId()!=null) {
						//设备类型
						row.getCell(4).setCellValue(EnumsDevice.getDesc(info.getDeviceId())); 
					}
					//订单状态
					if(info.getOrderStatus()!=null) {
						row.getCell(5).setCellValue(EnumsOrderStatus.getDesc(info.getOrderStatus()));
					}
					//订单支付时间
					row.getCell(6).setCellValue(info.getOrderPayTime());
					//用户id
					row.getCell(7).setCellValue(info.getUserid());
				}
			}

			if (wb != null) {
				// 得到文件的扩展名
				String type = "TEMPLATE_EXPORT.xlsx".substring("TEMPLATE_EXPORT.xlsx".lastIndexOf("."));
				String fileName = new String(("接入系统订单流水信息").getBytes("utf-8"),"iso-8859-1")
						+ (StringUtils.isNotEmpty(type) ? type : ".xls");
				response.setHeader("Content-Disposition", "attachment;filename=" + fileName);
				response.setContentType("application/vnd.ms-excel");
				// 获取文件输出流
				ServletOutputStream out = response.getOutputStream();
				// 将文件内容写入
				wb.write(out);
				out.flush();
				out.close();
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			e.printStackTrace();
		}
		return null;
	}
	
	public Row getRow(Row rootRow,int rowIndex,Sheet sheet,int height){
		Row row = sheet.getRow(rowIndex);
		if(row == null){
			row = sheet.createRow(rowIndex);
		}
		row.setRowStyle(rootRow.getRowStyle());
		row.setHeightInPoints(height);
		return row;
	}

	public void createCell(Row row,Row rootRow,int column){
		for (int i = 0; i < column; i++) {
			Cell cell = row.getCell(i);
			if(cell == null){
				cell = row.createCell(i);
			}
			if(i == column-1){
				cell.setCellStyle(rootRow.getCell(7).getCellStyle());
			}else{
				cell.setCellStyle(rootRow.getCell(0).getCellStyle());
			}
		}
	}
	
	/**
	 * 分转元
	 * @Title: changeF2Y  
	 * @param: @param amount
	 * @param: @throws Exception
	 * @return:String
	 * @author: WeiJia
	 * @date:2018年4月27日 上午9:30:16
	 */
	public static String changeF2Y(String amount) throws Exception{    
        return BigDecimal.valueOf(Long.valueOf(amount)).divide(new BigDecimal(100)).toString();    
    }   
}
