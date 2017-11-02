<%@ page language="java" pageEncoding="UTF-8"%>


<jsp:include flush="true" page="/student/studenttop.jsp"></jsp:include>


<div class="main-content">
    <div class="breadcrumbs" id="breadcrumbs">
        <script type="text/javascript">
            try {
                ace.settings.check('breadcrumbs', 'fixed')
            } catch (e) {}
        </script>

        <ul class="breadcrumb">
            <li>
                <i class="icon-home home-icon"></i>
                <a href="<%=request.getContextPath()%>/student/index">首页</a>
            </li>
            <li class="active">成绩列表</li>
        </ul>
        <!-- .breadcrumb -->
    </div>

    <div class="page-content">
        <div class="page-header center">
            <h1>
				成绩查询
			</h1>
        </div>
        <!-- /.page-header -->

        <div class="row">
            <div class="col-xs-12">
                <!-- PAGE CONTENT BEGINS -->
				<div class="message">${message}</div>
				<div class="table-responsive">
					<logic:present name="result">
					<table width="400"  border="1" align="center" cellpadding="4" cellspacing="1" bgcolor="#3D7BA3">
						<tr  align="center">
							<td bgcolor="94C9E7">姓名</td>
							<td bgcolor="ffffff" align="left">${result.student.name}&nbsp;</td>
						</tr> 
						<tr  align="center">
							<td bgcolor="94C9E7">科目编号</td>
							<td bgcolor="ffffff" align="left">${result.subject.subjectid}&nbsp;</td>
						</tr> 
						<tr  align="center">
							<td bgcolor="94C9E7">科目名称</td>
							<td bgcolor="ffffff" align="left">${result.subject.name}&nbsp;</td>
						</tr> 
						<tr  align="center">
							<td bgcolor="94C9E7">题数</td>
							<td bgcolor="ffffff" align="left">${result.subject.totalnum}&nbsp;</td>
						</tr> 
						<tr  align="center">
							<td bgcolor="94C9E7">总时间</td>
							<td bgcolor="ffffff" align="left">${result.subject.time}&nbsp;</td>
						</tr> 
						<tr  align="center">
							<td bgcolor="94C9E7">总分</td>
							<td bgcolor="ffffff" align="left">${result.subject.totalscore}&nbsp;</td>
						</tr> 
						<tr  align="center">
							<td bgcolor="94C9E7">考试时间</td>
							<td bgcolor="ffffff" align="left">${result.starttime}&nbsp;</td>
						</tr> 
						<tr  align="center">
							<td bgcolor="94C9E7">交卷时间</td>
							<td bgcolor="ffffff" align="left">${result.endtime}&nbsp;</td>
						</tr> 
						<tr  align="center">
							<td bgcolor="94C9E7">得分</td>
							<td bgcolor="ffffff" align="left">${result.score}&nbsp;</td>
						</tr>  
					</table>
					</logic:present>
				</div>
			</div>
			<center>
				<a  href="<%=request.getContextPath()%>/student/result/list.do" /><input type="button" class="btn btn-default" value="返回" ></a>
			</center>
		</div>
		<!-- PAGE CONTENT ENDS -->
	</div>
</div>
<!-- /.main-content -->

<jsp:include flush="true" page="/student/studentbottom.jsp"></jsp:include>