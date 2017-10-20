<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<title>My JSP 'exatype.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.11.1.js"></script>

<body>
<%-- 	<jsp:include flush="true" page="/student/studenttop.jsp"></jsp:include> --%>




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

							<h1 align="center">${tname}</h1>
							<h2 align="center">总分：${list.subtotal}分</h2>
							<div align="center" id="totalScore"></div>
							<div style="margin:auto" id="time" align="center">
								<h4>当前时间</h4>
							</div>
							<div style="margin:auto" id="startTime" align="center"></div>
							<div id="surplusTime" align="center"></div>
							</br>
							</br>
							</br>
							<%
								int i = 0;
							%>
							<form action="" method="post" id="fm" pid="${tpaperid}">
								<table border="1" width="800px" height="200px"
									style="margin:auto" class="table table-striped table-bordered table-hover">

									<!-- 单选题 -->
									<c:if test="${listA!=null}">
										<tr>
											<td><h3>${listA.get(0).getqType().getTypename()}(共${listA.size()}题,每题${listA.get(0).getScore()}分)</h3></td>
										</tr>
										<c:forEach items="${listA}" var="q">
											<tr>
												<td><h4>
														第<%=++i%>题.&nbsp;${q.content}
													</h4>
													<input type="hidden" value="${q.answers}"
													id="${q.questionsid}answers"></td>
												<td><div id="${q.questionsid}img"></div> <input
													type="hidden" id="Ascore" value="${q.score}">
												<!-- 单选题得分,用于js中获取 --></td>
											</tr>
											<tr>
												<td><input type="radio" name="${q.questionsid}A"
													value="A">A.${q.keya}</td>
											</tr>
											<tr>
												<td><input type="radio" name="${q.questionsid}A"
													value="B">B.${q.keyb}</td>
											</tr>
											<tr>
												<td><input type="radio" name="${q.questionsid}A"
													value="C">C.${q.keyc}</td>
											</tr>
											<tr>
												<td><input type="radio" name="${q.questionsid}A"
													value="D">D.${q.keyd}</td>
											</tr>
										</c:forEach>
									</c:if>

									<!-- 多选题 -->
									<c:if test="${listB!=null}">
										<tr>
											<td><h3>${listB.get(0).getqType().getTypename()}(共${listB.size()}题,每题(${listB.get(0).getScore()}分)</h3></td>
										</tr>
										<c:forEach items="${listB}" var="q">
											<tr>
												<td><h4>
														第<%=++i%>题.&nbsp;${q.content}
													</h4>
													<input type="hidden" value="${q.answers}"
													id="${q.questionsid}answers"></td>
												<td><div id="${q.questionsid}img"></div> <input
													type="hidden" id="Bscore" value="${q.score}">
												<!-- 多选题得分,用于js中获取 --></td>
											</tr>
											<tr>
												<td><input type="checkbox" name="${q.questionsid}B"
													value="A">A.${q.keya}</td>
											</tr>
											<tr>
												<td><input type="checkbox" name="${q.questionsid}B"
													value="B">B.${q.keyb}</td>
											</tr>
											<tr>
												<td><input type="checkbox" name="${q.questionsid}B"
													value="C">C.${q.keyc}</td>
											</tr>
											<tr>
												<td><input type="checkbox" name="${q.questionsid}B"
													value="D">D.${q.keyd}</td>
											</tr>
										</c:forEach>
									</c:if>

									<!-- 判断题 -->
									<c:if test="${listC!=null}">
										<tr>
											<td><h3>${listC.get(0).getqType().getTypename()}(共${listC.size()}题,每题${listC.get(0).getScore()}分)</h3></td>
										</tr>
										<c:forEach items="${listC}" var="q">
											<tr>
												<td><h4>
														第<%=++i%>题.&nbsp;${q.content}
													</h4>
													<input type="hidden" value="${q.answers}"
													id="${q.questionsid}answers"></td>
												<td><div id="${q.questionsid}img"></div> <input
													type="hidden" id="Cscore" value="${q.score}">
												<!-- 判断题得分,用于js中获取 --></td>
											</tr>
											<tr>
												<td><input type="radio" name="${q.questionsid}C"
													value="T">正确</td>
											</tr>
											<tr>
												<td><input type="radio" name="${q.questionsid}C"
													value="F">错误</td>
											</tr>
										</c:forEach>
									</c:if>

								</table>

								<table class="mtop5" width="70%" cellpadding="5px" border="0"
									style="margin:auto">
									<tr>
										<td style="text-align:center;height:60px"><input
											type="button" value="提交试卷" id="btn_submit" class="btn"
											onclick="submitPaper()" /> <input type="button" value="返回"
											class="btn" onclick="history.go(-1);" /> <input
											type="hidden" id="replyAnswers"></td>
									</tr>
								</table>

							</form>

						</div>
					</div>
				</div>
				<!-- PAGE CONTENT ENDS -->
			</div>
		</div>
	
	<%-- <jsp:include flush="true" page="/student/studentbottom.jsp"></jsp:include> --%>
</body>

 <script type="text/javascript"
	src="${pageContext.request.contextPath}/js/time.js"></script>
<!-- 计时器 --> 
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/submitPaper.js"></script>
<!--  提交试卷 -->

</html>
