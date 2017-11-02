<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/Sturesult/showpaper/";
%>

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
			"tname" : $("#s_tname").val()
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
			strIds.push(selectedRows[i].tpaperid);
		}
		var ids = strIds.join(",");
		$.messager.confirm("系统提示", "您确认要删除这<font color=red>"
				+ selectedRows.length + "</font>条数据吗？", function(r) {
			if (r) {
				$.post("${pageContext.request.contextPath}/testapi/deletebyid",
						{
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
		url = "${pageContext.request.contextPath}/testapi/add";
	}

	//这个方法具体添加(也可能是修改)动作
	function saveUser() {
		$("#fm").form("submit", {
			url : url,
			onSubmit : function() {
				if ($("#sex").combobox("getValue") == "") {
					$.messager.alert("系统提示", "请选择性别");
					return false;
				}
				return $(this).form("validate");
			},
			success : function(result) {
				console.log("result :" + result);
				//这个方法的判断 最好再优化一下;
				if (result == "true") {
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
		$("#exatype").val(row.exatype);
		$("#tname").val(row.tname); //这里要一致
		$("#sturesult").val(row.sturesult);
		$("#sex").combobox("setValue", row.sex);
		$("#stuid").datebox("setValue", row.stuid);
		$("#stuname").val(row.stuname);
		$("#email").val(row.email);
		$("#mobile").val(row.mobile);
		$("#address").val(row.address);
		//个url就是我们呀欧完成修改的那个控制器中url地址
		url = "${pageContext.request.contextPath}/testapi/update/"
				+ row.tpaperid;
	}

	//重置 表单元素还原到初始化状态
	function resetValue() {
		$("#exatype").val("");
		$("#tname").val("");
		$("#sturesult").val("");
		$("#sex").combobox("setValue", "");
		$("#stuid").datebox("setValue", "");
		$("#stuname").val("");
		$("#email").val("");
		$("#mobile").val("");
		$("#address").val("");
	}

	//关闭窗口
	function closeUserDialog() {
		$("#dlg").dialog("close");
		resetValue();
	}

	function formatStuName(val, row) {
		return row.stu.stuname;
	}
	
	//查看试卷详情的方法basePath+tpaper.tpaperid
   function formattqi(val, row) {
		return '<a style="color:blue"  href=<%=basePath%>'+row.tpaper.tpaperid+'>试卷详情</a>';
	}                                                                      

	function formattTpaperId(val, row) {
		return row.tpaper.tpaperid;
	}
	function formatStuStuid(val, row) {
		return row.stu.stuid;
	}
	function formattExatype(val, row) {
		return row.tpaper.exatype.exatype;
	} 
	function formattTname(val, row) {
		return row.tpaper.tname;
	} 
</script>
</head>
<body style="margin:1px;">
	<table id="dg" title="学生成绩管理" class="easyui-datagrid" fitColumns="true"
		pagination="true" rownumbers="true"
		data-options="url:'${pageContext.request.contextPath}/Sturesult/show',method:'get'"
		fit="true" toolbar="#tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true" align="center"></th>
				<th field="stu.stuid" width="100" align="center"
					formatter="formatStuStuid">学生编号</th>
				<th field="stu.stuname" width="150" align="center"
					formatter="formatStuName">学生姓名</th>
				<th field="tpaper.tpaperid" width="50" align="center"
					formatter="formattTpaperId" id="ttt">试卷表编号</th>
				<th field="tpaper.exatype.exatype" width="100" align="center"
					formatter="formattExatype">试卷类别</th>
				<th field="tpaper.tname" width="100" align="center" formatter="formattTname">试卷名</th>
				<th field="sturesult" width="100" align="center">考试成绩</th>
				<th field="qi" width="100" align="center" formatter="formattqi">操作</th>
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
			&nbsp;用户名：&nbsp;<input type="text" id="s_tname" size="20"
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
					<td>考试类别：</td>
					<td><input type="text" id="exatype" name="exatype"
						class="easyui-validatebox" required="true" /></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>用户名：</td>
					<td><input type="text" id="tname" name="tname"
						class="easyui-validatebox" required="true" /></td>
				</tr>
				<tr>
					<td>密码：</td>
					<td><input type="text" id="sturesult" name="sturesult"
						class="easyui-validatebox" required="true" /></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>性别：</td>
					<td><select class="easyui-combobox" id="sex" name="sex"
						style="width: 154px;" editable="false" panelHeight="auto">
							<option value="">请选择性别</option>
							<option value="男">男</option>
							<option value="女">女</option>
					</select></td>
				</tr>
				<tr>
					<td>出生日期：</td>
					<td><input type="text" id="stuid" name="stuid"
						class="easyui-datebox" editable="false" required="true" /></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>身份证：</td>
					<td><input type="text" id="stuname" name="stuname"
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
				</tr>
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