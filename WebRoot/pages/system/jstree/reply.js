var reply_blog_source = null;
var blog_reply_content = null;
function replyBlog(){
  this.ask = function(url,functionname){
    http_request = false;
    if (window.XMLHttpRequest) { // Mozilla, Safari,...
      http_request = new XMLHttpRequest();
      if (http_request.overrideMimeType) {
          http_request.overrideMimeType('text/xml');
      }
    }
    else if (window.ActiveXObject) { // IE
      try {
        http_request = new ActiveXObject("Msxml2.XMLHTTP");
      }
      catch (e) {
        try {
          http_request = new ActiveXObject("Microsoft.XMLHTTP");
        }
	    catch (e) {}
      }
    }
    if (!http_request) {
      alert('Giving up :( Cannot create an XMLHTTP instance');
      return false;
    }
    http_request.onreadystatechange = functionname;
    http_request.open('POST', url, true);
	http_request.setRequestHeader("contentType","text/html;charset=gb2312");
	http_request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    http_request.send(blog_reply_content);
  }
  
  this.replyBlog = function(){
    if (http_request.readyState == 4) {
      if (http_request.status == 200) {
		tbody_ele = reply_blog_source.parentNode.parentNode.parentNode;
		get_child_by_id(tbody_ele,"blogreplyContainer").childNodes.item(0).innerHTML = http_request.responseText;
      } else {
		tbody_ele = reply_blog_source.parentNode.parentNode.parentNode;
		get_child_by_id(tbody_ele,"blogreplyContainer").childNodes.item(0).innerHTML = http_request.responseText;
        alert('There was a problem with the request.');
      }
    }
  }
}

function reply_blog(source,id){
  reply = new replyBlog();
  reply_blog_source = source;
  reply_blog_id = id;
  blog_reply_content = null;
  reply.ask("com.beans.blog.ReplyListAction.ac?blog.id="+id,reply.replyBlog);
}

function add_blog_reply(source){
  reply = new replyBlog();
  reply_blog_source = source.parentNode;
  form_ele = source.parentNode;
  reply_blogid_ele = get_child_by_id(form_ele,"reply_blogid_");
  reply_reply_ele = get_child_by_id(form_ele,"reply_reply_");
  reply_authorName_ele = get_child_by_id(form_ele,"reply_authorName_");
  reply_authorUrl_ele = get_child_by_id(form_ele,"reply_authorUrl_");
  reply_email_ele = get_child_by_id(form_ele,"reply_email_");

  content = "reply.blogid="+reply_blogid_ele.getAttribute("value")
	  + "&reply.reply="+reply_reply_ele.innerHTML
	  + "&reply.authorName="+reply_authorName_ele.getAttribute("value");
      + "&reply.authorUrl="+reply_authorUrl_ele.getAttribute("value");
      + "&reply.email="+reply_email_ele.getAttribute("value");

  blog_reply_content = content;
//  window.location="com.beans.blog.ReplyExecuteAction.act?"+content;
  reply.ask("com.beans.blog.ReplyExecuteAction.ac",reply.replyBlog);
}

function delete_blog_reply(source,id,blogid){
  reply = new replyBlog();
  reply_blog_source = source.parentNode.parentNode.parentNode.parentNode;
  blog_reply_content = null;
  reply.ask("com.beans.blog.ReplyExecuteAction.ac?delete=true&reply.id="+id+"&reply.blogid="+blogid,reply.replyBlog);
}

function get_child_by_id(element,id){
  children = element.childNodes;
  for(i = 0;i<children.length;i++){
	ele = children.item(i);
    if(ele.getAttribute("id")==id){
      return ele;
    }
  }
}
