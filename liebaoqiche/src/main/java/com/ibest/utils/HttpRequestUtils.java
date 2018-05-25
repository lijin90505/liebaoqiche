package com.ibest.utils;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicHeader;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EntityUtils;

public class HttpRequestUtils {

	/**
	 * 发送Json请求
	 * @param url
	 * @param jsonParams
	 * @return
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
            httpPost.setHeader(HTTP.CONTENT_TYPE, "application/json");
			if(StringUtils.isNotEmpty(userToken)){
				httpPost.addHeader("userToken", userToken);
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
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 发送普通表单请求
	 * @param url
	 * @param reqParams
	 * @return
	 */
	public static String doPostRequest(String url, Map<String, String> reqParams){
		CloseableHttpClient httpClient = null;
		HttpPost httpPost = null;
		String result = null;
		try {
			// 获取对象
			httpClient = HttpClients.createDefault();
			httpPost = new HttpPost(url);
			
			// 解析参数
			List<NameValuePair> params = new ArrayList<NameValuePair>();
			
			if(reqParams.keySet().size() > 0){
				for(String paramKey: reqParams.keySet()){
					params.add(new BasicNameValuePair(paramKey, reqParams.get(paramKey)));
				}
				UrlEncodedFormEntity entity = new UrlEncodedFormEntity(params, "UTF-8");
				httpPost.setEntity(entity);
			}
			
			// 发送请求
			HttpResponse response = httpClient.execute(httpPost);
			if(response.getStatusLine().getStatusCode() == 200){
				HttpEntity he = response.getEntity();
				return EntityUtils.toString(he, "utf-8");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
}
