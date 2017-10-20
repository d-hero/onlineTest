<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>My JSP 'admin.jsp' starting page</title>
     
<!-- 	主界面
	request，resopne
	生成的静态页面的编码格式
	jsp页面的编码格式
	ajax的编码格式
	设置：
	filter设置编码格式
 -->
	
	<link href="student/css/bootstrap.min.css" title="" rel="stylesheet" />
	<link title="orange" href="student/css/login.css" rel="stylesheet" />
	<script type="text/javascript" src="student/js/rcode.js" ></script>   
	<%-- /src=${pageContext.request.contextPath}/ --%>
	<script type="text/javascript" src="js/jquery-1.11.1.js" ></script>
	
	
<script type="text/javascript">

	/* function loadimage(){
		document.getElementById("randImage").src = "${pageContext.request.contextPath}/image.jsp?"+Math.random();
	} */

	$(function() {
		// 点击注册按钮，如果用户名、密码为空则提示用户名与密码不能为空。 判断用户输入的两次密码是否一致，不一致的话，提示密码输入不一致。 如果以上条件都没问题则注册成功。
		$("#btnLogin").click(function() {
			if ($("#Stuno").val() == "") {
				alert("准考证号不能为空");
			} else if ($("#Stupwd").val() == "") {
				alert("密码不能为空");
			}else if ($("#rcodeValue").val() != $("#rcodeInput").val()) {
				alert("验证码输入有误或未输入，请重新输入验证码");
			} else if ($("#Stuno").val() != "") {
				$.post("Students/userLogin", {
					"stuno" : $("#Stuno").val(),
					"stupwd" : $("#Stupwd").val(),
				}, function(data,status) {
					alert("用户名或者密码输入错误");
					//跳转登录页面
				/* 	if (data) {
							alert("00000000000");						
							location.href = "Students/login?stuno"+$("#Stuno").val();						    
					} else {
						alert("00000000000");	
						alert("用户名或密码不正确");
						location.href = "student/login.jsp"; 
					} */
				});
			}
		});

		//提示用户名不能为空
		$("#Stuno").blur(function() {
			if ($(this).val() == "") {
				alert("用户名不能为空");
			}
		});
		//提示密码不能为空
		$("#Stupwd").blur(function() {
			if ($(this).val() == "") {
				alert("请输入密码");
			}
		});

	});
</script>
	
	<!--验证码区的样式  -->
<style type="text/css">
.rcodeValue {
	font-family: Arial;
	font-style: italic;
	font-weight: bold;
	border: 0;
	letter-spacing: 2px;
	color: blue;
	/* background-color:#FC7E31; */
}
</style>
	
</head>
  
<body>
   <div style="height:1px;"></div>
  <div class="d1">
     <header>
	    <h1>登陆</h1>
	 </header>
	 <div class="d11">
	    <form name="form1" id="form1"  method="post">
	    	<span>${result}</span>
		    <div class="d111">
				<label>
				<i class="sublist-icon glyphicon glyphicon-user"></i>
				</label>
				<input type="text"  placeholder="这里输入登录名" id="Stuno" name="stuno" class="inp">
				<span  id="tip1"></span>
			</div>
			<div class="d111">
				<label>
				<i class="sublist-icon glyphicon glyphicon-pencil"></i>
				</label> 
				<input type="passward"  placeholder="这里输入登录密码"  id="Stupwd" name="stupwd" class="inp">
				<span id="tip2"></span>
			</div>
			<div class="d112">
				<input type="text"  placeholder="输入验证码" class="rcodeInput"  id="rcodeInput" value="">
				<input type="text" id="rcodeValue"   readonly="readonly"   class="rcodeValue" oncLIck="rcreate()">
			</div>
			<div class="d113">
			<input  type="button" class="btnLogin" id="btnLogin"  value="登陆"></button>
			<a href="admin/register.jsp" id="btnRes">学生注册</a>
			</div>
		</form>
	 </div>
  </div>
  
  </body>
</html>
