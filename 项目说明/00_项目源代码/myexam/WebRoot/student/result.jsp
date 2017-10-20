<%@ page language="java" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>

<jsp:include flush="true" page="../top.jsp"></jsp:include>


<div class="main-content">
	<div class="breadcrumbs" id="breadcrumbs">


		<ul class="breadcrumb">
			<li><i class="icon-home home-icon"></i></li>
			<li class="active">成绩列表</li>
		</ul>
		<!-- .breadcrumb -->
	</div>

	<div class="page-content">
		<div class="page-header center">
			<h1>成绩查询</h1>
		</div>
		<!-- /.page-header -->

		<div class="row">
			<div class="col-xs-12">
				<!-- PAGE CONTENT BEGINS -->
				<div class="message"></div>
				<div class="table-responsive">
					<table id="sample-table-2" title="学生成绩管理" fitColumns="true"
						class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<td>试卷编号</td>
								<td>试卷类别</td>
								<td>试卷名称</td>
								<td>所获分数</td>
								<td>详细情况</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list.stuResult}" var="r">
								<tr>
									<td>${r.tpaper.tpaperid }</td>
									<td>${r.tpaper.exatype.exatype }</td>
									<td>${r.tpaper.tname }</td>
									<td>${r.sturesult }</td>
									<td>
									<a
										href="javascript:load(${r.tpaper.tpaperid })"
									>查看试卷</a>
									<script type="text/javascript">
									function load(id) {
										location.href="${pageContext.request.contextPath }/Sturesult/showpaperforstu/"+id;
									}
									</script>
									
									</td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- PAGE CONTENT ENDS -->
	</div>
</div>
<!-- /.main-content -->

<jsp:include flush="true" page="/student/studentbottom.jsp"></jsp:include>