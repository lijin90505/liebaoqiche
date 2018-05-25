package com.ibest.utils;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.security.Key;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.UnrecoverableKeyException;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;

import javax.crypto.Cipher;
import javax.security.cert.X509Certificate;

import org.apache.commons.codec.binary.Base64;

public class RSAEncryptUtils {
	
	public static final String CHAR_ENCODE = "UTF-8";
	
	/**
	 * 公钥加密
	 * @param publicKey
	 * @param data
	 * @return
	 */
	public static String encrypt(RSAPublicKey publicKey, String data) throws Exception{
		
		if(publicKey == null){
			throw new Exception("加密公钥为空");
		}
		
		if(data == null || (data != null && data.equals(""))){
			throw new Exception("加密内容为空");
		}
		
		Cipher cipher = null;
		try {
			cipher = Cipher.getInstance("RSA");
			cipher.init(Cipher.ENCRYPT_MODE, publicKey);
			byte[] output = cipher.doFinal(data.getBytes(CHAR_ENCODE));
			return Base64.encodeBase64String(output);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 私钥加密
	 * @param privateKey
	 * @param data
	 * @return
	 * @throws Exception
	 */
	public static String encrypt(RSAPrivateKey privateKey, String data) throws Exception{
		
		if(privateKey == null){
			throw new Exception("加密私钥为空");
		}
		
		if(data == null || (data != null && data.equals(""))){
			throw new Exception("加密内容为空");
		}
		
		Cipher cipher = null;
		try {
			cipher = Cipher.getInstance("RSA");
			cipher.init(Cipher.ENCRYPT_MODE, privateKey);
			byte[] output = cipher.doFinal(data.getBytes(CHAR_ENCODE));
			return Base64.encodeBase64String(output);
		} catch (Exception e) {
			return null;
		}
	}
	
	/**
	 * 公钥解密
	 * @param publicKey
	 * @param cipherData
	 * @return
	 * @throws Exception
	 */
	public static String decrypt(RSAPublicKey publicKey, String data) throws Exception{
		
		if(publicKey == null){
			throw new Exception("解密公钥为空");
		}
		
		if(data == null || (data != null && data.equals(""))){
			throw new Exception("解密内容为空");
		}
		
		Cipher cipher = null;
		try {
			cipher = Cipher.getInstance("RSA");
			cipher.init(Cipher.DECRYPT_MODE, publicKey);
			byte[] output = cipher.doFinal(Base64.decodeBase64(data.getBytes(CHAR_ENCODE)));
			return new String(output, CHAR_ENCODE);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * 私钥解密
	 * @param publicKey
	 * @param cipherData
	 * @return
	 * @throws Exception
	 */
	public static String decrypt(RSAPrivateKey privateKey, String data) throws Exception{
		
		if(privateKey == null){
			throw new Exception("解密私钥为空");
		}
		
		if(data == null || (data != null && data.equals(""))){
			throw new Exception("解密内容为空");
		}
		
		Cipher cipher = null;
		try {
			cipher = Cipher.getInstance("RSA");
			cipher.init(Cipher.DECRYPT_MODE, privateKey);
			byte[] output = cipher.doFinal(Base64.decodeBase64(data.getBytes(CHAR_ENCODE)));
			return new String(output, CHAR_ENCODE);
		} catch (Exception e) {
			return null;
		}
	}
	
	/**
	 * 从文件中读取密钥数据
	 * @param path
	 * @return
	 * @throws Exception
	 */
	public static String loadKeyDataFromFile(String path) throws Exception {
		try {
			BufferedReader br = new BufferedReader(new FileReader(path));
			String readLine = null;
			StringBuffer sb = new StringBuffer();
			while((readLine = br.readLine()) != null){
				sb.append(readLine);
			}
			br.close();
			return sb.toString();
		} catch (IOException e) {
			throw new Exception("密钥数据读取错误");
		} catch (NullPointerException e) {
			throw new Exception("密钥文件不存在或不正确");
		}
	}
	
	/**
	 * 从密钥数据中获取私钥
	 * @param keyData
	 * @return
	 * @throws Exception
	 */
	public static RSAPrivateKey loadPrivateKeyFromString(String keyData) throws Exception{
		try {
			byte[] buffer = Base64.decodeBase64(keyData);
			PKCS8EncodedKeySpec keySpec = new PKCS8EncodedKeySpec(buffer);
			KeyFactory keyFactory = KeyFactory.getInstance("RSA");
			return (RSAPrivateKey) keyFactory.generatePrivate(keySpec);
		} catch (NoSuchAlgorithmException e) {
			throw new Exception("无此算法");
		} catch (InvalidKeySpecException e){
			throw new Exception("私钥不合法");
		} catch (NullPointerException e){
			throw new Exception("私钥数据为空");
		}
	}
	
	/**
	 * 从密钥数据中获取公钥
	 * @param keyData
	 * @return
	 * @throws Exception
	 */
	public static RSAPublicKey loadPublicKeyFromString(String keyData) throws Exception{
		try {
			byte[] buffer = Base64.decodeBase64(keyData);
			X509EncodedKeySpec keySpec = new X509EncodedKeySpec(buffer);
			KeyFactory keyFactory = KeyFactory.getInstance("RSA");
			return (RSAPublicKey) keyFactory.generatePublic(keySpec);
		} catch (NoSuchAlgorithmException e) {
			throw new Exception("无此算法");
		} catch (InvalidKeySpecException e){
			throw new Exception("公钥不合法");
		} catch (NullPointerException e){
			throw new Exception("公钥数据为空");
		}
	}
	
	/**
	 * 从cer文件中读取公钥
	 * @param cerFile
	 * @return
	 * @throws Exception
	 */
	public static RSAPublicKey loadPublicKeyFormCer(String cerFile) throws Exception{
		try {
			X509Certificate cert = X509Certificate.getInstance(new FileInputStream(new File(cerFile)));
			X509EncodedKeySpec keySpec = new X509EncodedKeySpec(cert.getPublicKey().getEncoded());
			KeyFactory keyFactory = KeyFactory.getInstance("RSA");
			return (RSAPublicKey) keyFactory.generatePublic(keySpec);
		} catch (NoSuchAlgorithmException e) {
			throw new Exception("无此算法");
		} catch (InvalidKeySpecException e){
			throw new Exception("公钥不合法");
		} catch (NullPointerException e){
			throw new Exception("公钥数据为空");
		}
	}
	
	public static RSAPrivateKey loadPrivateKeyFromKeystore(String keystoreFile, String alias, String password) {
		
		try {
			KeyStore keyStore = KeyStore.getInstance("JKS");
			
			keyStore.load(new FileInputStream(keystoreFile), password.toCharArray());
			
			Key key = keyStore.getKey(alias, password.toCharArray());
			
			PKCS8EncodedKeySpec keySpec = new PKCS8EncodedKeySpec(key.getEncoded());
			KeyFactory keyFactory = KeyFactory.getInstance("RSA");
			return (RSAPrivateKey) keyFactory.generatePrivate(keySpec);
		} catch (KeyStoreException e) {
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (java.security.cert.CertificateException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (UnrecoverableKeyException e) {
			e.printStackTrace();
		} catch (InvalidKeySpecException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 生成公钥私、钥文件
	 * @param path
	 */
	public static KeyPair createKeyPair(){
		try {
			KeyPairGenerator keyPairGen = KeyPairGenerator.getInstance("RSA");
			keyPairGen.initialize(1024, new SecureRandom());
			
			return keyPairGen.generateKeyPair();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
