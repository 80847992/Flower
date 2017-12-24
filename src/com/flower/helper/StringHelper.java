package com.flower.helper;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * 字符串工具类
 * @author Administrator
 *
 */
public class StringHelper {

	/**
	 * 检查空字符串
	 * @param toTest
	 * @return
	 */
	public static boolean isNullOrEmpty(String toTest) {
		return toTest == null || toTest.length() == 0;
	}
	public static boolean isNullOrEmpty(Object toTest) {
		return toTest == null || String.valueOf(toTest).length() == 0;
	}

	/**
	 * md5加密
	 * @param source
	 * @return
	 */
	public static String md5(String source){
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(source.getBytes());
			return new BigInteger(1, md.digest()).toString(16);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return "";
	}
}
