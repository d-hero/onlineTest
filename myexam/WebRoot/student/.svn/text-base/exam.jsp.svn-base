<%@ page language="java" pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
	response.setHeader("pragma","no-cache");
	response.setHeader("cache-control","no-cache");
	response.setHeader("expires","0");
 %>
<jsp:include flush="true" page="/student/examttop.jsp"></jsp:include>
<center>
<br>
<font color="red">${message}</font>
<br>
<c:if test="${question !=null && question !=''}">
《${subject.name }》正在考试,剩余时间:<span id="tttt" style="color: red">&nbsp;</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" value="交  卷" onclick="jiaojuan()">
<br><br><font color='red'>
<span id="message" style="font-size: 150%">&nbsp;</span>
</font>
<br><br>
<form action="<%=request.getContextPath()%>/student/exam/go" id="examForm" name="examForm" method="post">
	<input type="hidden" id="nowid" name="nowid">
	<input type="hidden" id="oldid" name="oldid">
	<input type="hidden" id="currentid" name="currentid">
<table width="600"  border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#3D7BA3" style="WORD-BREAK: break-all; WORD-WRAP: break-word">
    <tr bgcolor="94C9E7" align="center">
      <td width="10%" >题号</td>
      <td width="20%" bgcolor="FFFFFF">第${examForm.nowid+1}/${subject.totalnum}题</td>
      <td width="15%">分数</td>
      <td width="20%" bgcolor="FFFFFF">${question.score}分</td>
      <td width="15%">类型</td>
      <td width="20%" bgcolor="FFFFFF">${question.qtype==0?"单选题":"多选题"}</td>
    </tr>
	<tr bgcolor="ffffff" align="center">
	  <td colspan="6" align="left" valign="top" height="100">
	  题目：<br><br>&nbsp;&nbsp;
	 
	  </td>
	</tr>     
	

</table><br>
	<div align="center" >
		<input type="button" value="上一题" ${examForm.nowid<=0?"disabled":""} onclick="document.examForm.nowid.value=${examForm.nowid-1};document.examForm.submit()"/>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" value="下一题" ${examForm.nowid>=subject.totalnum-1?"disabled":""} onclick="document.examForm.nowid.value=${examForm.nowid+1};document.examForm.submit()"/>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<select onchange="document.examForm.nowid.value=this.value;document.examForm.submit()">
		
		<option value=""	>
			</option>
	
		</select>

		
	</div>
</form>
</c:if>
</center>  
<script>
	
	function checkm(ck){
		var t = ${question.qtype};
		if (t==0){
			var a = 0;
			for (i=0;i<document.examForm.answers.length;i++){
				if(document.examForm.answers[i].checked){
					a++;
					if(a>=2){
						alert("单选题只能有一个答案!");
						ck.checked=false;
						document.examForm.submit();
						return;
					}
				}
			}
		}
	}
     var remainsec = ${remainsec};
     function goclock(){
       remainsec -= 1;
       if(remainsec<=0){
         document.examForm.action = '';
         document.examForm.submit();
         return;
       }
       var min = Math.floor(remainsec/60);
       var sec = remainsec%60;
       var secs = sec<10?"0"+sec:sec;
       var st = min+"分钟 "+secs+"秒";
       if(remainsec<300)
       {
         document.getElementById("message").innerHTML = "时间快要到了请注意!";
       }
       document.getElementById("tttt").innerHTML = st;
       window.setTimeout("goclock()",1000);
     }
      goclock();
      
      function jiaojuan(){
      if(window.confirm("是否交卷，交卷后不能修改!")&&window.confirm("请再次确认是否交卷，交卷后不能修改!")){
		document.examForm.action='';
		document.examForm.submit();      
      }else{
      	document.examForm.submit();      
      }
      }
</script>
<jsp:include flush="true" page="/student/studentbottom.jsp"></jsp:include>