<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在线考试后台管理</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	var url;

	//模糊查询
	function searchUser() {
		$("#dg").datagrid('load', {
			"username" : $("#s_userName").val()
		});
	}

	function deleteUser() {
		var selectedRows = $("#dg").datagrid('getSelections');
		if (selectedRows.length == 0) {
			$.messager.alert("系统提示", "请选择要删除的数据！");
			return;
		}
		var strIds = [];
		for (var i = 0; i < selectedRows.length; i++) {
			strIds.push(selectedRows[i].id);
		}
		var ids = strIds.join(",");
		$.messager.confirm("系统提示", "您确认要删除这<font color=red>"
				+ selectedRows.length + "</font>条数据吗？", function(r) {
			if (r) {
				$.post("${pageContext.request.contextPath}/testapi/deletebyid", {
					ids : ids
				}, function(result) {
					if (result) {
						$.messager.alert("系统提示", "数据已成功删除！");
						$("#dg").datagrid("reload");
					} else {
						$.messager.alert("系统提示", "数据删除失败！");
					}
				}, "json");
			}
		});

	}

	//这里打开添加用户模态窗口
	function openUserAddDialog() {
		$("#dlg").dialog("open").dialog("setTitle", "添加用户信息");
		//处理增加操作的url地址 控制器的访问路径
		url = "${pageContext.request.contextPath}/Tpaper/insert";
	}

	//这个方法具体添加(也可能是修改)动作
	function saveUser() {
		$("#fm").form("submit", {
			url :"${pageContext.request.contextPath}/Tpaper/insert",
			onSubmit : function() {
				if ($("#exid").combobox("getValue") == "") {
					$.messager.alert("系统提示", "请选择类型");
					return false;
				}
				return $(this).form("validate");
			},
			success : function(result) {
				console.log("result :" + result);
				//这个方法的判断 最好再优化一下;
				if (result=="true") {
					$.messager.alert("系统提示", "保存成功");
					resetValue();
					$("#dlg").dialog("close");
					//重新加载数据到datagrid
					$("#dg").datagrid("reload");
				} else {
					$.messager.alert("系统提示", "保存失败");
					return;
				}
			}
		});
	}

	//弹出修改用户的对话框
	function openUserModifyDialog() {
		var selectedRows = $("#dg").datagrid('getSelections');
		if (selectedRows.length != 1) {
			$.messager.alert("系统提示", "请选择一条要编辑的数据！");
			return;
		}
		var row = selectedRows[0];
		$("#dlg").dialog("open").dialog("setTitle", "编辑用户信息");
		$("#truename").val(row.truename);
		$("#username").val(row.username); //这里要一致
		$("#password").val(row.password);
		$("#sex").combobox("setValue", row.sex);
		$("#birthday").datebox("setValue", row.birthday);
		$("#dentitycode").val(row.dentitycode);
		$("#email").val(row.email);
		$("#mobile").val(row.mobile);
		$("#address").val(row.address);
		//个url就是我们呀欧完成修改的那个控制器中url地址
		url = "${pageContext.request.contextPath}/testapi/update/" + row.id;
	}

	//重置 表单元素还原到初始化状态
	function resetValue() {
		$("#tpaperid").val("");
		$("#tname").val("");
	 	$("#exid").combobox("setValue", "");
	/* 	$("#birthday").datebox("setValue", "");
		$("#dentitycode").val("");
		$("#email").val("");
		$("#mobile").val("");
		$("#address").val(""); */ 
	}

	//关闭窗口
	function closeUserDialog() {
		$("#dlg").dialog("close");
		resetValue();
	}
</script>
</head>
<body style="margin:1px;">
	<table id="dg" title="试卷管理" class="easyui-datagrid" fitColumns="true"
		pagination="true" rownumbers="true"
		data-options="url:'${pageContext.request.contextPath}/testapi/show',method:'get'"
		fit="true" toolbar="#tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true" align="center"></th>
				<th field="id" width="50" align="center">编号</th>
				<th field="truename" width="100" align="center">试卷名称</th>
				<th field="username" width="100" align="center">试卷类型</th>
				<th field="password" width="100" align="center">试卷总分</th>
			<!-- 	<th field="sex" width="50" align="center">性别</th>
				<th field="birthday" width="100" align="center">出生日期</th>
				<th field="dentitycode" width="150" align="center">身份证</th>
				<th field="email" width="100" align="center">邮件</th>
				<th field="mobile" width="100" align="center">联系电话</th>
				<th field="address" width="100" align="center">收货地址</th> -->
			</tr>
		</thead>
	</table>
	<div id="tb">
		<div>
			<a href="javascript:openUserAddDialog()" class="easyui-linkbutton"
				iconCls="icon-add" plain="true">添加</a> <a
				href="javascript:openUserModifyDialog()" class="easyui-linkbutton"
				iconCls="icon-edit" plain="true">修改</a> <a
				href="javascript:deleteUser()" class="easyui-linkbutton"
				iconCls="icon-remove" plain="true">删除</a>
		</div>
		<div>
			&nbsp;用户名：&nbsp;<input type="text" id="s_userName" size="20"
				onkeydown="if(event.keyCode==13) searchUser()" /> <a
				href="javascript:searchUser()" class="easyui-linkbutton"
				iconCls="icon-search" plain="true">搜索</a>
		</div>
	</div>

	<div id="dlg" class="easyui-dialog"
		style="width: 570px;height:300px;padding: 10px 20px" closed="true"
		buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table cellspacing="8px">
				<tr>
					<td>题号：</td>
					<td><input type="text" id="tpaperid" name="tpaperid"
						class="easyui-validatebox" required="true" /></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>题目名：</td>
					<td><input type="text" id="tname" name="tname"
						class="easyui-validatebox" required="true" /></td>
				</tr>
				<tr>
					<!-- <td>题目名：</td>
					<td><input type="text" id="tname" name="tname"
						class="easyui-validatebox" required="true" /></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;</td> -->
					<td>类型：</td>
					<td><select class="easyui-combobox" id="exid" name="exid"
						style="width: 154px;" editable="false" panelHeight="auto">
							<option value="">请选择类型</option>
							<option value="1">c#</option>
							<option value="2">java</option>
							<option value="3">c++</option>
					</select></td>
				</tr>
			<!-- 	<tr>
					<td>出生日期：</td>
					<td><input type="text" id="birthday" name="birthday"
						class="easyui-datebox" editable="false" required="true" /></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>身份证：</td>
					<td><input type="text" id="dentitycode" name="dentitycode"
						class="easyui-validatebox" required="true" /></td>
				</tr>
				<tr>
					<td>邮件：</td>
					<td><input type="text" id="email" name="email"
						class="easyui-validatebox" validType="email" required="true" /></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>联系电话：</td>
					<td><input type="text" id="mobile" name="mobile"
						class="easyui-validatebox" required="true" /></td>
				</tr>
				<tr>
					<td>收货地址：</td>
					<td colspan="4"><input type="text" id="address" name="address"
						class="easyui-validatebox" required="true" style="width: 350px;" />
					</td>
				</tr> -->
			</table>
		</form>
	</div>

	<div id="dlg-buttons">
		<a href="javascript:saveUser()" class="easyui-linkbutton"
			iconCls="icon-ok">保存</a> <a href="javascript:closeUserDialog()"
			class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
</body>
</html>