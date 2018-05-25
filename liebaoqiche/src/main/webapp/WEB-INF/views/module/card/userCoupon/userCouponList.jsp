<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
	<title>UserCoupon</title>
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
				data-options="url:'${ctx}/card/userCoupon/list',fit:true, fitColumns:true, checkOnSelect:true, selectOnCheck:true, border: false, onDblClickRow:onDblClickRow">
			    <thead>
			        <tr>
			            <th data-options="field:'ck',checkbox:true"></th>
			            <th data-options="field:'id',hidden:true">主键UUID</th>
			            <th data-options="field:'userId',hidden:true">用户编号</th>
			            <th data-options="field:'username'">用户名称</th>
			            <th data-options="field:'couponName'">卡券名称</th>
			            <th data-options="field:'couponBuildId',hidden:true">卡券生成编号</th>
			            <th data-options="field:'couponBuildName'">卡券生成名称</th>
			            <th data-options="field:'couponGetId',hidden:true">卡券领取编号</th>
			            <th data-options="field:'couponGetName'">卡券领取名称</th>
			            <th data-options="field:'couponUseId',hidden:true">卡券使用编号</th>
			            <th data-options="field:'couponUseName'">卡券使用名称</th>
			            <th data-options="field:'num'">数量</th>
			            <th data-options="field:'useNum'">使用数量</th>
			            <th data-options="field:'serplusNum'">剩余数量</th>
			            <th data-options="field:'usableNum'">可用数量</th>
			            <th data-options="field:'overdueNum'">过期数量</th>
			            <th data-options="field:'signId',hidden:true">系统标识</th>
			            <th data-options="field:'systemSignName'">系统名称</th>
			            <%--<th data-options="field:'creater'">创建人</th>--%>
			            <%--<th data-options="field:'createTime'">创建时间</th>--%>
			            <%--<th data-options="field:'modifier'">修改人</th>--%>
			            <%--<th data-options="field:'modifyTime'">修改时间</th>--%>
			            <%--<th data-options="field:'version'">版本</th>--%>
			            <%--<th data-options="field:'remarks'">备注</th>--%>
			        </tr>
			    </thead>
			</table>
			<div id="Grid_Toolbar">
				<form id="searchForm">
					<shiro:hasPermission name="userCoupon:query">
						<input class="easyui-textbox" name="username" data-options="prompt:'用户名称'" size="25">
						<input class="easyui-textbox" name="couponName" data-options="prompt:'卡券名称'" size="20">
						<input class="easyui-combobox" id="signId" name="signId"
						       data-options="
									        url:'${ctx}/accesssystem/accessSystem/accessSystems',
									        textField:'accessSystemName',
									        valueField:'id',
									        width:150,
									        panelHeight:'auto',
									        editable:false,
									        prompt:'系统名称'">
						<input class="easyui-combobox" id="couponBuildId" name="couponBuildId"
						                                            data-options="
									        url:'${ctx}/card/couponBuild/couponTypes',
									        textField:'buildType',
									        valueField:'id',
									        width:150,
									        panelHeight:'auto',
									        editable:false,
									        prompt:'卡券生成形式'">
						<input class="easyui-combobox" id="couponGetId" name="couponGetId"
						                                            data-options="
									        url:'${ctx}/card/couponGet/couponGetTypes',
									        textField:'getType',
									        valueField:'id',
									        width:150,
									        panelHeight:'auto',
									        editable:false,
									        prompt:'卡券领取形式'">
						<input class="easyui-combobox" id="couponUseId" name="couponUseId"
						       data-options="
									        url:'${ctx}/card/conpouUse/couponUseTypes',
									        textField:'couponUseName',
									        valueField:'id',
									        width:150,
									        panelHeight:'auto',
									        editable:false,
									        prompt:'卡券用途形式'">
						<button id="btnSearch" class="easyui-splitbutton button-primary" data-options="menu:'#search_menu'">
							<i class="fa fa-search fa-lg"></i> 查询
						</button>
						<div id="search_menu" style="padding: 0;">
							<div id="reset_btn" data-options="iconCls:'fa fa-refresh fa-lg fa-fw'">清空查询</div>
						</div>
					</shiro:hasPermission>

					<div class="pull-right">
						<shiro:hasPermission name="userCoupon:create">
					        <a id="btnCreate" href="javascript:void(0)" class="easyui-linkbutton button-success"><i class="fa fa-plus-circle fa-lg"></i>&nbsp;&nbsp;新增</a>
						</shiro:hasPermission>

						<shiro:hasPermission name="userCoupon:update">
					        <a id="btnUpdate" href="javascript:void(0)" class="easyui-linkbutton button-default"><i class="fa fa-pencil fa-lg"></i>&nbsp;&nbsp;修改</a>
						</shiro:hasPermission>

						<shiro:hasPermission name="userCoupon:delete">
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
				showDialog('新增', '${ctx}/card/userCoupon/add', 800, 500, function () {
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
					showDialog('编辑', '${ctx}/card/userCoupon/edit?id=' + selected[0].id, 800, 500, function () {
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
	                            url: '${ctx}/card/userCoupon/delete',
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

		//查询详情
		function onDblClickRow (index, row) {
			showDialog('<i class="fa fa-eye fa-lg"></i>&nbsp;&nbsp;详情页面', '/admin/card/userCoupon/view?id=' + row.id, 800, 500);
		}
	</script>
</body>
</html>