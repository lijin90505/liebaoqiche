<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
	<title>版本信息</title>
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
				data-options="url:'${ctx}/system/appVersion/list',fit:true, fitColumns:true, checkOnSelect:true, selectOnCheck:true, border: false">
			    <thead>
			        <tr>
			            <th data-options="field:'ck',checkbox:true"></th>
			            <th data-options="field:'appTypeName'">终端类型</th>
			            <th data-options="field:'appVersion'">客户端编号</th>
			            <th data-options="field:'sourcesPath'">资源包地址</th>
			            <th data-options="field:'verNum'">版本编号</th>
			            <th data-options="field:'verCode'">版本编号</th>
			            <th data-options="field:'isReleaseName'">发布状态</th>
			            <th data-options="field:'isDeleteName'">删除标识</th>
			        </tr>
			    </thead>
			</table>
			<div id="Grid_Toolbar">
		    	<form id="searchForm" name="searchForm">
		    		<shiro:hasPermission name="appVersion:query">
					<input class="easyui-textbox" id="appVersion" name="appVersion" data-options="validType:'special',prompt:'客户端编号'" style="width:160px;" iconWidth="0">
		        	<input class="easyui-textbox" id="verNum"  name="verNum"  data-options="validType:'special',prompt:'版本编号'" style="width:160px;" iconWidth="0">
		        	<input class="easyui-combobox" id="isDelete" name="isDelete" value="" 
	    							data-options="url:'${ctx}/enumData/isDelete',
										method:'post',
										onLoadSuccess:function(data){ 
											if($('#id').val() == '')
											$('#isDelete').combobox('setValue',0);
										},	
										value:'0',			
										textField:'label',
										panelHeight:'auto',
										editable:false" style="width:160px;">
	                        	</input>
		        	<a id="btnSearch" href="javascript:void(0)" class="easyui-linkbutton button-primary"><i class="fa fa-search fa-lg"></i>&nbsp;&nbsp;查询</a>
		    	
		    		</shiro:hasPermission>
		    		
		    		<div class="pull-right">
						<shiro:hasPermission name="appVersion:create">
					        <a id="btnCreate" href="javascript:void(0)" class="easyui-linkbutton button-success"><i class="fa fa-plus-circle fa-lg"></i>&nbsp;&nbsp;新增</a>
						</shiro:hasPermission>
						
						<shiro:hasPermission name="appVersion:update">
					        <a id="btnUpdate" href="javascript:void(0)" class="easyui-linkbutton button-default"><i class="fa fa-pencil fa-lg"></i>&nbsp;&nbsp;修改</a>
						</shiro:hasPermission>
						
						<shiro:hasPermission name="appVersion:delete">
					        <a id="btnDelete" href="javascript:void(0)" class="easyui-linkbutton button-danger"><i class="fa fa-minus-circle fa-lg"></i>&nbsp;&nbsp;删除</a>
						</shiro:hasPermission>
						
		<%-- 				<shiro:hasPermission name="appVersion:query">
				        	<a id="btnSearch" href="javascript:void(0)" class="easyui-linkbutton button-primary"><i class="fa fa-search fa-lg"></i>&nbsp;&nbsp;查询</a>
				    	</shiro:hasPermission> --%>
				    	
						<shiro:hasPermission name="appVersion:release">
				        	<a id="btnRelease" href="javascript:void(0)" class="easyui-linkbutton button-primary"><i class="fa fa-share fa-lg"></i>&nbsp;&nbsp;发布</a>
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
				showDialog('<i class="fa fa-plus-circle fa-lg"></i>&nbsp;&nbsp;新增客户端版本','${ctx}/system/appVersion/add','80%', '80%', function(){
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
					showDialog('<i class="fa fa-pencil fa-lg"></i>&nbsp;&nbsp;修改客户端版本','${ctx}/system/appVersion/edit?id=' + selected[0].id ,'80%', '80%', function(){
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
	                            url: '${ctx}/system/appVersion/delete',
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
			
			function reload(){
				var params = $('#Grid').datagrid('options').queryParams;
				params.appVersion = $('#appVersion').val();
				params.verNum = $('#verNum').val();
				params.isDelete = $('#isDelete').val();
				$('#Grid').datagrid('options').queryParams = params;
				$('#Grid').datagrid('reload');
			}
			
			// 给修改按钮添加点击事件
			$("#btnRelease").on('click', function(){
				var selected = $("#Grid").datagrid('getSelections');
				if(selected.length == 0){
					$.messager.alert('提示','请选择需要发布的记录', "info");
				}
				if(selected.length > 1){
					$.messager.alert('提示','只能选择一条需要修改的记录', "info");
				}
				if(selected.length == 1){
					if(selected[0].isRelease == 0){
						$.messager.confirm('警告', '确认发布此客户端版本吗?', function (r) {
	                        if(r){
	                            $.ajax({
		                            url: '${ctx}/system/appVersion/release',
		                            data: {
		                                id : selected[0].id
		                            },
		                            type: 'post',
		                            dataType: 'json',
		                            success: function (json) {
		                                if (json && json.rtnCode == '00000000') {
		                                    $.messager.alert('提示', "发布成功", "success");
		                                    $('#Grid').datagrid('reload');
		                                } else {
		                                    $.messager.alert('提示', json.rtnMsg);
		                                }
		                            }
	                        	});
							}
	                    });
					}else{
						$.messager.alert('提示','请不要重复发布',"info");
					}
				}
			});
		});
	</script>
</body>
</html>