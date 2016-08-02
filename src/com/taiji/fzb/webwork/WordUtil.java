package com.taiji.fzb.webwork;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.opensymphony.webwork.ServletActionContext;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
public class WordUtil {
	   
/**
* @Desc：生成word文件
* @Author：张轮
* @Date：2014-1-22下午05:33:42
* @param dataMap word中需要展示的动态数据，用map集合来保存
* @param templateName word模板名称，例如：test.ftl
* @param filePath 文件生成的目标路径，例如：D:/wordFile/
* @param fileName 生成的文件名称，例如：test.doc
*/
    @SuppressWarnings("unchecked")
public static void createWord(HttpServletRequest request,Map dataMap,String filePath,String fileName){
        try {
        //创建配置实例 
        	Configuration configuration = new Configuration();  
            configuration.setDefaultEncoding("utf-8");   
            //ftl模板文件统一放至 com.lun.template 包下面
            //D:\work_eclipse\apache-tomcat-6.0.30(2)\webapps\zxfy-zaixianfuyi\pages/zxfy/sqsmuban/
           // configuration.setClassForTemplateLoading(WordUtil.class,ServletActionContext.getServletContext().getRealPath("/")+"template");
            
            //获取模板 
          //  Template template = configuration.getTemplate(templateName);
            
            
            Template template=null;  
            String path = request.getRealPath("/");
            File inPath = new File(path+"/template");
            Writer os = null;
            if(!inPath.exists())
            	inPath.mkdirs();
            configuration.setDirectoryForTemplateLoading(inPath);
            template = configuration.getTemplate("muban4.ftl"); //文件名 
            
            
            //输出文件
            File outFile = new File(filePath+File.separator+fileName);
            
            //如果输出目标文件夹不存在，则创建
            if (!outFile.getParentFile().exists()){
                outFile.getParentFile().mkdirs();
            }
            
            //将模板和数据模型合并生成文件 
            Writer out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(outFile),"UTF-8"));


            //生成文件
            template.process(dataMap, out);
            
            //关闭流
            out.flush();
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public static void createWord(Map<String,Object> dataMap,HttpServletRequest request,HttpServletResponse response) throws IOException{  
        Configuration configuration = new Configuration();  
        configuration.setDefaultEncoding("utf-8");   
//        configuration.setClassForTemplateLoading(this.getClass(), "/com");  //FTL文件所存在的位置  
//        File outPath = new File(path+"/output");
//        Writer out = null;  
//        if(!outPath.exists())
//        	outPath.mkdirs();
//            File outFile = new File(outPath+"/"+sdf.format(now)+r.nextInt(1000)+".doc");  
//            out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(outFile),"UTF-8"));  //这里utf-8必须加，否则生成的word会因为中文字符问题打不开，报错xml格式错误
//            t.process(dataMap, out);  
        Template t=null;  
        String path = request.getRealPath("/");
        File inPath = new File(path+"/template");
        Writer os = null;
        if(!inPath.exists())
        	inPath.mkdirs();
        try {   
        	configuration.setDirectoryForTemplateLoading(inPath);
            t = configuration.getTemplate("muban4.ftl"); //文件名 
            Date now = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Random r = new Random();
            response.setContentType("application/msword");
            response.setHeader("Content-Disposition", "attachment; filename="+sdf.format(now)+r.nextInt(1000)+".doc"); 
            os = response.getWriter();
            t.process(dataMap, os);
           
        } catch (IOException e) {  
            e.printStackTrace();  
        } catch (TemplateException e) {  
            e.printStackTrace();  
        } finally{
        	 os.close();
        }
        
    }
    
    
    
    public static HttpServletResponse download(String path, HttpServletResponse response) {
    	try {
    		
    	// path是指欲下载的文件的路径。
    	File file = new File(path);
    	// 取得文件名。
    	String filename = file.getName();
    	// 取得文件的后缀名。
    	String ext = filename.substring(filename.lastIndexOf(".") + 1).toUpperCase();
    	// 以流的形式下载文件。
    	InputStream fis = new BufferedInputStream(new FileInputStream(path));
    	byte[] buffer = new byte[fis.available()];
    	fis.read(buffer);
    	fis.close();
    	// 清空response
    	response.reset();
    	// 设置response的Header
    	response.addHeader("Content-Disposition", "attachment;filename=" + new String(filename.getBytes()));
    	response.addHeader("Content-Length", "" + file.length());
    	OutputStream toClient = new BufferedOutputStream(response.getOutputStream());
    	response.setContentType("application/octet-stream");
    	toClient.write(buffer);
    	toClient.flush();
    	toClient.close();
    	} catch (IOException ex) {
    	ex.printStackTrace();
    	}
    	return response;
    	}
    
    
    static boolean flag;
    public static boolean DeleteFolder(String sPath) {  
        flag = false;  
      File   file = new File(sPath);  
        // 判断目录或文件是否存在  
        if (!file.exists()) {  // 不存在返回 false  
            return flag;  
        } else {  
            // 判断是否为文件  
            if (file.isFile()) {  // 为文件时调用删除文件方法  
                return deleteFile(sPath);  
            } else {  // 为目录时调用删除目录方法  
                return deleteDirectory(sPath);  
            }  
        }  
    }  
    
    public static boolean deleteFile(String sPath) {  
        flag = false;  
        File file = new File(sPath);  
        // 路径为文件且不为空则进行删除  
        if (file.isFile() && file.exists()) {  
            file.delete();  
            flag = true;  
        }  
        return flag;  
    }  
    
    public static boolean deleteDirectory(String sPath) {  
        //如果sPath不以文件分隔符结尾，自动添加文件分隔符  
        if (!sPath.endsWith(File.separator)) {  
            sPath = sPath + File.separator;  
        }  
        File dirFile = new File(sPath);  
        //如果dir对应的文件不存在，或者不是一个目录，则退出  
        if (!dirFile.exists() || !dirFile.isDirectory()) {  
            return false;  
        }  
        flag = true;  
        //删除文件夹下的所有文件(包括子目录)  
        File[] files = dirFile.listFiles();  
        for (int i = 0; i < files.length; i++) {  
            //删除子文件  
            if (files[i].isFile()) {  
                flag = deleteFile(files[i].getAbsolutePath());  
                if (!flag) break;  
            } //删除子目录  
            else {  
                flag = deleteDirectory(files[i].getAbsolutePath());  
                if (!flag) break;  
            }  
        }  
        if (!flag) return false;  
        //删除当前目录  
        if (dirFile.delete()) {  
            return true;  
        } else {  
            return false;  
        }  
    }  
    

}

 