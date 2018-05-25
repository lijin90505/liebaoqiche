package com.ibest.utils;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Random;
import java.util.UUID;

public class RandomUtils {

	/**
	 * 生成32位随机数
	 */
	public static String RandomUUID() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
	
	/**
	 * 生成数随机验证码(默认长度6位，最短4位)
	 * 
	 * @return
	 */
	public static String generateVerifyCode(Integer length) {
		if (length == null)
			length = 6;
		else if (length < 4)
			length = 4;

		Integer code = new Random().nextInt((int) Math.pow(10, length));
		if (code == null || code.toString().length() != length) {
			return generateVerifyCode(length);
		}
		return code.toString();
	}
	
	/**
	 * 生成卡券码(默认长度6位，最短4位)
	 * 
	 * @return
	 */
	public static String getCardNo() {
		DateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		Calendar calendar = Calendar.getInstance();
		String dateName = df.format(calendar.getTime())+generateVerifyCode(6);
		return dateName;
	}

	public static void main(String[] args) {
		
	}

}
