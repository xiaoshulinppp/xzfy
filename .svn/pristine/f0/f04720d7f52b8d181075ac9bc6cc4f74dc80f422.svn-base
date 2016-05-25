package com.util;

import javax.crypto.*;
import javax.crypto.spec.DESKeySpec;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import java.security.NoSuchAlgorithmException;
import java.security.InvalidKeyException;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;

/**
 * 通过DES加密解密实现一个String字符串的加密和解密.
 * 
 * @author badpeas
 * 
 */
public class EncryptDecryptData {

	public static void XX(String[] args) throws NoSuchAlgorithmException,
			InvalidKeyException, NoSuchPaddingException,
			InvalidKeySpecException, IllegalBlockSizeException,
			BadPaddingException {
		// 1.1 >>> 首先要创建一个密匙
		// DES算法要求有一个可信任的随机数源
		SecureRandom sr = new SecureRandom();
		// 为我们选择的DES算法生成一个KeyGenerator对象
		KeyGenerator kg = KeyGenerator.getInstance("DES");
		kg.init(sr);
		// 生成密匙
		SecretKey key = kg.generateKey();
		// 获取密匙数据
		// byte rawKeyData[] = key.getEncoded();
		byte rawKeyData[] = "taiji.com.cn".getBytes();
		System.out.println("密匙===>" + rawKeyData);

		String str = "hi.baidu.com/badpeas"; // 待加密数据
		// 2.1 >>> 调用加密方法
		byte[] encryptedData = encrypt(rawKeyData, str);
		// 3.1 >>> 调用解密方法
		decrypt(rawKeyData, encryptedData);
	}

	/**
	 * 加密方法
	 * 
	 * @param rawKeyData
	 * @param str
	 * @return
	 * @throws InvalidKeyException
	 * @throws NoSuchAlgorithmException
	 * @throws IllegalBlockSizeException
	 * @throws BadPaddingException
	 * @throws NoSuchPaddingException
	 * @throws InvalidKeySpecException
	 */
	public static byte[] encrypt(byte rawKeyData[], String str)
			throws InvalidKeyException, NoSuchAlgorithmException,
			IllegalBlockSizeException, BadPaddingException,
			NoSuchPaddingException, InvalidKeySpecException {
		// DES算法要求有一个可信任的随机数源
		SecureRandom sr = new SecureRandom();
		// 从原始密匙数据创建一个DESKeySpec对象
		DESKeySpec dks = new DESKeySpec(rawKeyData);
		// 创建一个密匙工厂，然后用它把DESKeySpec转换成一个SecretKey对象
		SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
		SecretKey key = keyFactory.generateSecret(dks);
		// Cipher对象实际完成加密操作
		Cipher cipher = Cipher.getInstance("DES");
		// 用密匙初始化Cipher对象
		cipher.init(Cipher.ENCRYPT_MODE, key, sr);
		// 现在，获取数据并加密
		byte data[] = str.getBytes();
		// 正式执行加密操作
		byte[] encryptedData = cipher.doFinal(data);
 
		return encryptedData;
	}

	public static void main(String args[]) throws InvalidKeyException,
			NoSuchAlgorithmException, IllegalBlockSizeException,
			BadPaddingException, NoSuchPaddingException,
			InvalidKeySpecException {
		
		byte[] encryptedData = encrypt("taiji.com.cn".getBytes(),
				"1f223c5e4a77905d43ae047533746dc8");
		BASE64Encoder enc = new BASE64Encoder();
		// 加密运算之后 将byte[]转化为base64的String
		String encryptedtext = enc.encode(encryptedData);
		System.out.println(encryptedtext);
		BASE64Decoder dec = new BASE64Decoder();
		try {
			encryptedData = dec.decodeBuffer(encryptedtext);

			System.out
					.println(decrypt("taiji.com.cn".getBytes(), encryptedData));
		} catch (Exception e) {

		}
	}

	/**
	 * 解密方法
	 * 
	 * @param rawKeyData
	 * @param encryptedData
	 * @throws IllegalBlockSizeException
	 * @throws BadPaddingException
	 * @throws InvalidKeyException
	 * @throws NoSuchAlgorithmException
	 * @throws NoSuchPaddingException
	 * @throws InvalidKeySpecException
	 */
	public static String decrypt(byte rawKeyData[], byte[] encryptedData)
			throws IllegalBlockSizeException, BadPaddingException,
			InvalidKeyException, NoSuchAlgorithmException,
			NoSuchPaddingException, InvalidKeySpecException {
		// DES算法要求有一个可信任的随机数源
		SecureRandom sr = new SecureRandom();
		// 从原始密匙数据创建一个DESKeySpec对象
		DESKeySpec dks = new DESKeySpec(rawKeyData);
		// 创建一个密匙工厂，然后用它把DESKeySpec对象转换成一个SecretKey对象
		SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
		SecretKey key = keyFactory.generateSecret(dks);
		// Cipher对象实际完成解密操作
		Cipher cipher = Cipher.getInstance("DES");
		// 用密匙初始化Cipher对象
		cipher.init(Cipher.DECRYPT_MODE, key, sr);
		// 正式执行解密操作
		byte decryptedData[] = cipher.doFinal(encryptedData);

		return new String(decryptedData);
	}

}
