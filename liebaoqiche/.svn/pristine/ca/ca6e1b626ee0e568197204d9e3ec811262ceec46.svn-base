<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE>
<html>
<head>
	<title>UserLevel</title>
	<%@ include file="/WEB-INF/views/include/head.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/views/include/loading.jsp" %>
<!-- 数据列表  -->
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center'">
		<table id="Grid" class="easyui-datagrid" ctrlSelect="true" striped="true"
		       rownumbers="true" pagination="true" fitColumns="true" toolbar="#Grid_Toolbar"
		       loadMsg="正在加载数据，请稍等..." emptyMsg="没有找到符合条件的数据"
		       data-options="url:'${ctx}/user/userLevel/list',fit:true, fitColumns:true, checkOnSelect:true, selectOnCheck:true, border: false,
				onDblClickRow:onDblClickRow">
			<thead>
			<tr>
				<th width="100" data-options="field:'ck',checkbox:true"></th>
				<th width="100" data-options="field:'id',hidden:true">id</th>
				<th width="100" data-options="field:'level',width:100">认证等级</th>
				<th width="100" data-options="field:'levelName',width:100">认证等级名称</th>
				<th width="100" data-options="field:'createTime',width:100">创建时间</th>
				<th width="100" data-options="field:'modifyTime',width:100">修改时间</th>
				<th width="100" data-options="field:'createUserName',width:100">创建人</th>
				<th width="100" data-options="field:'modifyUserName',width:100">修改人</th>
				<%--<th width="100" data-options="field:'remarks'">备注</th>--%>
				<th width="100" data-options="field:'isDeleteName',hidden:true">是否删除</th>
			</tr>
			</thead>
		</table>
		<div id="Grid_Toolbar">
			<form id="searchForm" name="searchForm">
				<shiro:hasPermission name="userLevel:query">
					<input class="easyui-textbox" id="levelName" name="levelName" data-options="prompt:'认证等级名称'">
					<%--<input class="easyui-combobox" id="isDelete" name="isDelete" value=""--%>
					       <%--data-options="url:'/admin/enumData/isDelete',--%>
										<%--method:'post',--%>
										<%--value:'0',--%>
										<%--textField:'label',--%>
										<%--panelHeight:'auto',--%>
										<%--editable:false">--%>
					<a id="btnSearch" href="javascript:void(0)" class="easyui-linkbutton button-primary"><i class="fa fa-search fa-lg"></i>&nbsp;&nbsp;查询</a>
					<a href="javascript:void(0)" class="easyui-linkbutton reset l-btn l-btn-small" plain="true" onclick="resetForm('searchForm')"><i class="fa fa-repeat fa-lg"></i>&nbsp;&nbsp;重置</a>
				</shiro:hasPermission>
				<div class="pull-right">
					<shiro:hasPermission name="userLevel:create">
						<a id="btnCreate" href="javascript:void(0)" class="easyui-linkbutton button-success">
							<i class="fa fa-plus-circle fa-lg"></i>&nbsp;&nbsp;新增
						</a>
					</shiro:hasPermission>

					<shiro:hasPermission name="userLevel:delete">
						<a id="btnDelete" href="javascript:void(0)" class="easyui-linkbutton button-danger">
							<i class="fa fa-minus-circle fa-lg"></i>&nbsp;&nbsp;删除
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
			showDialog('新增认证等级', '${ctx}/user/userLevel/add', 600, 400, function () {
				$('#Grid').datagrid('reload');
			});
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
				window.location.href = '${ctx}/user/userLevel/edit?id=' + selected[0].id;
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
							url: '${ctx}/user/userLevel/delete',
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

		$("#btnSearch").on('click', function(){
			if($('#searchForm').form('enableValidation').form('validate')){
				reload();
			}
		});
	});

	function reload(){
		var params = $('#Grid').datagrid('options').queryParams;
		params.levelName = $('#levelName').val();
		params.outSystemName = $('#outSystemName').val();
		$('#Grid').datagrid('options').queryParams = params;
		$('#Grid').datagrid('reload');
	}

	/**
	 * Easyui重置表单
	 * @param formId
	 */
	function resetForm(formId){
		$('#'+formId).form('clear');
		reload();
	};

	function onDblClickRow (index, row) {
		showDialog('<i class="fa fa-eye fa-lg"></i>&nbsp;&nbsp;详情页面', '${ctx}/user/userLevel/view?id=' + row.id, 800, 500);
	}
</script>
</body>
</html>