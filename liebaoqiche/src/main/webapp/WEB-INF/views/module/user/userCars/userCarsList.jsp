<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
	<title>用户汽车管理</title>
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
				data-options="url:'${ctx}/user/userCars/list',fit:true, fitColumns:true, checkOnSelect:true, selectOnCheck:true, border: false">
			    <thead>
			        <tr>
			            <th data-options="field:'ck',checkbox:true"></th>
			            <th data-options="field:'id',hidden:true">主键</th>
			            <th data-options="field:'username'">用户名称</th>
			            <th data-options="field:'model'">汽车型号</th>
			            <th data-options="field:'type',formatter: function(value,row,index){
							if (row.type =='01'){
								return '小型车';
												} else if(row.type =='02'){
													return '中型车';
												}
												else if(row.type =='03'){
											return 'SUV';
										}
									}">汽车类型</th>
			            <th data-options="field:'simNo'">车载SIM卡号</th>
			            <th data-options="field:'iccid'">ICCID</th>
			            <th data-options="field:'engineNo'">发动机编号</th>
			            <th data-options="field:'vinCode'">车辆识别码（车架号码）</th>
			            <th data-options="field:'licensePlate'">汽车牌照</th>
			            <th data-options="field:'prodDate'">生产日期</th>
			            <th data-options="field:'color'">颜色</th>
			            <th data-options="field:'createTime'">创建时间</th>
			            <th data-options="field:'createBy'">创建人</th>
			            <th data-options="field:'updateBy'">修改人</th>
			            <th data-options="field:'updateDate'">修改时间</th>
			        </tr>
			    </thead>
			</table>
			<div id="Grid_Toolbar">
			<form id="searchForm" name="searchForm">
				<div class="pull-left">
					<%-- <shiro:hasPermission name="userCars:query"> --%>
						<input class="easyui-textbox" id="username" name="username" data-options="prompt:'用户名'" size="20">
						<input class="easyui-textbox" id="vinCode" name="vinCode" data-options="prompt:'车辆识别码'" size="20">
						<input class="easyui-textbox" id="licensePlate" name="licensePlate" data-options="prompt:'汽车牌照'" size="20">
			        	<input class="easyui-datebox" id="prodDate" editable="false" name="prodDate" data-options="prompt:'生产日期'" size="17">
			        	<a id="btnSearch" href="javascript:void(0)" class="easyui-linkbutton button-primary"><i class="fa fa-search fa-lg"></i>&nbsp;&nbsp;查询</a>
			    		<a href="javascript:void(0)" class="easyui-linkbutton reset l-btn l-btn-small" plain="true" onclick="resetForm('searchForm')"><i class="fa fa-repeat fa-lg"></i>&nbsp;&nbsp;重置</a>
			    	<%-- </shiro:hasPermission> --%>
			    </div>
			    <div class="pull-right">
					<shiro:hasPermission name="userCars:create">
				        <a id="btnCreate" href="javascript:void(0)" class="easyui-linkbutton button-success"><i class="fa fa-plus-circle fa-lg"></i>&nbsp;&nbsp;新增</a>
					</shiro:hasPermission>
			    	<shiro:hasPermission name="userCars:update">
				        <a id="btnUpdate" href="javascript:void(0)" class="easyui-linkbutton button-default"><i class="fa fa-pencil fa-lg"></i>&nbsp;&nbsp;修改</a>
					</shiro:hasPermission>
					
					<shiro:hasPermission name="userCars:delete">
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
			$("#btnCreate").on('click', function () {
				showDialog('新增用户汽车', '${ctx}/user/userCars/add', 800, 500, function () {
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
					showDialog('编辑用户', '${ctx}/user/userCars/edit?id=' + selected[0].id, 800, 500, function () {
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
	                            url: '${ctx}/user/userCars/delete',
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
			params.username = $('#username').val().trim();
			params.vinCode = $('#vinCode').val().trim();
			params.licensePlate = $('#licensePlate').val().trim();
			params.prodDate = $('#prodDate').val();
			$('#Grid').datagrid('options').queryParams = params;
			$('#Grid').datagrid('reload');
		};
		
		/**
		 * Easyui重置表单
		 * @param formId
		 */
		function resetForm(formId){
			$('#searchForm').form('reset');
			reload();
		};
	</script>
</body>
</html>