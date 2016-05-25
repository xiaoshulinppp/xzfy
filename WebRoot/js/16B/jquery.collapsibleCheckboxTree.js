/**
 * Project: Collapsible Checkbox Tree jQuery Plugin Version: 1.0.1 Author: Lewis
 * Jenkins Website:
 * http://www.redcarrot.co.uk/2009/11/11/collapsible-checkbox-tree-jquery-plugin/
 * 
 * License: The CheckTree jQuery plugin is currently available for use in all
 * personal or commercial projects under both MIT and GPL licenses. This means
 * that you can choose the license that best suits your project and use it
 * accordingly.
 */
var rootId = 'chkbxTree';
var url = '/knowledge/manknowledge_queryChildren.hx';
var liStr = '<li><span>&nbsp;</span><input type="hidden" name="kpcode" value="${kp.knowledgeCode}" /> <div>${kp.knowledgeName} [${kp.knowledgeCode}]</div><ul></ul></li>';
(function($) {
	$.fn.collapsibleCheckboxTree = function(options) {
		var defaults = {
			checkParents : true, 		// 当勾选一个节点时,全部父节点都勾选
			// checked
			checkChildren : false, 		// 当勾选一个节点时,所有子节点都勾选
			// checked
			uncheckChildren : true, 	// 当取消勾选一个节点时,所有子节点都取消勾选
			// unchecked
			initialState : 'default', 	// Options - 'expand' (默认全部展开),
										// 'collapse' (默认全部收缩) or
										// 'default' (默认打开选中节点)
			inputName: ''	
		};
		var options = $.extend(defaults, options);
		this.each(function() {
			var $root = this;
			// 添加按钮
				$(this)
						.before(
								'<!--<button id="expand">展开全部</button>--><button id="collapse">收缩全部</button><!--<button id="default">已选</button>-->');
				// 隐藏除了顶级节点外的所有节点
				$("ul", $(this)).addClass('hide');
				// Check parents if necessary
				/*if (defaults.checkParents) {
					$("input:checked").parents("li").find(
							"input[type='checkbox']:first").attr('checked',
							true);
				}*/
				// 如果开启checkChildren=true,选中上级节点时,选中全部下级节点(包括孙,重孙...所有下级级别)
				/*if (defaults.checkChildren) {
					$("input:checked").parent("li").find(
							"input[type='checkbox']").attr('checked', true);
				}*/
				// 显示选中节点及所有次级节点
				$("li:has(input:checked) > ul", $(this)).removeClass('hide');
				// 为显示的节点添加+/-
				$("li", $(this)).prepend('<span>&nbsp;</span>');
				$("li:has(> ul:not(.hide)) > span", $(this)).addClass(
						'expanded').html('-');
				$("li:has(> ul.hide) > span", $(this)).addClass('collapsed')
						.html('+');
				// 勾选框逻辑--------------->
				/*$("input[type='checkbox']", $(this))
						.click(function() {
							// 如果勾选 ...
								if ($(this).is(":checked")) {
									// 显示所有次级
									treeClickHandle($(this));
									$("> ul", $(this).parent("li"))
											.removeClass('hide');
									// 更新节点样式
									$("> span.collapsed", $(this).parent("li"))
											.removeClass("collapsed").addClass(
													"expanded").html('-');
									// 选中父级节点
									if (defaults.checkParents) {
										$(this).parents("li").find(
												"input[type='checkbox']:first")
												.attr('checked', true);
									}
									// 选中
									if (defaults.checkChildren) {
										$(this).parent("li").find(
												"input[type='checkbox']").attr(
												'checked', true);
										// 显示所有次级
										$("ul", $(this).parent("li"))
												.removeClass('hide');
										// 更新节点样式
										$("span.collapsed",
												$(this).parent("li"))
												.removeClass("collapsed")
												.addClass("expanded").html('-');
									}
									// 如果取消勾选...
								} else {
									// 取消所有次级勾选
									if (defaults.uncheckChildren) {
										$(this).parent("li").find(
												"input[type='checkbox']").attr(
												'checked', false);
										// 隐藏所有次级
										$("ul", $(this).parent("li")).addClass(
												'hide');
										// 更新节点样式
										$("span.expanded", $(this).parent("li"))
												.removeClass("expanded")
												.addClass("collapsed")
												.html('+');
									}
								}
								//treeClickHandle($(this));
							});*/

				// 树展示逻辑--------------->				
				$("li:has(> ul) span",$(this)).click(function(){treeClickHandle($(this))});	
				$('li:has(> ul) div',$(this)).click(function(){treeClickHandle($(this))});	
				
				function treeClickHandle(obj){
					var spanObj = null;
					var divObj = null;
					var inputObj = null;
					var kpcode = null;
					//判断标签类型
					var isSpan = obj.is('span');
					var isDiv = obj.is('div');
					var isInput =  obj.is("input");
					
					if(isInput){
						spanObj = obj.parent().children('span:first');
						divObj = obj.parent().children('div:first');
						inputObj = obj;						
					}else if(isDiv){
						spanObj = obj.parent().children('span:first');
						divObj = obj;
						inputObj = obj.parent().children('input:first');
					}else if(isSpan){
						spanObj = obj;
						divObj = obj.parent().children('div:first');
						inputObj = obj.parent().children('input:first');
					}	
					
					kpcode = inputObj.val();	
					//
					$('li:has(> ul) div').removeClass('high_light');
					if (kpcode != null) {
						treeView(spanObj);
					}else{
						if (spanObj.is(".collapsed")) {	
							$("> ul", obj.parent("li")).removeClass('hide');
							spanObj.removeClass("collapsed").addClass("expanded").html('-');
							//单击当前节点背景高亮
							divObj.addClass('high_light');
						} else if (spanObj.is(".expanded")) {
							$("> ul", obj.parent("li")).addClass('hide');	
							spanObj.removeClass("expanded").addClass("collapsed").html('+');	
							//关闭当前节点背景去掉高亮
							divObj.removeClass('high_light');
						}
					}					
				}//end function
				
				function treeView(spanObj) {	
					var isSpan = spanObj.is('span');
					var kpcode = spanObj.siblings('input:first').val();
					var ulObj = spanObj.siblings('ul:first');
					if (kpcode != null) {//end if pcode is not null
							if(spanObj.is('.collapsed')){
									// ajax获取次级数据
									$.post(url, {
										'kpcode' : kpcode,
										'random' : Math.random() * 100
									}, function(json) {
										if (json != null && json.length > 0) {
											var json = eval('(' + json + ')');								
											var kpArr = new Array();
											for(var i=0;i<json['chdList'].length;i++){//从map中获取List,每个list元素转换成一个js对象
												eval("var kp = {\'"+json['chdList'][i]+"\'}");
												//构造树节点代码,替换占位符
												var chdNodeStr = liStr.replace(/${kp.knowledgeCode}/gi, kp.knowledgeCode)
															 .replace('${kp.knowledgeName}', kp.knowledgeName);
												kpArr[i] = chdNodeStr;
											}											
											// If was previously collapsed...
											if(ulObj.html().length == 0){
												for(var i=0;i<kpArr.length;i++){//写入子节点代码
													ulObj.append(kpArr[i]);																					
												}
												var ajaxSpan = ulObj.children('li:has(> ul)').children('span');
												var ajaxDiv = ulObj.children('li:has(> ul)').children('div');
												var ajaxInput = ulObj.children('li:has(> ul)').children('input');
												ajaxSpan.addClass('collapsed').html('+');
												ajaxSpan.bind("click", function(){treeClickHandle($(this));});	
												ajaxDiv.bind("dblclick", function(){dblClickDivHandle($(this));});
												ajaxDiv.bind("click", function(){treeClickHandle($(this));});
											}
											//显示次级节点(ajax生成)
											$("> ul", spanObj.parent("li")).removeClass('hide');
											spanObj.removeClass("collapsed").addClass("expanded").html('-');	
											//单击当前节点背景高亮
											spanObj.siblings('div:first').addClass('high_light');
										}//end call back function
									});//end ajax
								}else if(spanObj.is('.expanded')){
									//隐藏次级节点									
									$("> ul", spanObj.parent("li")).addClass('hide');
									spanObj.removeClass("expanded").addClass("collapsed").html('+');
									spanObj.siblings('div:first').removeClass('high_light');
								}													
						}//end if					
				}//end function
				
				//双击返回code
				$('li:has(> ul) div').dblclick(function(){
					dblClickDivHandle($(this));	
				});
				
				function dblClickDivHandle(obj){
					var inputObj = obj.siblings('input:first');
					if(inputObj == null || inputObj.val() == null){
						//alert('对不起,该分类没有分配知识点code,请选择下级知识点.');
					}else if(inputObj != null && inputObj.val() != null){						
						window.returnValue = inputObj.val();
						window.close();
					}	
				}
				
				// 按钮逻辑--------------->
				// 展开所有(暂不使用,因为ajax加入后,这样做效率不高)
				$("#expand").click(function() {
					// Show all children
						$("ul", $root).removeClass('hide');
						// and update the html
						$("li:has(> ul) > span", $root)
								.removeClass("collapsed").addClass("expanded")
								.html('-');
						return false;
					});
				// 收缩全部
				$("#collapse").click(function() {
					// Hide all children
						$("ul", $root).addClass('hide');
						// and update the html
						$("li:has(> ul) > span", $root).removeClass("expanded")
								.addClass("collapsed").html('+');
						return false;
					});
				// 只展开默认勾选的部分(默认)
				$("#default").click(function() {
					// Hide all except top level
						$("ul", $root).addClass('hide');
						// Show checked and immediate children of checked
						$("li:has(input:checked) > ul", $root).removeClass(
								'hide');
						// and update the html
						$("li:has(> ul:not(.hide)) > span", $root).removeClass(
								'collapsed').addClass('expanded').html('-');
						$("li:has(> ul.hide) > span", $root).removeClass(
								'expanded').addClass('collapsed').html('+');
						return false;
					});
				switch (defaults.initialState) {
				case 'expand':
					$("#expand").trigger('click');
					break;
				case 'collapse':
					$("#collapse").trigger('click');
					break;
				}
			});
		return this;
	};
})(jQuery);
