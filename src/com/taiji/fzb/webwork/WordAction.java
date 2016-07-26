package com.taiji.fzb.webwork;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;


import com.opensymphony.webwork.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.taiji.core.webwork.action.ProtectedDetailAction;

/**
 * @Desc：生成word
 * @Author：张轮
 * @Date：2014-1-22下午04:52:03
 */
@SuppressWarnings("serial")
public class WordAction  extends ProtectedDetailAction{

 private String filePath; //文件路径
 private String fileName; //文件名称
 private String fileOnlyName; //文件唯一名称

 /**
  * @Desc：生成word文档
  * @Author：张轮
  * @Date：2014-1-22下午07:29:58
  * @return
  */
    public String createWord() {
        /** 用于组装word页面需要的数据 */
        Map<String, Object> dataMap = new HashMap<String, Object>();
        
        /** 组装数据 */
        
        
        
        
        dataMap.put("jiansuom","张三");
        
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy年MM月dd日");
        dataMap.put("datenow",sdf.format(new Date()));
        
        dataMap.put("dlren","代理人");
        dataMap.put("dbren","被表人");
        dataMap.put("bsqren","被申请人");
        dataMap.put("xwandwh","张三");
        dataMap.put("nianyue","2016-03-31");
        dataMap.put("fagnshi","城管通知方式");
        
        dataMap.put("ssliyou","我不需要理由");
        dataMap.put("sldanwei","北京市人民政府");
        
        dataMap.put("qingqiu","1");
        List<Map<String, Object>> listsqr =new ArrayList<Map<String,Object>>();
        for(int i=1;i<=10;i++){
         Map<String, Object> map=new HashMap<String, Object>();
         map.put("sqr", "刘全成（由董事会以股份制企业名义提出申请），主要负责人是：张三，送达地址北京海淀，邮编333333，电话3333333；");
         
         listsqr.add(map);
        }
        dataMap.put("listsqr",listsqr );
        
        List<Map<String, Object>> listfy  =new ArrayList<Map<String,Object>>();
        for(int i=1;i<=2;i++){
         Map<String, Object> map=new HashMap<String, Object>();
         map.put("mcjiawh", "告知书（京政复字200603）");
         map.put("nianyue", "2013-03-04");
         map.put("moufs", "他人报纸");
         listfy.add(map);
        }
        dataMap.put("listfy ",listfy  );
        
        
        
        
        
        //dataMap.put("content","这是其它内容这是其它内容这是其它内容这是其它内容这是其它内容这是其它内容这是其它内容这是其它内容这是其它内容这是其它内容这是其它内容这是其它内容这是其它内容");
    //    newList 
        
        
        /** 文件名称，唯一字符串 */
        Random r=new Random();
        SimpleDateFormat sdf1=new SimpleDateFormat("yyyyMMdd_HHmmss_SSS");
        StringBuffer sb=new StringBuffer();
        sb.append(sdf1.format(new Date()));
        sb.append("_");
        sb.append(r.nextInt(100));
        
        //文件路径
        filePath=ServletActionContext.getServletContext().getRealPath("/")+"upload";
        //ServletActionContext.getServletContext().getRealPath("/")+"upload
        //文件唯一名称
        fileOnlyName = "用freemarker导出的Word文档_"+sb+".doc";
        
        //文件名称
        fileName="用freemarker导出的Word文档.doc";
        
        /** 生成word */
        WordUtil.createWord(dataMap, "muban4.ftl", filePath, fileOnlyName);
        
        return "createWordSuccess";
    }
    
    
 /**
  * @Desc：下载生成的word文档，入口，用来跳转至struts XML配置
  * @Author：张轮
  * @Date：2014-1-22下午07:36:29
  * @return
  */
    public String dowloadWord() {
        /** 先判断文件是否已生成  */
        try {
         //解决中文乱码
         filePath = URLDecoder.decode(filePath, "UTF-8");
         fileOnlyName = URLDecoder.decode(fileOnlyName, "UTF-8");
         fileName = URLDecoder.decode(fileName, "UTF-8");
         
         //如果文件不存在，则会跳入异常，然后可以进行异常处理
            new FileInputStream(filePath + File.separator +  fileOnlyName);
        } catch (Exception e) {
         e.printStackTrace();
         return "error";
        }
        return "dowloadWord";
    }
    
    /**
     * @Desc：下载生成的word文档
     * 该方法是struts.xml文件中的： <param name="inputName">wordFile</param> 中自动对应的get方法，该方法自动调用
     * @Author：张轮
     * @Date：2014-1-22下午07:36:29
     * @return 返回最终生成的word文档 文件流
     */
    public InputStream getWordFile(){
        try {
         //解决中文乱码
         fileName = URLDecoder.decode(fileName, "UTF-8");
         
            /** 返回最终生成的word文件流  */
            return new FileInputStream(filePath + File.separator + fileOnlyName);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }


 public String getFilePath() {
  return filePath;
 }


 public void setFilePath(String filePath) {
  this.filePath = filePath;
 }


 public String getFileName() {
  return fileName;
 }


 public void setFileName(String fileName) {
  this.fileName = fileName;
 }


 public String getFileOnlyName() {
  return fileOnlyName;
 }


 public void setFileOnlyName(String fileOnlyName) {
  this.fileOnlyName = fileOnlyName;
 }


@Override
public Class getPersistentClass() {
	// TODO Auto-generated method stub
	return null;
}

}