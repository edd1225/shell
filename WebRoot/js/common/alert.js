//弹出框，模拟遮罩效果

var isIe=(document.all)?true:false; 
//设置select的可见状态 

function setSelectState(state) 
{ 
 var objl=document.getElementsByTagName('select'); 
 var i=0;
 var j=0;
 for(i=0;i<objl.length;i++) 
 { 
 objl[i].style.visibility=state; 
 } 
} 

function mousePosition(ev) 
{ 
	 if(ev.pageX || ev.pageY) 
	 { 
		 return {x:ev.pageX, y:ev.pageY}; 
	 } 
	 return {x:ev.clientX + document.body.scrollLeft - document.body.clientLeft,y:ev.clientY + document.body.scrollTop - document.body.clientTop }; 
} 


function v_openAlertWin(){
   
}



//弹出方法 
function showMessageBox(wTitle,content,pos,wWidth,wHeight) 
{ 
	 closeWindow(); 
	 var bWidth=1600;//parseInt(document.documentElement.scrollWidth); 
	 var bHeight=parseInt(document.documentElement.scrollHeight-20); 
	 if(isIe){ 
	 setSelectState('hidden');} 
	 var back=document.createElement("div"); 
	 back.id="back"; 
	 var styleStr="z-index:8;top:0px;left:0px;position:absolute;background:#666;width:100%;height:100%;"; 
	 styleStr+=(isIe)?"filter:alpha(opacity=0);":"opacity:0;"; 
	 back.style.cssText=styleStr; 
	 document.body.appendChild(back); 
	 showBackground(back,50); 
	 var mesW=document.createElement("div"); 
	 mesW.id="mesWindow"; 
	 mesW.className="mesWindow"; 
	 
	 mesW.innerHTML="<table width='100%' height='100%' bgcolor='#eff5fe' >" +
	 		"<tr height='10px'><td align='left'>"+wTitle+"</td>" +
	 				"<td  align='right'>" +
	 					"<input type='button' onclick='closeWindow();' title='关闭窗口' style='cursor:pointer' class='close' value='关闭' />" +
	 				"</td>" +
	 		"</tr>" +
	 		"<tr width='100%' >" +
	 				"<td colspan='2'><p align='center' height='100%'>"+content+"</span>" +
	 				"</td>" +
	 		"</tr></table>"; 
	 
	 //mesW.innerHTML="<table width='100%' height='100%' bgcolor='#eff5fe' ><tr height='10px'><td align='left'>"+wTitle+"</td><td  align='right'>&nbsp;</td></tr><tr  width='100%' ><td colspan='2'><p align='center' height='100%'>"+content+"</span></td></tr></table>"; 
	 
	 styleStr="z-index:10;left:"+(pos.x-200)+"px;top:"+(pos.y-100)+"px;position:absolute;width:"+wWidth+"px;height:"+wHeight+"px"; 
	 mesW.style.cssText=styleStr; 
	 document.body.appendChild(mesW); 
} 


//让背景渐渐变暗 
 function showBackground(obj,endInt) 
{ 
 if(isIe) 
 { 
 obj.filters.alpha.opacity+=1; 
 if(obj.filters.alpha.opacity<endInt) 
 { 
 setTimeout(function(){showBackground(obj,endInt)},5); 
 } 
 }else{ 
 var al=parseFloat(obj.style.opacity);
 al+=0.1; 
 obj.style.opacity=al; 
 if(al<(endInt/100)) 
 {setTimeout(function(){showBackground(obj,endInt)},5);} 
 } 
} 
 
 
//关闭窗口 
function closeWindow() 
{ 
	 if(document.getElementById('back')!=null) 
	 { 
	 document.getElementById('back').parentNode.removeChild(document.getElementById('back')); 
	 } 
	 if(document.getElementById('mesWindow')!=null) 
	 { 
	        var iframe=document.getElementById("v_popupWinIframe");
	        if(iframe!=null){
	                 iframe.src="about:blank";
	        }        
	  document.getElementById('mesWindow').parentNode.removeChild(document.getElementById('mesWindow')); 
	 } 
	 
	 if(isIe){ 
	 setSelectState('');} 
} 


//测试弹出 
function testMessageBox(ev) 
{ 
	 var objPos = mousePosition(ev); 
	 messContent="<div style='padding:20px 0 20px 0;text-align:center'>中国站长站</div>"; 
	 showMessageBox('窗口标题',messContent,objPos,150,100); 
} 

