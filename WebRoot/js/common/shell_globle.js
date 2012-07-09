/******************************************************
 * @SHELL Gloable JS v1.0
 *
 * DateTime: 2012.7.9
 * By changming.Y
 *
 *****************************************************/

/**
 * 表单提交通用函数
 * @param currentPage 当前页码
 * @param _action form的action
 * @param _formName form的名称
 * @returns {Boolean}
 */
function doSubmit(currentPage,_action,_formName){
	if(currentPage!=null && currentPage>0){
		document.getElementById("currentPage").value = currentPage;
	}
	if(_action==null || _action==undefined){
		_action = document.forms[0].action;
		if(_action==null || _action==undefined){
			alert('Action Undefied!');
			throw 'Action Undefied!';
		}
	}
	if(_formName==null || _formName==undefined){
		_formName = document.forms[0].name;
	}
	
	try{
		var _form = document.forms[_formName];
		with(_form){
			action = _action;
			submit();
		}
	}catch(error){
		alert(error.name + ":" + error.message);
		return false;
	}
}

/**
 * JQUERY AJAX加载 数据/页面 到指定区域
 * @param url 请求的url或者页面地址
 * @param pageContainerID 装载页面容器id
 */
function loadDataFunc(url,pageContainerID){
	$('#'+pageContainerID).load(url);
}







