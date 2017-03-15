<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>

<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->

<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->

<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->

<!-- BEGIN HEAD -->

<head>

	<meta charset="utf-8" />

	<title>Metronic | Data Tables - Editable Tables</title>

	<meta content="width=device-width, initial-scale=1.0" name="viewport" />

	<meta content="" name="description" />

	<meta content="" name="author" />

	<!-- BEGIN GLOBAL MANDATORY STYLES -->

	<link href="../../static/media/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

	<link href="../../static/media/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css"/>

	<link href="../../static/media/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>

	<link href="../../static/media/css/style-metro.css" rel="stylesheet" type="text/css"/>

	<link href="../../static/media/css/style.css" rel="stylesheet" type="text/css"/>

	<link href="../../static/media/css/style-responsive.css" rel="stylesheet" type="text/css"/>

	<link href="../../static/media/css/default.css" rel="stylesheet" type="text/css" id="style_color"/>

	<link href="../../static/media/css/uniform.default.css" rel="stylesheet" type="text/css"/>

	<!-- END GLOBAL MANDATORY STYLES -->

	<!-- BEGIN PAGE LEVEL STYLES -->

	<link rel="stylesheet" type="text/css" href="../../static/media/css/select2_metro.css" />

	<link rel="stylesheet" href="../../static/media/css/DT_bootstrap.css" />
	
	<link href="../../static/page/keleyidivpager.css" type="text/css" rel="Stylesheet" />

	<!-- END PAGE LEVEL STYLES -->

	<link rel="shortcut icon" href="../../static/media/image/favicon.ico" />

</head>

<!-- END HEAD -->

<!-- BEGIN BODY -->

<body>

	<div class="row-fluid page-header-fixed">
	
		<div class="span12">
	
			<!-- BEGIN EXAMPLE TABLE PORTLET-->
	
			<div class="portlet box blue">
	
				<div class="portlet-title">
	
					<div class="caption"><i class="icon-edit"></i>用户信息操作</div>
	
				</div>
	
				<div class="portlet-body">
	
					<div class="clearfix">
	
						<div class="btn-group">
	
							<a class=" btn green" data-toggle="modal" href="#stack1">添加用户信息</a>
	
						</div>
	
						<div class="btn-group pull-right">
	
							<button class="btn dropdown-toggle" data-toggle="dropdown">Tools <i class="icon-angle-down"></i>
	
							</button>
	
							<ul class="dropdown-menu pull-right">
	
								<li><a href="#">Print</a></li>
	
								<li><a href="#">Save as PDF</a></li>
	
								<li><a href="#">Export to Excel</a></li>
	
							</ul>
	
						</div>
	
					</div>
	
					<table class="table table-striped table-hover table-bordered" id="sample_editable_1">
	
						<thead>
	
							<tr>
	
								<th>#</th>
	
								<th>用户名</th>
	
								<th>真实名</th>
	
								<th>性别</th>
	
								<th>电话</th>
	                                        
	                                        <th>创建时间</th>
	
	                                        <th>修改时间</th>
	
								<th>编辑</th>
	
								<th>删除</th>
	
							</tr>
	
						</thead>
	
						<tbody>
	
								<c:forEach var="userinfo" items="${userInfoList}">
	                                        <tr>
	                                            <td>1</td>
	                                            <td>${userinfo.u_userName}</td>
	                                            <td>${userinfo.u_realName}</td>
	                                            <td>${userinfo.u_sex}</td>
	                                            <td>${userinfo.u_phone}</td>
	                                            <td>${userinfo.u_createTime}</td>
	                                            <td>${userinfo.u_lastChangeTime}</td>
	                                            <td><a class="edit" href="javascript:;">Edit</a></td>
								<td><a class="delete" href="javascript:;">Delete</a></td>
	                                        </tr>
	                                    </c:forEach>
						</tbody>
	
					</table>
	
					<div id="div_pager"></div>
					</div>
				
			</div>
	
			<!-- END EXAMPLE TABLE PORTLET-->
	
		</div>
	
	</div>

		<div id="stack1" class="modal hide fade" tabindex="-1" data-focus-on="input:first">

			<div class="modal-header">

				<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>

				<h4 class="modal-title" id="myModalLabel">
					添加用户信息
				</h4>

			</div>

			<div class="modal-body">

				<div class="form-group" >
					<label for="u_userName" class="col-sm-2 control-label">用户名</label>
					<div class="col-sm-10" >
						<input type="text" class="form-control" id="u_userName" 
							   placeholder="请输入用户名" style="width:97%;">
					</div>
				</div>
				<div class="form-group" >
					<label for="u_passWord" class="col-sm-2 control-label">密码</label>
					<div class="col-sm-10" >
						<input type="password" class="form-control" id="u_passWord" 
							   placeholder="请输入用密码" style="width:97%;">
					</div>
				</div>
				<div class="form-group" >
					<div class="col-sm-10" >
						<input type="password" class="form-control" id="u_passWord_too" 
							   placeholder="请再次输入用密码" style="width:97%;">
					</div>
				</div>
				<div id="password_error" class="alert alert-danger" style="display:none">
		                两次输入的密码不一致！
		            </div>
				<div class="form-group" >
					<label for="u_realName" class="col-sm-2 control-label">昵称</label>
					<div class="col-sm-10" >
						<input type="text" class="form-control" id="u_realName" 
							   placeholder="请输入昵称" style="width:97%;">
					</div>
				</div>
				<div class="form-group" >
					<label for="u_sex" class="col-sm-2 control-label">性别</label>
					<div class="col-sm-10" >
						<select id=“u_sex” name=“u_sex” style="width:100%;"> 
							<option selected="selected" value="1">男</option> 
							<option  value="2">女</option> 
						</select> 
					</div>
				</div>
				<div class="form-group" >
					<label for="u_phone" class="col-sm-2 control-label">电话</label>
					<div class="col-sm-10" >
						<input type="text" class="form-control" id="u_phone" 
							   placeholder="请输入电话" style="width:97%;">
					</div>
				</div>

			</div>

			<div class="modal-footer">

				<button type="button" data-dismiss="modal" class="btn">关闭</button>

				<button type="button" class="btn green"  onclick="addUser();">提交</button>

			</div>

		</div>

	<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->

	<!-- BEGIN CORE PLUGINS -->

	<script src="../../static/media/js/jquery-1.10.1.min.js" type="text/javascript"></script>

	<script src="../../static/media/js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>

	<!-- IMPORTANT! Load jquery-ui-1.10.1.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->

	<script src="../../static/media/js/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>      

	<script src="../../static/media/js/bootstrap.min.js" type="text/javascript"></script>

	<!--[if lt IE 9]>

	<script src="../../static/media/js/excanvas.min.js"></script>

	<script src="../../static/media/js/respond.min.js"></script>  

	<![endif]-->   

	<script src="../../static/media/js/jquery.slimscroll.min.js" type="text/javascript"></script>

	<script src="../../static/media/js/jquery.blockui.min.js" type="text/javascript"></script>  

	<script src="../../static/media/js/jquery.cookie.min.js" type="text/javascript"></script>

	<script src="../../static/media/js/jquery.uniform.min.js" type="text/javascript" ></script>
	
	<script src="../../static/page/keleyidivpager.js" type="text/javascript" ></script>

	<!-- END CORE PLUGINS -->
	<script type="text/javascript">
	var totalPage = 20;
	var totalRecords = 390;
	//var pageNo = getParameter('p');
	var pageNo = 1;
	if (!pageNo) {
	pageNo = 1;
	}
	//生成分页控件 根据分页的形式在这里设置
	kkpager.init({
	pno: pageNo,
	//总页码
	total: totalPage,
	//总数据条数
	totalRecords: totalRecords,
	//链接前部
	hrefFormer: 'keleyidivpager',
	//链接尾部
	hrefLatter: '.htm',
	getLink: function (n) {
	return this.hrefFormer + this.hrefLatter + "?p=" + n; //参数名跟上面相同
	}
	});
	kkpager.generPageHtml();
	
	
	function addUser()
	{
		var u_userName= $("#u_userName").val();
		var u_passWord= $("#u_passWord").val();
		var u_passWord_too= $("#u_passWord_too").val();
		var u_realName= $("#u_realName").val();
		var u_sex = $("select[name=“u_sex”]").val();
		var u_phone= $("#u_phone").val();
		alert(u_sex);
		/*  if(u_passWord!=u_passWord_too)
		{
			$("#password_error").show();
			return;
		}
        var User_Info = {"u_userName":u_userName,"u_passWord":u_passWord,"u_realName":u_realName,"u_sex":u_sex,"u_phone":u_phone};
        $.ajax({
            type : 'POST',
            url : '${pageContext.servletContext.contextPath }/usertest/addUser',
            data : User_Info,
            dataType: "json",
            success:function(data){
                if(data.flag=="true")
                {
                	window.location.href="${pageContext.servletContext.contextPath }/usertest/toUserInfo"
                }
                else
                {
                	$("#login_error").show();
                }
            }
        });  */
        
	};
	</script>

<script type="text/javascript">  var _gaq = _gaq || [];  _gaq.push(['_setAccount', 'UA-37564768-1']);  _gaq.push(['_setDomainName', 'keenthemes.com']);  _gaq.push(['_setAllowLinker', true]);  _gaq.push(['_trackPageview']);  (function() {    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;    ga.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'stats.g.doubleclick.net/dc.js';    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);  })();</script></body>

<!-- END BODY -->

</html>