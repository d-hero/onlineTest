<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%-- <%@taglib uri="spring.tld" prefix="spring"%> --%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    	<base href="<%=basePath%>">
    
    	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta charset="utf-8"><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>试题管理</title>
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="keywords" content="">
		<link rel="shortcut icon" href="<%=basePath%>resources/images/favicon.ico" />
		<link href="resources/bootstrap/css/bootstrap-huan.css" rel="stylesheet">
		<link href="resources/font-awesome/css/font-awesome.min.css" rel="stylesheet">
		<link href="resources/css/style.css" rel="stylesheet">
		
		<link href="resources/css/exam.css" rel="stylesheet">
		<link href="resources/chart/morris.css" rel="stylesheet">
		
		<script type="text/javascript" src="resources/js/jquery/jquery-1.9.0.min.js"></script>
		
		<script type="text/javascript">
			 function goFile() {		 	
			 	if($("flag").val()=="true")
					window.location.href="${pageContext.request.contextPath}/Sturesult/showForStu";
				else 
					alert("没有登录,不能进入");
			}
			 function goResult() {		 	
			 	if($("flag").val()=="true")
					window.location.href="${pageContext.request.contextPath}/Sturesult/showForStu";
				else 
					alert("没有登录,不能进入");
			}
			 function goSetting() {		 	
			 	if($("flag").val()=="true")
					window.location.href="${pageContext.request.contextPath}/Sturesult/showForStu";
				else 
					alert("没有登录,不能进入");
			}
		</script>
	</head>
	<body>
		<header>
		<c:if test="${not empty sessionScope.stu}">
			<input id="flag" type="hidden" value="true">
		</c:if>
		
		<input  id= type="hidden"  value="sessionScope.stu">
			<div class="container">
				<div class="row">
					<div class="col-xs-5">
						<div class="logo">
							<h1><a href="#"><img alt="" src="resources/images/logo.png"></a></h1>
						</div>
					</div>
					<div class="col-xs-7" id="login-info">
						<c:choose>
							<c:when test="${not empty sessionScope.stu}">
								<div id="login-info-user">									
									<span>欢迎你|${stu.stuname}</span>
									<a href="j_spring_security_logout"><i class="fa fa-sign-out"></i> 退出</a>
								</div>
							</c:when>
							<c:otherwise>
								<a class="btn btn-primary" href="user-register">用户注册</a>
								<a class="btn btn-success" href="student/login.jsp">登录</a>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</header>
		<!-- Navigation bar starts -->

		<div class="navbar bs-docs-nav" role="banner">
			<div class="container">
				<nav class="collapse navbar-collapse bs-navbar-collapse" role="navigation">
					<ul class="nav navbar-nav">
						<li>
							<a href="student/index.jsp"><i class="fa fa-home"></i>主页</a>
						</li>
						<li>
							<a href="student/exatype.jsp"><i class="fa fa-edit"></i>文件中心</a>
						</li>
						<li>
							<a href="javascript:goResult()"><i class="fa fa-dashboard"></i>成绩分析</a>
						</li>
						<li class="active">
							<a href="student/updatestudent.jsp"><i class="fa fa-cogs"></i>个人设置</a>
						</li>
					</ul>
				</nav>
			</div>
		</div>
		<!-- Slider Ends -->

		<!-- Javascript files -->
		<!-- jQuery -->
		<script type="text/javascript" src="resources/js/jquery/jquery-1.9.0.min.js"></script>
		<script type="text/javascript" src="resources/js/all.js"></script>
		<!-- Bootstrap JS -->
		<script type="text/javascript" src="resources/bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="resources/chart/raphael-min.js"></script>
		<script type="text/javascript" src="resources/chart/morris.js"></script>
		<script type="text/javascript" src="resources/js/pwd-change.js"></script>
	</body>
</html>