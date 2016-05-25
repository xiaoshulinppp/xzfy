package com.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import com.taiji.core.util.ApplicationPath;

public class FileUtil {
	
	public static String fileSave(File file, String fileName)
			throws FileNotFoundException, IOException {
		String rootPath = ApplicationPath.getRootPath().replaceAll("\\\\",
				"\\\\\\\\");
		String absoutleFilePath = rootPath + "download"+File.separator+"file" + File.separator;
		File f = new File(absoutleFilePath);
		f.mkdir();
		absoutleFilePath += File.separator;
		String fileNameNew = FileUtil.generateRandomStr()
				+ fileName.substring(fileName.lastIndexOf("."), fileName
						.length());// 文件名新
		FileOutputStream output = new FileOutputStream(absoutleFilePath
				+ fileNameNew);
		FileInputStream in = new FileInputStream(file);
		int fileSize = in.available();// 剩余字节数。
		byte buffer[] = new byte[fileSize];
		int len;
		while ((len = in.read(buffer)) > 0) {
			output.write(buffer, 0, len);
		}
		output.close();
		in.close();
		return fileNameNew;
	}
	
	public static String generateRandomStr() {
		String randStr = "0123456789"; // 写入你所希望的所有的字母A-Z,a-z,0-9
		StringBuffer generateRandStr = new StringBuffer();
		Random rand = new Random();
		int randStrLength = 6; // 你想生成的随机数的长度
		for (int i = 0; i < randStrLength; i++) {
			int randNum = rand.nextInt(10);
			generateRandStr.append(randStr.substring(randNum, randNum + 1));
		}
		Date date = new Date();
		SimpleDateFormat fat = new SimpleDateFormat("yyyyMMdd");
		String str = fat.format(date) + generateRandStr.toString();
		return str;
	}

	public static void copyFile(String pathAndFile, String path) {
		// TODO Auto-generated method stub
		
	}
}
