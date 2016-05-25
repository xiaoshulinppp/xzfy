样式表说明

重定义样式：（只是对整体的页面显示控制，一般不需要改动和添加）
body{}
div{}
table{}

伪类样式：（控制连接的显示样式）
a:link{}
a:visited{}
a:active{}
a:hover{}
以上4句提供对连接的一种样式控制
如需增加连接样式，即在一种系统风格中需要提供两种连接样式（譬如风格四）
则增加一组
a.tt:link{}
a.tt:visited{}
a.tt:active{}
a.tt:hover{}

自定义样式
.titlefont1    
.titlefont2     是两种对字体的样式控制

.word{}         是对<td>....</td>标签中的一段文本的样式控制（主要用于介绍行说明文字）

.xxline{}       显示为一条虚线

.tabout{}       为表格外边框（譬如<table class=tabout>）

.thlist{}       对表格的第一行的样式控制（譬如<td class=thlist>）

.trcolor{}
.trwhite{}      对整行的表格的颜色进行控制（如<tr class=trcolor>）

.tdlist{}       对单元格的样式进行控制，显示内容位置居中（如<td class=tdlist>）
.tdulleft{}     对单元格的样式进行控制,显示内容位置向左对齐，宽度70%
.tdulright{}    对单元格的样式进行控制,显示内容位置向右对齐，宽度30%
.tdulinput{}    对单元格的样式进行控制,显示内容位置向左对齐，对宽度无规定
.tdultext{}     对单元格的样式进行控制,显示内容位置向右对齐，对宽度无规定
.textarea{}     对文本域的样式控制
.button{}       对一般按钮的样式控制
.sbutton{}      对小型按钮的样式控制，如 go等
.inputtext{}    对输入框的样式控制，宽度为50%
.inputinf{}     对输入框的样式控制，对宽度无规定