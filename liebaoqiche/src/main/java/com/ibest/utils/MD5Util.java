package com.ibest.utils;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5Util {

	/**
	 * 将密码进行MD5加密
	 *
	 * @param password
	 * @return
	 */
	public static String encrypt(String password) {
		if (password == null) {
			throw new IllegalArgumentException("password can't be null!");
		}

		try {
			MessageDigest md = MessageDigest.getInstance("MD5");

			password = new BigInteger(1, md.digest(password.getBytes())).toString(16);

			if (password.length() < 32) password = 0 + password;
		} catch (NoSuchAlgorithmException e) {
			throw new RuntimeException("加密失败：" + e.getMessage());
		}

		return password;
	}

	public static void main(String[] args) {
		System.out.println(encrypt("password"));
	}
}
