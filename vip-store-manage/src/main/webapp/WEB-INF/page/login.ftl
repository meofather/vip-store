<!DOCTYPE html>

<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->

<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->

<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->

<!-- BEGIN HEAD -->

<head>
	<meta charset="utf-8" />

	<title>九九网络信息管理平台|九九工作室</title>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<meta content="width=device-width, initial-scale=1.0" name="viewport" />

	<meta content="" name="description" />

	<meta content="" name="author" />

    <script>
        var serverPath = "${serverPath}";
        var cdnPath = "${cdnPath}";
    </script>
	<!-- BEGIN GLOBAL MANDATORY STYLES -->

	<link href="${cdnPath}/common/bootstrap/media/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

	<link href="${cdnPath}/common/bootstrap/media/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css"/>

	<link href="${cdnPath}/common/bootstrap/media/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>

	<link href="${cdnPath}/common/bootstrap/media/css/style-metro.css" rel="stylesheet" type="text/css"/>

	<link href="${cdnPath}/common/bootstrap/media/css/style.css" rel="stylesheet" type="text/css"/>

	<link href="${cdnPath}/common/bootstrap/media/css/style-responsive.css" rel="stylesheet" type="text/css"/>

	<link href="${cdnPath}/common/bootstrap/media/css/default.css" rel="stylesheet" type="text/css" id="style_color"/>

	<link href="${cdnPath}/common/bootstrap/media/css/uniform.default.css" rel="stylesheet" type="text/css"/>

	<!-- END GLOBAL MANDATORY STYLES -->

	<!-- BEGIN PAGE LEVEL STYLES -->

	<link href="${cdnPath}/common/bootstrap/media/css/login-soft.css?11" rel="stylesheet" type="text/css"/>

	<!-- END PAGE LEVEL STYLES -->

	<link rel="shortcut icon" href="${cdnPath}/images/logo.ico" />
	
</head>

<!-- END HEAD -->

<!-- BEGIN BODY -->

<body class="login">

	<!-- BEGIN LOGO -->

	<div class="logo" style="width:500px;">

<#--
		<img src="${cdnPath}/images/logo.png" alt="九九网络后台管理系统" />
-->

	</div>

	<!-- END LOGO -->

	<!-- BEGIN LOGIN -->

	<div class="content">

		<!-- BEGIN LOGIN FORM -->

		<form class="form-vertical login-form" action="" method="post" onkeydown="if(event.keyCode==13){return false;}">

			<h3 class="form-title">登                          录</h3>

			<!--<div class="alert alert-error hide">

				<button class="close"></button>

				<span>请输入手机号和短信验证码.</span>

			</div>-->
			
			<div class="alert alert-60-error hide">

				<button class="close"></button>

				<span>短信60s内只能发送一次.</span>

			</div>
			
			<div class="alert alert-phone-error hide">

				<button class="close"></button>

				<span>手机号不可为空.</span>

			</div>
			
			<div class="alert alert-smsCode-error hide">

				<button class="close"></button>

				<span>短信验证码不可为空.</span>

			</div>
			
			<div class="alert alert-smsException-error hide">

				<button class="close"></button>

				<span>发送短信异常,请稍后再试.</span>

			</div>
			
			<div class="alert alert-success-error hide">

				<button class="close"></button>

				<span id="login_sms_msg"></span>

			</div>
			
			<div class="control-group">

				<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->

				<div class="controls">

					<div class="input-icon left">

						<i class="icon-user"></i>

						<input id="userName" AUTOCOMPLETE="on" class="m-wrap placeholder-no-fix" type="text" placeholder="用户名" name="userName"/>

					</div>

				</div>

			</div>

			<div class="control-group">


				<div class="controls">

					<div class="input-icon left">

						<i class="icon-lock"></i>

                        <input id="password" AUTOCOMPLETE="on" class="m-wrap placeholder-no-fix" type="password" placeholder="密码" name="password"/>
					</div>
					
				</div>
				<div class="error-mess" id="error-mess">
					<span class="error-icon"></span><span id="error">
				</span>
				</div>
			</div>
			
			<div class="form-actions text-center">

				<button onclick="login(event);" type="button" class="btn red" style="width:292px">

				登&nbsp;&nbsp;录 <i class="m-icon-swapright m-icon-white"></i>

				</button>            

			</div>

			<div class="forget-password">
				
				<p title="">

					<!--忘记密码 ? 请联系管理员重置密码-->

				</p>

			</div>

			<!--<div class="create-account">

				<p>

					Don't have an account yet ?&nbsp; 

					<a href="javascript:;" id="register-btn" class="">Create an account</a>

				</p>

			</div>-->

		</form>


	</div>

	<!-- END LOGIN -->

	<!-- BEGIN COPYRIGHT -->

	<div class="copyright">

		Copyright ©2017九九网络科技有限公司 苏ICP备15059068号-1

	</div>

	<!-- END COPYRIGHT -->

	<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->

	<!-- BEGIN CORE PLUGINS -->

	<script src="${cdnPath}/common/bootstrap/media/js/jquery-1.10.1.min.js" type="text/javascript"></script>

	<script src="${cdnPath}/common/bootstrap/media/js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>

	<!-- IMPORTANT! Load jquery-ui-1.10.1.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->

	<script src="${cdnPath}/common/bootstrap/media/js/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>      

	<script src="${cdnPath}/common/bootstrap/media/js/bootstrap.min.js" type="text/javascript"></script>

	<!--[if lt IE 9]>

	<script src="media/js/excanvas.min.js"></script>

	<script src="media/js/respond.min.js"></script>  

	<![endif]-->   

	<script src="${cdnPath}/common/bootstrap/media/js/jquery.slimscroll.min.js" type="text/javascript"></script>

	<script src="${cdnPath}/common/bootstrap/media/js/jquery.blockui.min.js" type="text/javascript"></script>  

	<script src="${cdnPath}/common/bootstrap/media/js/jquery.cookie.min.js" type="text/javascript"></script>

	<script src="${cdnPath}/common/bootstrap/media/js/jquery.uniform.min.js" type="text/javascript" ></script>

	<!-- END CORE PLUGINS -->

	<!-- BEGIN PAGE LEVEL PLUGINS -->

	<script src="${cdnPath}/common/bootstrap/media/js/jquery.validate.min.js" type="text/javascript"></script>

	<script src="${cdnPath}/common/bootstrap/media/js/jquery.backstretch.min.js" type="text/javascript"></script>

	<!-- END PAGE LEVEL PLUGINS -->

	<!-- BEGIN PAGE LEVEL SCRIPTS -->

	<script src="${cdnPath}/common/bootstrap/media/js/app.js" type="text/javascript"></script>


	<script src="${cdnPath }/common/js/common.js"></script>
	

	<!-- END PAGE LEVEL SCRIPTS --> 

	<script>

		jQuery(document).ready(function() {     

		 // App.init();

		 // Login.init();

		});
		var serverPath = "${serverPath}";
		function login(e) {
		    var userName = $("#userName").val();
		    var password = $("#password").val();
            var url = serverPath+"/dologin.htm";
            $.ajax({
                url : url,
                type : "POST",
                data : {
                    userName :userName,
                    password :password
                },
                dataType : "json",
                cache : false,
                success : function(res) {
                    if(res.success) {
                        window.location.href = serverPath + "/index.htm";
                    } else {
                        $('.alert-success-error').show(0,function(){
                            $('#login_sms_msg').html(res.message);
                        });
                    }
                },
                error : function(res) {
                    $('.alert-success-error').show(0,function(){
                        $('#login_sms_msg').html(res.message);
                    });
                }
            });
        }
	</script>

	<!-- END JAVASCRIPTS -->

</body>

<!-- END BODY -->

</html>