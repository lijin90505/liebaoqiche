<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
<title>系统首页</title>
<link rel="shortcut icon" href="${ctxResources}/favicon.ico" />
<%@ include file="/WEB-INF/views/include/head.jsp"%>
</head>
<body style='overflow:hidden;'>
	<%@ include file="/WEB-INF/views/include/loading.jsp"%>
	<!--用户信息-->
    <div class="person-mes">
        <div class="headPortrait">
            <i style="background-image: url('${ctxResources}/images/user_photo.png')"></i>
            <p class="reMessage">
            	<a href="javascript:void(0)" class="updateUser">修改信息</a>
            	<b></b>
            	<a href="javascript:void(0)" class="updatePassword">修改密码</a>
            </p>
        </div>
        <div class="headPortrait-mes">
            <p>
                <span class="pic-left-mes">登录帐号</span>
                <span> : </span>
                <span class="pic-right-mes"><shiro:principal type="com.ibest.framework.common.security.SystemPrincipal" property="username"/></span>
            </p>
            <p>
                <span class="pic-left-mes">用户名称</span>
                <span> : </span>
                <span class="pic-right-mes"><shiro:principal type="com.ibest.framework.common.security.SystemPrincipal" property="realname" defaultValue="系统用户"/></span>
            </p>
            <p>
                <span class="pic-left-mes">工号</span>
                <span> : </span>
                <span class="pic-right-mes"><shiro:principal type="com.ibest.framework.common.security.SystemPrincipal" property="workNo" defaultValue="未分配工号"/></span>
            </p>
            <p>
                <span class="pic-left-mes">部门</span>
                <span> : </span>
                <span class="pic-right-mes"><shiro:principal type="com.ibest.framework.common.security.SystemPrincipal" property="departmentName" defaultValue="未设置所属部门"/></span>
            </p>
            <p>
                <span class="pic-left-mes">在线时长</span>
                <span> : </span>
                <span class="pic-right-mes" id="keepTime">00:00:00</span>
            </p>
            <!-- <div class="person_bottom">
            	<button class="" title='修改密码'><span class="fa fa-key"></span></button>
            	<button class="" title='修改信息'><span class="fa fa-pencil"></span></button>
            </div> -->
            <button class="exitBtn" title='退出'>退出</button>
            <input type="hidden" id="userPhoto" value="<shiro:principal type="com.ibest.framework.common.security.SystemPrincipal" property="photo"/>">
        </div>
    </div>
    
	<div id="app-container" class="easyui-layout" data-options="fit:true">
		<div id="app-header" class="app-header" data-options="region:'north', border: false">
			<p class="linkIndexTitle">后台管理系统</p>
			<a href="javascript:void(0)" class="linkIndex">
				<img src="${ctxResources}/images/logo.png">
			</a>
			<div class="person-con">
		        <!--头像-->
		        <div class="person-pic">
		        	<b class="person-pic-img" style="background-image: url('${ctxResources}/images/user_photo.png')"></b>
		        	<span class="person-pic-mes"><shiro:principal type="com.ibest.framework.common.security.SystemPrincipal" property="realname" defaultValue="系统用户"/></span>
		        	<b class="person-pic-icon fa fa-sort-down"></b>
		        </div>
		    	<!-- 消息 -->
		    	<!-- <div class="person-news">
		    		<b class="fa fa-volume-up"></b>
		    		<span>消息</span>
		    	</div> -->
		    </div>
		</div>
		<div id="app-slider" class="mySlider" data-options="region:'west', border: false" style="width:200px;">
			<div class="mySlider_con">
				<c:forEach items="${currentUserModule}" var="fm">
					<c:set var="fi" value="${fns:getDefaultIcon()}"/>
					<c:if test="${fm.icon != null && fm.icon != '' }">
						<c:set var="fi" value="${fm.icon }"/>
					</c:if>
					<div class="slider-list">
						<!-- 一级目录 -->
						<div class="slider-first" title="${fm.name}">
							<div class="sliderIcon"><i class='${fi}'></i></div>
							<span>${fm.name}</span>
							<!-- 一级目录小箭头 -->
							<b class="fa fa-angle-right fa-lg rightDown"></b>
						</div>
						
						<c:forEach items="${fm.children}" var="sm">
							<!-- 二级目录 -->
							<c:set var="si" value="${sm.icon }"/>
							<div class="sm_slider" id="sm_${sm.id}" title="${sm.name}" onclick="createTab('sm_${sm.id}','${sm.name}','${ctx}${sm.path }', true);">
								<div class="sliderIcon"><i class='iconfont icon-selected'></i></div>
								<span>${sm.name}</span>
							</div>
						</c:forEach>
					</div>
				</c:forEach>
			</div>
		</div>
		<div id="app-tabs" class="easyui-tabs" data-options="region:'center', border: false">
			<div title="首页">
				<iframe scrolling="no" frameborder="0" src="${ctxProject}/admin/home/" style="padding:0px; margin:0px; width:100%;height:100%;min-width:1000px"></iframe>
			</div>
		</div>
		<!-- <div id="app-footer" class="app-footer" data-options="region:'south'" style="height: 30px;">footer</div> -->
	</div>
	
	<script type="text/javascript" src="${ctxResources}/js/app.js"></script>
</body>
</html>