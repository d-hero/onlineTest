<%@page import="java.util.List"%>

<%@ page language="java" pageEncoding="UTF-8"%>

<jsp:include flush="true" page="../top.jsp"></jsp:include>

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
            <li class="active">在线考试</li>
        </ul>
        <!-- .breadcrumb -->
    </div>

    <div class="page-content">
        <div class="page-header center">
            <h1>
				在线考试
			</h1>
        </div>
        <!-- /.page-header -->

        <div class="row">
            <div class="col-xs-12">
                <!-- PAGE CONTENT BEGINS -->
				<div class="message"></div>
				<div class="table-header">
					诚信考试,请勿作弊!
				</div>
				<div class="table-responsive">
					<table id="sample-table-2" class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>ID</th>
								<th>科目名称</th>
								<th>考试时间</th>
								<th>
									<i class="icon-time bigger-110"></i> 发布时间
								</th>
								<th>总题数</th>
								<th>总分数</th>
								<th>开始考试</th>
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
<!-- /.main-content -->

<jsp:include flush="true" page="/student/studentbottom.jsp"></jsp:include>