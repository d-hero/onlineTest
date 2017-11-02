<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<%
	response.setHeader("pragma", "no-cache");
	response.setHeader("cache-control", "no-cache");
	response.setHeader("expires", "0");
%>

<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$
				.get(
						"${pageContext.request.contextPath}/ExaType/selecttype",
						null,
						function(data, status) {
							var info = "";
							$
									.each(
											data,
											function(index, exatype) {
												info = " <tr> <td>"
														+ exatype.exid
														+ "</td><td>"
														+ exatype.exatype
														+ "</td><td><a href=${pageContext.request.contextPath}/Tpaper/selectAll/"+
    exatype.exid+">进入</a></td></tr>";
												$("#tbl").append(info);
											});

						});
	});
</script>
<jsp:include flush="true" page="../top.jsp"></jsp:include>
<center>



	<div class="main-content">
		<div class="breadcrumbs" id="breadcrumbs">
			<script type="text/javascript">
				try {
					ace.settings.check('breadcrumbs', 'fixed')
				} catch (e) {
				}
			</script>

			<ul class="breadcrumb">
				<li><i class="icon-home home-icon"></i> <a
					href="<%=request.getContextPath()%>/student/index">首页</a></li>
				<li class="active">在线考试</li>
			</ul>
			<!-- .breadcrumb -->
		</div>

		<div class="page-content">
			<div class="page-header center">
				<h1>在线考试</h1>
			</div>
			<!-- /.page-header -->

			<div class="row">
				<div class="col-xs-12">
					<!-- PAGE CONTENT BEGINS -->
					<div class="message"></div>
					<div class="table-header">诚信考试,请勿作弊!</div>
					<div class="table-responsive">
						<table id="tbl"
							class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th>考试类别编号</th>
									<th>考试类别名称</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>

							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- PAGE CONTENT ENDS -->
		</div>
	</div>


</center>
<jsp:include flush="true" page="/student/studentbottom.jsp"></jsp:include>

