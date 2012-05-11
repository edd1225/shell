//to replace all string1 with string2 in a fixed string.
function replaceString(s,s1,s2){
  if(s.indexOf(s1)>=0){
    s=s.substring(0,s.indexOf(s1))+s2+s.substring(s.indexOf(s1)+s1.length);
    s=replaceString(s,s1,s2);
  }
  return s;
}
//��ʾ��ǰʱ��ĺ���
 function showTime(){ 
    var now = new Date(); 
    var year=now.getYear();
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

//��HTML����ת��Ϊʵ�ʶ�Ӧ���ַ�õ�������ַ�
function getRealString(s){
  s=replaceString(s,"&lt;","<");
  s=replaceString(s,"&gt;",">");
  s=replaceString(s,"&amp;","&");
  s=replaceString(s,"&quot;","\"");

  return s;
}

//to open a new window without status
function openwin(URL,winName,leftMargin,topMargin,winWidth,winHeight){
  window.open(URL,winName,"left="+leftMargin+" top="+topMargin+" width="+winWidth+", height="+winHeight+" menu=yes status=yes resizable=no scrollbars=yes");
}

//�ж��Ƿ���������
function isInteger(inputVal){
  inputStr=inputVal.toString();

  for(var i=0;i<inputStr.length;i++) {
    var oneChar=inputStr.charAt(i);
//    if(i==0&&oneChar=="0")
//      return false;
    if(oneChar<"0"||oneChar>"9"){
      return false;
    }  
  }
  return true;
}

//�ж��Ƿ���������,����ʾ
function isInteger(inputVal, strName){	
  inputStr=inputVal.toString();

  for(var i=0;i<inputStr.length;i++) {
    var oneChar=inputStr.charAt(i);
//    if(i==0&&oneChar=="0")
//      return false;
    if(oneChar<"0"||oneChar>"9"){
      alert("��Ŀ��"+strName+"��ֻ����д����0������");
      return false;
    }  
  }
  return true;
}

//�ж��Ƿ��ǿ��ַ��ո��ַ�
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

//�ж�EAMIL�Ƿ�Ϸ�
function check_email(address) {
  address=address;
  if ((address == "") || (address.indexOf ('@') == -1) || (address.indexOf ('.') == -1))
    return false;
  return true;
}

//�õ��ַ���ֽڳ���
function calculateStrLen(str){
  var i,intLen=0;
  for(i=0;i<str.length;i++){
    if (str.charCodeAt(i)>126){
      intLen++;
    }
    intLen++;
  }
  return intLen;
}

function telVerify(objText,intLength,strName ){
//У��绰����¼�����Ч��,��Ч����true,��Ч����false
  var strText=objText.value;

  if( strText.length > intLength){
    alert("��Ŀ��"+strName+"������ָ�����ȡ�");
    objText.focus();
    return false;
  }
	
  var i;
  for(i=0;i<strText.length;i++){
    if((strText.charCodeAt(i)<48 || strText.charCodeAt(i)>57) &&  strText.charCodeAt(i)!=45){
      alert("��Ŀ��"+strName+"��ֻ����д���ֺ����ַ�-��");
      objText.focus();
      return false;
    }
  }
  return true;
}

//ȥ�ո�ĺ���
function trim(str){
	var regExp = /[^\s]+(\s+[^\s]+)*/;
	if(str == null)
		return str;

	var matchs = str.match(regExp);
	if(matchs != null)
		return matchs[0];

	return "";
}
function textVerify(objText,blnEmpty,intLength,strName ){
//У���ı�¼�����Ч��,��Ч����true,��Ч����false
//objTextΪ��У���ҳ��?����blnEmpty��ʾ���ı��Ƿ��Ϊ��,true��ʾ��Ϊ�գ�false��ʾ����Ϊ�գ�
//intLength����ֽڳ��ȣ�strNameУ��Ķ�����Ŀ�����
  var strText=objText.value;

  if(trim(strText)=="" && blnEmpty==false){
    alert("��Ŀ��"+strName+"������Ϊ�ա�");
    objText.focus();
    return false;
  }
  if(calculateStrLen(trim(strText)) > intLength){
    alert("��Ŀ��"+strName+"��������ָ���ĳ��ȣ������");
    objText.focus();
    return false;
  }
  return true;
}

function charVerify(objText,blnEmpty,intLength,strName ){
//У�鴿��ĸ�ı�¼�����Ч��,��Ч����true,��Ч����false
  var strText=objText.value;
  if(strText=="" && blnEmpty==false){
    alert("��Ŀ��"+strName+"������Ϊ�ա�");
    objText.focus();
    return false;
  }
  var i;
  for(i=0;i<strText.length;i++){
    if(strText.charCodeAt(i)!=32){
      if(strText.charCodeAt(i)<65 || ( strText.charCodeAt(i)>90 && strText.charCodeAt(i)<97 )  ||  strText.charCodeAt(i)>122 ){
        alert("��Ŀ��"+strName+"��ֻ����д��ĸ��");
        objText.focus();
        return false;
      }
    }
  }
  if(strText.length > intLength){
    alert("��Ŀ��"+strName+"��������ָ���ĳ��ȣ������");
    objText.focus();
    return false;
  }
  return true;
}

function char_numVerify(objText,blnEmpty,intLength,strName ){
//У�鴿��ĸ�������ı�¼�����Ч��,��Ч����true,��Ч����false
  var strText=objText.value;
  if(strText=="" && blnEmpty==false){
    alert("��Ŀ��"+strName+"������Ϊ�ա�");
    objText.focus();
    return false;
  }
  var i;
  for(i=0;i<strText.length;i++){
    if(strText.charCodeAt(i)!=32){
      if(strText.charCodeAt(i)<48 || ( strText.charCodeAt(i)>57 && strText.charCodeAt(i)<65 )  || ( strText.charCodeAt(i)>90 && strText.charCodeAt(i)<97 )  ||  strText.charCodeAt(i)>122 ){
        alert("��Ŀ��"+strName+"��ֻ����д��ĸ�����֡�");
        objText.focus();
        return false;
      }
    }
  }
  if(strText.length > intLength){
    alert("��Ŀ��"+strName+"��������ָ���ĳ��ȣ������");
    objText.focus();
    return false;
  }
  return true;
}

function numberVerify(objText,blnEmpty,intLength,strName ){
//У�鴿�����ı�¼�����Ч��,��Ч����true,��Ч����false
  var strText=objText.value;
  if(strText=="" && blnEmpty==false){
    alert("��Ŀ��"+strName+"������Ϊ�ա�");
    objText.focus();
    return false;
  }
  var i;
  for(i=0;i<strText.length;i++){
    if((strText.charCodeAt(i)<48 || strText.charCodeAt(i)>57)){
      alert("��Ŀ��"+strName+"��ֻ����д���֡�");
      objText.focus();
      return false;
    }
  }
  if(strText.length > intLength){
    alert("��Ŀ��"+strName+"��������ָ���ĳ��ȣ������");
    objText.focus();
    return false;
  }
  return true;
}

function intVerify(objText,blnEmpty,intLength,strName ){
//У�������ı�¼�����Ч��,��Ч����true,��Ч����false
  var strText=objText.value;
  if(strText=="" && blnEmpty==false){
    alert("��Ŀ��"+strName+"������Ϊ�ա�");
    objText.focus();
    return false;
  }
  var i;
  for(i=0;i<strText.length;i++){
    if((strText.charCodeAt(i)<48 || strText.charCodeAt(i)>57)){
      alert("��Ŀ��"+strName+"��ֻ����д����");
      objText.focus();
      return false;
    }
  }
  if(strText.length > intLength){
    alert("��Ŀ��"+strName+"��������ָ���ĳ��ȣ������");
    objText.focus();
    return false;
  }
  return true;
}

function doubleVerify(objText,blnEmpty,totalLen,decimalLen,strName ){
//У���С�������ı�¼�����Ч��,��Ч����true,��Ч����false
  var strText=objText.value;
  if(strText=="" && blnEmpty==false){
    alert("��Ŀ��"+strName+"������Ϊ�ա�");
    objText.focus();
    return false;
  }
  var i;
  for(i=0;i<strText.length;i++){
    if((strText.charCodeAt(i)<48 || strText.charCodeAt(i)>57) &&  strText.charCodeAt(i)!=46&&  strText.charCodeAt(i)!=69){
      alert("��Ŀ��"+strName+"��ֻ����д���֡�");
      objText.focus();
      return false;
    }
  }

  var point=strText.indexOf('.');
  if( point==-1){
    if(strText.length > totalLen-decimalLen){
      alert("��Ŀ��"+strName+"����������ֹ�������");
      objText.focus();
      return false;
    }
  }else{
    if(point > totalLen-decimalLen){
      alert("��Ŀ��"+strName+"����������ֹ�������");
      objText.focus();
      return false;
    }
  }  
  return true;
}

function dateOrderVerify(objStart,objEnd,blnEmpty,strStartName,strEndName ){
//У��������ڵ���Ч��,��Ч����true,��Ч����false
  var strStart=trim(objStart.value);
  var strEnd=trim(objEnd.value);
  if(blnEmpty){
    if(strStart=="" || strEnd==""){
      return true;
    }
  }else{
    if(strStart==""){
      alert("��Ŀ��"+strStartName+"������Ϊ�ա�");
      objStart.focus();
      return false;
    }
    if(strEnd==""){
      alert("��Ŀ��"+strEndName+"������Ϊ�ա�");
      objEnd.focus();
      return false;
    }
  }

  var intStart=(strStart.substring(0,4))*10000+(strStart.substring(5,7))*100+(strStart.substring(8,10));
  var intEnd=(strEnd.substring(0,4))*10000+(strEnd.substring(5,7))*100+(strEnd.substring(8,10));
  if(intStart>intEnd){
    alert("��Ŀ��"+strStartName+"��ָ�������ڲ��ܱ���Ŀ��"+strEndName+"��ָ���������?");
    objStart.focus();
    return false;
  }else{
    return true;
  }
}
function dateOrderVerify2(objStart,objEnd,blnEmpty,strStartName,strEndName ){
//У��������ڵ���Ч��,��Ч����true,��Ч����false
  var strStart=trim(objStart.value);
  var strEnd=trim(objEnd.value);
  if(blnEmpty){
    if(strStart=="" || strEnd==""){
      return true;
    }
  }else{
    if(strStart==""){
      alert("��Ŀ��"+strStartName+"������Ϊ�ա�");
      objStart.focus();
      return false;
    }
    if(strEnd==""){
      alert("��Ŀ��"+strEndName+"������Ϊ�ա�");
      objEnd.focus();
      return false;
    }
  }

  var intStart=(strStart.substring(0,4))*10000+(strStart.substring(5,7))*100+(strStart.substring(8,10));
  var intEnd=(strEnd.substring(0,4))*10000+(strEnd.substring(5,7))*100+(strEnd.substring(8,10));
  if(intStart>=intEnd){
    alert("��Ŀ��"+strStartName+"��Ӧ���ڡ�"+strEndName+"�� ��");
    objStart.focus();
    return false;
  }else{
    return true;
  }
}

// ��������ҳд�� Title
// titleName Ҫ�� Title ������ʾ������
function createTitle(titleName){
  var strTable = "";
  strTable += "<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">";
  strTable += "<tr align=\"left\">";
  strTable += "<td valign=\"top\" background=\"../../images/center_bg_1.gif\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">";
  strTable += "<tr>";
  strTable += "<td width=\"1%\"><img src=\"../../images/center_11.gif\" width=\"38\" height=\"23\"></td>";
  strTable += "<td width=\"99%\" background=\"../../images/center_more_1.gif\" style=\"BACKGROUND-REPEAT:no-repeat;background-position:100% 0%\"><strong><b class=\"a6\" style=\"BACKGROUND-REPEAT: no-repeat\">"+ titleName +"</b></strong></td>";
  strTable += "</tr>";
  strTable += "</table></td>";
  strTable += "</tr>";
  strTable += "<tr align=\"left\">";
  strTable += "<td valign=\"top\" height=\"10\"></td>";
  strTable += "</tr>";
  strTable += "</table>";
  document.write (strTable);
}

// ��� Select �Ƿ�Ϊ�գ���Ϊ�շ���true,�շ���false
function selectVerify(objText,strName){
  if(objText != null){
    if(objText.value != ""){
      return true;
    }
    alert("��Ŀ��"+strName+"������Ϊ�ա�");
    objText.focus();
    return false;
  }else{
    alert("��Ŀ��"+strName+"�������ڡ�");
    return false;
  }
}

function dateVerify(objText,blnEmpty,strFormat,strName){
//У�����ڵ���Ч��,��Ч����true,��Ч����false

  var strText=objText.value;
  if(strText=="" && blnEmpty==false){
    alert("��Ŀ��"+strName+"������Ϊ�ա�");
    objText.focus();
    return false;
  }
  if(strText.length!=strFormat.length){
    alert("��Ŀ��"+strName+"���ĸ�ʽ����ȷ,�밴�ա�"+strFormat+"����ʽ�������ڡ�");
    objText.focus();
    return false;
  }
  
  var i,j;
  var strFormatTemp;
  var strTemp;
  
  for(i=0;i<strText.length;){
  	strFormatTemp=strFormat.substring(i,i+4);
  	if(strFormatTemp=="yyyy"){
  	  strTemp=strText.substring(i,i+4);
  	  for(j=0;j<4;j++){
        if(strTemp.charCodeAt(j)<48 || strTemp.charCodeAt(j)>57){
          alert("��Ŀ��"+strName+"���ĸ�ʽ����ȷ,�밴�ա�"+strFormat+"����ʽ�������ڡ�");
          objText.focus();
          return false;
        }
  	  }
  	  i=i+4;
    }else{
  	
  	strFormatTemp=strFormat.substring(i,i+2);
  	if(strFormatTemp=="MM" || strFormatTemp=="dd" || strFormatTemp=="HH" || strFormatTemp=="mm" || strFormatTemp=="ss"){
  	  strTemp=strText.substring(i,i+2);
  	  for(j=0;j<2;j++){
        if(strTemp.charCodeAt(j)<48 || strTemp.charCodeAt(j)>57){
          alert("��Ŀ��"+strName+"���ĸ�ʽ����ȷ,�밴�ա�"+strFormat+"����ʽ�������ڡ�");
          objText.focus();
          return false;
        }
  	  }
	  if(strFormatTemp=="MM" && (strTemp>12 || strTemp<1)){
          alert("��Ŀ��"+strName+"�����·����벻��ȷ,�밴�ա�"+strFormat+"����ʽ�������ڡ�");
          objText.focus();
          return false;
	  }
	  if(strFormatTemp=="dd" && (strTemp>31 || strTemp<1)){
          alert("��Ŀ��"+strName+"�����������벻��ȷ,�밴�ա�"+strFormat+"����ʽ�������ڡ�");
          objText.focus();
          return false;
	  }
	  if(strFormatTemp=="HH" && (strTemp>24 || strTemp<0)){
          alert("��Ŀ��"+strName+"����Сʱ���벻��ȷ,�밴�ա�"+strFormat+"����ʽ�������ڡ�");
          objText.focus();
          return false;
	  }
	  if((strFormatTemp=="mm" || strFormatTemp=="ss") && (strTemp>59 || strTemp<0)){
          alert("��Ŀ��"+strName+"����ʱ�����벻��ȷ,�밴�ա�"+strFormat+"����ʽ�������ڡ�");
          objText.focus();
          return false;
	  }
  	  i=i+2;
    }else{
      if(strText.substring(i,i+1)!=strFormat.substring(i,i+1)){
        alert("��Ŀ��"+strName+"���ĸ�ʽ����ȷ,�밴�ա�"+strFormat+"����ʽ�������ڡ�");
        objText.focus();
        return false;
      }
  	  i=i+1;
    }
    }
  }
  return true;
}
function checkstrings(objText){
		var strText=objText.value;
		if(/\s*[;|!|@|#|$|%|^|&|*|'|']\s*/g.test(objText.value)){
			alert("��������ַ��д��ڷǷ��ַ����������룡");
			objText.focus();
			return false;
		}
		return true;
}
//���ļ��ж�λ�����һ������
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

