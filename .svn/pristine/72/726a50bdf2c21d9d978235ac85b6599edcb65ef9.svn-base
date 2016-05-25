package com.iscp.sys.formLayout;
import org.hibernate.*;
import org.hibernate.cfg.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import com.taiji.core.util.templateparse.*;
import com.iscp.sys.formLayout.msg.*;
import com.iscp.sys.formLayout.model.*;

public class FormLayoutServer extends HttpServlet {
  private static final String CONTENT_TYPE = "text/html; charset=GBK";

  //Initialize global variables

  private SessionFactory factory;
  private Execute execute = new Execute(this);
  public void init() throws ServletException {
    String url = getBasePath();
//    System.out.println(url);
/*    String url = this.getClass().getResource("").toString();
    if (url.indexOf("file:/") >= 0) {
      url = url.substring(6);
    }
    if (url.indexOf("file:") >= 0) {
      url = url.substring(5);
    }*/
//    System.out.println(url + "/../../../../../../hibernate.cfg.xml");
    Configuration cfg = new Configuration().configure(new File(
      url + "/hibernate.cfg.xml"));
    cfg.addResource("com/iscp/sys/formLayout/msg/MsgField.hbm.xml");
    cfg.addResource("com/iscp/sys/formLayout/msg/MsgTable.hbm.xml");
    cfg.addResource("com/iscp/sys/formLayout/msg/MsgDict.hbm.xml");
    cfg.addResource("com/iscp/sys/formLayout/msg/RelModel.hbm.xml");
    factory = cfg.buildSessionFactory();
    execute.cfg = cfg;
  }
  private static int MAXPREVIEWCOUNT = 5;
  private int currentIndex;
  private String[] previewHtmls = new String[MAXPREVIEWCOUNT];
  public static String headString = null;
  public String getHTMLString(String inner){
    if(headString == null){
      StringBuffer sb = new StringBuffer();
      sb.append("<html>");
      sb.append("<head>");
      sb.append(
          "<link rel=\"stylesheet\" href=\"css/12B/style.css\" type=\"text/css\">");
      sb.append("<META HTTP-EQUIV=\"PRAGMA\" CONTENT=\"NO-CACHE\">\r\n");
      sb.append("<title>\r\n</title>\r\n</head>\r\n");
      headString = sb.toString();
    }
    StringBuffer s = new StringBuffer();
    s.append(headString);
    s.append(inner);
    s.append("</html>");
    return s.toString();
  }
  /**
   * 添加预览任务
   * @param previewHtml String 需要预览的html页面
   * @return int 此次预览任务的id
   */
  public String addPreview(String previewHtml){
    previewHtmls[currentIndex] = getHTMLString(previewHtml);
    String id = currentIndex + "";
    currentIndex ++;
    if(currentIndex>=MAXPREVIEWCOUNT){
      currentIndex = currentIndex - MAXPREVIEWCOUNT;
    }
    System.out.println("&id&="+id);
    return id;
  }
  public void doGet(HttpServletRequest request, HttpServletResponse response) throws
      ServletException, IOException {
    response.setContentType(CONTENT_TYPE);
    String tabName = request.getParameter("tb");
    if(tabName != null){
      Session session = factory.openSession();
      execute.setSession(session);
      try{
        execute.writeFile(tabName);
      }
      catch(Exception e){
        e.printStackTrace();
      }
      return;
    }
    String id = request.getParameter("id");
    System.out.println("_id_="+id);
    OutputStream os = response.getOutputStream();
    String html = null;
    if(id != null){
      int i = Integer.parseInt(id);
      if(i>=0 && i<MAXPREVIEWCOUNT){
        html = (String) previewHtmls[i];
      }
    }
    if(html == null){
      html =getHTMLString("预览发生错误：缺少预览id或预览id无效");
    }
    os.write(html.getBytes());
    os.flush();
  }

  public void doPost(HttpServletRequest request, HttpServletResponse response) throws
      ServletException, IOException {
    response.setContentType(CONTENT_TYPE);
    Command command = null;
    Answer answer = new Answer();
    Object[] answerObjs = null;
    Object[] commandObjs = null;
    try {
      ObjectInputStream commandStream = new ObjectInputStream(request.
          getInputStream());
      Object o = commandStream.readObject();
      commandStream.close();
      if(o instanceof Command){
        command = (Command)o;
      }
      else if(o instanceof Object[]){
        commandObjs = (Object[])o;
      }
    }
    catch (Exception e) {
      answer = new Answer();
      answer.error = e;
      e.printStackTrace();
    }
    try {
      if (answer.error == null) {
        if(command != null){
          answer = this.execute(command);
        }
        else if(commandObjs != null){
          answerObjs = execute(commandObjs);
        }
      }
    }
    catch (Exception e) {
      e.printStackTrace();
      answer.error = e;
    }
    ObjectOutputStream answerStream = new ObjectOutputStream(response.
        getOutputStream());
    if(command != null){
      answerStream.writeObject(answer);
    }
    else{
      answerStream.writeObject(answerObjs);
    }
    answerStream.flush();
  }

  public Answer execute(Command command) throws Exception {
    Answer answer = null;
    Session session = factory.openSession();
    Transaction tx = null;
    if(command.commandType != command.WRITE_FILE){
      tx = session.beginTransaction();
    }
    answer = execute.execute(session, command);
    if(command.commandType != command.WRITE_FILE){
      tx.commit();
      session.close();
    }
    return answer;
  }

  private Object[] execute(Object[] command){
    Object[] ans = new Object[2];
    Exception error = null;
    try{
      Session session = factory.openSession();
      ans[0] = detailExecute(session,command);
      session.close();
    }
    catch(Exception e){
      e.printStackTrace();
      error = e;
    }
    ans[1] = error;
    return ans;
  }

  private void writeLayout(Object layout,String tableName,Session session)throws Exception{
    TableModel tableModel = null;
    if(layout instanceof String){
      //从布局文件生成表单
      Command cmd = new Command();
      cmd.commandType = cmd.LOAD_FILE;
      cmd.basePath = "/layout/" + tableName + "/" + layout + ".lay";
      tableModel = execute.execute(session, cmd).tableModel;
    }
    else if(layout instanceof Integer){
      //生成默认表单布局
      int colCount = ((Integer)layout).intValue();
      Command cmd = new Command();
      cmd.msgTable = new MsgTable();
      cmd.msgTable.name = tableName;
      cmd.msgTable.logTable = tableName;
      execute.setCommand(cmd);
      MsgField[] msgFieldList = execute.get_field_list().msgFieldList;
      tableModel = new TableModel();
      TableModel tm = tableModel;
      tableModel.tabName = tableName;
      if(colCount>3)colCount = 3;
      int col = 0;
      int row = 1;
      for(int i = 0;i<msgFieldList.length;i++){
        //////////////////////////////////////////////
        CellModel title = new CellModel();
        FieldTextItemModel titleItem = new FieldTextItemModel();
        title.setItemModel(titleItem);
        titleItem.text = msgFieldList[i].byName;
        titleItem.field = msgFieldList[i].name;
        titleItem.table = msgFieldList[i].tableName;
        title.top = row;
        title.rowspan = 1;
        title.left = col*5+1;
        title.colspan = 2;
        tm.addCell(title);
        //////////////////////////////////////////////
        CellModel field = new CellModel();
        FieldItemModel fieldItem = new FieldItemModel();
        field.setItemModel(fieldItem);
        importMsgFieldIntoFieldItem(msgFieldList[i],fieldItem);

        field.top = row;
        field.rowspan = 1;
        field.left = col*5+3;
        field.colspan = 3;
        tm.addCell(field);
        col ++;
        if(col>=colCount){
          col = 0;
          row ++;
        }
      }
    }
    if(tableModel != null){
      PresentCodeGen gen = new PresentCodeGen(tableModel.tabName,
          tableModel.toString());
  System.out.println("#################################");
  System.out.println(tableModel.toString());
  System.out.println("#################################");
      gen.generatePropertyFile();
    }
  }

  private void importMsgFieldIntoFieldItem(MsgField mf,FieldItemModel fim){
    fim.field = mf.name;
    fim.table = mf.tableName;
    fim.action = mf.action;
    fim.default_ = mf.default_;
    fim.dictListId = mf.dictListId;
    fim.setDictType(mf.dictType);
    fim.enu = mf.enu;
    fim.setType(mf.type);
    fim.hidden = fim.type == fim.INVISIBLE;
    fim.setIsDict(mf.isDict);
    fim.setIsNull(mf.isNull);
    fim.length = mf.length;
    fim.setShowType(mf.showType);
    fim.dictShowType = mf.dictvalShowType;
    fim.dictvalGetType = mf.dictvalGetType;
    String relationTable = mf.getRelatedTable();
    if(relationTable != null){
      fim.showType = fim.SELECT;
      fim.sourceTable = relationTable;
      fim.sourceName = "name";
      fim.sourceId = mf.getRelatedId();
      fim.targetRelationType = mf.getTargetRelationType();
    }
    correctFieldItem(fim);
  }

  private void correctFieldItem(FieldItemModel fim){
    int showType= fim.showType;
    boolean selectableItem = showType == fim.RADIO || showType == fim.CHECKBOX || showType == fim.SELECT;
    if(fim.sourceTable != null && fim.sourceTable.length()>0){
      //如果是关联字段
      //显示类型必须为可选择的类型
      if(!selectableItem && showType != fim.INVISIBLE){
        fim.showType = FieldItemModel.SELECT;
      }
      //不能启用数据字典
      fim.isDict = false;
    }
    else if(fim.isDict){
      //如果使用数据字典
      //显示类型必须为输入框
      fim.showType = fim.INPUT;
    }
    else if(selectableItem && (fim.enu == null || fim.enu.length()<=0)){
      //如果没有定义静态列表且不是关联字段
      //显示类型必须为输入框
      fim.showType = fim.INPUT;
    }
    if(fim.css_class_index < 0 && (fim.css_class == null || fim.css_class.length()==0)){
      fim.css_class = fim.SYSTEM_CSS_CLASSES[fim.getSelectableCss(fim.showType)[0]];
    }
  }


  private Object[] detailExecute(Session session,Object[] command) throws Exception{
    //command={请求名,请求参数}
    Object[] answer = null;
    execute.setSession(session);
    if (command[0].equals("writeFile")) {
      //param={表名,布局名Map}
      Object[] param = (Object[])command[1];
      String tableName = (String)param[0];
      String[] relTableNames = (String[])param[3];
      Map layoutMap = (Map)param[2];
      String functionName = (String)param[4];
      boolean writeAll = param[1] != null;
      if(writeAll){
        for(int i = 0;i<relTableNames.length;i++){
          Object layout = layoutMap.get(relTableNames[i]);
          writeLayout(layout,relTableNames[i],session);
        }
      }
      else{
        Object layout = layoutMap.get(tableName);
        writeLayout(layout,tableName,session);
      }
      execute.writeFile(tableName.toString(),writeAll,functionName);
      return answer;
    }
    else if(command[0].equals("getLayoutList")){
      //param={表名,布局名}
      Object[] param = (Object[])command[1];
      String tableName = (String)param[0];
      File file = new File(Execute.getLayoutBasePath()+"/layout/"+tableName+"/");
      if(file.exists()){
        File[] list = file.listFiles();
        Vector vector = new Vector();
        for(int i = 0;i<list.length;i++){
          if(!list[i].equals(file)){
            String name = list[i].getName();
            if(name.length()>4 && name.substring(name.length()-4).equals(".lay")){
              vector.add(name.substring(0,name.length()-4));
            }
          }
        }
        answer = new Object[vector.size()];
        for(int i = 0;i<answer.length;i++){
          answer[i] = (String)vector.get(i);
        }
      }
      else{
        answer = new Object[0];
      }
    }
    return answer;
  }

  //Clean up resources
  public void destroy() {
  }
  public static String getBasePath(){
    String path = FormLayoutServer.class.getResource("").toString();
    int ind = path.indexOf("file:");
    if(ind>=0){
      path = path.substring(ind+5);
    }
    else{
      ind = path.indexOf("file:/");
      if(ind>=0){
        path = path.substring(ind+6);
      }
    }
    ind = path.indexOf("/WEB-INF/");
    if(ind >= 0){
      path = path.substring(0,ind+8);
    }
    else{
      int len = path.length();
      for(int i= 0;i<5;i++){
        len = path.lastIndexOf("/",len)-1;
      }
      path = path.substring(0,len);
    }
    path = path +"/classes";
    return path;
  }
}
