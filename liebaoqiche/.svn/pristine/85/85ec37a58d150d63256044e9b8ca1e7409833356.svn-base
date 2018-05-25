<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
	<title>IntegralDetail</title>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
</head>
<body>
<%@ include file="/WEB-INF/views/include/loading.jsp"%>
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'center'">
		<div class="datagrid-body" style=" overflow-x: hidden;">
			<table style="width: 100%;font-size:12px;" class="datagrid-btable detail-table">
				<tr>
					<td><div>系统名称</div></td>
					<td><div>${userCardCount.accessSystemId== '' || userCardCount.accessSystemId==null?'':userCardCount.accessSystemId}</div></td>
					<td><div>应用程序</div></td>
					<td><div>${userCardCount.appIdDesc == '' || userCardCount.appIdDesc ==null?0:userCardCount.appIdDesc}</div></td>
					</tr>
				<tr>
					<td><div>用户名称</div></td>
					<td><div>${userCardCount.userName == ''|| userCardCount.userName ==null?'':userCardCount.userName}</div></td>
					<td><div>车架号</div></td>
					<td><div>${userCardCount.vinNo == '' || userCardCount.vinNo ==null?0:userCardCount.vinNo}</div></td>
				</tr>
				<tr>
					<td><div>总数量</div></td>
					<td><div>${userCardCount.totalNum == '' || userCardCount.totalNum ==null?0:userCardCount.totalNum}</div></td>
					<td><div>已使用</div></td>
					<td><div>${userCardCount.used == '' || userCardCount.used ==null?0:userCardCount.used}</div></td>
				</tr>
				<tr>
					<td><div>未使用</div></td>
					<td><div>${userCardCount.noUsed == '' || userCardCount.noUsed ==null?0:userCardCount.noUsed}</div></td>
					<td><div>已过期</div></td>
					<td><div>${userCardCount.past == '' || userCardCount.past ==null?0:userCardCount.past}</div></td>
				</tr>
<!-- 				<tr> -->
<!-- 					<td><div>备注</div></td> -->
<%-- 					<td colspan="3" class="remarks"><div>${userCardCount.remarks ==''||userCardCount.remarks ==null?'':userCardCount.remarks}</div></td> --%>
<!-- 				</tr> -->
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