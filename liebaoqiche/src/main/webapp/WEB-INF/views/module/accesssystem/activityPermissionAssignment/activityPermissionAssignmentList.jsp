<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE>
<html>
<head>
	<title>ActivityPermissionAssignment</title>
	<%@ include file="/WEB-INF/views/include/head.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/views/include/loading.jsp" %>
<!-- 数据列表  -->
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center'">
		<table id="Grid" class="easyui-datagrid" title="" ctrlSelect="true" striped="true"
		       rownumbers="true" pagination="true" fitColumns="true" toolbar="#Grid_Toolbar"
		       loadMsg="正在加载数据，请稍等..." emptyMsg="没有找到符合条件的数据"
		       data-options="url:'${ctx}/accesssystem/accessSystem/list',fit:true, fitColumns:true, checkOnSelect:true, selectOnCheck:true, border: false">
			<thead>
			<tr>
				<th data-options="field:'ck',checkbox:true"></th>
				<th data-options="field:'id',hidden:true">id</th>
				<th data-options="field:'name'">系统名称</th>
				<th data-options="field:'isDelete',hidden:true">是否删除；0未删除，1删除</th>
				<th data-options="field:'identification'">系统标识</th>
				<th data-options="field:'secret',hidden:true">密钥</th>
				<th data-options="field:'creater'">创建人</th>
				<th data-options="field:'createTime'">创建时间</th>
				<th data-options="field:'modifier'">修改人</th>
				<th data-options="field:'modifyTime'">修改时间</th>
				<th data-options="field:'remarks'">备注</th>
			</tr>
			</thead>
		</table>
		<div id="Grid_Toolbar">
			<form id="searchForm" name="searchForm">
				<input class="easyui-textbox" id="name" name="name" labelWidth="70" data-options="validType:'special',validType:'special',prompt:'系统名称'">
				<a id="btnSearch" href="javascript:void(0)" class="easyui-linkbutton button-primary"><i class="fa fa-search fa-lg"></i>&nbsp;&nbsp;查询</a>

				<div class="pull-right">
					<shiro:hasPermission name="activityPermissionAssignment:create">
						<a id="btnCreate" href="javascript:void(0)" class="easyui-linkbutton button-success">
							<i class="fa fa-plus-circle fa-lg"></i>&nbsp;&nbsp;新增
						</a>
					</shiro:hasPermission>

					<shiro:hasPermission name="activityPermissionAssignment:update">
						<a id="btnUpdate" href="javascript:void(0)" class="easyui-linkbutton button-default">
							<i class="fa fa-pencil fa-lg"></i>&nbsp;&nbsp;修改
						</a>
					</shiro:hasPermission>

					<shiro:hasPermission name="activityPermissionAssignment:delete">
						<a id="btnDelete" href="javascript:void(0)" class="easyui-linkbutton button-danger">
							<i class="fa fa-minus-circle fa-lg"></i>&nbsp;&nbsp;删除
						</a>
					</shiro:hasPermission>

					<shiro:hasPermission name="activityPermissionAssignment:distribution">
						<a id="btnDistribution" href="javascript:void(0)" class="easyui-linkbutton button-primary">
							<i class="fa fa-search fa-lg"></i>&nbsp;&nbsp;分配
						</a>
					</shiro:hasPermission>
				</div>
			</form>
		</div>
	</div>
</div>

<!-- js脚本，必须写在body中，tab的url加载模式只会异步加载body中的内容到tab中 -->
<script type="text/javascript">
	require(['jquery', 'common'], function ($) {
		// 给新增按钮添加点击事件
		$("#btnCreate").on('click', function () {
			showDialog('新增', '${ctx}/accesssystem/activityPermissionAssignment/add', 800, 500, function () {
				$('#Grid').datagrid('reload');
			});
		});

		// 给分配按钮添加点击事件
		$("#btnDistribution").on('click', function () {
			var selected = $("#Grid").datagrid('getSelections');
			if (selected.length == 0) {
				$.messager.alert('提示', '请选择需要分配权限的记录', "info");
			}
			if (selected.length > 1) {
				$.messager.alert('提示', '只能选择一条需要分配权限的记录', "info");
			}
			if (selected.length == 1) {
				showDialog('分配', '${ctx}/accesssystem/activityPermissionAssignment/permission?id=' + selected[0].id, 800, 550, function () {
					$('#Grid').datagrid('reload');
				});
			}
		});

		// 给修改按钮添加点击事件
		$("#btnUpdate").on('click', function () {
			var selected = $("#Grid").datagrid('getSelections');
			if (selected.length == 0) {
				$.messager.alert('提示', '请选择需要修改的记录', "info");
			}
			if (selected.length > 1) {
				$.messager.alert('提示', '只能选择一条需要修改的记录', "info");
			}
			if (selected.length == 1) {
				window.location.href = '${ctx}/accesssystem/activityPermissionAssignment/edit?id=' + selected[0].id;
			}
		});

		// 给删除按钮添加点击事件
		$("#btnDelete").on('click', function () {
			var selected = $("#Grid").datagrid('getSelections');
			if (selected.length == 0) {
				$.messager.alert('提示', '请选择需要删除的记录', "info");
			} else {
				$.messager.confirm('警告', '确认删除本条记录吗?', function (r) {
					if (r) {
						var ids = '';
						for (var i = 0; i < selected.length; i++) {
							ids += selected[i].id + ',';
						}

						$.ajax({
							url: '${ctx}/accesssystem/activityPermissionAssignment/delete',
							data: {
								ids: ids
							},
							type: 'post',
							dataType: 'json',
							success: function (json) {
								if (json && json.rtnCode == '00000000') {
									$.messager.alert('提示', "删除成功", "success");
									$('#Grid').datagrid('reload');
								} else {
									$.messager.alert('提示', json.rtnMsg);
								}
							}
						});
					}
				});
			}
		});

		// 给查询按钮添加点击事件
		$("#btnSearch").on('click', function(){
			if($('#searchForm').form('enableValidation').form('validate')){
				reload();
			}
		});

		// 给查询按钮添加点击事件
		$("#btnSearch").on('click', function () {

		});
	});

	function reload(){
		var params = $('#Grid').datagrid('options').queryParams;
		params.name = $('#name').val();
		$('#Grid').datagrid('options').queryParams = params;
		$('#Grid').datagrid('reload');
	}
</script>
</body>
</html>