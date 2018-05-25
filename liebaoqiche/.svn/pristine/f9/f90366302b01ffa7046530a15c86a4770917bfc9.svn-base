<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
	<title>Coupon</title>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/loading.jsp"%>
	<!-- 数据列表  -->
	<div class="easyui-layout" data-options="fit:true,border:false">
		<div data-options="region:'center'">
			<table id="Grid" class="easyui-datagrid" title="" ctrlSelect="true" striped="true"
				rownumbers="true" pagination="true" fitColumns="true" toolbar="#Grid_Toolbar"
				loadMsg="正在加载数据，请稍等..." emptyMsg="没有找到符合条件的数据"
				data-options="url:'${ctx}/card/coupon/list',fit:true, fitColumns:true, checkOnSelect:true, selectOnCheck:true, border: false">
			    <thead>
			        <tr>
			            <th data-options="field:'ck',checkbox:true"></th>
			            <th data-options="field:'id',hidden:true">id</th>
			            <th data-options="field:'isDelete',hidden:true">是否删除；0未删除，1删除</th>
			            <th data-options="field:'couponName'">卡券名称</th>
			            <th data-options="field:'couponContent'">卡券内容</th>
			            <th data-options="field:'couponBuildId',hidden:true">卡券生成编号</th>
			            <th data-options="field:'couponBuildName'">生成形式</th>
			            <th data-options="field:'couponGetName'">领取形式</th>
			            <th data-options="field:'couponGetId',hidden:true">领取券编号</th>
			            <th data-options="field:'conpouUseId',hidden:true">卡券用途编号</th>
			            <th data-options="field:'couponUseName'">用途形式</th>
			            <th data-options="field:'creater'">创建人</th>
			            <th data-options="field:'createTime'">创建时间</th>
			            <th data-options="field:'modifier'">修改人</th>
			            <th data-options="field:'modifyTime'">修改时间</th>
			            <th data-options="field:'remarks'">备注</th>
			        </tr>
			    </thead>
			</table>
			<div id="Grid_Toolbar">
				<form id="searchForm">
					<shiro:hasPermission name="coupon:query">
						<input class="easyui-textbox" name="couponName" data-options="prompt:'卡券名称'" size="25">
						<input class="easyui-textbox" name="couponContent" data-options="prompt:'卡券内容'" size="25">
						<button id="btnSearch" class="easyui-splitbutton button-primary" data-options="menu:'#search_menu'">
							<i class="fa fa-search fa-lg"></i> 查询
						</button>
						<div id="search_menu" style="padding: 0;">
							<div id="reset_btn" data-options="iconCls:'fa fa-refresh fa-lg fa-fw'">清空查询</div>
						</div>
					</shiro:hasPermission>

					<div class="pull-right">
						<shiro:hasPermission name="coupon:create">
					        <a id="btnCreate" href="javascript:void(0)" class="easyui-linkbutton button-success"><i class="fa fa-plus-circle fa-lg"></i>&nbsp;&nbsp;新增</a>
						</shiro:hasPermission>

						<shiro:hasPermission name="coupon:update">
					        <a id="btnUpdate" href="javascript:void(0)" class="easyui-linkbutton button-default"><i class="fa fa-pencil fa-lg"></i>&nbsp;&nbsp;修改</a>
						</shiro:hasPermission>

						<shiro:hasPermission name="coupon:delete">
					        <a id="btnDelete" href="javascript:void(0)" class="easyui-linkbutton button-danger"><i class="fa fa-minus-circle fa-lg"></i>&nbsp;&nbsp;删除</a>
						</shiro:hasPermission>
				    </div>
				</form>
		    </div>
		</div>
	</div>
	
    <!-- js脚本，必须写在body中，tab的url加载模式只会异步加载body中的内容到tab中 -->
	<script type="text/javascript">
		require(['jquery','common'], function($){
			// 给新增按钮添加点击事件
			$("#btnCreate").on('click', function(){
				showDialog('新增', '${ctx}/card/coupon/add', 800, 500, function () {
					$('#Grid').datagrid('reload');
				});
			});
			
			// 给修改按钮添加点击事件
			$("#btnUpdate").on('click', function(){
				var selected = $("#Grid").datagrid('getSelections');
				if(selected.length == 0){
					$.messager.alert('提示','请选择需要修改的记录', "info");
				}
				if(selected.length > 1){
					$.messager.alert('提示','只能选择一条需要修改的记录', "info");
				}
				if(selected.length == 1){
					showDialog('编辑', '${ctx}/card/coupon/edit?id=' + selected[0].id, 800, 500, function () {
						$('#Grid').datagrid('reload');
					});
				}
			});
			
			// 给删除按钮添加点击事件
			$("#btnDelete").on('click', function(){
				var selected = $("#Grid").datagrid('getSelections');
				if(selected.length == 0){
					$.messager.alert('提示','请选择需要删除的记录', "info");
				}else{
                    $.messager.confirm('警告', '确认删除本条记录吗?', function (r) {
                        if(r){
                            var ids = '';
                            for (var i = 0; i < selected.length; i++) {
                                ids += selected[i].id + ',';
                            }
                            
                            $.ajax({
	                            url: '${ctx}/card/coupon/delete',
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