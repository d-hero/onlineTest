<%@page import="com.etc.entity.Students"%>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>

<head>
    <title>在线考试系统</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    	<!-- basic styles -->
		<link href="<%=request.getContextPath()%>/assets/css/bootstrap.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/font-awesome.min.css" />
		<!--[if IE 7]>
		  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/font-awesome-ie7.min.css" />
		<![endif]-->
		<!-- page specific plugin styles -->
		<!-- fonts -->
		<!-- ace styles -->
		<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/ace.min.css" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/ace-rtl.min.css" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/ace-skins.min.css" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/message.css" />
		<!--[if lte IE 8]>
		  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/ace-ie.min.css" />
		<![endif]-->
		<!-- inline styles related to this page -->
		<!-- ace settings handler -->
		<script src="<%=request.getContextPath()%>/assets/js/ace-extra.min.js"></script>
		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
		<script src="<%=request.getContextPath()%>/assets/js/html5shiv.js"></script>
		<script src="<%=request.getContextPath()%>/assets/js/respond.min.js"></script>
		<![endif]-->

		<!-- basic scripts -->
		<!--[if !IE]> -->
		<script src="<%=request.getContextPath()%>/assets/js/jquery.min.js"></script>
		<!-- <![endif]-->
		<!--[if IE]>
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
		<![endif]-->
		<!--[if !IE]> -->
		<script type="text/javascript">
			window.jQuery || document.write("<script src='<%=request.getContextPath()%>/assets/js/jquery-2.0.3.min.js'>" + "<" + "script>");
		</script>
		<!-- <![endif]-->
		<!--[if IE]>
		<script type="text/javascript">
		 window.jQuery || document.write("<script src='<%=request.getContextPath()%>/assets/js/jquery-1.10.2.min.js'>"+"<"+"script>");
		</script>
		<![endif]-->
		<script type="text/javascript">
			if ("ontouchend" in document) document.write("<script src='<%=request.getContextPath()%>/assets/js/jquery.mobile.custom.min.js'>" + "<" + "script>");
		</script>
		<script src="<%=request.getContextPath()%>/assets/js/bootstrap.min.js"></script>
		<script src="<%=request.getContextPath()%>/assets/js/typeahead-bs2.min.js"></script>
		<!--[if lte IE 8]>
		  <script src="<%=request.getContextPath()%>/assets/js/excanvas.min.js"></script>
		<![endif]-->
		<script src="<%=request.getContextPath()%>/assets/js/jquery-ui-1.10.3.custom.min.js"></script>
		<script src="<%=request.getContextPath()%>/assets/js/jquery.ui.touch-punch.min.js"></script>
		<script src="<%=request.getContextPath()%>/assets/js/jquery.slimscroll.min.js"></script>
		<script src="<%=request.getContextPath()%>/assets/js/jquery.easy-pie-chart.min.js"></script>
		<script src="<%=request.getContextPath()%>/assets/js/jquery.sparkline.min.js"></script>
		<script src="<%=request.getContextPath()%>/assets/js/flot/jquery.flot.min.js"></script>
		<script src="<%=request.getContextPath()%>/assets/js/flot/jquery.flot.pie.min.js"></script>
		<script src="<%=request.getContextPath()%>/assets/js/flot/jquery.flot.resize.min.js"></script>
		<script src="<%=request.getContextPath()%>/assets/js/ace-elements.min.js"></script>
		<script src="<%=request.getContextPath()%>/assets/js/ace.min.js"></script>
		<!-- inline scripts related to this page -->
		<script type="text/javascript">

			jQuery(function($) {
			 
		
				$('.easy-pie-chart.percentage').each(function() {
					var $box = $(this).closest('.infobox');
					var barColor = $(this).data('color') || (!$box.hasClass('infobox-dark') ? $box.css('color') : 'rgba(255,255,255,0.95)');
					var trackColor = barColor == 'rgba(255,255,255,0.95)' ? 'rgba(255,255,255,0.25)' : '#E2E2E2';
					var size = parseInt($(this).data('size')) || 50;
					$(this).easyPieChart({
						barColor: barColor,
						trackColor: trackColor,
						scaleColor: false,
						lineCap: 'butt',
						lineWidth: parseInt(size / 10),
						animate: /msie\s*(8|7|6)/.test(navigator.userAgent.toLowerCase()) ? false : 1000,
						size: size
					});
				})
				$('.sparkline').each(function() {
					var $box = $(this).closest('.infobox');
					var barColor = !$box.hasClass('infobox-dark') ? $box.css('color') : '#FFF';
					$(this).sparkline('html', {
						tagValuesAttribute: 'data-values',
						type: 'bar',
						barColor: barColor,
						chartRangeMin: $(this).data('min') || 0
					});
				});
				var placeholder = $('#piechart-placeholder').css({
					'width': '90%',
					'min-height': '150px'
				});
				var data = [{
					label: "social networks",
					data: 38.7,
					color: "#68BC31"
				}, {
					label: "search engines",
					data: 24.5,
					color: "#2091CF"
				}, {
					label: "ad campaigns",
					data: 8.2,
					color: "#AF4E96"
				}, {
					label: "direct traffic",
					data: 18.6,
					color: "#DA5430"
				}, {
					label: "other",
					data: 10,
					color: "#FEE074"
				}]

				function drawPieChart(placeholder, data, position) {
					$.plot(placeholder, data, {
						series: {
							pie: {
								show: true,
								tilt: 0.8,
								highlight: {
									opacity: 0.25
								},
								stroke: {
									color: '#fff',
									width: 2
								},
								startAngle: 2
							}
						},
						legend: {
							show: true,
							position: position || "ne",
							labelBoxBorderColor: null,
							margin: [-30, 15]
						},
						grid: {
							hoverable: true,
							clickable: true
						}
					})
				}
				drawPieChart(placeholder, data);
				/**
				we saved the drawing function and the data to redraw with different position later when switching to RTL mode dynamically
				so that's not needed actually.
				*/
				placeholder.data('chart', data);
				placeholder.data('draw', drawPieChart);
				var $tooltip = $("<div class='tooltip top in'><div class='tooltip-inner'></div></div>").hide().appendTo('body');
				var previousPoint = null;
				placeholder.on('plothover', function(event, pos, item) {
					if (item) {
						if (previousPoint != item.seriesIndex) {
							previousPoint = item.seriesIndex;
							var tip = item.series['label'] + " : " + item.series['percent'] + '%';
							$tooltip.show().children(0).text(tip);
						}
						$tooltip.css({
							top: pos.pageY + 10,
							left: pos.pageX + 10
						});
					} else {
						$tooltip.hide();
						previousPoint = null;
					}
				});
				var d1 = [];
				for (var i = 0; i < Math.PI * 2; i += 0.5) {
					d1.push([i, Math.sin(i)]);
				}
				var d2 = [];
				for (var i = 0; i < Math.PI * 2; i += 0.5) {
					d2.push([i, Math.cos(i)]);
				}
				var d3 = [];
				for (var i = 0; i < Math.PI * 2; i += 0.2) {
					d3.push([i, Math.tan(i)]);
				}
				var sales_charts = $('#sales-charts').css({
					'width': '100%',
					'height': '220px'
				});
				$.plot("#sales-charts", [{
					label: "Domains",
					data: d1
				}, {
					label: "Hosting",
					data: d2
				}, {
					label: "Services",
					data: d3
				}], {
					hoverable: true,
					shadowSize: 0,
					series: {
						lines: {
							show: true
						},
						points: {
							show: true
						}
					},
					xaxis: {
						tickLength: 0
					},
					yaxis: {
						ticks: 10,
						min: -2,
						max: 2,
						tickDecimals: 3
					},
					grid: {
						backgroundColor: {
							colors: ["#fff", "#fff"]
						},
						borderWidth: 1,
						borderColor: '#555'
					}
				});
				$('#recent-box [data-rel="tooltip"]').tooltip({
					placement: tooltip_placement
				});

				function tooltip_placement(context, source) {
					var $source = $(source);
					var $parent = $source.closest('.tab-content')
					var off1 = $parent.offset();
					var w1 = $parent.width();
					var off2 = $source.offset();
					var w2 = $source.width();
					if (parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2)) return 'right';
					return 'left';
				}
				$('.dialogs,.comments').slimScroll({
					height: '300px'
				});
				//Android's default browser somehow is confused when tapping on label which will lead to dragging the task
				//so disable dragging when clicking on label
				var agent = navigator.userAgent.toLowerCase();
				if ("ontouchstart" in document && /applewebkit/.test(agent) && /android/.test(agent))
					$('#tasks').on('touchstart', function(e) {
						var li = $(e.target).closest('#tasks li');
						if (li.length == 0) return;
						var label = li.find('label.inline').get(0);
						if (label == e.target || $.contains(label, e.target)) e.stopImmediatePropagation();
					});
				$('#tasks').sortable({
					opacity: 0.8,
					revert: true,
					forceHelperSize: true,
					placeholder: 'draggable-placeholder',
					forcePlaceholderSize: true,
					tolerance: 'pointer',
					stop: function(event, ui) { //just for Chrome!!!! so that dropdowns on items don't appear below other items after being moved
						$(ui.item).css('z-index', 'auto');
					}
				});
				$('#tasks').disableSelection();
				$('#tasks input:checkbox').removeAttr('checked').on('click', function() {
					if (this.checked) $(this).closest('li').addClass('selected');
					else $(this).closest('li').removeClass('selected');
				});
			})
		</script>
    <script language="JavaScript">
        <!--
        function MM_preloadImages() { //v3.0
            var d = document;
            if (d.images) {
                if (!d.MM_p) d.MM_p = new Array();
                var i, j = d.MM_p.length,
                    a = MM_preloadImages.arguments;
                for (i = 0; i < a.length; i++)
                    if (a[i].indexOf("#") != 0) {
                        d.MM_p[j] = new Image;
                        d.MM_p[j++].src = a[i];
                    }
            }
        }

        function MM_swapImgRestore() { //v3.0
            var i, x, a = document.MM_sr;
            for (i = 0; a && i < a.length && (x = a[i]) && x.oSrc; i++) x.src = x.oSrc;
        }

        function MM_findObj(n, d) { //v4.01
            var p, i, x;
            if (!d) d = document;
            if ((p = n.indexOf("?")) > 0 && parent.frames.length) {
                d = parent.frames[n.substring(p + 1)].document;
                n = n.substring(0, p);
            }
            if (!(x = d[n]) && d.all) x = d.all[n];
            for (i = 0; !x && i < d.forms.length; i++) x = d.forms[i][n];
            for (i = 0; !x && d.layers && i < d.layers.length; i++) x = MM_findObj(n, d.layers[i].document);
            if (!x && d.getElementById) x = d.getElementById(n);
            return x;
        }

        function MM_swapImage() {
                var i, j = 0,
                    x, a = MM_swapImage.arguments;
                document.MM_sr = new Array;
                for (i = 0; i < (a.length - 2); i += 3)
                    if ((x = MM_findObj(a[i])) != null) {
                        document.MM_sr[j++] = x;
                        if (!x.oSrc) x.oSrc = x.src;
                        x.src = a[i + 2];
                    }
            }
            //显示学生的成绩页面
            function querystuid() {
				window.location.href="${pageContext.request.contextPath}/Sturesult/showForStu";
			}
          
            
            
    </script>
</head>

<body>
    
    <!--顶栏-->
    <div class="navbar navbar-default" id="navbar">
			<script type="text/javascript">
				try {
					ace.settings.check('navbar', 'fixed')
				} catch (e) {}
			</script>

			<div class="navbar-container" id="navbar-container">
				<div class="navbar-header pull-left">
					<a href="#" class="navbar-brand">
						<small>
							<i class="icon-leaf"></i>
							在线考试系统
						</small>
					</a>
					<!-- /.brand -->
				</div>
				<!-- /.navbar-header -->

				<!--个人信息-->
				<div class="navbar-header pull-right" role="navigation">
					<ul class="nav ace-nav">
						<li class="light-blue">
							<a data-toggle="dropdown" href="#" class="dropdown-toggle">
								<img class="nav-user-photo" src="<%=request.getContextPath()%>/assets/avatars/user.jpg" alt="Jason's Photo" />
								<span class="user-info">
									<small>欢迎光临,</small>
								  ${stu.stuname}
								</span>

								<i class="icon-caret-down"></i>
							</a>

							<ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
								<li>
									<a href="<%=request.getContextPath()%>/student/updatestudent.jsp">
										<i class="icon-cog"></i> 设置
									</a>
								</li>

								<li>
									<a href="<%=request.getContextPath()%>/student/updatestudent.jsp">
										<i class="icon-user"></i> 个人资料
									</a>
								</li>

								<li class="divider"></li>

								<li>
									<a href="<%=request.getContextPath()%>/student/logout">
										<i class="icon-off"></i> 退出
									</a>
								</li>
							</ul>
						</li>
					</ul>
					<!-- /.ace-nav -->
				</div>
				<!-- /.navbar-header -->
			</div>
			<!-- /.container -->
		</div>

		<div class="main-container" id="main-container">
			<script type="text/javascript">
				try {
					ace.settings.check('main-container', 'fixed')
				} catch (e) {}
			</script>

			<div class="main-container-inner">
				<a class="menu-toggler" id="menu-toggler" href="#">
					<span class="menu-text"></span>
				</a>

				<!--导航栏-->
				<div class="sidebar" id="sidebar">
					<script type="text/javascript">
						try {
							ace.settings.check('sidebar', 'fixed')
						} catch (e) {}
					</script>

					<div class="sidebar-shortcuts" id="sidebar-shortcuts">

						<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
							<span class="btn btn-success"></span>

							<span class="btn btn-info"></span>

							<span class="btn btn-warning"></span>

							<span class="btn btn-danger"></span>
						</div>
					</div>
					<!-- #sidebar-shortcuts -->

					<ul class="nav nav-list">
					
					<li class="active">
							<a href="<%=request.getContextPath()%>/student/index.jsp">
								<i class="icon-dashboard"></i>
								<span class="menu-text"> 在线考试系统 </span>
							</a>
						</li>
						
						

						<li>
							<a href="<%=request.getContextPath()%>/student/updatestudent.jsp">
								<i class="icon-user-md"></i>
		                		<span class="menu-text"> 修改信息 </span>
	            			</a>
						</li>

						<li >
							<a href="<%=request.getContextPath()%>/student/exatype.jsp">
								<i class="icon-dashboard"></i>
								<span class="menu-text"> 在线考试 </span>
							</a>
						</li>
						
						
						<li >
							<a href="<%=request.getContextPath()%>/student/addQuestion.jsp">
								<i class="icon-dashboard"></i>
								<span class="menu-text"> 自我检测 </span>
							</a>
						</li>
						<li>
							<a href="javascript:querystuid()"> 
								<i class="icon-list"></i>
								<span class="menu-text"> 成绩查询 </span>
               				</a>
						</li>
						<li>
							<a href="<%=request.getContextPath()%>/student/logout">
								<i class="icon-off"></i>
								<span class="menu-text"> 退出系统 </span>
                			</a>
						</li>
					</ul>
					<!-- /.nav-list -->

					<div class="sidebar-collapse" id="sidebar-collapse">
						<i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
					</div>

					<script type="text/javascript">
						try {
							ace.settings.check('sidebar', 'collapsed')
						} catch (e) {}
					</script>
				</div>
				
				<!--右侧设置功能-->
				<div class="ace-settings-container" id="ace-settings-container">
					<div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="ace-settings-btn">
						<i class="icon-cog bigger-150"></i>
					</div>
					<div class="ace-settings-box" id="ace-settings-box">
						<div>
							<div class="pull-left">
								<select id="skin-colorpicker" class="hide">
									<option data-skin="default" value="#438EB9">#438EB9</option>
									<option data-skin="skin-1" value="#222A2D">#222A2D</option>
									<option data-skin="skin-2" value="#C6487E">#C6487E</option>
									<option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
								</select>
							</div>
							<span>&nbsp; 选择皮肤</span>
						</div>

						<div>
							<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-navbar" />
							<label class="lbl" for="ace-settings-navbar"> 固定导航条</label>
						</div>

						<div>
							<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-sidebar" />
							<label class="lbl" for="ace-settings-sidebar"> 固定滑动条</label>
						</div>

						<div>
							<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-breadcrumbs" />
							<label class="lbl" for="ace-settings-breadcrumbs">固定面包屑</label>
						</div>

						<div>
							<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl" />
							<label class="lbl" for="ace-settings-rtl">切换到左边</label>
						</div>

						<div>
							<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-add-container" />
							<label class="lbl" for="ace-settings-add-container">
								切换窄屏
								<b></b>
							</label>
						</div>
					</div>
				</div>
				<!-- /#ace-settings-container -->
				
				<!--头部结束-->
				