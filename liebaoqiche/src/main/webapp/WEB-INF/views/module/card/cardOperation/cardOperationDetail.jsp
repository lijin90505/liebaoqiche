<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
	<title>cardOperation</title>
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
					<td><div>${cardOperation.systemName == ''|| cardOperation.systemName ==null?'':cardOperation.systemName}</div></td>
					<td><div>用户名称</div></td>
					<td><div>${cardOperation.userName == ''|| cardOperation.userName ==null?'':cardOperation.userName}</div></td>
				</tr>
				<tr>
					<td><div>卡券名称</div></td>
					<td><div>${cardOperation.cardName == '' || cardOperation.cardName ==null?0:cardOperation.cardName}</div></td>
					<td><div>卡券操作状态</div></td>
					<td><div>${cardOperation.grantOrRecallDesc == ''|| cardOperation.grantOrRecallDesc ==null?'':cardOperation.grantOrRecallDesc}</div></td>
				</tr>
				<tr>
					<td><div>发放数量</div></td>
					<td><div>${cardOperation.grantNum == '' || cardOperation.grantNum ==null?0:cardOperation.grantNum}</div></td>
					<%-- <td><div>撤回数量</div></td>
					<td><div>${cardOperation.recallNum == ''|| cardOperation.recallNum ==null?'':cardOperation.recallNum}</div></td> --%>
						<td><div>创建人</div></td>
					<td><div>${cardOperation.creater == '' || cardOperation.creater ==null?0:cardOperation.creater}</div></td>
				</tr>
				<tr>
					<td><div>修改人</div></td>
					<td><div>${cardOperation.modifier == '' || cardOperation.modifier ==null?0:cardOperation.modifier}</div></td>
					<td><div>创建时间</div></td>
					<td><div><fmt:formatDate value="${cardOperation.createTime == '' || cardOperation.createTime ==null?0:cardOperation.createTime}" pattern="yyyy-MM-dd HH:mm:ss" />
					</div></td>
				</tr>
				<tr>
					<td><div>修改时间</div></td>
					<td><div><fmt:formatDate value="${cardOperation.modifyTime == '' || cardOperation.modifyTime ==null?0:cardOperation.modifyTime}" pattern="yyyy-MM-dd HH:mm:ss" />
					</div></td>
				</tr>
				<tr>
					<td><div>备注</div></td>
					<td colspan="3" class="remarks"><div>${cardOperation.remarks ==''||cardOperation.remarks ==null?'':cardOperation.remarks}</div></td>
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