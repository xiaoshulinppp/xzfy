package com.taiji.fzb.webwork;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
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

}

 