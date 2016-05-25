package com.taiji.zxfy.zxsq.utils;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import java.util.Set;


import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.taiji.zxfy.zxsq.domain.AppModel;

public class PdfUtil {
    public static File createPdf(List<String> imageUrllist, List<String> imageStrlist, String mOutputPdfFileName) {
//        String TAG = "PdfUtil";
        Document doc = new Document(PageSize.A4, 20, 20, 20, 20);
        try {
            PdfWriter.getInstance(doc, new FileOutputStream(mOutputPdfFileName));
            doc.open();
            
            if(imageUrllist == null || imageUrllist.isEmpty())
            {
            	doc.add(new Paragraph("没有材料", setChineseFont()));
            }else{
	            for (int i = 0; i < imageUrllist.size(); i++) {
	//                doc.newPage();
	                doc.add(new Paragraph(imageStrlist.get(i), setChineseFont()));
	//	            for (int j = 0; j < 3; j++) {
		                Image png1 = Image.getInstance(imageUrllist.get(i));
		                float heigth = png1.getHeight();
		                float width = png1.getWidth();
		                int percent = getPercent(heigth, width);
		                png1.setAlignment(Image.MIDDLE);
		                png1.scalePercent(percent+3);// 表示是原来图像的比例;
		                doc.add(png1);
	//                }
	            }
            }
            doc.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (DocumentException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        File mOutputPdfFile = new File(mOutputPdfFileName);
        if (!mOutputPdfFile.exists()) {
            mOutputPdfFile.deleteOnExit();
            return null;
        }
        return mOutputPdfFile;
    }

    /**
     * 第一种解决方案 在不改变图片形状的同时，判断，如果h>w，则按h压缩，否则在w>h或w=h的情况下，按宽度压缩
     *
     * @param h
     * @param w
     * @return
     */

    public static int getPercent(float h, float w) {
        int p = 0;
        float p2 = 0.0f;
        if (h > w) {
            p2 = 297 / h * 100;
        } else {
            p2 = 210 / w * 100;
        }
        p = Math.round(p2);
        return p;
    }

    /**
     * 第二种解决方案，统一按照宽度压缩 这样来的效果是，所有图片的宽度是相等的，自我认为给客户的效果是最好的
     *
     * @param args
     */
    public static int getPercent2(float h, float w) {
        int p = 0;
        float p2 = 0.0f;
        p2 = 530 / w * 100;
        p = Math.round(p2);
        return p;
    }
    
    
    /**
     * 生成字体   支持中文
     * @return
     */
    public static Font setChineseFont() {
        BaseFont bf = null;
        Font fontChinese = null;
        try {
            bf = BaseFont.createFont("resources/SIMKAI.TTF",
                    BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
            fontChinese = new Font(bf, 12, Font.NORMAL);
        } catch (DocumentException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return fontChinese;
    }
    
    
    public static void main(String[] args) throws Exception, DocumentException {
//    	xzfysqs();
//    	xzfysqqrd();
	}
    
    public static void xzfysqqrd(List list, String path)
    {
    	Document doc = new Document(PageSize.A4, 20, 20, 20, 20);
        try {
        	// 设置页边空白
        	doc.setMargins(50, 50, 50, 50);
        	
        	
            PdfWriter.getInstance(doc, new FileOutputStream(path));
            doc.open();
            
            
            Paragraph t = new Paragraph("行政复议申请确认单", setChineseFont(22,1));
            t.setAlignment(Paragraph.ALIGN_CENTER);
            doc.add(t);
            String str = "";
            
            Calendar c = Calendar.getInstance();
            int year = c.get(Calendar.YEAR); 
            int month = c.get(Calendar.MONTH) + 1; 
            int date = c.get(Calendar.DATE); 
            int hour = c.get(Calendar.HOUR_OF_DAY); 
            int minute = c.get(Calendar.MINUTE); 
            
            str = "（申请代码："+ (String)list.get(0) +"  生成时间：" + year + "年" + month + "月" + date + "日" + hour + "时" + minute + "分" + "）";
            
            t = new Paragraph(str, setChineseFont(12,0));
            t.setAlignment(Paragraph.ALIGN_CENTER);
            doc.add(t);
            doc.add(new Paragraph("申请人：", setChineseFont(12,0)));
        	Set<AppModel> appS = (Set)list.get(2);
            Iterator<AppModel> it = appS.iterator();
    		AppModel app = new AppModel();
    		str = "";
    		
    		for(int i = 0;it.hasNext(); i ++)
    		{
    			app = it.next();
    			if((Integer)list.get(1) > 5)
    			{
    				str = app.getAppName() + "等" + (Integer)list.get(1) + "人，代表人：";
    				doc.add(new Paragraph("    " + str, setChineseFont(12,0)));
    			}
    			if("1".equals(app.getSexy()))
    			{
    				str = app.getAppName() + "，男，身份证：" + app.getAppId() + "，电话：" + app.getTelephone() + "，通邮地址：" + app.getMailAddress();
    			}else{
    				str = app.getAppName() + "，女，身份证：" + app.getAppId() + "，电话：" + app.getTelephone() + "，通邮地址：" + app.getMailAddress();
    			}
    			doc.add(new Paragraph(str, setChineseFont(12,0)));
    		}
    		
            doc.add(new Paragraph("被申请人：" + (String)list.get(3), setChineseFont(12,0)));
            doc.add(new Paragraph("复议请求：" + (String)list.get(4), setChineseFont(12,0)));
            doc.add(new Paragraph("    我（们）确认以上内容是我（们）真是意思表示，相关申请材料已经在网上申请复议系统提交（网址www...,申请代码为" + (String)list.get(0) + "），并确保上述材料真实有效，请复议机关予以审查。", setChineseFont(14,1)));
            doc.add(new Paragraph(" ", setChineseFont(12,0)));
            doc.add(new Paragraph(" ", setChineseFont(12,0)));
            doc.add(new Paragraph("申请人签名：", setChineseFont(12,0)));
            doc.add(new Paragraph(" ", setChineseFont(12,0)));
            
            //申请人签名表       申请人     身份证     签名
            
            
            
            PdfPTable table = new PdfPTable(3);   
            
//          //1行2列   
//          PdfPTable nested1 = new PdfPTable(2);   
//          nested1.addCell("1.1");   
//          nested1.addCell("1.2");   
//            
//          //2行1列   
//          PdfPTable nested2 = new PdfPTable(1);   
//          nested2.addCell("2.1");   
//          nested2.addCell("2.2");   
//            
//          //将表格插入到指定位置   
//          for (int k = 0; k < 24; ++k) {   
//              if (k == 1) {   
//                  table.addCell(nested1);   
//              } else if (k == 20) {   
//                  table.addCell(nested2);   
//              } else {   
//                  table.addCell("cell " + k);   
//              }   
//          }
            
            table.addCell(new Paragraph("申请人", setChineseFont(12,0)));
            table.addCell(new Paragraph("身份证", setChineseFont(12,0)));
            table.addCell(new Paragraph("签名", setChineseFont(12,0)));
            
            appS = (Set)list.get(2);
            it = appS.iterator();
    		app = new AppModel();
    		str = "";
    		
    		for(int i = 0;it.hasNext(); i ++)
    		{
    			app = it.next();
    			table.addCell(new Paragraph(app.getAppName(), setChineseFont(12,0)));
    			table.addCell(app.getAppId());
    			table.addCell(" ");
    		}
            
            
          doc.add(table);
            
            
            
            
            
            
            doc.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (DocumentException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public static void xzfysqs(List list, String path)
    {
    	Document doc = new Document(PageSize.A4, 20, 20, 20, 20);
        try {
            PdfWriter.getInstance(doc, new FileOutputStream(path));
            doc.open();
            
            
            Paragraph t = new Paragraph("行政复议申请书", setChineseFont(22,1));
            t.setAlignment(Paragraph.ALIGN_CENTER);
            doc.add(t);
            
            Set<AppModel> appS = (Set)list.get(0);
            Iterator<AppModel> it = appS.iterator();
    		AppModel app = new AppModel();
    		String str = "";
            doc.add(new Paragraph("申请人：", setChineseFont(12,0)));
    		for(;it.hasNext();)
    		{
    			app = it.next();
    			if("1".equals(app.getSexy()))
    			{
    				str = app.getAppName() + "，男，身份证：" + app.getAppId() + "，电话：" + app.getTelephone() + "，通邮地址：" + app.getMailAddress();
    			}else{
    				str = app.getAppName() + "，女，身份证：" + app.getAppId() + "，电话：" + app.getTelephone() + "，通邮地址：" + app.getMailAddress();
    			}
    			doc.add(new Paragraph(str, setChineseFont(12,0)));
    		}
    		appS = (Set)list.get(1);
    		it = appS.iterator();
    		str = "代表人：";
    		for(;it.hasNext();)
    		{
    			app = it.next();
    			str += app.getAppName() + "、";
    		}
            doc.add(new Paragraph(str, setChineseFont(12,0)));
            
            if(list.get(2) != null)
            {
            	str = ((AppModel)list.get(2)).getAppName();
            }
            doc.add(new Paragraph("代理人： " + str, setChineseFont(12,0)));
            
            doc.add(new Paragraph("被申请人： " + (String)list.get(3), setChineseFont(12,0)));
            doc.add(new Paragraph("复议请求：" + (String)list.get(4), setChineseFont(12,0)));
            doc.add(new Paragraph("事实和理由：", setChineseFont(12,0)));
            doc.add(new Paragraph("    " + (String)list.get(5), setChineseFont(12,0)));
            doc.add(new Paragraph("此致", setChineseFont(12,0)));
            doc.add(new Paragraph("    " + (String)list.get(6), setChineseFont(12,0)));
            doc.add(new Paragraph(" ", setChineseFont(12,0)));
            doc.add(new Paragraph("附件1：行政复议申请材料确认单", setChineseFont(12,0)));
            doc.add(new Paragraph("附件2：申请人身份证明", setChineseFont(12,0)));
            
            List<String> clList = (List)list.get(7);
            if(!clList.isEmpty())
            {
            	for(int i = 0; i < clList.size(); i++)
            	{
            		doc.add(new Paragraph(clList.get(i), setChineseFont(12,0)));
            	}
            }
            
            doc.add(new Paragraph("附件3：其他证据材料", setChineseFont(12,0)));
            clList = (List)list.get(8);
            if(clList != null)
            {
            	for(int i = 0; i < clList.size(); i++)
            	{
            		doc.add(new Paragraph("    " + clList.get(i), setChineseFont(12,0)));
            	}
            }else{
            	doc.add(new Paragraph("    无", setChineseFont(12,0)));
            }
            
            doc.add(new Paragraph(" ", setChineseFont(12,0)));
            doc.add(new Paragraph("申请人：", setChineseFont(12,0)));
            appS = (Set)list.get(0);
            it = appS.iterator();
    		app = new AppModel();
    		str = "";
            doc.add(new Paragraph("申请人：", setChineseFont(12,0)));
    		for(;it.hasNext();)
    		{
    			app = it.next();
    			str += app.getAppName() + "、";
    		}
            doc.add(new Paragraph(str, setChineseFont(12,0)));
            
            
            
            
            
            doc.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (DocumentException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }

//        File mOutputPdfFile = new File("E:/PDF/xingZhengFuYiShenQingShu.pdf");
//        if (!mOutputPdfFile.exists()) {
//            mOutputPdfFile.deleteOnExit();
//        }
    }
    
    public static Font setChinese12Font() {
        BaseFont bf = null;
        Font fontChinese = null;
        try {
            bf = BaseFont.createFont("resources/SIMKAI.TTF",
                    BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
            fontChinese = new Font(bf, 12, Font.NORMAL);
        } catch (DocumentException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return fontChinese;
    }
    
    public static Font setChinese14Font() {
        BaseFont bf = null;
        Font fontChinese = null;
        try {
            bf = BaseFont.createFont("resources/SIMKAI.TTF",
                    BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
            fontChinese = new Font(bf, 14, Font.BOLD);
        } catch (DocumentException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return fontChinese;
    }
    public static Font setChineseFont(int fontSize, int fontStyle) {
        BaseFont bf = null;
        Font fontChinese = null;
        try {
            bf = BaseFont.createFont("resources/SIMKAI.TTF",
                    BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
            fontChinese = new Font(bf, fontSize, fontStyle);
        } catch (DocumentException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return fontChinese;
    }
}