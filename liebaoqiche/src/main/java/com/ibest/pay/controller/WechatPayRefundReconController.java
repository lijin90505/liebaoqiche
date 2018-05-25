package com.ibest.pay.controller;

import java.math.BigDecimal;
import java.security.interfaces.RSAPublicKey;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.http.HttpResponse;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicHeader;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EntityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.ibest.framework.common.enums.EnumsRtnMapResult;
import com.ibest.framework.common.persistence.BaseController;
import com.ibest.framework.common.utils.GlobalConfig;
import com.ibest.framework.common.utils.PageList;
import com.ibest.pay.ReconChannelEnum;
import com.ibest.pay.dto.input.WechatPayRefundReconInputDTO;
import com.ibest.pay.entity.WechatPayRefundRecon;
import com.ibest.pay.enums.EnumsBillType;
import com.ibest.pay.enums.EnumsOrderStatus;
import com.ibest.pay.enums.EnumsReconChannel;
import com.ibest.pay.enums.EnumsReconState;
import com.ibest.pay.enums.EnumsRefundState;
import com.ibest.pay.enums.EnumsRefundType;
import com.ibest.pay.service.WechatPayRefundReconService;
import com.ibest.utils.HttpRequestUtils;
import com.ibest.utils.RSAEncryptUtils;
import com.ibest.utils.TripleDesUtils;

/**
 * 支付退款对账
 * @ClassName: WechatPayRefundReconController 
 * @author: WeiJia  
 * @date: 2018年4月3日下午4:06:15
 */
@Controller
@RequestMapping(value="${adminPath}/pay/wechatPayRefundRecon")
public class WechatPayRefundReconController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(WechatPayRefundReconController.class);
	
	@Autowired
	private WechatPayRefundReconService wechatPayRefundReconService;
	
	/**
	* 进入到列表页
	*/
	@RequestMapping(value="/")
	public String index(){
		return "module/pay/wechatPayRefundRecon/wechatPayRefundReconList";
	}
	
	/**
	* 进入到表单页-创建
	*/
	@RequestMapping(value="/add")
	public String add(){
		
		return "module/pay/wechatPayRefundRecon/wechatPayRefundReconForm";
	}
	
	/**
	* 进入到表单页，编辑
	*/
	@RequestMapping(value="/edit")
	public String edit(@RequestParam String id, Model model){
		try {
			if(StringUtils.isNotEmpty(id)){
				WechatPayRefundRecon wechatPayRefundRecon = wechatPayRefundReconService.findById(id);
				if(wechatPayRefundRecon != null){
					model.addAttribute("wechatPayRefundRecon", wechatPayRefundRecon);
				}else{
					setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "您查看的信息不存在！", model);
				}
			}else{
				setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "请选择需要编辑的信息！", model);
			}
		} catch (Exception e) {
			setRtnCodeAndMsg(EnumsRtnMapResult.EXCEPTION.getCode(), EnumsRtnMapResult.EXCEPTION.getMsg(), model);
		}
		return "module/pay/wechatPayRefundRecon/wechatPayRefundReconForm";
	}
	
	/**
	* 进入到详情页
	*/
	@RequestMapping(value="/view")
	public String view(@RequestParam String id, Model model){
		try {
			if(StringUtils.isNotEmpty(id)){
				WechatPayRefundRecon wechatPayRefundRecon = wechatPayRefundReconService.findById(id);
				if(wechatPayRefundRecon != null){
					model.addAttribute("wechatPayRefundRecon", wechatPayRefundRecon);
				}else{
					setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "您查看的信息不存在！", model);
				}
			}else{
				setRtnCodeAndMsg(EnumsRtnMapResult.FAILURE.getCode(), "请选择需要查看的信息！", model);
			}
		} catch (Exception e) {
			setRtnCodeAndMsg(EnumsRtnMapResult.EXCEPTION.getCode(), EnumsRtnMapResult.EXCEPTION.getMsg(), model);
		}
		return "module/pay/wechatPayRefundRecon/wechatPayRefundReconDetail";
	}

	/**
	* 异步分页查询
	*/
	@ResponseBody
	@RequiresPermissions("wechatPayRefundRecon:query")
	@RequestMapping(value="/list")
	public PageList<WechatPayRefundRecon> list(WechatPayRefundReconInputDTO wechatPayRefundRecon, HttpServletRequest request){
		
		PageList<WechatPayRefundRecon> pageList = new PageList<WechatPayRefundRecon>();
		
		try {
			//设置分页参数
			super.setPage(request, pageList);
			pageList = wechatPayRefundReconService.findByPage(pageList, wechatPayRefundRecon);
			
			List<WechatPayRefundRecon> reconList = pageList.getRows();
			List<WechatPayRefundRecon> list = new ArrayList<WechatPayRefundRecon>();
			if(reconList!=null && reconList.size()>0) {
				for (WechatPayRefundRecon wpr : reconList) {
					
					if(wpr.getReconChannel()!=null) {
						wpr.setReconChannel(EnumsReconChannel.getDesc(wpr.getReconChannel()));
					}
					
					if(wpr.getBillType()!=null) {
						wpr.setBillType(EnumsBillType.getDesc(wpr.getBillType()));
					}
					
					if(wpr.getTradeState()!=null) {
						wpr.setTradeState(EnumsOrderStatus.getDesc(wpr.getTradeState()));
					}
					
					if(wpr.getFeeType().equals("CNY")) {
						wpr.setFeeType("人民币");
					}
					
					if(wpr.getReconState()!=null) {
						wpr.setReconState(EnumsReconState.getDesc(wpr.getReconState()));
					}
					
					if(wpr.getRefundType()!=null) {
						wpr.setRefundType(EnumsRefundType.getDesc(wpr.getRefundType()));
					}
					
					if(wpr.getRefundState()!=null) {
						wpr.setRefundState(EnumsRefundState.getDesc(wpr.getRefundState()));
					}
					
					if(wpr.getBankType().equals("LQT")) {
						wpr.setBankType("零钱通");
					}else if(wpr.getBankType().equals("CFT")) {
						wpr.setBankType("零钱");
					}else {
						wpr.setBankType("银行卡");
					}
					wpr.setRefundAmount(changeF2Y(wpr.getRefundAmount())+"元");
					list.add(wpr);
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
	@RequiresPermissions("wechatPayRefundRecon:create")
	@RequestMapping(value="create")
	public Map<String, Object> insert(WechatPayRefundRecon wechatPayRefundRecon){

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");
		
		try {
			int result = wechatPayRefundReconService.insert(wechatPayRefundRecon);
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
	@RequiresPermissions("wechatPayRefundRecon:update")
	@RequestMapping(value="update")
	public Map<String, Object> update(WechatPayRefundRecon wechatPayRefundRecon){

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "保存成功");
		
		try {
			int result = wechatPayRefundReconService.update(wechatPayRefundRecon);
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
	@RequiresPermissions("wechatPayRefundRecon:delete")
	@RequestMapping(value="delete")
	public Map<String, Object> delete(@RequestParam(required=true) String ids){
		
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		setRtnCodeAndMsgBySuccess(rtnMap, "删除成功");
		
		try {
			int result = wechatPayRefundReconService.deleteByIds(ids);
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
	@RequiresPermissions("wechatPayRefundRecon:downloadRecon")
	@RequestMapping(value="downloadRecon")
	public Map<String, Object> downloadRecon(String reconChannel,String billType,String billDate) throws Exception{
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		// 获取支付方式
		ReconChannelEnum rce = ReconChannelEnum.getReconChannel(new Integer(reconChannel));
		switch (rce) {
			case WECHATPAY:
				logger.info("进入微信退款对账...");
				billType="REFUND";
//				String url = "http://localhost:7707/liebaoqiche_interface";
				String url = "http://172.24.102.61:8085/liebaoqiche_interface";
//				String url = "http://123.125.218.30:60005/liebaoqiche_interface";
				String payRecon = "02";
				String jsonParam = "{\"reqMap\":{\"billDate\":\""+billDate.replaceAll("-", "")+"\",\"payRecon\":\""+payRecon+"\",\"billType\":\""+billType+"\"}}";
				String rs = doJsonRequest(url+"/api/liebao/pay/payRecon", jsonParam, "");
				JSONObject obj = JSONObject.parseObject(rs);
				JSONObject jo = obj.getJSONObject("rtnInfo");
				boolean flag = jo.getBooleanValue("success");
				if(!flag) {
					setRtnCodeAndMsgByFailure(rtnMap, jo.getString("message"));
				}else {
					setRtnCodeAndMsgBySuccess(rtnMap, "操作成功");
				}
				System.out.println(rs);
				return rtnMap;
			case AILPAY:
				logger.info("进入支付宝退款对账...");
				String payRecon1 = "01";
				String aliJsonParam = "{\"reqMap\":{\"billDate\":\""+billDate.replaceAll("-", "")+"\",\"payRecon\":\""+payRecon1+"\",\"billType\":\""+billType+"\"}}";
				String url1 = "http://localhost:8080/liebaoqiche_interface";
				String rs1 = doJsonRequest(url1+"/api/liebao/pay/payRecon", aliJsonParam, "");
				JSONObject json1 = JSONObject.parseObject(rs1);
				String returnCode1 = json1.getString("result");
				return rtnMap;
			case UNIONPAY:	
				logger.info("进入银联退款对账...");
				
				String payRecon2 = "01";
				String unJsonParam = "{\"reqMap\":{\"billDate\":\""+billDate.replaceAll("-", "")+"\",\"payRecon\":\""+payRecon2+"\",\"billType\":\""+billType+"\"}}";
				String url2 = "http://localhost:8080/liebaoqiche_interface";
				String rs2 = doJsonRequest(url2+"/api/liebao/pay/payRecon", unJsonParam, "");
				
				JSONObject json2 = JSONObject.parseObject(rs2);
				String returnCode2 = json2.getString("result");
				return rtnMap;
			default:
				break;
		}
		return rtnMap;
	}
	
	
	/**
	 * 分转元
	 * @Title: changeF2Y  
	 * @param: @param amount
	 * @param: @throws Exception
	 * @date:2018年4月27日 上午9:30:16
	 */
	public static String changeF2Y(String amount) throws Exception{    
        return BigDecimal.valueOf(Long.valueOf(amount)).divide(new BigDecimal(100)).toString();    
    }
	
	public static String userLogin() throws Exception {
		String token = "";
		// 生成请求数据
		Map<String, String> params = new HashMap<String, String>();
		params.put("username", "seven");
		params.put("password", "123456");
		params.put("outSystemId", "UBI");
		params.put("deviceId", "01");
		
		//对请求数据进行加密,请求时请用公钥
		String secret = TripleDesUtils.getSecretKey();
		String requestParams = JSONObject.toJSONString(params);
		String publicKey= GlobalConfig.getPublicKey();
		String reqSecret = RSAEncryptUtils.encrypt(RSAEncryptUtils.loadPublicKeyFromString(publicKey),secret);
		//对请求参数进行加密处理
		String reqInfo = TripleDesUtils.encrypt(requestParams, secret);

		// 发送请求数据
		Map<String, String> jsonRequestParams = new HashMap<String, String>();
		jsonRequestParams.put("reqInfo", reqInfo);
		jsonRequestParams.put("reqSecret", reqSecret);
		String requestUrl = "http://123.125.218.30:60005/liebaoqiche_interface/api/liebao/user/login";
//		String requestUrl = "http://localhost:7707/liebaoqiche_interface/api/liebao/user/login";
		System.err.println(jsonRequestParams.toString());
		String requestResult = HttpRequestUtils.doJsonRequest(requestUrl,JSONObject.toJSONString(jsonRequestParams), "");
		
		// 对返回结果进行验签并解密
		JSONObject responseMap = JSONObject.parseObject(requestResult);
		String rtnCode=responseMap.getString("rtnCode");
		if ("00000000".equals(rtnCode)) {
            String info=responseMap.getString("rtnInfo");
				if (StringUtils.isNotEmpty(info)) {			
					String sec=responseMap.getString("rtnSecret");
					RSAPublicKey ras=RSAEncryptUtils.loadPublicKeyFromString(publicKey);
					//拿到响应数据的密钥
					String rtnSecret = RSAEncryptUtils.decrypt(ras,sec);
					//对响应数据进行解密
					String rtnInfo = TripleDesUtils.decrypt(info, rtnSecret);
					System.out.println("解密后响应数据："+rtnInfo);
				}

		} else {
			System.out.println(responseMap.getString("rtnMsg"));
		}
		return token;
	}
	
	
	/**
	 * 发送json请求
	 * @Title: doJsonRequest  
	 * @param: @param url
	 * @param: @param jsonParams
	 * @param: @param userToken
	 * @author: WeiJia
	 * @date:2018年5月14日 下午4:04:51
	 */
	public static String doJsonRequest(String url, String jsonParams, String userToken){
		
		CloseableHttpClient httpClient = null;
		HttpPost httpPost = null;
		String result = null;
		
		try {
			// 获取对象
			httpClient = HttpClients.createDefault();
			RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(50000).setConnectTimeout(50000).build();
			
			httpPost = new HttpPost(url); 
			httpPost.setConfig(requestConfig);  
			// 设置请求内容为Json结构
			httpPost.addHeader(HTTP.CONTENT_TYPE, "application/json");  
            httpPost.addHeader(HTTP.CONTENT_TYPE, "text/json"); 
            if(!StringUtils.isEmpty(userToken)) {//此步是往header中添加token值
            	httpPost.addHeader("Authorization", "Bearer "+userToken);
            }
			
			// 设置参数  
			StringEntity se = new StringEntity(jsonParams,"UTF-8");
			se.setContentType(new BasicHeader(HTTP.CONTENT_TYPE, "application/json"));
			
			httpPost.setEntity(se);
			
			// 发送请求
			HttpResponse response = httpClient.execute(httpPost);
			System.out.println(response.getStatusLine().getStatusCode());
			if(response.getStatusLine().getStatusCode() == 200){
				result = EntityUtils.toString( response.getEntity(), "utf-8");
			}else if(response.getStatusLine().getStatusCode() == 302){
				response.getLastHeader("Location").getValue();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
