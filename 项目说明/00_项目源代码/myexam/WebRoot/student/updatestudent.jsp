<%@ page language="java" pageEncoding="UTF-8"%>


<jsp:include flush="true" page="../top.jsp"></jsp:include>

<div class="main-content">
    <div class="breadcrumbs" id="breadcrumbs">
        <script type="text/javascript">
        
            try {
                ace.settings.check('breadcrumbs', 'fixed')
            } catch (e) {}
		// 点击注册按钮，如果用户名、密码为空则提示用户名与密码不能为空。 判断用户输入的两次密码是否一致，不一致的话，提示密码输入不一致。 如果以上条件都没问题则注册成功。
        </script>
        <div class="row">
        	<div class="col-xs-2"></div>
            <div class="col-xs-8">
                <!-- PAGE CONTENT BEGINS -->
                <div class="message">${message}</div>
				<form action="<%=request.getContextPath()%>/Students/update/${stu.stuid}" name="studentForm" id="studentForm"  onsubmit="return checkstudentform(this)" class="form-horizontal" method="post">			
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right"> 准考证号</label>
						<div class="col-sm-9">
							<input type="text" name="stuno" class="col-xs-10 col-sm-5" disabled="disabled" value="${stu.stuno}" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="sid">学生姓名</label>
						<div class="col-sm-9">
							<input type="text" name="stuname" class="col-xs-10 col-sm-5" value="${stu.stuname}" id="Stuname"/>
						</div>
					</div>
                    <div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="name" >联系号码</label>
						<div class="col-sm-9">
							<input type="text" name="stuphone" class="col-xs-10 col-sm-5"  value="${stu.stuphone}" id="Stupahone"/>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="sex"> 性别 </label>
						<div class="col-sm-9">
							<label>
						 		    boy：<input id="boy" type="radio" name="stusex" value="boy">
							                 girl：<input id="girl" type="radio" name="stusex" value="girl">
							              
							              <script type="text/javascript">
							                         
              if ('${stu.stusex}'=="boy") {	   	
	        $("#boy").attr("checked","true");
	  	}else{
			$("#girl").attr("checked","true");
		
		}
							              </script>
							</label>
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-offset-3 col-md-9">
							<input type="reset" value="重置" class="btn btn-info"/>
							<input type="submit" value="提交" class="btn btn-success" />
						</div>
					</div>
				</form>
            </div>
            <div class="col-xs-2"></div>
            <!-- /.col -->
        </div>
        <!-- /.row -->
    </div>
    <!-- /.page-content -->
</div>
<!-- /.main-content -->

<script>

	 function checkstudentform(sf){
	 
	 
		var message = "";
		var i = 1;
		if(!isSid(sf.sid.value)){
			message += i+") 学号只能输入6-30个字母、数字、下划线\n";
			i++;
		}
		if(!isSid(sf.oldpassword.value)||!isSid(sf.newpassword.value)){
			message += i+") 密码只能输入6-30个字母、数字、下划线\n";
			i++;
		}
		if(sf.name.value==""||sf.name.value.length>15){
			message += i+") 姓名不能为空且小于15字\n";
			i++;
		}
		if(message!=""){
			alert(message);
			return false;
		}else{
			return true;
		}					
	}
	function isSid(s){
		var patrn=/^(\d){6,30}$/;
		if (!patrn.exec(s)) 
			return false;
		return true;
	}	 
</script> 
<jsp:include flush="true" page="/student/studentbottom.jsp"></jsp:include>