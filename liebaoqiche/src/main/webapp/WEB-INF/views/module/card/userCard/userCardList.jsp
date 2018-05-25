<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
	<title>UserCard</title>
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
				data-options="url:'${ctx}/card/userCard/list',fit:true, fitColumns:true, checkOnSelect:true, selectOnCheck:true, border: false">
			    <thead>
			        <tr>
			            <th data-options="field:'ck',checkbox:true"></th>
			            <th data-options="field:'id',hidden:true">id</th>
			            <!-- <th data-options="field:'accessSystemId',hidden:true">access_system_id</th> -->
			            <th data-options="field:'accessSystemId',width:120">系统名称</th>
			            <!-- <th data-options="field:'appId',hidden:true">app_id</th> -->
			            <th data-options="field:'appId',width:120,formatter:function(value,row,index){
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
				        <th data-options="field:'userName'">用户名称</th>
			            <th data-options="field:'vinNo',width:140">车架号</th>
			            <th data-options="field:'cardId',hidden:true">card_id</th>
			            <th data-options="field:'cardName',width:120">卡券名称</th>
			            <th data-options="field:'cardNo'">卡号</th>
			            <th data-options="field:'dealerId'">经销商</th>
			            <th data-options="field:'state',formatter: function(value,row,index){
							if (row.state =='0'){
								return '未使用';
												} else if(row.state =='1'){
													return '使用中';
												}
												else if(row.state =='2'){
											return '已使用';
										}else  if(row.state =='3'){
											return '已过期';
										}
									}">状态</th>
						<th data-options="field:'expiryDate'">卡券有效期</th>		
			        </tr>
			    </thead>
			</table>
			<div id="Grid_Toolbar">
				<form id="searchForm" name="searchForm">
					<input class="easyui-textbox" style="width:120px;" id="accessSystemId" name="accessSystemId" data-options="prompt:'系统名称'" size="20">
					<input class="easyui-textbox" style="width:120px;" id="userName" name="userName" data-options="prompt:'用户名称'" size="20">
					<input class="easyui-textbox" style="width:120px;" id="cardName" name="cardName" data-options="prompt:'卡券名称'" size="20">
					<input class="easyui-textbox" style="width:120px;" id="vinNo" name="vinNo" data-options="prompt:'车架号'" size="20">
					<input class="easyui-textbox" style="width:120px;" id="dealerId" name="dealerId" data-options="prompt:'经销商'" size="20">
					<%-- <input class="easyui-combobox" id="accessSystemId" name="accessSystemId"  label=""
					       data-options="
									        url:'${ctx}/accesssystem/accessSystem/accessSystems',
									        textField:'name',
									        valueField:'id',
									        width:176,
									        panelHeight:'auto',
									        editable:false,
									        prompt:'系统名称'"> --%>
					<input class="easyui-combobox" style="width:120px;" id="state" name="state" labelWidth="100"
					       data-options="
											url:'${ctx}/enumData/lieBao/enumsCardUseStatus',
											textField:'label',
											panelHeight:'auto',
											editable:false,
											prompt:'状态'">
					<input class="easyui-combobox" style="width:120px;" id="appId" name="appId"  label=""
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
						<shiro:hasPermission name="userCard:create">
					        <a id="btnCreate" href="javascript:void(0)" class="easyui-linkbutton button-success"><i class="fa fa-plus-circle fa-lg"></i>&nbsp;&nbsp;新增</a>
						</shiro:hasPermission>

						<shiro:hasPermission name="userCard:update">
					        <a id="btnUpdate" href="javascript:void(0)" class="easyui-linkbutton button-default"><i class="fa fa-pencil fa-lg"></i>&nbsp;&nbsp;修改</a>
						</shiro:hasPermission>

						<shiro:hasPermission name="userCard:delete">
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
				window.location.href = '${ctx}/card/userCard/add';
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
					window.location.href = '${ctx}/card/userCard/edit?id=' + selected[0].id;
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
	                            url: '${ctx}/card/userCard/delete',
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
			params.userName = $('#userName').val().trim();
			params.accessSystemId = $('#accessSystemId').val().trim();
			params.vinNo = $('#vinNo').val().trim();
			params.appId = $('#appId').val();
			params.cardName = $('#cardName').val().trim();
			params.state = $('#state').val();
			params.dealerId = $('#dealerId').val().trim();
			$('#Grid').datagrid('options').queryParams = params;
			$('#Grid').datagrid('reload');
		}
	</script>
</body>
</html>