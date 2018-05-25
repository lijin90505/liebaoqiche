<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE>
<html>
<head>
    <title>用户登录-${fns:getAppname()}</title>
    <link rel="shortcut icon" href="${ctxResources}/favicon.ico" />
    <%@ include file="/WEB-INF/views/include/head.jsp" %>
    <link href="${ctxResources}/css/login.css" rel="stylesheet"/>
</head>
<body>
	<div class="login-cont" style="background-image: url(${ctxResources}/images/login-bg-big2.png);">
        <div class="login-box-body" style="background-image: url(${ctxResources}/images/login-content.png);">
        	<div class="login_content">
			    <form class="login-from" id="login" name="login" action="${ctxProject}/userLogin" method="post">
			      	<h1 class="login-title">后台管理系统</h1>
			      	<div class="form-input">
			      		<label class="uName" for="username" style="background-image: url(${ctxResources}/images/MaleUser.png);"></label>
			      		<input type="text" id="username" placeholder="用户名" name="username" value="admin" autocomplete="off"/>
			      	</div>
			      	<div class="form-input">
			      		<label class="pWord" for="password" style="background-image: url(${ctxResources}/images/Lock.png);"></label>
			      		<input type="password" id="password" placeholder="密码" name="password" value="ibest123" autocomplete="off"/>
			      	</div>
			      	<div class="msg">
			        <c:if test="${rtnMsg != null}">
			        	<p>${rtnMsg}</p>
			        </c:if>
			        </div>
			        <div class="form-btn">
	                      <button type="button" class="loginBtn">登录</button>
	                </div>
		        </form>
	       	</div>
        </div>
	</div>
	
	<script type="text/javascript">
		require(['jquery'], function($){
	 		// 若登录超时，点击菜单会加载登录页内容，在这里做个判断，自动全屏跳转到登陆界面
	 		if(top.window.location.href.indexOf("/main") != -1){
	 			top.window.location.href = window.location.href.replace("main","");
	 		}
	 		
	 		/* 进入登录页面，用户名输入获取焦点 */
			$("#username").focus();
	 		
	 		$(".loginBtn").on('click', function(){
	 			 $("#login").submit();
	 		});
	 		
	 		/* 登录监听回车键 */
	 		$(document).keyup(function(event){  
                if(event.keyCode == 13){  
                 	$("#login").submit();
                }  
            });    
	 	});
	</script>
	
</body>
</html>