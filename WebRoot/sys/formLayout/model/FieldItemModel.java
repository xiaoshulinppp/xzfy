package com.iscp.sys.formLayout.model;
import java.util.*;

public class FieldItemModel implements ItemModel{
  public String table = "";
  public void setTable(String table){
    this.table = table;
  }
  public String getTable(){
    return table;
  }
  public boolean hidden = false;
  public String field = "";
  public void setField(){
    this.field = field;
  }
  public String getField(){
    return field;
  }
  public String action = "";
  public void setAction(){
    this.action = action;
  }
  public String getAction(){
    return action;
  }
  public String css_class;
  public int css_class_index = -1;
  public void setCss_class(String css_class){
    this.css_class = css_class;
    css_class_index = -1;
    for(int i = 0;i<this.SYSTEM_CSS_CLASSES.length;i++){
      if(SYSTEM_CSS_CLASSES[i].equals(css_class))
        css_class_index = i;
    }
  }
  public String getCss_class(){
    return this.css_class;
  }
  public String other_property_express;
  public FieldItemModel() {
  }
  public static void addp(StringBuffer sb,String name,String value){
    if(value != null){
      sb.append("[$" + name + "]");
      sb.append(value);
      sb.append("[/$" + name + "]");
    }
  }
  public String toString(){
    String tempstr="";
    StringBuffer sb = new StringBuffer();
    sb.append("[$element]");

    addp(sb,"table",table);
    addp(sb,"field",field);
    if(id != null && id.length()>0){
      addp(sb, "htmlid", id);
    }
    if(!hidden){
      addp(sb,"event",getEventString(this));
      addp(sb,"action",action);
      addp(sb,"css_class",css_class);
      addp(sb,"tab_index",tabIndex+"");
      addp(sb,"sourcetable",sourceTable);
      addp(sb,"sourceid",sourceId);
      addp(sb,"sourcename",sourceName);
      addp(sb,"fieldtype",this.getType());
      addp(sb,"fieldshowtype",this.getShowType());
      if(this.sourceTable != null){
        tempstr="relation";
      }
      else if(isDict){
        tempstr="dict";
      }
      else{
        tempstr="static";
      }
      addp(sb,"sourcetype",tempstr);
      addp(sb,"targetrelationtype",targetRelationType);
      addp(sb,"staticvalue",enu);
      addp(sb,"length",length);
      addp(sb,"default",default_);
      addp(sb,"isnull",isNull+"");
      addp(sb,"property_exp",this.other_property_express);
      if(isDict){
        addp(sb, "dictlistid", dictListId);
        addp(sb, "dicttype", this.getDictType());
        addp(sb, "dictshowtype", dictShowType);
        addp(sb, "dictvalgettype", dictvalGetType);
      }
    }
    sb.append("[/$element]");
    return sb.toString();
  }

  public String id;
  public String getId(){
    return id;
  }
  public void setId(String id){
    this.id = id;
  }
  public String getText(){
    if(sourceTable != null){
      return sourceTable;
    }
    return field;
  }

  public int tabIndex = 1;
  //按tab键后，下一个获得焦点的元素
  public FieldItemModel tabNext;
  //上一个获得焦点的元素，与tabNext相反，即this.tabNext.tabLast == this
  public FieldItemModel tabLast;
  public void setTabNext(FieldItemModel tabNext){
    //检验是否会存在环
    FieldItemModel itemForCheck = this;
    while(itemForCheck != null){
      if(itemForCheck == tabNext){
        if(this.tabLast != null){
          this.tabLast.tabNext = null;
        }
        this.tabLast = null;
        break;
      }
      itemForCheck = itemForCheck.tabLast;
    }
    //具体操作
    if(this.tabNext != null){
      this.tabNext.tabLast = null;
    }
    this.tabNext = tabNext;
    if(tabNext.tabLast != null){
      tabNext.tabLast.tabNext = null;
    }
    tabNext.tabLast = this;
  }
  public String sourceTable;
  public String sourceId;
  public String sourceName;
  public String targetRelationType;

  //域表展现相关
  ///////////////////
  //     type      //
  ///////////////////
  public static final int INT = 0;
  public static final int STRING = 1;
  public static final int DATE = 2;
  public static final int FLOAT = 3;
  public static final String[] TYPES__ = {"int","string","date","float"};
  public int type;//字段值类型，为int、string或date
  public String getType(){
    return TYPES__[type];
  }
  public void setType(String type){
    for(int i = 0;i<TYPES__.length;i++){
      if(TYPES__[i].equals(type)){
        this.type = i;
        return;
      }
    }
  }
  ///////////////////
  //   showType    //
  ///////////////////
  public static final int SELECT = 0;//下拉列表
  public static final int INPUT = 1;//文本框
  public static final int TEXTAREA = 2;//文本区域
  public static final int INPUTFILE = 3;//上传文件
  public static final int INPUTWIN = 4;//文本按钮
  public static final int RADIO = 5;//单选框
  public static final int CHECKBOX = 6;//复选框
  public static final int INVISIBLE = 7;//不显示

  public static final String[] SHOWTYPES__={
      "select","input","textarea","inputfile","inputwin","radio",
      "checkbox","invisible"};
  public int showType;//字段显示类型，为input、radio、textarea等等
  public String getShowType(){
    return SHOWTYPES__[showType];
  }
  public void setShowType(String showType){
    for(int i = 0;i<SHOWTYPES__.length;i++){
      if(SHOWTYPES__[i].equals(showType)){
        this.showType = i;
        return;
      }
    }
  }
  public String enu;//静态列表
  public String length;//长度
  public String default_;//缺省值
  public boolean isNull;//是否可空，可以选true或false
  public void setIsNull(String isNull){
    this.isNull = isNull == null || (isNull.equals("true")||isNull.equals("1"));
  }
  public String getIsNull(){
    return isNull+"";
  }
  public boolean isDict;//是否使用数据字典
  public void setIsDict(String isDict){
    this.isDict = isDict != null && (isDict.equals("true") || isDict.equals("1"));
  }
  public String dictListId;//数据字典标记
  ////////////////
  //  dictType  //
  ////////////////
  public static final int DICT_TREE = 0;
  public static final int DICT_RADIO = 1;
  public static final String[] DICTTYPES__ = {"tree","radio"};
  public int dictType;//数据字典类型
  public String getDictType(){
    return DICTTYPES__[dictType];
  }
  public void setDictType(String dictType){
    for(int i = 0;i<DICTTYPES__.length;i++){
      if(DICTTYPES__[i].equals(dictType)){
        this.dictType = i;
        return;
      }
    }
  }
  //系统提供的css样式
  public static String[] SYSTEM_CSS_CLASSES = {
      "selectStyleLong","selectStyleNormal",
      "inputTextLong","inputTextNormal","inputTextNumber",
      "textarea",
      "button",
      "fieldsetNormal",
      ""
  };
  private static int[][] SYSTEM_CSS_SELECTABLE;
  //获得类型type相对应的css
  public static int[] getSelectableCss(int type){
    if(SYSTEM_CSS_SELECTABLE == null){
      SYSTEM_CSS_SELECTABLE = new int[SHOWTYPES__.length][];
      //下拉列表
      int i = SELECT;
      SYSTEM_CSS_SELECTABLE[i] = new int[] {0, 1};
      //文本框
      i = INPUT;
      SYSTEM_CSS_SELECTABLE[i] = new int[] {2, 3, 4};
      //文本区域
      i = TEXTAREA;
      SYSTEM_CSS_SELECTABLE[i] = new int[] {5};
      //上传文件
      i = INPUTFILE;
      SYSTEM_CSS_SELECTABLE[i] = new int[] {2,3,4};
      //文本按钮
      i = INPUTWIN;
      SYSTEM_CSS_SELECTABLE[i] = new int[] {6};
      //单选框
      i = RADIO;
      SYSTEM_CSS_SELECTABLE[i] = new int[] {7};
      //复选框
      i = CHECKBOX;
      SYSTEM_CSS_SELECTABLE[i] = new int[] {7};
      //不显示
      i = INVISIBLE;
      SYSTEM_CSS_SELECTABLE[i] = new int[] {8};
    }
    return SYSTEM_CSS_SELECTABLE[type];
  }
  public String dictvalGetType;
  public String dictShowType;
  public static String[] eventIntr;
  public static String[] eventName;
  private static int counterForEventInit = 0;
  private static void addEventForInit(String _eventName,String _eventIntr){
    eventName[counterForEventInit] = _eventName;
    eventIntr[counterForEventInit] = _eventIntr;
    counterForEventInit++;
  };
  static{
    counterForEventInit = 0;
    eventIntr = new String[14];
    eventName = new String[14];

    addEventForInit("onblur","失去焦点");
    addEventForInit("onchange","改变");
    addEventForInit("onclick","鼠标单击");
    addEventForInit("ondblclick","鼠标双击");
    addEventForInit("onfocus","获得焦点");
    addEventForInit("onkeydown","键盘键按下");
    addEventForInit("onkeypress","键盘普通键按下");
    addEventForInit("onkeyup","键盘键弹起");
    addEventForInit("onmousedown","鼠标按下");
    addEventForInit("onmousemove","鼠标移动");
    addEventForInit("onmouseout", "鼠标移出");
    addEventForInit("onmouseover","鼠标移入");
    addEventForInit("onmouseup","鼠标键按下");
    addEventForInit("onselect", "被选");
  }
/*   public static String[] eventName = new String[]{
      //一般事件
      "onclick","ondblclick","onmousedown","onmouseup",
      "onmouseover","onmousemove","onmouseout","onkeypress",
      "onkeydown","onkeyup",
      //页面相关事件
      "onabort","onbeforeunload","onerror","onload",
      "onmove","onresize","onscroll","onstop","onunload",
      //表单相关事件
      "onblur","onchange","onfocus","onreset","onsubmit",
      //滚动字幕事件
      "onbounce","onfinish","onstart",
      //编辑事件
      "onbeforecopy","onbeforecut","onbeforeeditfocus",
      "onbeforepaste","onbeforeupdate","oncontextmenu",
      "oncopy","oncut","ondrag","ondragdrop","ondragend",
      "ondragenter","ondragleave","ondragover","ondragstart",
      "ondrop","onlosecapture","onpaste","onselect","onselectstart",
      //数据绑定
      "onafterupdate","oncellchange","ondataavailable",
      "ondatasetchanged","ondatasetcomplete","onerrorupdate",
      "onrowenter","onrowexit","onrowsdelete","onrowsinserted",
      //外部事件
      "onafterprint","onbeforeprint","onfilterchange","onhelp",
      "onpropertychange","onreadystatechange"};*/
  public boolean[] event = new boolean[eventName.length];

  public static String getFunction(FieldItemModel fim,String event){
    return fim.getTable()+"_"+fim.getField()+"_"+event+"(this)";
  }
  public static String getEventString(FieldItemModel fim,String event){
    return event + "=\""+getFunction(fim,event)+"\"";
  }
  public static String getEventString(FieldItemModel fim){
    StringBuffer sb = new StringBuffer();
    for(int i =0;i<eventName.length;i++){
      if(fim.event[i]){
        sb.append(" ");
        sb.append(getEventString(fim, eventName[i]));
      }
    }
    sb.append(" ");
    String result = sb.toString();
    if(result.length() == 0)result = null;
    return result;
  }
}
