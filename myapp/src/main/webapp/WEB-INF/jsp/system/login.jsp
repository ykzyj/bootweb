<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->

<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->

<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->

<!-- BEGIN HEAD -->

<head>

<meta charset="utf-8" />

<title>登录</title>

<meta content="width=device-width, initial-scale=1.0" name="viewport" />

<meta content="" name="description" />

<meta content="" name="author" />

<!-- BEGIN GLOBAL MANDATORY STYLES -->

<link href="../../static/media/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />

<link href="../../static/media/css/bootstrap-responsive.min.css"
	rel="stylesheet" type="text/css" />

<link href="../../static/media/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />

<link href="../../static/media/css/style-metro.css" rel="stylesheet"
	type="text/css" />

<link href="../../static/media/css/style.css" rel="stylesheet"
	type="text/css" />

<link href="../../static/media/css/style-responsive.css"
	rel="stylesheet" type="text/css" />

<link href="../../static/media/css/default.css" rel="stylesheet"
	type="text/css" id="style_color" />

<link href="../../static/media/css/uniform.default.css" rel="stylesheet"
	type="text/css" />

<!-- END GLOBAL MANDATORY STYLES -->

<!-- BEGIN PAGE LEVEL STYLES -->

<link href="../../static/media/css/login.css" rel="stylesheet"
	type="text/css" />

<!-- END PAGE LEVEL STYLES -->

<link rel="shortcut icon" href="../../static/media/image/favicon.ico" />

</head>

<!-- END HEAD -->

<!-- BEGIN BODY -->
<script type="text/javascript">
        function checkUserForm() {
        	$("#u_userName").popover('destroy');
            $("#u_passWord").popover('destroy');
            $("#login_error").hide();
            var u_userName = $("#u_userName").val();
            var u_passWord = $("#u_passWord").val();
            if (u_userName == ""&&u_passWord == "") {
                $("#u_userName").popover('show');
                $("#u_passWord").popover('show');
                return false;
            }
            if (u_userName == "") {
                $("#u_userName").popover('show');
                return false;
            }
            if (u_passWord == "") {
                $("#u_passWord").popover('show');
                return false;
            }
            var user = {"u_userName":u_userName,"u_passWord":u_passWord};
            $.ajax({
                type : 'POST',
                url : '${pageContext.servletContext.contextPath }/login/userCheck',
                data : user,
                dataType: "json",
                success:function(data){
                    if(data.flag=="true")
                    {
                    	window.location.href="${pageContext.servletContext.contextPath }/main/index"
                    }
                    else
                    {
                    	$("#login_error").show();
                    }
                }
            });
        };

        function doSubmit() {
            return false;
        };
    </script>

<body class="login">

	<!-- BEGIN LOGO -->

	<div class="logo"></div>

	<!-- END LOGO -->

	<!-- BEGIN LOGIN -->

	<div class="content">

		<!-- BEGIN LOGIN FORM -->

		<form id="loginForm" class="form-vertical login-form" action="indexss.html" onsubmit="return doSubmit();">

			<h3 class="form-title">登录</h3>

			<div id="login_error" class="alert alert-danger" style="display:none">
                <strong>登录失败！</strong>用户名或密码有误。
            </div>

			<div class="control-group">

				<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->

				<label class="control-label visible-ie8 visible-ie9">用户名</label>

				<div class="controls">

					<div class="input-icon left">

						<i class="icon-user"></i> <input class="m-wrap placeholder-no-fix"
							type="text" placeholder="用户名" name="u_userName" id="u_userName" 
                            data-container="body" data-toggle="popover"
                            data-content="用户名不能为空"/>

					</div>

				</div>

			</div>
			
			<input type="text" style="display:none" value="此处的input删掉然后回车按钮就会触发提交" />

			<div class="control-group">

				<label class="control-label visible-ie8 visible-ie9">密码</label>

				<div class="controls">

					<div class="input-icon left">

						<i class="icon-lock"></i> <input class="m-wrap placeholder-no-fix"
							type="password" placeholder="密码" name="u_passWord"
							id="u_passWord"  data-container="body" data-toggle="popover"
                            data-content="密码不能为空"/>

					</div>

				</div>

			</div>

			<div class="form-actions">

				<label class="checkbox"> <input type="checkbox"
					name="remember" value="1" /> 记住我

				</label>

				<button type="submit" class="btn green pull-right"
					 onclick="checkUserForm(); return false;">

					登录 <i class="m-icon-swapright m-icon-white"></i>

				</button>

			</div>

			<div class="forget-password">

				<a href="javascript:;" class="" id="forget-password">忘记密码</a> <a
					href="javascript:;" id="register-btn" class="">创建账户</a>

			</div>

		</form>

		<!-- END LOGIN FORM -->

		<!-- BEGIN FORGOT PASSWORD FORM -->

		<form class="form-vertical forget-form" action="">

			<h3 class="">忘记密码 ?</h3>

			<p>请输入你的邮箱去重置密码.</p>

			<div class="control-group">

				<div class="controls">

					<div class="input-icon left">

						<i class="icon-envelope"></i> <input
							class="m-wrap placeholder-no-fix" type="text" placeholder="邮箱"
							name="email" />

					</div>

				</div>

			</div>

			<div class="form-actions">

				<button type="button" id="back-btn" class="btn">

					<i class="m-icon-swapleft"></i> 返回

				</button>

				<button type="submit" class="btn green pull-right">

					提交 <i class="m-icon-swapright m-icon-white"></i>

				</button>

			</div>

		</form>

		<!-- END FORGOT PASSWORD FORM -->

		<!-- BEGIN REGISTRATION FORM -->

		<form class="form-vertical register-form" action="">

			<h3 class="">注册</h3>

			<p>请输入一下信息:</p>

			<div class="control-group">

				<label class="control-label visible-ie8 visible-ie9">用户名</label>

				<div class="controls">

					<div class="input-icon left">

						<i class="icon-user"></i> <input class="m-wrap placeholder-no-fix"
							type="text" placeholder="用户名" name="username" />

					</div>

				</div>

			</div>

			<div class="control-group">

				<label class="control-label visible-ie8 visible-ie9">密码</label>

				<div class="controls">

					<div class="input-icon left">

						<i class="icon-lock"></i> <input class="m-wrap placeholder-no-fix"
							type="password" id="register_password" placeholder="密码"
							name="password" />

					</div>

				</div>

			</div>

			<div class="control-group">

				<label class="control-label visible-ie8 visible-ie9">重复一次</label>

				<div class="controls">

					<div class="input-icon left">

						<i class="icon-ok"></i> <input class="m-wrap placeholder-no-fix"
							type="password" placeholder="重复一次" name="rpassword" />

					</div>

				</div>

			</div>

			<div class="control-group">

				<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->

				<label class="control-label visible-ie8 visible-ie9">邮箱</label>

				<div class="controls">

					<div class="input-icon left">

						<i class="icon-envelope"></i> <input
							class="m-wrap placeholder-no-fix" type="text" placeholder="邮箱"
							name="email" />

					</div>

				</div>

			</div>

			<div class="control-group">

				<div class="controls">

					<label class="checkbox"> <input type="checkbox" name="tnc" />
						已经阅读并同意 <a href="#">服务条款</a> 和 <a href="#">法律法规</a>

					</label>

					<div id="register_tnc_error"></div>

				</div>

			</div>

			<div class="form-actions">

				<button id="register-back-btn" type="button" class="btn">

					<i class="m-icon-swapleft"></i> 返回
				</button>

				<button type="submit" id="register-submit-btn"
					class="btn green pull-right">

					注册 <i class="m-icon-swapright m-icon-white"></i>

				</button>

			</div>

		</form>

		<!-- END REGISTRATION FORM -->

	</div>

	<!-- END LOGIN -->

	<!-- BEGIN COPYRIGHT -->

	<!-- END COPYRIGHT -->

	<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->

	<!-- BEGIN CORE PLUGINS -->

	<script src="../../static/media/js/jquery-1.10.1.min.js"
		type="text/javascript"></script>

	<script src="../../static/media/js/jquery-migrate-1.2.1.min.js"
		type="text/javascript"></script>

	<!-- IMPORTANT! Load jquery-ui-1.10.1.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->

	<script src="../../static/media/js/jquery-ui-1.10.1.custom.min.js"
		type="text/javascript"></script>

	<script src="../../static/media/js/bootstrap.min.js"
		type="text/javascript"></script>

	<!--[if lt IE 9]>

    <script src="../../static/media/js/excanvas.min.js"></script>

    <script src="../../static/media/js/respond.min.js"></script>  

    <![endif]-->

	<script src="../../static/media/js/jquery.slimscroll.min.js"
		type="text/javascript"></script>

	<script src="../../static/media/js/jquery.blockui.min.js"
		type="text/javascript"></script>

	<script src="../../static/media/js/jquery.cookie.min.js"
		type="text/javascript"></script>

	<script src="../../static/media/js/jquery.uniform.min.js"
		type="text/javascript"></script>

	<!-- END CORE PLUGINS -->

	<!-- BEGIN PAGE LEVEL PLUGINS -->

	<script src="../../static/media/js/jquery.validate.min.js"
		type="text/javascript"></script>

	<!-- END PAGE LEVEL PLUGINS -->

	<!-- BEGIN PAGE LEVEL SCRIPTS -->

	<script src="../../static/media/js/app.js" type="text/javascript"></script>

	<script src="../../static/media/js/login.js" type="text/javascript"></script>

	<!-- END PAGE LEVEL SCRIPTS -->

	<script>

        jQuery(document).ready(function() {     

          App.init();

          Login.init();

        });

    </script>

	<!-- END JAVASCRIPTS -->

	<script type="text/javascript">  var _gaq = _gaq || [];  _gaq.push(['_setAccount', 'UA-37564768-1']);  _gaq.push(['_setDomainName', 'keenthemes.com']);  _gaq.push(['_setAllowLinker', true]);  _gaq.push(['_trackPageview']);  (function() {    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;    ga.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'stats.g.doubleclick.net/dc.js';    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);  })();</script>
</body>

<!-- END BODY -->

</html>