<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
	<title>user</title>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
</head>
<body>
<%@ include file="/WEB-INF/views/include/loading.jsp"%>
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'center'">
		<div class="datagrid-body" style=" overflow-x: hidden;">
			<table style="width: 100%;font-size:12px;" class="datagrid-btable detail-table">
				<tr>
					<td><div>用户名</div></td>
					<td><div>${user.username == ''|| user.username ==null?'':user.username}</div></td>
					<td><div>姓名</div></td>
					<td><div>${user.realname == '' || user.realname ==null?'':user.realname}</div></td>
				</tr>
				<tr>
					<td><div>手机</div></td>
					<td><div>${user.phone == '' || user.phone ==null?'':user.phone}</div></td>
					<td><div>经验值</div></td>
					<td><div>${user.experienceNumber == ''|| user.experienceNumber ==null?0:user.experienceNumber}</div></td>
				</tr>
				<tr>
					<td><div>积分</div></td>
					<td><div>${user.integralNumber == '' || user.integralNumber ==null?0:user.integralNumber}</div></td>
					<td><div>认证等级</div></td>
					<td><div>${user.levelName == '' || user.levelName ==null?0:user.levelName}</div></td>
				</tr>
				<tr>
					<td><div>是否锁定</div></td>
					<td><div>${user.lockedDesc == ''|| user.lockedDesc ==null?'':user.lockedDesc}</div></td>
					<td><div>创建人</div></td>
					<td><div>${user.createUserName == '' || user.createUserName ==null?'':user.createUserName}</div></td>
				</tr>
				<tr>
				<tr>
					<td><div>创建时间</div></td>
					<td><div><fmt:formatDate value="${user.createTime == '' || user.createTime ==null?'':user.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /></div></td>
					<td><div>修改人</div></td>
					<td><div>${user.modifyUserName == '' || user.modifyUserName ==null?'':user.modifyUserName}</div></td>
				</tr>
				<tr>
					<td><div>修改时间</div></td>
					<td><div><fmt:formatDate value="${user.modifyTime == '' || user.modifyTime ==null?'':user.modifyTime}" pattern="yyyy-MM-dd HH:mm:ss" /></div></td>
				</tr>
				<tr>
					<td><div>备注</div></td>
					<td colspan="3" class="remarks"><div>${user.remarks ==''||user.remarks ==null?'':user.remarks}</div></td>
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