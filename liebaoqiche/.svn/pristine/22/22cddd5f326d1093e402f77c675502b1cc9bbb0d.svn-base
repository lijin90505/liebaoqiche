package com.ibest.utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
	
	private static final String PATTERN_YYYY_MM_DD = "yyyy/MM/dd";
	private static final String PATTERN_YYYYMMDDKKMMSS = "yyyyMMddkkmmss";
	
	/**
	 * 格式化日期
	 * 
	 * @return
	 */
	public static Date parseDate(String date,String pattern) {
		DateFormat fmt = new SimpleDateFormat(pattern);
		try {
			return fmt.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * 格式化日期
	 * 
	 * @return
	 */
	public static Date parseDate(String date) {
		try {
			return new SimpleDateFormat(PATTERN_YYYY_MM_DD).parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * 格式化日期
	 * 
	 * @return
	 */
	public static String formatDate(Date date) {
		return new SimpleDateFormat(PATTERN_YYYY_MM_DD).format(date);
	}

	/**
	 * 格式化日期
	 * 
	 * @return
	 */
	public static String formatDate(Date date,String pattern) {
		return new SimpleDateFormat(pattern).format(date);
	}
	
	public static String getCurrentTime() {
		return new SimpleDateFormat(PATTERN_YYYYMMDDKKMMSS).format(new Date());
	}
	
	public static String getCurrentTime(Date date) {
		return new SimpleDateFormat(PATTERN_YYYYMMDDKKMMSS).format(date);
	}
	
	public static String getCurrentTime(Date date,String pattern){
		return new SimpleDateFormat(pattern).format(date);
	}
	
	public static Long getTime(){
		return new Date().getTime();
	}
	
	public static void main(String[] args) {
		System.out.println(getCurrentTime());
	}
}
