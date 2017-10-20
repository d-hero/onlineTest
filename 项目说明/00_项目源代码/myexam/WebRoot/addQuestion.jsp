<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>试卷</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<script type="text/javascript">
	//刷新页面实现考试类别加载
	$(function() {
	//点击返回，清空文本框数据
   var asw=""; 
	 $("#return").click(function(){
	  $("#text01").val("");
	  $("#text02").val("");
	  $("#text03").val("");
	 
	  });
	  
	
	//进入页面获取数据
		$.get("ExaType/selecttype", null, function(data, status) {
         var info="";
         $.each(data,function(index,exa){
         info="<option value="+(index+1)+">"+exa.exatype+"</option>";
         $("#sub").append(info);
         });
		});
	
//输入题目数获取题目
	$("#add_question").click(function(){
	$("#qtext").html("");
	asw="";
	if($("#text01").val()==null||$("#text01").val()==""){
	alert("单选题题目数不能为空");
	}
	else if($("#text02").val()==null||$("#text02").val()==""){
	alert("多选题题目数不能为空");
	}
	else if($("#text03").val()==null||$("#text03").val()==""){
	alert("判断题题目数不能为空");
	}

	else {
	//将题目数与数据库进行比较判断  并生成题目
	$.get("${pageContext.request.contextPath}/question/question03?Exid="+$("#sub").val()+"&Typeid=1&number="+$("#text01").val(),null,function(data,status){
    var cou = data.count;
     var info="";
    if (cou>=$("#text01").val()) {
     $.each(data.list,function(index,exa){
         asw=asw+"+"+exa.answers;
         info="<p value="+(index+1)+">"+exa.content+"</p>"+
         "<p value="+(index+1)+"><input type='radio' name='ex' />"+exa.keya+"</p>"+
         "<p value="+(index+1)+"><input type='radio' name='ex' />"+exa.keyb+"</p>"
         +"<p value="+(index+1)+"><input type='radio' name='ex' />"+exa.keyc+"</p>"+
         "<p value="+(index+1)+"><input type='radio' name='ex'/>"+exa.keyd+"</p>";
         $("#qtext").append(info);
         });
		
	}else  {
		alert("没那么多题");
	}
	
	});
	   
	 	
$.get("${pageContext.request.contextPath}/question/question03?Exid="+$("#sub").val()+"&Typeid=2&number="+$("#text02").val(),null,function(data,status){
    var cou = data.count;
     var info="";
    if (cou>=$("#text02").val()) {
     $.each(data.list,function(index,exa){
     asw=asw+"+"+exa.answers;
         info="<p value="+(index+1)+">"+exa.content+"</p>"+
         "<p value="+(index+1)+"><input type='checkbox' name='ex' />"+exa.keya+"</p>"+
         "<p value="+(index+1)+"><input type='checkbox' name='ex' />"+exa.keyb+"</p>"
         +"<p value="+(index+1)+"><input type='checkbox' name='ex' />"+exa.keyc+"</p>"+
         "<p value="+(index+1)+"><input type='checkbox' name='ex'/>"+exa.keyd+"</p>";
         $("#qtext").append(info);
         });
		
	}else  {
		alert("没那么多题");
	}
	
	});
	 
	$.get("${pageContext.request.contextPath}/question/question03?Exid="+$("#sub").val()+"&Typeid=3&number="+$("#text03").val(),null,function(data,status){
    var cou = data.count;
     var info="";
    if (cou>=$("#text03").val()) {
     $.each(data.list,function(index,exa){
     asw=asw+"+"+exa.answers;
 
         info="<p value="+(index+1)+">"+exa.content+"</p>"+
         "<p value="+(index+1)+"><input type='radio' name='ex'/>"+exa.keya+"</p>"+
         "<p value="+(index+1)+"><input type='radio' name='ex' />"+exa.keyb+"</p>";
         $("#qtext").append(info);
         });
		  alert(asw);
	}else  {
		alert("没那么多题");
	}

	});
	  $("#jiaojuan").click(function(){
	  //交卷提交
	  alert("是否确定交卷，交卷后不可修改")
	  }); 
	}
		
	});
	
	
	});
	
	
	/* function confirm_add() {
		if (confirm("您确定添加吗？")) {
			return true;
		}
		return false;
	}  */
</script>
</head>

<body>
	<form  method="get" id="fm">
		科目 <select id="sub" name="sub">
			<option value="-1">请先选择科目...</option>
		</select></br>
		单选题:<input type="text" id="text01" >
		多选题:<input type="text" id="text02" >
		判断题:<input type="text" id="text03" >
		<input id="add_question" type="button" value="生成试卷"/>
		<input id="return" type="button" value="返      回" />
		<input type="button" value="交  卷" onclick="jiaojuan()">
		<br />
		<br />
		<!-- 题目添加的地方 -->
		<div id="qtext" style="width: 50%; height: 80%; resize: none;"></div>
		<br />
	<br><br></form>
</body>
</html>
