<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
	<title>userAuthApply</title>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
</head>
<body>
<%@ include file="/WEB-INF/views/include/loading.jsp"%>
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'center'">
		<div class="datagrid-body" style=" overflow-x: hidden;">
			<table style="width: 100%;font-size:12px;" class="datagrid-btable detail-table">
				<tr>
					<td><div>用户姓名</div></td>
					<td><div>${userAuthApply.realname == '' || userAuthApply.realname ==null?0:userAuthApply.realname}</div></td>
					<td><div>申请等级</div></td>
					<td><div>${userAuthApply.levelName == '' || userAuthApply.levelName ==null?0:userAuthApply.levelName}</div></td>
				</tr>
				<tr>
					<td><div>终端平台</div></td>
					<td><div>${userAuthApply.platformDesc == '' || userAuthApply.platformDesc ==null?0:userAuthApply.platformDesc}</div></td>
					<td><div>申请时间</div></td>
					<td><div><fmt:formatDate value="${userAuthApply.createTime == '' || userAuthApply.createTime ==null?0:userAuthApply.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /></div></td>
				</tr>
				<tr>
					<td><div>操作时间</div></td>
					<td><div><fmt:formatDate value="${userAuthApply.modifyTime == '' || userAuthApply.modifyTime ==null?0:userAuthApply.modifyTime}" pattern="yyyy-MM-dd HH:mm:ss" /></div></td>
					<td><div>操作人</div></td>
					<td><div>${userAuthApply.modifyUserName == '' || userAuthApply.modifyUserName ==null?0:userAuthApply.modifyUserName}</div></td>
				</tr>
				</tr>
				<tr>
					<td><div>状态</div></td>
					<td><div>${userAuthApply.statusDesc == '' || userAuthApply.statusDesc ==null?0:userAuthApply.statusDesc}</div></td>
				</tr>
				<tr>
					<td><div>备注</div></td>
					<td colspan="3" class="remarks"><div>${userAuthApply.remarks ==''||userAuthApply.remarks ==null?'':userAuthApply.remarks}</div></td>
				</tr>
			</table>
		</div>
	</div>
	<div data-options="region:'south',border:false" style="text-align:right; padding:10px;">
		<a id="btnClose" href="javascript:void(0)" class="easyui-linkbutton button-warning" style="width: 80px;"><i class="fa fa-remove fa-lg"></i>&nbsp;&nbsp;关闭</a>
	</div>
</div>

<!-- js脚本，必须写在body中，tab的url加载模式只会异步加载body中的内容到tab中 -->
<script type="text/javascript">
	require(['jquery','common'], function($){
		// 给关闭按钮添加点击事件
		$("#btnClose").on('click', function(){
			hideDialog();
		});
	});
</script>
</body>
</html>