<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
	<title>cardUse</title>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
</head>
<body>
<%@ include file="/WEB-INF/views/include/loading.jsp"%>
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'center'">
		<div class="datagrid-body" style=" overflow-x: hidden;">
			<table style="width: 100%;font-size:12px;" class="datagrid-btable detail-table">
				<tr>
					<td><div>卡券用途</div></td>
					<td><div>${cardUse.name == ''|| cardUse.name ==null?'':cardUse.name}</div></td>
					<td><div>创建人</div></td>
					<td><div>${cardUse.creater == '' || cardUse.creater ==null?0:cardUse.creater}</div></td>
				</tr>
				<tr>
				<tr>
					<td><div>创建时间</div></td>
					<td><div><fmt:formatDate value="${cardUse.createTime == '' || cardUse.createTime ==null?0:cardUse.createTime}" pattern="yyyy-MM-dd HH:mm:ss" />
					</div></td>
					<td><div>修改人</div></td>
					<td><div>${cardUse.modifier == '' || cardUse.modifier ==null?0:cardUse.modifier}</div></td>
				</tr>
				<tr>
					<td><div>修改时间</div></td>
					<td><div><fmt:formatDate value="${cardUse.modifyTime == '' || cardUse.modifyTime ==null?0:cardUse.modifyTime}" pattern="yyyy-MM-dd HH:mm:ss" />
					</div></td>
				</tr>
				<tr>
					<td><div>备注</div></td>
					<td colspan="3" class="remarks"><div>${cardUse.remarks ==''||cardUse.remarks ==null?'':cardUse.remarks}</div></td>
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