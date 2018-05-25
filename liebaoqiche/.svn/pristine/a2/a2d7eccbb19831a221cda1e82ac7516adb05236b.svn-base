package com.ibest.utils;

import java.security.Signature;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;

import org.apache.commons.codec.binary.Base64;

public class RSASignatureUtils {

	public static final String SIGN_ALGORITHMS = "SHA1withRSA";
	public static final String CHAR_ENCODE = "UTF-8";
	
	/**
	 * 私钥签名
	 * @param data
	 * @param privateKey
	 */
	public static String sign(String data, RSAPrivateKey privateKey){
		try {
			Signature signature = Signature.getInstance(SIGN_ALGORITHMS);
			signature.initSign(privateKey);
			signature.update(data.getBytes(CHAR_ENCODE));
			
			byte[] signed = signature.sign();
			return new String(Base64.encodeBase64(signed));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 验证签名
	 * @param data
	 * @param sign
	 * @param publicKey
	 * @return
	 */
	public static boolean doCheck(String data, String sign, RSAPublicKey publicKey) {
		try {
			Signature signature = Signature.getInstance(SIGN_ALGORITHMS);
			signature.initVerify(publicKey);
			signature.update(data.getBytes(CHAR_ENCODE));
			boolean verify = signature.verify(Base64.decodeBase64(sign));
			return verify;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
