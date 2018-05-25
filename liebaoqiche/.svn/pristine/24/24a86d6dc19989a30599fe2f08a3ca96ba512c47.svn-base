<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE>
<html>
<head>
	<title>UserLog</title>
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
		       data-options="url:'${ctx}/user/userLog/list',fit:true, fitColumns:true, checkOnSelect:true, selectOnCheck:true, border: false">
			<thead>
			<tr>
				<th width="100" data-options="field:'ck',checkbox:true"></th>
				<th width="100" data-options="field:'username'">用户名</th>
				<th width="100" data-options="field:'url'">用户访问URL</th>
				<th width="100" data-options="field:'ip'">用户访问IP</th>
				<th width="100" data-options="field:'event'">操作事件</th>
				<th width="100" data-options="field:'createTime'">记录时间</th>
				<th width="100" data-options="field:'detail'">详情</th>
			</tr>
			</thead>
		</table>
		<div id="Grid_Toolbar">
			<form id="searchForm" name="searchForm">
				<shiro:hasPermission name="userLog:query">
					<input class="easyui-textbox" name="username" data-options="prompt:'用户名'">
					<input class="easyui-textbox" name="url" data-options="prompt:'访问URL'">
					<input class="easyui-textbox" name="ip" data-options="prompt:'访问IP'">
					<button id="btnSearch" class="easyui-splitbutton button-primary" data-options="menu:'#search_menu'">
						<i class="fa fa-search fa-lg"></i> 查询
					</button>
					<div id="search_menu" style="padding: 0;">
						<div id="reset_btn" data-options="iconCls:'fa fa-refresh fa-lg fa-fw'">清空查询</div>
					</div>
				</shiro:hasPermission>
			</form>
		</div>
	</div>
</div>

<!-- js脚本，必须写在body中，tab的url加载模式只会异步加载body中的内容到tab中 -->
<script type="text/javascript">
	require(['jquery', 'common'], function ($) {
		// 表单提交，获取查询条件重载表格数据
		$('#searchForm').submit(function () {
			$('#Grid').datagrid('reload', $('#searchForm').serializeObject());
			return false;
		});

		// 清空查询表单，重载表格数据
		$('#reset_btn').click(function () {
			$('#searchForm').form('reset').submit();
		});
	});
</script>
</body>
</html>