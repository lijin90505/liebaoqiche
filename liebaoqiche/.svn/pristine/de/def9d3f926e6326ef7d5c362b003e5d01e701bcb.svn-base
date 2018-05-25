package com.ibest.pay.controller;

import java.security.interfaces.RSAPublicKey;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONObject;
import com.ibest.framework.common.persistence.BaseController;
import com.ibest.framework.common.utils.GlobalConfig;
import com.ibest.utils.HttpRequestUtils;
import com.ibest.utils.RSAEncryptUtils;
import com.ibest.utils.TripleDesUtils;

@Controller
@RequestMapping(value="${adminPath}/pay/pay")
public class PayController extends BaseController{
		
	/**
	* 进入支付页面
	*/
	@RequestMapping(value="/")
	public String index(){
		return "module/pay/pay";
	}
	
	/**
	* 进入wxpay支付页面
	*/
	@RequestMapping(value="/wxsmpay")
	public String wxsmpay(){
		return "module/pay/wxsmpay";
	}
	/**
	 * 进入aliF2FPay支付页面
	 */
	@RequestMapping(value="/aliF2FPay")
	public String aliF2FPay(){
		return "module/pay/aliF2FPay";
	}
	/**
	 * 进入aliWapPay支付页面
	 */
	@RequestMapping(value="/aliWapPay")
	public String aliWapPay(){
		return "module/pay/aliWapPay";
	}
	/**
	 * 进入aliF2FPay支付页面
	 */
	@RequestMapping(value="/aliBarCodePay")
	public String aliBarCodePay(){
		return "module/pay/aliBarCodePay";
	}
	/**
	 * 进入aliPCpay支付页面
	 */
	@RequestMapping(value="/alismpay")
	public String alismpay(){
		return "module/pay/alismpay";
	}
	/**
	 * 进入银联支付页面
	 */
	@RequestMapping(value="/unionGatePay")
	public String unionPay(){
		return "module/pay/unionGatePay";
	}
	
	@RequestMapping(value="/wechatH5Pay")
	public String wechatH5Pay() {
		return "module/pay/wechatH5Pay";
	}
	
	@RequestMapping("/sendWechatScanPay")
	public String sendWechatScanPay(Model model) throws Exception {
		String orderId = getOrderNo();
		String userId = "3e0e2b1c8a9a4daf8ff6249ec95743b7";
		String nonceStr = buildRandom();
		
		String jsonParm = "{\"reqMap\":{\"orderId\":\""+orderId+"\",\"txnAmt\":\"10\",\"payType\":\"03\",\"outSystemId\":\"UBI\",\"deviceId\":\"01\",\"userId\":\""+userId+"\",\"nonceStr\":\""+nonceStr+"\",\"body\":\"测试\",\"spbillCreateIp\":\"192.168.100.103\"}}";
		
//		String url = "http://127.0.0.1:7707";
		String url = "http://172.24.102.61:8085/liebaoqiche_interface";
//		String url = "http://123.125.218.30:60005/liebaoqiche_interface";
		String token = userLogin();
		String rs = doJsonRequest(url+"/api/liebao/pay/consume", jsonParm, token);
		// 对返回结果进行验签并解密
		JSONObject responseMap = JSONObject.parseObject(rs);
		String rtnCode=responseMap.getString("rtnCode");
		if ("00000000".equals(rtnCode)) {
            String info=responseMap.getString("rtnInfo");
				if (StringUtils.isNotEmpty(info)) {			
					String sec=responseMap.getString("rtnSecret");
					String publicKey= GlobalConfig.getPublicKey();
					RSAPublicKey ras=RSAEncryptUtils.loadPublicKeyFromString(publicKey);
					//拿到响应数据的密钥
					String rtnSecret = RSAEncryptUtils.decrypt(ras,sec);
					//对响应数据进行解密
					String rtnInfo = TripleDesUtils.decrypt(info, rtnSecret);
					JSONObject obj = JSONObject.parseObject(rtnInfo);
					model.addAttribute("codeUrl", obj.get("codeurl"));
				}
		} else {
			System.out.println(responseMap.getString("rtnMsg"));
		}
        return "module/pay/wechatQRCode";
	}
	
	/**
	 * 微信H5支付
	 * @Title: sendWechatH5Pay  
	 * @param: @param model
	 * @author: WeiJia
	 * @throws Exception 
	 * @date:2018年3月29日 下午4:39:46
	 */
	@RequestMapping("/sendWechatH5Pay")
	public String sendWechatH5Pay(Model model,HttpServletRequest request) throws Exception {
		String orderId = getOrderNo();
		String userId = "3e0e2b1c8a9a4daf8ff6249ec95743b7";
		String nonceStr = buildRandom();
		String ip = getIpAddress(request);
		
		String token = userLogin();
		String jsonParm = "{\"reqMap\":{\"orderId\":\""+orderId+"\",\"txnAmt\":\"10\",\"payType\":\"10\",\"outSystemId\":\"UBI\",\"deviceId\":\"01\",\"userId\":\""+userId+"\",\"nonceStr\":\""+nonceStr+"\",\"body\":\"测试\",\"spbillCreateIp\":\""+ip+"\",\"sceneInfo\":\"{\"h5_info\":{\"type\":\"Wap\",\"wap_url\":\"https://pay.qq.com\",\"wap_name\": \"测试\"}}\"}}";
		String url = "http://172.24.102.61:8085/liebaoqiche_interface";
//		String url = "http://127.0.0.1:7707";
		String rs = doJsonRequest(url+"/api/liebao/pay/consume", jsonParm, token);
		// 对返回结果进行验签并解密
		JSONObject responseMap = JSONObject.parseObject(rs);
		String rtnCode=responseMap.getString("rtnCode");
		if ("00000000".equals(rtnCode)) {
            String info=responseMap.getString("rtnInfo");
				if (StringUtils.isNotEmpty(info)) {			
					String sec=responseMap.getString("rtnSecret");
					String publicKey= GlobalConfig.getPublicKey();
					RSAPublicKey ras=RSAEncryptUtils.loadPublicKeyFromString(publicKey);
					//拿到响应数据的密钥
					String rtnSecret = RSAEncryptUtils.decrypt(ras,sec);
					//对响应数据进行解密
					String rtnInfo = TripleDesUtils.decrypt(info, rtnSecret);
					JSONObject obj = JSONObject.parseObject(rtnInfo);
					model.addAttribute("codeUrl", obj.get("codeurl"));
				}
		} else {
			System.out.println(responseMap.getString("rtnMsg"));
		}
		return "module/pay/sendWechatH5Pay";
	}
	
	

	@RequestMapping("/sendUnionGatePay")
	public String sendUnionGatePay(Model model) throws Exception {
		String orderId = getOrderNo();
		String userId = "3e0e2b1c8a9a4daf8ff6249ec95743b7";
		String nonceStr = buildRandom();
		String token = userLogin();
		String jsonParm = "{\"reqMap\":{\"orderId\":\""+orderId+"\",\"txnAmt\":\"10\",\"payType\":\"00\",\"outSystemId\":\"UBI\",\"deviceId\":\"01\",\"userId\":\""+userId+"\",\"nonceStr\":\""+nonceStr+"\",\"body\":\"测试\",\"spbillCreateIp\":\"192.168.100.103\"}}";
		
		String url = "http://172.24.102.61:8085/liebaoqiche_interface";
//		String url = "http://127.0.0.1:8080";
		String rs = doJsonRequest(url+"/api/liebao/pay/consume", jsonParm, token);

		// 对返回结果进行验签并解密
		JSONObject responseMap = JSONObject.parseObject(rs);
		String rtnCode=responseMap.getString("rtnCode");
		if ("00000000".equals(rtnCode)) {
            String info=responseMap.getString("rtnInfo");
				if (StringUtils.isNotEmpty(info)) {			
					String sec=responseMap.getString("rtnSecret");
					String publicKey= GlobalConfig.getPublicKey();
					RSAPublicKey ras=RSAEncryptUtils.loadPublicKeyFromString(publicKey);
					//拿到响应数据的密钥
					String rtnSecret = RSAEncryptUtils.decrypt(ras,sec);
					//对响应数据进行解密
					String rtnInfo = TripleDesUtils.decrypt(info, rtnSecret);
					JSONObject obj = JSONObject.parseObject(rtnInfo);
					model.addAttribute("html", obj.getString("rtnInfo"));
				}
		} else {
			System.out.println(responseMap.getString("rtnMsg"));
		}
        return "module/pay/html";
	}

	@RequestMapping("/sendAliScanPay")
	public String sendAliScanPay(Model model) throws Exception {
		String orderId = getOrderNo();
		String userId = "3e0e2b1c8a9a4daf8ff6249ec95743b7";
		String nonceStr = buildRandom();
		String token = userLogin();
		String jsonParm = "{\"reqMap\":{\"orderId\":\"" + orderId
				+ "\",\"txnAmt\":\"10\",\"payType\":\"01\",\"outSystemId\":\"UBI\",\"deviceId\":\"01\",\"userId\":\""
				+ userId + "\",\"nonceStr\":\"" + nonceStr
				+ "\",\"body\":\"测试\",\"spbillCreateIp\":\"192.168.100.103\"}}";

//		String url = "http://123.125.218.30:60005/liebaoqiche_interface";
		String url = "http://172.24.102.61:8085/liebaoqiche_interface";
//		String url = "http://127.0.0.1:8080";
		String rs = doJsonRequest(url + "/api/liebao/pay/consume", jsonParm, token);
		
		// 对返回结果进行验签并解密
		JSONObject responseMap = JSONObject.parseObject(rs);
		String rtnCode=responseMap.getString("rtnCode");
		if ("00000000".equals(rtnCode)) {
            String info=responseMap.getString("rtnInfo");
				if (StringUtils.isNotEmpty(info)) {			
					String sec=responseMap.getString("rtnSecret");
					String publicKey= GlobalConfig.getPublicKey();
					RSAPublicKey ras=RSAEncryptUtils.loadPublicKeyFromString(publicKey);
					//拿到响应数据的密钥
					String rtnSecret = RSAEncryptUtils.decrypt(ras,sec);
					//对响应数据进行解密
					String rtnInfo = TripleDesUtils.decrypt(info, rtnSecret);
					JSONObject obj = JSONObject.parseObject(rtnInfo);
					model.addAttribute("html", obj.getString("rtnInfo"));
				}
		} else {
			System.out.println(responseMap.getString("rtnMsg"));
		}
        return "module/pay/html";
	}	
	
	@RequestMapping("/sendAliF2FScanPay")
	public String sendAliF2FScanPay(Model model) throws Exception {
		String orderId = getOrderNo();
		String userId = "3e0e2b1c8a9a4daf8ff6249ec95743b7";
		String nonceStr = buildRandom();
		String token = userLogin();
		String jsonParm = "{\"reqMap\":{\"orderId\":\""+orderId+"\",\"txnAmt\":\"10\",\"payType\":\"07\",\"outSystemId\":\"UBI\",\"deviceId\":\"01\",\"userId\":\""+userId+"\",\"nonceStr\":\""+nonceStr+"\",\"body\":\"测试\",\"spbillCreateIp\":\"192.168.100.103\"}}";
		
		String url = "http://172.24.102.61:8085/liebaoqiche_interface";
//		String url = "http://127.0.0.1:8080";
		String rs = doJsonRequest(url+"/api/liebao/pay/consume", jsonParm, token);
		
		// 对返回结果进行验签并解密
		JSONObject responseMap = JSONObject.parseObject(rs);
		String rtnCode=responseMap.getString("rtnCode");
		if ("00000000".equals(rtnCode)) {
            String info=responseMap.getString("rtnInfo");
				if (StringUtils.isNotEmpty(info)) {			
					String sec=responseMap.getString("rtnSecret");
					String publicKey= GlobalConfig.getPublicKey();
					RSAPublicKey ras=RSAEncryptUtils.loadPublicKeyFromString(publicKey);
					//拿到响应数据的密钥
					String rtnSecret = RSAEncryptUtils.decrypt(ras,sec);
					//对响应数据进行解密
					String rtnInfo = TripleDesUtils.decrypt(info, rtnSecret);
					JSONObject obj = JSONObject.parseObject(rtnInfo);
					model.addAttribute("html", obj.getString("rtnInfo"));
				}
		} else {
			System.out.println(responseMap.getString("rtnMsg"));
		}
        return "module/pay/aliQRCode";
	}
	
	@RequestMapping("/sendAliWapPay")
	public String sendAliWapPay(Model model) throws Exception {
		String orderId = getOrderNo();
		String userId = "3e0e2b1c8a9a4daf8ff6249ec95743b7";
		String nonceStr = buildRandom();
		String token = userLogin();
		String jsonParm = "{\"reqMap\":{\"orderId\":\""+orderId+"\",\"txnAmt\":\"10\",\"payType\":\"06\",\"outSystemId\":\"UBI\",\"deviceId\":\"03\",\"userId\":\""+userId+"\",\"nonceStr\":\""+nonceStr+"\",\"body\":\"测试\",\"spbillCreateIp\":\"192.168.100.103\"}}";
		
		String url = "http://172.24.102.61:8085/liebaoqiche_interface";
//		String url = "http://127.0.0.1:8080";
		String rs = doJsonRequest(url+"/api/liebao/pay/consume", jsonParm, token);

		// 对返回结果进行验签并解密
		JSONObject responseMap = JSONObject.parseObject(rs);
		String rtnCode=responseMap.getString("rtnCode");
		if ("00000000".equals(rtnCode)) {
            String info=responseMap.getString("rtnInfo");
				if (StringUtils.isNotEmpty(info)) {			
					String sec=responseMap.getString("rtnSecret");
					String publicKey= GlobalConfig.getPublicKey();
					RSAPublicKey ras=RSAEncryptUtils.loadPublicKeyFromString(publicKey);
					//拿到响应数据的密钥
					String rtnSecret = RSAEncryptUtils.decrypt(ras,sec);
					//对响应数据进行解密
					String rtnInfo = TripleDesUtils.decrypt(info, rtnSecret);
					JSONObject obj = JSONObject.parseObject(rtnInfo);
					model.addAttribute("html", obj.getString("rtnInfo"));
				}
		} else {
			System.out.println(responseMap.getString("rtnMsg"));
		}
        return "module/pay/html";
	}
	
	@RequestMapping("/sendAliBarCodePay")
	public String sendAliBarCodePay(String authCode , Model model) throws Exception {
		String orderId = getOrderNo();
		String userId = "3e0e2b1c8a9a4daf8ff6249ec95743b7";
		String nonceStr = buildRandom();
		String token = userLogin();
		String jsonParm = "{\"reqMap\":{\"orderId\":\""+orderId+"\",\"txnAmt\":\"10\",\"payType\":\"02\",\"outSystemId\":\"UBI\",\"deviceId\":\"03\",\"userId\":\""+userId+"\",\"authCode\":\""+ authCode + "\",\"nonceStr\":\""+nonceStr+"\",\"body\":\"测试\",\"spbillCreateIp\":\"192.168.100.103\"}}";
		
		String url = "http://172.24.102.61:8085/liebaoqiche_interface";
//		String url = "http://127.0.0.1:8080";
		String rs = doJsonRequest(url+"/api/liebao/pay/consume", jsonParm, token);
		System.out.println(rs);
		return "module/pay/aliBarCodePay";
	}
	
	private static String getOrderNo() {
		String order = new SimpleDateFormat("yyyyMMdd").format(new Date());
		Random r = new Random();
		for (int i = 0; i < 20; i++) {
			order += r.nextInt(9);
		}
		return order;
	}
	
	private static String getCurrTime() {
		Date now = new Date();
		SimpleDateFormat outFormat = new SimpleDateFormat("yyyyMMddHHmmss");
		String s = outFormat.format(now);
		return s;
	}
	private static String buildRandom() {
		String currTime = getCurrTime();
		String strTime = currTime.substring(8, currTime.length());
		int num = 1;
		double random = Math.random();
		if (random < 0.1) {
			random = random + 0.1;
		}
		for (int i = 0; i < 4; i++) {
			num = num * 10;
		}
		return (int) ((random * num)) + strTime;
	}
	
	public static String getIpAddress(HttpServletRequest request) {  
	    String ip = request.getHeader("x-forwarded-for");  
	    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	        ip = request.getHeader("Proxy-Client-IP");  
	    }  
	    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	        ip = request.getHeader("WL-Proxy-Client-IP");  
	    }  
	    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	        ip = request.getHeader("HTTP_CLIENT_IP");  
	    }  
	    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	        ip = request.getHeader("HTTP_X_FORWARDED_FOR");  
	    }  
	    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	        ip = request.getRemoteAddr();  
	    }
	    System.out.println("真实IP："+ip);
	    return ip;  
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
//		String requestUrl = "http://123.125.218.30:60005/liebaoqiche_interface/api/liebao/user/login";
		String requestUrl = "http://172.24.102.61:8085/liebaoqiche_interface/api/liebao/user/login";
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
					JSONObject js = JSONObject.parseObject(rtnInfo);
					token = js.getString("token");
					System.out.println("token："+token);
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
