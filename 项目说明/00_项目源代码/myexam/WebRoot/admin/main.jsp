<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>在线考试后台管理</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	var url;
	
	function openTab(text,url,iconCls){
		if($("#tabs").tabs("exists",text)){
			$("#tabs").tabs("select",text);
		}else{
			var content="<iframe frameborder=0 scrolling='auto' style='width:100%;height:100%' src='${pageContext.request.contextPath}/admin/"+url+"'></iframe>";
			$("#tabs").tabs("add",{
				title:text,
				iconCls:iconCls,
				closable:true,
				content:content
			});
		}
	}
	
	function openPasswordModifyDialog(){
		$("#dlg").dialog("open").dialog("setTitle","修改密码");
		url="user_modifyPassword.action?user.id=${currentUser.id}";
	}
	
	function closePasswordModifyDialog(){
		$("#dlg").dialog("close");
		$("#oldPassword").val("");
		$("#newPassword").val("");
		$("#newPassword2").val("");
	}
	
	function modifyPassword(){
		$("#fm").form("submit",{
			url:url,
			onSubmit:function(){
				var oldPassword=$("#oldPassword").val();
				var newPassword=$("#newPassword").val();
				var newPassword2=$("#newPassword2").val();
				if(!$(this).form("validate")){
					return false;
				}
				if(oldPassword!='${currentUser.password}'){
					$.messager.alert("系统提示","用户密码输入错误！");
					return false;
				}
				if(newPassword!=newPassword2){
					$.messager.alert("系统提示","确认密码输入错误！");
					return false;
				}
				return true;
			},
			success:function(result){
				var result=eval('('+result+')');
				if(result.success){
					$.messager.alert("系统提示","密码修改成功，下一次登录生效！");
					closePasswordModifyDialog();
				}else{
					$.messager.alert("系统提示","密码修改失败");
					return;
				}
			}
		});
	}
	
	function logout(){
		$.messager.confirm("系统提示","您确定要退出系统吗",function(r){
			if(r){
				window.location.href="user_logout2.action";
			}
		});
	}
	
	function refreshSystem(){
		$.post("sys_refreshSystem.action",{},function(result){
			if(result.success){
				$.messager.alert("系统提示","已成功刷新系统缓存！");
			}else{
				$.messager.alert("系统提示","刷新系统缓存失败！");
			}
		},"json");
	}
</script>
</head>
<body class="easyui-layout">
<div region="north" style="height: 78px;background-color: #E0ECFF">
	<table style="padding: 5px" width="100%">
		<tr>
			<td width="50%">
				<img src="${pageContext.request.contextPath}/images/logo.png.png"/>
			</td>
			<td valign="bottom" align="right" width="50%">
				<font size="3">&nbsp;&nbsp;<strong>欢迎：${result}</strong>${currentUser.userName }</font>
			</td>
		</tr>
	</table>
</div>
<div region="center">
	<div class="easyui-tabs" fit="true" border="false" id="tabs">
		<div title="首页" data-options="iconCls:'icon-home'">
			<div align="center" style="padding-top: 100px"><font color="skyblue" size="10">欢迎使用Exam++后台管理系统</font></div>
		</div>
	</div>
</div>
<div region="west" style="width: 200px" title="导航菜单" split="true">
	<div class="easyui-accordion" data-options="fit:true,border:false">
		<div title="学生管理" data-options="iconCls:'icon-user'" style="padding: 10px">
			<a href="javascript:openTab('学生管理','StudentsManage.jsp','icon-user')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-manage'" style="width: 150px;">管理学生</a>
			<a href="javascript:openTab('学生成绩查看','ResultManage.jsp','icon-user')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-manage'" style="width: 150px;">学生成绩查看</a>
			<a href="javascript:openTab('管理员管理','adminManage.jsp','icon-user')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-manage'" style="width: 150px;">管理管理员</a>
			
		</div>
		
		<div title="试题管理"  data-options="iconCls:'icon-product'" style="padding:10px;">
			<a href="javascript:openTab('试题管理','questionManage.jsp','icon-product')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-manage'" style="width: 150px;">管理试题</a>
			<a href="javascript:openTab('专业管理','exatypeTypeManage.jsp','icon-product')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-manage'" style="width: 150px;">管理专业</a>
			
		</div>
		<div title="考试管理"  data-options="iconCls:'icon-order'" style="padding:10px">
			<a href="javascript:openTab('试卷管理','paperManage.jsp','icon-order')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-manage'" style="width: 150px;">管理试卷</a>
			<a href="javascript:openTab('备份试卷管理','backupsManage.jsp','icon-order')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-manage'" style="width: 150px;">管理备份试卷</a>
		</div>
		<div title="文件管理"  data-options="iconCls:'icon-order'" style="padding:10px">
			<a href="javascript:openTab('试卷管理','paperManage.jsp','icon-order')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-manage'" style="width: 150px;">管理试卷</a>
			<a href="javascript:openTab('备份试卷管理','backupsManage.jsp','icon-order')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-manage'" style="width: 150px;">管理备份试卷</a>
		</div>
	</div>
</div>
<div region="south" style="height: 25px;padding: 5px;" align="center">
Copyright © 2017 CHL All Rights Reserved.
</div>


<div id="dlg" class="easyui-dialog" style="width: 400px;height:220px;padding: 10px 20px"
  closed="true" buttons="#dlg-buttons">
 	<form id="fm" method="post">
 		<table cellspacing="8px">
 			<tr>
 				<td>用户名：</td>
 				<td><input type="text" id="userName" name="user.userName" value="${currentUser.userName }" readonly="readonly" style="width: 200px"/></td>
 			</tr>
 			<tr>
 				<td>原密码：</td>
 				<td><input type="password" id="oldPassword" class="easyui-validatebox" required="true" style="width: 200px"/></td>
 			</tr>
 			<tr>
 				<td>新密码：</td>
 				<td><input type="password" id="newPassword" name="user.password" class="easyui-validatebox" required="true" style="width: 200px"/></td>
 			</tr>
 			<tr>
 				<td>确认新密码：</td>
 				<td><input type="password" id="newPassword2"  class="easyui-validatebox" required="true" style="width: 200px"/></td>
 			</tr>
 		</table>
 	</form>
</div>

<div id="dlg-buttons">
	<a href="javascript:modifyPassword()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
	<a href="javascript:closePasswordModifyDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
</div>
</body>
</html>