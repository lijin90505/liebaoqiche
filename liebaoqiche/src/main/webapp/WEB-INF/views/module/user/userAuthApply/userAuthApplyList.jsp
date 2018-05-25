<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE>
<html>
<head>
	<title>用户认证申请管理</title>
	<%@ include file="/WEB-INF/views/include/head.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/views/include/loading.jsp" %>
<!-- 数据列表  -->
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center'">
		<table id="Grid" class="easyui-datagrid" ctrlSelect="true" striped="true"
		       rownumbers="true" pagination="true" toolbar="#Grid_Toolbar"
		       loadMsg="正在加载数据，请稍等..." emptyMsg="没有找到符合条件的数据"
		       data-options="
				url:'${ctx}/user/userAuthApply/list',
				fit:true,
				fitColumns:true,
				checkOnSelect:true,
				selectOnCheck:true,
				border: false,
				onDblClickRow:onDblClickRow">
			<thead>
			<tr>
				<th width="100" data-options="field:'ck',checkbox:true"></th>
				<th width="100" data-options="field:'username',hidden:true">用户名</th>
				<th width="100" data-options="field:'realname'">用户姓名</th>
				<th width="100" data-options="field:'levelId',hidden:true">申请等级</th>
				<th width="100" data-options="field:'levelName'">申请等级</th>
				<th width="100" data-options="field:'platform',hidden:true">终端平台</th>
				<th width="100" data-options="field:'platformDesc'">终端平台</th>
				<th width="100" data-options="field:'outSystemName',hidden:true">接入系统</th>
				<th width="120" data-options="field:'createTime'">申请时间</th>
				<th width="120" data-options="field:'modifyTime'">操作时间</th>
				<th width="100" data-options="field:'modifyUserName'">操作人</th>
				<th width="100" data-options="field:'statusDesc'">状态</th>
			</tr>
			</thead>
		</table>
		<div id="Grid_Toolbar">
			<form id="searchForm" name="searchForm">
				<shiro:hasPermission name="userAuthApply:query">
					<input class="easyui-textbox" id="realname" name="realname" data-options="prompt:'用户姓名'">
					<input class="easyui-combobox" id="levelId" name="levelId"
					       data-options="
											        url:'${ctx}/user/userLevel/levels',
											        textField:'levelName',
											        valueField:'id',
											        panelHeight:'300',
											        editable:false,
											        prompt:'申请等级'">
					<input class="easyui-combobox" id="platform" name="platform"
					       data-options="
					       url:'${ctx}/enumData/lieBao/EnumsPlatformType',
					       textField:'label',
					       width:140,
					       panelHeight:'300px',
					       editable:false,
					       prompt:'终端平台'">
					<a id="btnSearch" href="javascript:void(0)" class="easyui-linkbutton button-primary"><i class="fa fa-search fa-lg"></i>&nbsp;&nbsp;查询</a>
					<a href="javascript:void(0)" class="easyui-linkbutton reset l-btn l-btn-small" plain="true" onclick="resetForm('searchForm')"><i class="fa fa-repeat fa-lg"></i>&nbsp;&nbsp;重置</a>
				</shiro:hasPermission>
				<div class="pull-right">
					<shiro:hasPermission name="userAuthApply:batchPass">
						<a id="batch_pass_btn" class="easyui-linkbutton button-success">
							<i class="fa fa-check fa-lg"></i> 批量通过
						</a>
					</shiro:hasPermission>

					<shiro:hasPermission name="userAuthApply:batchReject">
						<a id="batch_reject_btn" class="easyui-linkbutton button-danger">
							<i class="fa fa-remove fa-lg"></i> 批量拒绝
						</a>
					</shiro:hasPermission>

					<shiro:hasPermission name="userAuthApply:delete">
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

		// 批量通过
		$('#batch_pass_btn').click(function () {
			checkHandle(1);
		});

		// 批量拒绝
		$('#batch_reject_btn').click(function () {
			checkHandle(0);
		});

		function checkHandle (status) {
			var rows = $("#Grid").datagrid('getSelections');
			if (rows.length == 0) return $.messager.alert('提示', '请选择需要处理的记录', "info");

			var ids = rows.map(function (row) {
				return row.id;
			}).join();

			if (status === 0) {
				$.messager.prompt('系统提示', '请输入拒绝原因', function (r) {
					if (r !== undefined) sendHandle(ids, status, $.trim(r) || '审核未通过');
				});

			} else {
				$.messager.confirm('系统提示', '您确定通过用户申请？', function (r) {
					if (r) sendHandle(ids, status, '通过审核');
				});
			}
		}

		function sendHandle (ids, status, detail) {
			$.ajax({
				url: '${ctx}/user/userAuthApply/handle',
				data: {
					ids: ids,
					status: status,
					detail: detail
				},
				type: 'post',
				dataType: 'json',
				success: function (json) {
					if (json && json.rtnCode == '00000000') {
						$.messager.alert('提示', "处理成功", "success");
						$('#Grid').datagrid('reload');
					} else {
						$.messager.alert('提示', json.rtnMsg, 'error');
					}
				}
			});
		}

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
							url: '${ctx}/user/userAuthApply/delete',
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
	});

	function reload(){
		var params = $('#Grid').datagrid('options').queryParams;
		params.realname = $('#realname').val();
		params.outSystemName = $('#outSystemName').val();
		params.levelId = $('#levelId').val();
		params.platform = $('#platform').val();
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
		showDialog('<i class="fa fa-eye fa-lg"></i>&nbsp;&nbsp;详情页面', '${ctx}/user/userAuthApply/view?id=' + row.id, 800, 500);
	}
</script>
</body>
</html>