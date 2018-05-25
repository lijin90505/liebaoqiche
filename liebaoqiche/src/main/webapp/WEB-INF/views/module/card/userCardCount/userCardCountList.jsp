<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
	<title>UserCardCount</title>
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
				data-options="url:'${ctx}/card/userCardCount/list',fit:true, fitColumns:true, checkOnSelect:true, selectOnCheck:true, border: false,onDblClickRow:onDblClickRow">
			    <thead>
			        <tr>
			            <th data-options="field:'ck',checkbox:true"></th>
				        <th data-options="field:'id',hidden:true">id</th>
				        <!-- <th data-options="field:'accessSystemId',hidden:true">access_system_id</th> -->
			            <th data-options="field:'accessSystemId',width:100">系统名称</th>
			            <!-- <th data-options="field:'appId',hidden:true">app_id</th> -->
			            <th data-options="field:'appId',width:100,formatter:function(value,row,index){
							if (row.appId =='00'){
								return 'PC';
												} else if(row.appId =='01'){
													return '安卓';
												}
												else if(row.appId =='02'){
											return 'IOS';
										}else if(row.appId == '03'){
											return '微信公众号';
										}else if(row.appId == '04'){
											return '微信小程序';
										}else if(row.appId == '05'){
											return '管理系统';
										}else if(row.appId == '06'){
											return '活动系统';
										}else{
											return row.appId;
										}
									}">应用程序</th>
				        <th data-options="field:'userId',hidden:true">user_id</th>
				        <th data-options="field:'userName',width:100">用户名称</th>
				        <th data-options="field:'vinNo',width:180">车架号</th>
				        <th data-options="field:'cardId',hidden:true">card_id</th>
				        <th data-options="field:'cardName',width:100">卡券名称</th>
			            <!-- <th data-options="field:'number'">卡券数量</th> -->
			            <th data-options="field:'number',width:50">总数量</th>
			            <th data-options="field:'useing',width:50">使用中</th>
			            <th data-options="field:'used',width:50">已使用</th>
			            <th data-options="field:'noUsed',width:50">未使用</th>
			            <th data-options="field:'past',width:50">已过期</th>
			           <!--  <th data-options="field:'creater'">创建人</th>
			            <th data-options="field:'createTime'">创建时间</th>
			            <th data-options="field:'modifier'">修改人</th>
			            <th data-options="field:'modifyTime'">修改时间</th>
			            <th data-options="field:'version',hidden:true">版本</th> -->
			            <!-- <th data-options="field:'remarks',width:100">备注</th> -->
			        </tr>
			    </thead>
			</table>
			<div id="Grid_Toolbar">
				<form id="searchForm" name="searchForm">
					<input class="easyui-textbox" id="accessSystemId" name="accessSystemId" data-options="prompt:'系统名称'" size="20">
					<input class="easyui-textbox" id="userName" name="userName" data-options="prompt:'用户名称'" size="20">
					<input class="easyui-textbox" id="cardName" name="cardName" data-options="prompt:'卡券名称'" size="20">
					<input class="easyui-textbox" id="vinNo" name="vinNo" data-options="prompt:'车架号'" size="20">
					<input class="easyui-combobox" id="appId" name="appId"  label=""
					       data-options="
									        url:'${ctx}/enumData/lieBao/EnumsPlatformType',
									        textField:'label',
									        width:120,
									        panelHeight:'auto',
									        editable:false,
									        prompt:'应用程序'">
					<a id="btnSearch" href="javascript:void(0)" class="easyui-linkbutton button-primary"><i class="fa fa-search fa-lg"></i>&nbsp;&nbsp;查询</a>
					<a href="javascript:void(0)" class="easyui-linkbutton reset l-btn l-btn-small" plain="true" onclick="resetForm('searchForm')"><i class="fa fa-repeat fa-lg"></i>&nbsp;&nbsp;重置</a>
					<div class="pull-right">
						<shiro:hasPermission name="userCardCount:create">
					        <a id="btnCreate" href="javascript:void(0)" class="easyui-linkbutton button-success"><i class="fa fa-plus-circle fa-lg"></i>&nbsp;&nbsp;新增</a>
						</shiro:hasPermission>

						<shiro:hasPermission name="userCardCount:update">
					        <a id="btnUpdate" href="javascript:void(0)" class="easyui-linkbutton button-default"><i class="fa fa-pencil fa-lg"></i>&nbsp;&nbsp;修改</a>
						</shiro:hasPermission>

						<shiro:hasPermission name="userCardCount:delete">
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
				window.location.href = '${ctx}/card/userCardCount/add';
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
					window.location.href = '${ctx}/card/userCardCount/edit?id=' + selected[0].id;
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
	                            url: '${ctx}/card/userCardCount/delete',
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
			params.vinNo = $('#vinNo').val().trim();
			params.userName = $('#userName').val().trim();
			params.cardName = $('#cardName').val().trim();
			params.accessSystemId = $('#accessSystemId').val().trim();
			params.appId = $('#appId').val();
			$('#Grid').datagrid('options').queryParams = params;
			$('#Grid').datagrid('reload');
		}
		
		function onDblClickRow (index, row) {
			/* showDialog('<i class="fa fa-eye fa-lg"></i>&nbsp;&nbsp;详情页面', '${ctx}/card/userCardCount/view?id=' + row.id, 800, 500); */
		}
	</script>
</body>
</html>