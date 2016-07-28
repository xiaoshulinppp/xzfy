package com.taiji.fzb.util;
import java.awt.Color;
import java.io.File;
import java.io.FileOutputStream;

import com.jacob.activeX.ActiveXComponent;
import com.jacob.com.ComThread;
import com.jacob.com.Dispatch;
import com.jacob.com.Variant;
import com.lowagie.text.pdf.BaseFont;
import com.lowagie.text.pdf.PdfContentByte;
import com.lowagie.text.pdf.PdfGState;
import com.lowagie.text.pdf.PdfReader;
import com.lowagie.text.pdf.PdfStamper;
import com.lowagie.text.Element;

public class Word2Pdf {

	static final int wdDoNotSaveChanges = 0;// 不保存待定的更改。
	static final int wdFormatPDF = 17;// PDF 格式

	public static boolean word2PDF(String filename, String toFilename,
			String waterMarkStr) {
		boolean f = true;
		System.out.println("启动Word");
		long start = System.currentTimeMillis();
		ActiveXComponent app = null;
		Dispatch doc = null;
		try {
			ComThread.InitSTA();// 
			app = new ActiveXComponent("Word.Application");
			app.setProperty("Visible", false);

			Dispatch docs = app.getProperty("Documents").toDispatch();
			System.out.println("打开文档" + filename);
			doc = Dispatch.call(docs,//
					"Open", //
					filename,// FileName
					false,// ConfirmConversions
					true // ReadOnly
					).toDispatch();

			/**
			 * 添加水印
			 */
			// 取得窗口活动体
			// Dispatch activeWindow = app.getProperty("ActiveWindow")
			// .toDispatch();
			// Dispatch docSelection = Dispatch.get(app,
			// "Selection").toDispatch();
			// setWaterMark(activeWindow, docSelection, waterMarkStr);
			System.out.println("转换文档到PDF" + toFilename);
			File tofile = new File(toFilename);
			if (tofile.exists()) {
				tofile.delete();
			}
			Dispatch.call(doc,//
					"SaveAs", //
					toFilename, // FileName
					wdFormatPDF);

//			Dispatch.call(doc, "Close", false);
//			if (app != null)      
//                app.invoke("Quit", new Variant[] {});      
//           
//			ComThread.Release();//
			long end = System.currentTimeMillis();
			System.out.println("转换完成..用时：" + (end - start) + "ms.");
		} catch (Exception e) {
			f = false;
			System.out.println("Error:文档转换失败：" + e.getMessage());
			e.printStackTrace();
		}finally {  
            Dispatch.call(doc,"Close",false);  
            System.out.println("关闭文档");  
            if (app != null)      
                app.invoke("Quit", new Variant[] {});      
            //如果没有这句话,winword.exe进程将不会关闭  
            ComThread.Release();     
        }  
		return f;
	}

	/**
	 * 文档设置水印
	 * 
	 * @param waterMarkStr
	 *            水印字符串
	 */
	public static void setWaterMark(Dispatch activeWindow,
			Dispatch docSelection, String waterMarkStr) {
		// 取得活动窗格对象
		Dispatch activePan = Dispatch.get(activeWindow, "ActivePane")
				.toDispatch();
		// 取得视窗对象
		Dispatch view = Dispatch.get(activePan, "View").toDispatch();
		// 输入页眉内容
		Dispatch.put(view, "SeekView", new Variant(9));
		Dispatch headfooter = Dispatch.get(docSelection, "HeaderFooter")
				.toDispatch();
		// 取得图形对象
		Dispatch shapes = Dispatch.get(headfooter, "Shapes").toDispatch();
		// 给文档全部加上水印
		Dispatch selection = Dispatch.call(shapes, "AddTextEffect",
				new Variant(9), waterMarkStr, "宋体", new Variant(1),
				new Variant(false), new Variant(false), new Variant(0),
				new Variant(0)).toDispatch();
		Dispatch.call(selection, "Select");
		// 设置水印参数
		Dispatch shapeRange = Dispatch.get(docSelection, "ShapeRange")
				.toDispatch();
		Dispatch.put(shapeRange, "Name", "PowerPlusWaterMarkObject1");
		Dispatch textEffect = Dispatch.get(shapeRange, "TextEffect")
				.toDispatch();
		Dispatch.put(textEffect, "NormalizedHeight", new Boolean(false));
		Dispatch line = Dispatch.get(shapeRange, "Line").toDispatch();
		Dispatch.put(line, "Visible", new Boolean(false));
		Dispatch fill = Dispatch.get(shapeRange, "Fill").toDispatch();
		Dispatch.put(fill, "Visible", new Boolean(true));
		// 设置水印透明度
		Dispatch.put(fill, "Transparency", new Variant(1));
		Dispatch foreColor = Dispatch.get(fill, "ForeColor").toDispatch();
		// 设置水印颜色
		Dispatch.put(foreColor, "RGB", new Variant(0));
		Dispatch.call(fill, "Solid");
		// 设置水印旋转
		Dispatch.put(shapeRange, "Rotation", new Variant(315));
		Dispatch.put(shapeRange, "LockAspectRatio", new Boolean(true));
		Dispatch.put(shapeRange, "Height", new Variant(117.0709));
		Dispatch.put(shapeRange, "Width", new Variant(468.2835));
		Dispatch.put(shapeRange, "Left", new Variant(-999995));
		Dispatch.put(shapeRange, "Top", new Variant(-999995));
		Dispatch wrapFormat = Dispatch.get(shapeRange, "WrapFormat")
				.toDispatch();
		// 是否允许交叠
		Dispatch.put(wrapFormat, "AllowOverlap", new Variant(true));
		Dispatch.put(wrapFormat, "Side", new Variant(3));
		Dispatch.put(wrapFormat, "Type", new Variant(3));
		Dispatch.put(shapeRange, "RelativeHorizontalPosition", new Variant(0));
		Dispatch.put(shapeRange, "RelativeVerticalPosition", new Variant(0));
		Dispatch.put(view, "SeekView", new Variant(0));
	}

	public static String writePdfMark(String sourcePdf, String targetPdf,
			String waterMark, String footerMark) throws Exception {
		// 未加水印的源文件
		PdfReader reader = new PdfReader(sourcePdf);
		// 加完水印的输出文件
		PdfStamper stamper = new PdfStamper(reader, new FileOutputStream(
				targetPdf));
		// pdf总页数
		int total = reader.getNumberOfPages() + 1;
		// 设置字体
		BaseFont base = BaseFont.createFont("STSong-Light", "UniGB-UCS2-H",
				BaseFont.EMBEDDED);
		PdfGState gs = new PdfGState();
		// 对每页加入水印
		for (int i = 1; i < total; i++) {
			PdfContentByte content = stamper.getOverContent(i);
			gs.setFillOpacity(0.2f);
			content.setGState(gs);
			content.beginText();
			// 字体颜色
			content.setColorFill(Color.black);
			// 字体编码和大小
			content.setFontAndSize(base, 100);
			if (null != waterMark && !"".equals(waterMark.trim())) {
				content.showTextAligned(Element.ALIGN_CENTER, waterMark, 300,
						450, 30);
			}
			content.setColorFill(Color.BLACK);
			content.setFontAndSize(base, 8);
			if (null != footerMark && !"".equals(footerMark.trim())) {
				content.showTextAligned(Element.ALIGN_CENTER, footerMark, 300,
						10, 0);
			}
			content.endText();
		}
		stamper.close();
		return footerMark;

	}

	public static void main(String[] args) {

		String filename = "E:/apache-tomcat-6.0.30/webapps/QYSBPT/uploadfiles/temp/1463.doc";
		String toFilename = "E:/apache-tomcat-6.0.30/webapps/QYSBPT/uploadfiles/temp/1463.pdf";
		try {
			Word2Pdf.word2PDF(filename, toFilename, "111");
			Word2Pdf.writePdfMark(toFilename,"E:/apache-tomcat-6.0.30/webapps/QYSBPT/uploadfiles/temp/1463.pdf", "诚 信 创 建", "222222");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// Word2Pdf.word2PDF(filename, toFilename, "诚信创建");
	}
}