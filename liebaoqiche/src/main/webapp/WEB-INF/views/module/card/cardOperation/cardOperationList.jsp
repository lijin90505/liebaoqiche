<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
	<title>CardOperation</title>
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
				data-options="url:'${ctx}/card/cardOperation/list',fit:true, fitColumns:true, checkOnSelect:true, selectOnCheck:true, border: false,onDblClickRow:onDblClickRow">
			    <thead>
			        <tr>
			            <th data-options="field:'ck',checkbox:true"></th>
			            <th data-options="field:'id',hidden:true">id</th>
			            <th data-options="field:'systemId',hidden:true">系统标识</th>
			            <th data-options="field:'systemName',width:100">系统名称</th>
			            <th data-options="field:'userId',hidden:true">发放用户编号</th>
			            <th data-options="field:'userName',width:100">用户名称</th>
			            <th data-options="field:'cardId',hidden:true">卡券编号</th>
			            <th data-options="field:'cardName',width:100">卡券名称</th>
			            <th data-options="field:'grantOrRecall',hidden:true">发放/撤回；0发放，1撤回</th>
			            <th data-options="field:'grantOrRecallDesc',width:100">操作类型</th>
			            <th data-options="field:'number',width:100">数量</th>
			           <!--  <th data-options="field:'grantNum',width:100,formatter: function(value,row,index){
							if (row.grantNum ==''){
								return '0';
									} else{
											return row.grantNum;
										}
									}">发放数量</th>
			            <th data-options="field:'recallNum',width:100,formatter: function(value,row,index){
							if (row.recallNum ==''){
								return '0';
									} else{
											return row.recallNum;
										}
									}">撤回数量</th> -->
			            <%--<th data-options="field:'creater'">创建人</th>--%>
			            <%--<th data-options="field:'createTime'">创建时间</th>--%>
			            <%--<th data-options="field:'modifier'">修改人</th>--%>
			            <%--<th data-options="field:'modifyTime'">修改时间</th>--%>
			            <%--<th data-options="field:'version',hidden:true">版本</th>--%>
			            <%--<th data-options="field:'remarks'">备注</th>--%>
			            <th data-options="field:'isDelete',hidden:true">is_delete</th>
			        </tr>
			    </thead>
			</table>
			<div id="Grid_Toolbar">
				<form id="searchForm" name="searchForm">
				<input class="easyui-textbox" style="width:120px;" id="systemName" name="systemName" data-options="prompt:'系统名称'" size="20">
				<input class="easyui-textbox" style="width:120px;" id="userName" name="userName" data-options="prompt:'用户名称'" size="20">
				<input class="easyui-textbox" style="width:120px;" id="cardName" name="cardName" data-options="prompt:'卡券名称'" size="20">
					<%-- <input class="easyui-combobox" id="grantOrRecall" name="grantOrRecall" labelWidth="100"
					       data-options="
											        url:'${ctx}/enumData/lieBao/EnumCardGrantOrRecall',
											        textField:'label',
											        panelHeight:'auto',
											        editable:false,
											        prompt:'卡券操作类型'"> --%>
					<a id="btnSearch" href="javascript:void(0)" class="easyui-linkbutton button-primary"><i class="fa fa-search fa-lg"></i>&nbsp;&nbsp;查询</a>
					<a href="javascript:void(0)" class="easyui-linkbutton reset l-btn l-btn-small" plain="true" onclick="resetForm('searchForm')"><i class="fa fa-repeat fa-lg"></i>&nbsp;&nbsp;重置</a>
					<div class="pull-right">
						<shiro:hasPermission name="cardOperation:create">
					        <a id="btnCreate" href="javascript:void(0)" class="easyui-linkbutton button-success"><i class="fa fa-hand-o-right fa-lg"></i>&nbsp;&nbsp;发放</a>
						</shiro:hasPermission>

						<shiro:hasPermission name="cardOperation:update">
					        <a id="btnUpdate" href="javascript:void(0)" class="easyui-linkbutton button-default"><i class="fa fa-pencil fa-lg"></i>&nbsp;&nbsp;修改</a>
						</shiro:hasPermission>

						<shiro:hasPermission name="cardOperation:delete">
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
				showDialog('新增', '${ctx}/card/cardOperation/add', 800, 500, function () {
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
					showDialog('编辑', '${ctx}/card/cardOperation/edit?id=' + selected[0].id, 800, 500, function () {
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
	                            url: '${ctx}/card/cardOperation/delete',
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

		/**
		 * Easyui重置表单
		 * @param formId
		 */
		function resetForm(formId){
			$('#'+formId).form('clear');
			reload();
		};

		function reload(){
			var params = $('#Grid').datagrid('options').queryParams;
			params.systemName = $('#systemName').val().trim();
			params.userName = $('#userName').val().trim();
			params.cardName = $('#cardName').val().trim();
			$('#Grid').datagrid('options').queryParams = params;
			$('#Grid').datagrid('reload');
		}

		function onDblClickRow (index, row) {
			showDialog('<i class="fa fa-eye fa-lg"></i>&nbsp;&nbsp;详情页面', '/admin/card/cardOperation/view?id=' + row.id, 800, 500);
		}
	</script>
</body>
</html>