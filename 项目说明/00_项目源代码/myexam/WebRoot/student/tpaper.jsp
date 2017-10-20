<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ page import="com.etc.entity.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


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
				<h1>试题</h1>
			</div>
			<!-- /.page-header -->

			<div class="row">
				<div class="col-xs-12">
					<!-- PAGE CONTENT BEGINS -->
					<div class="message"></div>
					<div class="table-header">诚信考试,请勿作弊!</div>
					<div class="table-responsive">
						<table id="sample-table-2"
							class="table table-striped table-bordered table-hover">

   <thead><th>试卷id</th>
   <th>考卷名称</th>
   <th>操作</th></thead>
  
  <%List<Tpaper> listT=(List<Tpaper>)request.getAttribute("list");
    List<Backups> listB=(List<Backups>)request.getAttribute("listB");
    List<Tpaper> listb=new ArrayList<Tpaper>();
    for(Backups b:listB){  //将备份表中的Tpaper取出
    listb.add(b.getTpaper());
    }
    
    for(Tpaper t:listT){ /* 遍历试题集合，并判断备份表中是否包含 */
    if(!listb.contains(t)){  /* 情况1：试卷集合没有雨备份表试题相关的部分，是直接重新考试 */
    /* 使用List.contains(Object object)方法判断ArrayList是否包含一个元素对象（针对于对象的属性值相同，但对象地址不同的情况），如果没有重写List<E>的元素对象Object中的
    equals方法,默认返回都为false，所以这里讲Tpaper实体类的equal（）方法进行了重写，只比较id和name*/
     %>
     
     <tr><td><%=t.getTpaperid()%></td>
    
        <td><%=t.getTname()%></td>
        
        <td><a href="${pageContext.request.contextPath}/Tpaper/selectPaper/

<%=t.getTpaperid()%>">考试</a></td>
     </tr>
     
     <%}else {            /* 情况1：试卷集合有与雨备份表试题相关的部分，是继续考试或已经结束考试 */
     for(Backups bk:listB){      /* 继续考试 */
     if(t.getTpaperid()==bk.getTpaper().getTpaperid()&&bk.getBktype()==0){%>
      <tr><td><%=t.getTpaperid()%></td>
    
        <td><%=t.getTname()%></td>
        
        <td><a href="${pageContext.request.contextPath}/Tpaper/selectPaper/

<%=t.getTpaperid()%>">继续考试</a></td>
     </tr>
     <%}else if(t.getTpaperid()==bk.getTpaper().getTpaperid()&&bk.getBktype()==1){%>   <!-- 考试已结束的判断条件  -->
      <tr><td><%=t.getTpaperid()%></td>
    
        <td><%=t.getTname()%></td>
        
        <td><a href="${pageContext.request.contextPath}/Tpaper/selectPaper/

<%=t.getTpaperid()%>">考试已结束</a></td>
     </tr>
  
     <%}}}}%>   
  
   
   </table>
					</div>
				</div>
			</div>
			PAGE CONTENT ENDS
		</div>
	</div>


</center>
<jsp:include flush="true" page="/student/studentbottom.jsp"></jsp:include>
   
  