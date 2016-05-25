//********************************************************************
// $author: Eric Chan
// $Revision: 1.2 $, $Date: 2005/05/11 11:20:45 $
//******************************************************************** 


/**
 * ��ת��ָ��url��ַ
 *
 * @param targetUrl ҳ����ת��ַ
 */
function goNext(targetUrl) {
    document.location.href = targetUrl;
}

/**
 * �ύ�?
 *
 * @param form �?��
 * @param actionUrl (optional) action��ַ
 */
function submitForm(form, actionUrl) {
    if (typeof actionUrl != "undefined" && actionUrl != "") {
        form.action = actionUrl;
    }    
    form.submit();
}

/**
 * ��post��ʽ�ύ�?,����ʾȷ�Ͽ�
 * 
 * @param form �?��
 * @param targetUrl ҳ����ת��ַ
 * @param message ȷ����Ϣ
 */
function confirmSubmit(form, targetUrl, message) {
    if (confirm(message)) {
		submitForm(form, targetUrl);
	} else {
		return;
	}
}    

// clear and fill the input
function clearText(inp, val) {
 
	if (inp.value == val) inp.value = "";
}

function fillText(inp, val) {
	if (inp.value == "") inp.value = val;
}
function selectAll(val) {
   alert("11111");
}
