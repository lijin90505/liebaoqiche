<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
	<title>ActivityCard</title>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/loading.jsp"%>
	<!-- 数据列表  -->
	<div class="easyui-layout" data-options="fit:true,border:false">
		<div data-options="region:'center'">
			<table id="Grid" class="easyui-datagrid" title="ActivityCard" ctrlSelect="true" striped="true"
				rownumbers="true" pagination="true" fitColumns="true" toolbar="#Grid_Toolbar"
				loadMsg="正在加载数据，请稍等..." emptyMsg="没有找到符合条件的数据"
				data-options="url:'${ctx}/activity/activityCard/list',fit:true, fitColumns:true, checkOnSelect:true, selectOnCheck:true, border: false">
			    <thead>
			        <tr>
			            <th data-options="field:'ck',checkbox:true"></th>
			            <th data-options="field:'id'">id</th>
			            <th data-options="field:'cardId'">card_id</th>
			            <th data-options="field:'activityId'">activity_id</th>
			            <th data-options="field:'isDelete'">是否删除；0未删除，1删除</th>
			            <th data-options="field:'creater'">创建人</th>
			            <th data-options="field:'createTime'">创建时间</th>
			            <th data-options="field:'modifier'">修改人</th>
			            <th data-options="field:'modifyTime'">修改时间</th>
			            <th data-options="field:'version'">版本</th>
			            <th data-options="field:'remarks'">备注</th>
			        </tr>
			    </thead>
			</table>
			<div id="Grid_Toolbar">
				<div class="pull-right">
					<shiro:hasPermission name="activityCard:create">
				        <a id="btnCreate" href="javascript:void(0)" class="easyui-linkbutton button-success"><i class="fa fa-plus-circle fa-lg"></i>&nbsp;&nbsp;新增</a>
					</shiro:hasPermission>
					
					<shiro:hasPermission name="activityCard:update">
				        <a id="btnUpdate" href="javascript:void(0)" class="easyui-linkbutton button-default"><i class="fa fa-pencil fa-lg"></i>&nbsp;&nbsp;修改</a>
					</shiro:hasPermission>
					
					<shiro:hasPermission name="activityCard:delete">
				        <a id="btnDelete" href="javascript:void(0)" class="easyui-linkbutton button-danger"><i class="fa fa-minus-circle fa-lg"></i>&nbsp;&nbsp;删除</a>
					</shiro:hasPermission>
					
					<shiro:hasPermission name="activityCard:query">
			        	<a id="btnSearch" href="javascript:void(0)" class="easyui-linkbutton button-primary"><i class="fa fa-search fa-lg"></i>&nbsp;&nbsp;查询</a>
			    	</shiro:hasPermission>
			    </div>
		    </div>
		</div>
	</div>
	
    <!-- js脚本，必须写在body中，tab的url加载模式只会异步加载body中的内容到tab中 -->
	<script type="text/javascript">
		require(['jquery','common'], function($){
			// 给新增按钮添加点击事件
			$("#btnCreate").on('click', function(){
				window.location.href = '${ctx}/activity/activityCard/add';
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
					window.location.href = '${ctx}/activity/activityCard/edit?id=' + selected[0].id;
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
	                            url: '${ctx}/activity/activityCard/delete',
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
		});
	</script>
</body>
</html>