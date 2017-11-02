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
		$("#dg").datagrid( {url:"${pageContext.request.contextPath}/question/query?Exid="+$("#Exid").val()+"&typeid="+$("#typeid").val(),
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
			strIds.push(selectedRows[i].questionsid);
		}
		var ids = strIds.join(",");
		alert(ids);
		$.messager.confirm("系统提示", "您确认要删除这<font color=red>"
				+ selectedRows.length + "</font>条数据吗？", function(r) {
			if (r) {
				$.post("${pageContext.request.contextPath}/question/delete", {
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
		url = "${pageContext.request.contextPath}/question/add";
	}

	//这个方法具体添加(也可能是修改)动作
	function saveUser() {

		$("#fm").form("submit", {
			url : url,
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
	
		if (row.status==1) {
			$.messager.alert("该试题被使用中无法修改和删除");
			return;
		}
		$("#dlg").dialog("open").dialog("setTitle", "编辑用户信息");
	   url = "${pageContext.request.contextPath}/question/update?questionsid=" + row.questionsid;
	   alert(url);
		$("#content").val(row.content);
		$("#keya").val(row.keya); //这里要一致
		$("#keyb").val(row.keyb);
		$("#keyc").val(row.keyc);
		$("#keyd").val(row.keyd);
        $("#answers").val(row.answers);
		$("#score").val(row.score);
        $("#Exid").combobox("setValue",row.exaType.exatype)
         $("#typeid").combobox("setValue",row.qType.typename)
		//个url就是我们要完成修改的那个控制器中url地址
		
	}

	//重置 表单元素还原到初始化状态
	function resetValue() {
		$("#content").val("");
		$("#answers").val("");
		$("#keya").val("");
		$("#keyb").val("");
		$("#keyc").val("");
		$("#keyd").val("");
		$("#score").val("");
		
	}

	//关闭窗口
	function closeUserDialog() {
		$("#dlg").dialog("close");
		resetValue();
	}
	
	function formaexaTypeName(val,row){
		return row.exaType.exatype;
	}
</script>
</head>
<body style="margin:1px;">
	<table id="dg" title="试题管理" class="easyui-datagrid" fitColumns="true"
		pagination="true" rownumbers="true"
		data-options="url:'${pageContext.request.contextPath}/question/query?Exid=1&typeid=1',method:'get'"
		fit="true" toolbar="#tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true" align="center"></th>
				<th field="questionsid" width="50" align="center">编号</th>
				<th field="content" width="100" align="center">问题</th>
				<th field="keya" width="100" align="center">选项A</th>
				<th field="keyb" width="100" align="center">选项B</th>
				<th field="keyc" width="50" align="center">选项C</th>
				<th field="keyd" width="100" align="center">选项D</th>
				<th field="answers" width="150" align="center">答案</th>
				<th field="exaType.exatype" width="100" align="center" formatter="formaexaTypeName">所属专业</th>
				<th field="score" width="100" align="center">试题分数</th>
				<th field="status" width="100" align="center">试题状态</th>
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
			&nbsp;专业：&nbsp;<select  id="Exid" 
				onkeydown="if(event.keyCode==13) searchUser()" ><option value="1">c#</option>
				<option value="2">java</option><option value="3">c++</option></select>
				&nbsp;试题类别：&nbsp;<select  id="typeid" 
				onkeydown="if(event.keyCode==13) searchUser()" ><option value="1">单项选择题</option>
				<option value="2">多选题</option></select>
				 <a href="javascript:searchUser()" class="easyui-linkbutton"
				iconCls="icon-search" plain="true">搜索</a>
		</div>
	</div>

	<div id="dlg" class="easyui-dialog"
		style="width: 570px;height:300px;padding: 10px 20px" closed="true"
		buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table cellspacing="8px">
				<tr>
					<td>问题：</td>
					<td><input type="text" id="content" name="content"
						class="easyui-validatebox" required="true" /></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>答案：</td>
					<td><input type="text" id="answers" name="answers"
						class="easyui-validatebox" required="true" /></td>
				</tr>
				<tr>
					<td>试题分数：</td>
					<td><input type="text" id="score" name="score"
						class="easyui-validatebox" required="true" /></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>专业：</td>
					<td><select class="easyui-combobox" id="Exids"" name="Exid""
						style="width: 154px;" editable="false" panelHeight="auto">
							<option value="">请选择专业</option>
								<option value="1">c#</option>
							<option value="2">java</option>
					</select></td>
				</tr>
				<tr>
				<td>试题类型：</td>
					<td><select class="easyui-combobox" id="typeids"" name="typeid""
						style="width: 154px;" editable="false" panelHeight="auto">
							<option value="">请选择试题类型</option>
									<option value="1">选择题</option>
							<option value="2">多选题</option>		
					</select></td>
				</tr>
				<tr>
					<td>选项A：</td>
					<td><input type="text" id="keya" name="keya"
						class="easyui-validatebox"  required="true" /></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				</tr>
					<tr>
					<td>选项B：</td>
					<td><input type="text" id="keyb" name="keyb"
						class="easyui-validatebox"  required="true" /></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				</tr>
					<tr>
					<td>选项C：</td>
					<td><input type="text" id="keyc" name="keyc"
						class="easyui-validatebox" required="true" /></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				</tr>
					<tr>
					<td>选项D：</td>
					<td><input type="text" id="keyd" name="keyd"
						class="easyui-validatebox"  required="true" /></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
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