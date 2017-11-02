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

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<!-- 这个，生成两个验证码 -->
<script src="checkCode.js"></script>

<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		// 点击注册按钮，如果用户名、密码为空则提示用户名与密码不能为空。 判断用户输入的两次密码是否一致，不一致的话，提示密码输入不一致。 如果以上条件都没问题则注册成功。
		$("#btnReg").click(function() {
			if ($("#Stuno").val() == "") {
				alert("准考证号不能为空");
			} else if ($("#Stupwd").val() == "") {
				alert("密码不能为空");
			} else if ($("#Stupwd").val() != $("#passwordRepeat").val()) {
				alert("密码不一致，请重新修改");
			} else if ($("#Stuname").val() == "") {
				alert("姓名不能为空");
			} else if ($("#Stusex").val() == "") {
				alert("性别不能为空");
			} else if ($("#Stuphone").val() == "") {
				alert("电话号码不能为空");
			} else if ($("#submitcode").val() != $("#code2").val()) {
				alert("验证码输入有误或未输入，请重新输入验证码");
			} else if ($("#Stuno").val() != "") {

alert("进入");
				$.post("${pageContext.request.contextPath}/Students/selectAll", {
					"stuno" : $("#Stuno").val(),
					"stupwd" : $("#Stupwd").val(),
					"stuname" : $("#Stuname").val(),
					"stusex" : $("#Stusex").val(),
					"stuphone" : $("#Stuphone").val(),
					"op" : "same"
				}, function(data,status) {
					alert(data);
					//跳转登录页面
					if (data) {
						location.href = "login2.jsp";
					} else {
						location.href = "index.jsp";
					}
				});

			}

		});

		//判断密码是否一致
		$("#passwordRepeat").blur(function() {
			if ($(this).val() == $("#Stupwd").val()) {

			} else {
				alert("密码不一致,请重新输入");
			}
		});

		//提示用户名不能为空
		$("#Stuno").blur(function() {
			if ($(this).val() == "") {
				alert("用户名不能为空");
			}else{
				$.post("${pageContext.request.contextPath}/Students/selectAll1",{
					"stuno":$("#Stuno").val()	
				},function(data,status){
					if(!data){
					$("#div").html("该用户已存在请重新输入");
					}
				})
			}
		});
		//提示密码不能为空
		$("#Stupwd").blur(function() {
			if ($(this).val() == "") {
				alert("请输入密码");
			}
		});
		//提示姓名不能为空
		$("#Stuname").blur(function() {
			if ($(this).val() == "") {
				alert("请输入密码");
			}
		});
		//提示性别不能为空
		$("#Stusex").blur(function() {
			if ($(this).val() == "") {
				alert("请输入密码");
			}
		});
		//提示电话号码不能为空
		$("#Stuphone").blur(function() {
			if ($(this).val() == "") {
				alert("请输入密码");
			}else{
				check();
			}
		});
		//提示再次输入密码
		$("#passwordRepeat").blur(function() {
			if ($(this).val() == "") {
				alert("请再次输入密码");
			}
		});

	});

	function check() {
		var tel_regexp = /^1\d{10}$/;
		var tel = $("#Stuphone").val();

		if (tel_regexp.test(tel)) {

		} else {

			alert("手机号码需为11位或者号码格式有误");
			return false;
		}

	}
</script>

<!--验证码区的样式  -->
<style type="text/css">
#code2 {
	font-family: Arial;
	font-style: italic;
	font-weight: bold;
	border: 0;
	letter-spacing: 2px;
	color: blue;
}

#code3 {
	font-family: Arial;
	font-style: italic;
	font-weight: bold;
	border: 0;
	letter-spacing: 2px;
	color: blue;
}
</style>
</head>

<body>

	准考证号：
	<input  type="text" id="Stuno" ><div id="div" ></div>
	<br> 密码：
	<input type="password" id="Stupwd">
	<br> 再次确认密码：
	<input type="password" id="passwordRepeat">
	<br> 姓名：
	<input type="text" id="Stuname">
	<br>性别:
	<select name="sex" id="Stusex">
		<option value="choose">请选择</option>
		<option value="boy">男</option>
		<option value="girl">女</option>
	</select>
	<br> 电话号码:
	<input type="text" id="Stuphone">
	<br> 验证码：
	<input type="text" id="submitcode"><br>
	<input type="text" id="code2" >
	<br>
	<input type="button" value="提交" id="btnReg">
	<br>
</body>
</html>
