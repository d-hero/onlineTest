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
			strIds.push(selectedRows[i].id);
		}
		var ids = strIds.join(",");
		$.messager.confirm("系统提示", "您确认要删除这<font color=red>"
				+ selectedRows.length + "</font>条数据吗？", function(r) {
			if(r){
				$.ajax({url:"${pageContext.request.contextPath}/backupsapi/delete/"+ids,
				       type:"delete",
				       success:function(result){
					if(result){
						$.messager.alert("系统提示","数据已成功删除！");
						$("#dg").datagrid("reload");
					}else{
						$.messager.alert("系统提示","数据删除失败！");
					}
				
				}
				});        
				/* 
				},"json"); */
			}
		});
		
	}

	//这里打开添加用户模态窗口
	function openUserAddDialog() {
		$("#dlg").dialog("open").dialog("setTitle", "添加用户信息");
		//处理增加操作的url地址 控制器的访问路径
		url = "${pageContext.request.contextPath}/backupsapi/add";
	}

	//这个方法具体添加(也可能是修改)动作
	function saveUser() {
		$("#fm").form("submit", {
			url : url,
			onSubmit : null,
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
		$("#backupsid").val(row.backupsid);
		$("#stuid").val(row.stuid); //stuid
		$("#tpaperid").val(row.tpaperid); //这里要一致
		$("#exatime").val(row.exatime);
		$("#surplustime").val(row.surplustime);
		$("#bktype").val(row.bktype);
		$("#answers").val(row.answers);
		//个url就是我们呀欧完成修改的那个控制器中url地址
		url = "${pageContext.request.contextPath}/backupsapi/update/" + row.id;
	}

	//重置 表单元素还原到初始化状态
	function resetValue() {
		$("#backupsid").val(row.backupsid);
		$("##stuid").val("");
		$("#tpaperid").val("");
		$("#tpaperid").val("");
		$("#exatime").val("");
		$("#surplustime").val("");
		$("#bktype").val("");
		$("#answers").val("");
	}

	//关闭窗口
	function closeUserDialog() {
		$("#dlg").dialog("close");
		resetValue();
	}
	
	function formastudentName(val,row){
		return row.student.stuname;
	}
	  function rowformater(value, row, index) {  
            return "<a href='LoanApplyHandle.aspx?NoticeID=" + row.CMLoanApplyID + "' target='_self'>" + "试卷查看" + "</a>";//_top,  
        }  
        
</script>
</head>
<body style="margin:1px;">
	<table id="dg" title="试题管理" class="easyui-datagrid" fitColumns="true"
		pagination="true" rownumbers="true"
		data-options="url:'${pageContext.request.contextPath}/backupsapi/show',method:'get'"
		fit="true" toolbar="#tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true" align="center"></th>
				<th field="backupsid" width="50" align="center">备份试卷编号</th>
				<th field="stu.stuid" width="100" align="center">学生编号</th>
				<th field="tpaper.tpaperid" width="100" align="center">试卷编号</th>
				<th field="exatime" width="100" align="center">考试时间</th>
				<th field="surplustime" width="50" align="center">考试剩余时间</th>
				<th field="bktype" width="100" align="center">备份卷状态</th>
				<th field="answers" width="150" align="center">答案</th>
				<th field="student.stuname" width="100" align="center" formatter="formastudentName">学生姓名</th>
				<th field="查看试卷" width="100" align="center" formatter="rowformater">查看试卷</th>
	
			</tr>
		</thead>
	</table>
	<div id="tb">
		<div>
			<!-- <a href="javascript:openUserAddDialog()" class="easyui-linkbutton"
				iconCls="icon-add" plain="true">添加</a>  --><a
				href="javascript:openUserModifyDialog()" class="easyui-linkbutton"
				iconCls="icon-edit" plain="true">修改</a> <a
				href="javascript:deleteUser()" class="easyui-linkbutton"
				iconCls="icon-remove" plain="true">删除</a>
		</div>
		<div>
			&nbsp;专业：&nbsp;<select  id="Exid" 
				onkeydown="if(event.keyCode==13) searchUser()" ><option value="1">java</option>
				<option value="2">C#</option></select>
				&nbsp;试题类别：&nbsp;<select  id="typeid" 
				onkeydown="if(event.keyCode==13) searchUser()" ><option value="1">选择题</option>
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
				<td>备份试卷编号</td>
					<td><input type="text" id="backupsid" name="backupsid" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"  
   onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'0')}else{this.value=this.value.replace(/\D/g,'')}"
						class="easyui-validatebox" required="true" /></td>
					<td>学生编号</td>
					<td><input type="text" id="stuid" name="stuid" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"  
   onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'0')}else{this.value=this.value.replace(/\D/g,'')}"
						class="easyui-validatebox" required="true" /></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>试卷编号</td>
					<td><input type="text" id="tpaperid" name="tpaperid"
						onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"  
   onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'0')}else{this.value=this.value.replace(/\D/g,'')}" class="easyui-validatebox" required="true" /></td>
				<td>答案</td>
					<td><input type="text" id="answers" name="answers"
						class="easyui-validatebox" required="true" /></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>考试时间</td>
					<td><input type="text" id="exatime" name="exatime"
						onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"  
   onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'0')}else{this.value=this.value.replace(/\D/g,'')}" class="easyui-validatebox" required="true" /></td>
				<td>考试剩余时间</td>
					<td><input type="text" id="surplustime" name="surplustime"
						onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"  
   onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'0')}else{this.value=this.value.replace(/\D/g,'')}" class="easyui-validatebox" required="true" /></td>
					<td>备份卷状态</td>
					<td><input type="text" id="bktype" name="bktype"
						onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"  
   onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'0')}else{this.value=this.value.replace(/\D/g,'')}" class="easyui-validatebox" required="true" /></td>
				</tr>
				<!-- <tr>
					<td>答案</td>
					<td><input type="text" id="answers" name="answers"
						class="easyui-validatebox" required="true" /></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>考试时间</td>
					<td><input type="text" id="exatime" name="exatime"
						onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"  
   onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'0')}else{this.value=this.value.replace(/\D/g,'')}" class="easyui-validatebox" required="true" /></td>
				</tr>
				<tr>
					<td>考试剩余时间</td>
					<td><input type="text" id="surplustime" name="surplustime"
						onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"  
   onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'0')}else{this.value=this.value.replace(/\D/g,'')}" class="easyui-validatebox" required="true" /></td>
					<td>备份卷状态</td>
					<td><input type="text" id="bktype" name="bktype"
						onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"  
   onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'0')}else{this.value=this.value.replace(/\D/g,'')}" class="easyui-validatebox" required="true" /></td>
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