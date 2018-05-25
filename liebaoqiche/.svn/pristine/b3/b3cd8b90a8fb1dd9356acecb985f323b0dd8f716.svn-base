<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
	<title>SysRole</title>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/loading.jsp"%>
	<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'center'">
			<div class="datagrid-body" style=" overflow-x: hidden;">
				<table style="width: 100%;font-size:12px;" class="datagrid-btable detail-table">
					<tr>
						<td><div>角色名称</div></td>
						<td><div>${sysRole.name =='' || sysRole.name ==null?'':sysRole.name}</div></td>
						<td><div>角色代码</div></td>
						<td><div>${sysRole.code =='' || sysRole.code ==null?'':sysRole.code}</div></td>
					</tr>
					<tr>
						<td><div>排序号</div></td>
						<td><div>${sysRole.orderNo ==null?'':sysRole.orderNo}</div></td>
						<td><div>是否删除</div></td>
						<td><div>${sysRole.isDeleteName =='' || sysRole.isDeleteName ==null?'':sysRole.isDeleteName}</div></td>
					</tr>
					<tr>
						<td><div>备注</div></td>
						<td colspan="3" class="remarks"><div>${sysRole.remarks =='' || sysRole.remarks ==null?'':sysRole.remarks}</div></td>
					</tr>
				</table>
			</div>
		</div>
		<div data-options="region:'south',border:false" style="text-align:right; padding:5px;">
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