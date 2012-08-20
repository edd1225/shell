/******************************************************
 * @SHELL Util JS v1.0
 * Javascript 工具類
 * DateTime: 2012.8.6
 * By changming.Y
 *****************************************************/

/**
 * 字符串trim操作
 */
String.prototype.trim = function(){
	return this.replace(/(^\s*)|(\s*$)/g, "");
};


/**
 * 键盘事件
 */
function keyPress(e){
   if(e.keyCode==13){
      //document.forms[0].submit();
   }
}


/**
 * 获取DOM對象
 */
function findObj(theObj, theDoc)
{
  var p, i, foundObj;
  
  if(!theDoc) theDoc = document;
  if( (p = theObj.indexOf("?")) > 0 && parent.frames.length)
  {
    theDoc = parent.frames[theObj.substring(p+1)].document;
    theObj = theObj.substring(0,p);
  }
  if(!(foundObj = theDoc[theObj]) && theDoc.all) foundObj = theDoc.all[theObj];
  for (i=0; !foundObj && i < theDoc.forms.length; i++) 
    foundObj = theDoc.forms[i][theObj];
  for(i=0; !foundObj && theDoc.layers && i < theDoc.layers.length; i++) 
    foundObj = findObj(theObj,theDoc.layers[i].document);
  if(!foundObj && document.getElementById) foundObj = document.getElementById(theObj);
  
  return foundObj;
}



/**
 * 去除字符串左右两边的空格
 */
function trim(str){
	var regExp = /[^\s]+(\s+[^\s]+)*/;
	 
	if(str == null)
		return str;
	var matchs = str.match(regExp);
	if(matchs != null)
		return matchs[0];
	return "";
}

/**
 * 获得真正字符串，转换HTML特殊字符为原来的显示字符
 * 返回真正html显示字符串
 */
function getRealString(s){
	  s=replaceString(s,"&lt;","<");
	  s=replaceString(s,"&gt;",">");
	  s=replaceString(s,"&amp;","&");
	  s=replaceString(s,"&quot;","\"");
	  return s;
}


/**
 * 在固定字符串s中，用s2替换所有的字符串s1
 * 返回替换后的新字符串s
 */
function replaceString(s,s1,s2){
  if(s.indexOf(s1)>=0){
    s=s.substring(0,s.indexOf(s1))+s2+s.substring(s.indexOf(s1)+s1.length);
    s=replaceString(s,s1,s2);
  }
  return s;
}


/**
 * 判断是否是整数(0...9)
 */
function isInteger(inputVal){
  var inputStr=inputVal.toString();
  for(var i=0;i<inputStr.length;i++) {
    var oneChar=inputStr.charAt(i);
    if(oneChar<"0"||oneChar>"9"){
      return false;
    }  
  }
  return true;
}


/**
 * 判断是否是空字符串或者是空格字符串
 * 只要不全部都是空字符或者空格字符串，即返回fasle
 * 只有全部都是空字符[“ ”]或者空格字符串，不包含其他非空字符串字符，才返回true
 */
function isVoidStr(inputVal){
  if(inputVal.length==0){
    return true;
  } else {	
    var oneChar="";
    for(var i=0;i<inputVal.length;i++) {
      oneChar=inputVal.charAt(i);
      if(oneChar!=' ') {
        return false;
      }
    }
  }
  return true;
}

/**
 * 选中/去选 所有复选框
 * all_box 全选checkbox按钮
 * group_box 同名checkbox
 */
function selectAll(all_box, group_box) {
	var main_checkbox = document.getElementById(all_box);
	var sub_boxes = document.getElementsByName(group_box);
	for (var i = 0; i < sub_boxes.length; i++) {
		if (main_checkbox.checked) {
			sub_boxes[i].checked = true;
		} else {
			sub_boxes[i].checked = false;
		}
	}
}


/**
 * 复选框是否有被选中
 * @param checkBox_name 复选框组名
 * @returns {Boolean} 至少选中一个返回选中的第一个checkbox的vaule属性值，否则返回false
 */
function checkBoxSelected(checkBox_name){
	var checkBoxes = document.getElementsByName(checkBox_name);
	for(var i=0;i<checkBoxes.length;i++){
		if(checkBoxes[i].checked){
			return checkBoxes[i].value;
		}
	}
	return false;
}


/**
 * 返回指定checkbox组选中个数
 * @param checkBox_name checkbox组名
 * @returns {Number} 选中个数
 */
function checkBoxSelectedCount(checkBox_name){
	var checkBoxes = document.getElementsByName(checkBox_name);
	var selectedCount=0;
	for(var i=0;i<checkBoxes.length;i++){
		if(checkBoxes[i].checked){
			selectedCount=selectedCount+1;
		}
	}
	return selectedCount;
}


/**
 * 把指定的一组checkbox所选的值构造为中划线分隔的字符串，赋值给elem指定的表单元素
 * @param group_box checkbox组名
 * @param elemName 表单元素id或者name
 * @returns {String} 中划线分隔的字符串
 */
function getcheckBoxAllValue(group_box, elemName) {
	var boxes = document.getElementsByName(group_box);
	var values = "";
	for (var i = 0; i < boxes.length; i++) {
		if (boxes[i].checked) {
			values += boxes[i].value + "-";
		}
	}
	if (values.length > 0) {
		values = values.substring(0, values.length - 1);
	}
	if (elemName) {
		var elem = document.getElementById(elemName);
		if (elem) {
			elem.value = values;
		} else {
			var elems = document.getElementsByName(elemName);
			if (elems && elems.length > 0) {
				elems[0].value = values;
			}
		}
	}
	return values;
}




/**
 * 新建窗口，位于屏幕中央
 * 无菜单栏 无工具栏 无标题栏
 */
function openNewWindow(xURL, xwidth, xheight) {
	var showx = (window.screen.availWidth - xwidth) / 2;
	var showy = (window.screen.availHeight - xheight) / 2;
	var retval = window.open(xURL, "_blank", "resizable=yes,height=" + xheight + ",width=" + xwidth + ",left=" + showx + ",top=" + showy + ",menubar=no,scrollbars=yes,toolbar=no,titlebar=no");
}


/**
* 判断给定中英文混合串长度是否超长
* value:待判断的字符串
* max:允许的最大长度
* ignoreZh：是否忽略中文。如果设置ignoreZh为true，则中为也认为是一个字符，否则，中文认为是两个字符。
* 默认中文按两个字符计算。
*/
function validateMaxLen(value, max, ignoreZh) {
	if (!max) {
		return true;
	}
	return caculateLength(value, ignoreZh) <= max;
}


/**
* 计算目标字符串的长度。如果ignore为true，中文认为是一个字符；否则，中文作两个字符处理。
* value：目标字符串
* ignoreZh：是否忽略中文
*/
function caculateLength(value, ignoreZh) {
	if (!value) {
		return 0;
	}
	if (ignoreZh) {
		return value.length;
	}
	var len = 0;
	for (var i = 0; i < value.length; i++) {
		if (value.charCodeAt(i) < 128 && value.charCodeAt(i) > 0) {
			len++;
		} else {
			len = len + 2;
		}
	}
	return len;
}


/**
 * 对form中的每个元素做trim操作
 * @param theForm form表单
 */
function trimForm(theForm) {
	var obj = theForm || event.srcElement;
	var count = obj.elements.length;
	for (var i = 0; i < count; i++) {
		with (obj.elements[i]) {
			if (type == "button" || type == "submit" || value == "") {
				continue;
			} else {
				value = value.trim();
			}
		}
	}
}


/**
 * 过滤输入框中的中文中划线，把它替换为两个英文的中划线
 */
function replaceDash(theForm) {
	var obj = theForm || event.srcElement;
	var count = obj.elements.length;
	for (var i = 0; i < count; i++) {
		with (obj.elements[i]) {
			if (type == "button" || type == "submit" || value == "") {
				continue;
			} else {
				value = value.replace(/—/g, "--");
			}
		}
	}
}


/**
 *	过滤英文的单引号、双引号，改成中文的单引号和双引号
 */
function replaceSpecial(theForm) {
	var obj = theForm || event.srcElement;
	var count = obj.elements.length;
	for (var i = 0; i < count; i++) {
		with (obj.elements[i]) {
			if (type == "button" || type == "submit" || value == "") {
				continue;
			} else {
				value = value.replace(/'/g, "\u2019");
				value = value.replace(/"/g, "\u201d");
			}
		}
	}
}


/**
 * 清除表单中每个对象的值中的空格字符
 * @param theForm
 */
function clearAllSpace(theForm) {
	var obj = theForm || event.srcElement;
	var count = obj.elements.length;
	for (var i = 0; i < count; i++) {
		with (obj.elements[i]) {
			if (type == "button" || type == "submit" || value == "") {
				continue;
			} else {
				value = value.replace(/\s+/g, "");
			}
		}
	}
}


/**
 * 标识表格中一行的颜色
 */
function markTr(trId,tableId){
	if(!tableId)
		tableId="hollylistTable";
	var listTable=document.getElementById(tableId);
	var childNodes=listTable.rows;
	for(var i=1;i<childNodes.length;i++){
		childNodes[i].style.background = "#FFFFFF";
	}
	var markTr=document.getElementById("tr_"+trId);
	if(markTr)
		markTr.style.background = "#F7F7CC"
}





//==================================================================-------------------

/**
 * 先判断是不是在标签页中，如果在，就关闭标签页，否则，关闭窗口
 */
function shutdownWindow(currentIndex) {
	if(currentIndex==null) currentIndex=-1;
	try{
	if(top.v_closeCurrentTab){
	   	top.v_closeCurrentTab();
	}else if(window.close){
		window.opener=null;
		window.open('',"_self");
	   	//if(getCurrentTabIndex()==currentIndex){
	   	 //alert("currentIndex="+currentIndex);
	   	 window.close();
	   	//}else{
	   	 //alert("getCurrentTabIndex()="+getCurrentTabIndex()+" currentIndex="+currentIndex);
	   	//}
	}
	}catch(e){}
}
function refreshParent() {
	try
	{
		if (opener) {
			if (opener.refreshSelf) {
				opener.refreshSelf();
			}
		} else {
			if (window.dialogArguments) {
				if (window.dialogArguments.refreshSelf) {
					window.dialogArguments.refreshSelf();
				}
			} else {
	 		//在这里刷新父标签
	 			var parentTab="";
	 			try{
	 				parentTab=top.v_getCurrentTabVal();
	 			}catch(e){}
	 			if(parentTab){
	 				if(parentTab.refreshSelf){
	 					parentTab.refreshSelf();
	 				}
	 			} 
			}
		}
	}
	catch(e){}
}






function showTime(){ 
   var now = new Date(); 
   var year= now.getYear();
   var mon = now.getMonth() + 1;
   var day = now.getDate();
   var hh  = now.getHours(); 
   //var mm  = now.getMinutes(); 
   
   var date= year + '-';
   if (mon< 10) date += '0';
   date += mon + '-';
   if (day<10) date += '0';
   date += day + '-';
   if (hh<10) date += '0';
   date += hh ;
   return(date);
   
   //var ss  = now.getTime() % 60000; 
   //ss = (ss - (ss % 1000)) / 1000; 
   //var clock = year+'-'; 
   //var clock = hh+'-'; 
   //if (mm < 10) clock += '0'; 
   //clock += mm+'-'; 
   //if (ss < 10) clock += '0'; 
   //clock += ss; 
   //return(clock); 
}

