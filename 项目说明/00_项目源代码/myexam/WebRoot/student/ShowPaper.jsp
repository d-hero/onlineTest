<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>试卷详情页</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<script type="text/javascript">
	
</script>
</head>

<body>
	<input type="button" value="返回" class="btn" onclick="history.go(-1);" style="margin-left: 1300px;margin-top: 20px"  />
	<h1 style="text-align:center">${tpaper.tname }</h1>
	<p style="margin-left: 950px">${tpaper.exatype.exatype }</p>

	<%-- ${tpaper.papers.questions.content }/${tpaper.papers.orderno }
	 ${tpaper.backups.answers } <br>--%>

	<div id="oneSelect"
		style="width: 50%; height: 80%; resize: none;border: 2px;margin-left: 500px">

		<h4 style="margin-left: 0px">一、单选题</h4>
		<c:forEach items="${tpaper.papers }" var="t" begin="0" end="${x-1 }"
			step="1">
		
			${t.orderno+1}、${t.questions.content }
			<span style="margin-left: 50px">( </span>
			<span style="margin-left: 10px" id="anspan"></span>
			${t.aws}
			<span style="margin-left: 10px">)</span>
			<br />
			<br />
			<span style="margin-right: 35px;margin-left: 25px">A、${t.questions.keya }
			</span>
			<span style="margin-right: 35px">B、${t.questions.keyb }</span>
			<span style="margin-right: 35px">C、${t.questions.keyc }</span>
			<span style="margin-right: 35px">D、${t.questions.keyd }</span>
			<br />
			<br />

		</c:forEach>
		<h4 style="margin-left: 0px">二、多选题</h4>
		<c:forEach items="${tpaper.papers }" var="t" begin="${x }"
			end="${x+y-1 }" step="1">
			
			${t.orderno+1}、${t.questions.content }
			<span style="margin-left: 50px">(</span>
			<span style="margin-left: 10px"></span>
			${t.aws}
			<span style="margin-left: 10px">)</span><br /><br />
			<span style="margin-right: 35px;margin-left: 25px">A、${t.questions.keya }
			</span>
			<span style="margin-right: 35px">B、${t.questions.keyb }</span>
			<span style="margin-right: 35px">C、${t.questions.keyc }</span>
			<span style="margin-right: 35px">D、${t.questions.keyd }</span>
			<br />
			<br />

		</c:forEach>
		<h4 style="margin-left: 0px">三、判断题</h4>
		<c:forEach items="${tpaper.papers }" var="t" begin="${x+y }"
			end="${x+y+z-1 }" step="1">
		
			${t.orderno+1}、${t.questions.content }
			<span style="margin-left: 50px">(</span>
			<span style="margin-left: 10px"></span>
			${t.aws}
			<span style="margin-left: 10px">)</span>
			<br />
			<br />
			<span style="margin-right: 35px;margin-left: 25px">${t.questions.keya }
			</span>
			<br />
			<br />

		</c:forEach>
	</div>





	<form method="get" id="fm">

		<!-- 题目添加的地方 -->
		<div id="qtext" style="width: 50%; height: 80%; resize: none;"></div>
		<br />
	</form>
</body>
</html>
