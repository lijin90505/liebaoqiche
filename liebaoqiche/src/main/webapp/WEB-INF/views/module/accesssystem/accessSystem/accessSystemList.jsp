<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
	<title>AccessSystem</title>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<style>
		.switch{
			width:44px;
			height:22px;
			/* border:1px solid #264dbe; */
			border-radius:22px;
			overflow:hidden;
		}
		.switch>div{
			position:relative;
			width:100%;
			height:100%;
			background:#ccc;
		}
		.switch>div>b{
			position:absolute;
			top:1px;
			left:1px;
			diplay:block;
			width:20px;
			height:20px;
			background:#fff;
			border-radius:20px;
		}
		.switch.active>div{
			background:#264dbe;
		}
		.switch.active>div>b{
			left:23px;
		}
	</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/loading.jsp"%>
	<!-- 数据列表  -->
	<div class="easyui-layout" data-options="fit:true,border:false">
		<div data-options="region:'center'">
			<table id="Grid" class="easyui-datagrid" title="" ctrlSelect="true" striped="true"
				rownumbers="true" pagination="true" fitColumns="true" toolbar="#Grid_Toolbar"
				loadMsg="正在加载数据，请稍等..." emptyMsg="没有找到符合条件的数据"
				data-options="url:'${ctx}/accesssystem/accessSystem/list',fit:true, fitColumns:true, checkOnSelect:true, selectOnCheck:true, border: false,onDblClickRow:onDblClickRow">
			    <thead>
			        <tr>
			            <th data-options="field:'ck',checkbox:true"></th>
			            <th data-options="field:'id',hidden:true">id</th>
			            <th data-options="field:'name',width:100,hidden:true">系统名称</th>
				        <th data-options="field:'isDelete',hidden:true">是否删除；0未删除，1删除</th>
			            <th data-options="field:'identification',width:100">系统标识</th>
			            <th data-options="field:'isActivity',width:100">是否关联活动</th>
			            <th data-options="field:'isActivityDesc',hidden:true">是否关联活动</th>
			            <th data-options="field:'isChannel',width:100">是否关联支付渠道</th>
			            <th data-options="field:'isChannelDesc',hidden:true">是否关联支付渠道</th>
			            <th data-options="field:'isOpen',formatter:switchstate">开启状态</th>
			            <th data-options="field:'secret',hidden:true">密钥</th>
			        </tr>
			    </thead>
			</table>
			<div id="Grid_Toolbar">
				<form id="searchForm" name="searchForm">
					<input class="easyui-textbox" id="identification" name="identification" labelWidth="70" data-options="validType:'special',validType:'special',prompt:'系统标识'">
					<input class="easyui-combobox" style="width:120px;" id="isOpen" name="isOpen" labelWidth="50"
					       data-options="
											url:'${ctx}/enumData/lieBao/isOpen',
											textField:'label',
											panelHeight:'auto',
											editable:false,
											prompt:'状态'">
					<a id="btnSearch" href="javascript:void(0)" class="easyui-linkbutton button-primary"><i class="fa fa-search fa-lg"></i>&nbsp;&nbsp;查询</a>
					<a href="javascript:void(0)" class="easyui-linkbutton reset l-btn l-btn-small" plain="true" onclick="resetForm('searchForm')"><i class="fa fa-repeat fa-lg"></i>&nbsp;&nbsp;重置</a>
					<div class="pull-right">
						<shiro:hasPermission name="accessSystem:distributionActivity">
							<a id="btnDistributionActivity" href="javascript:void(0)" class="easyui-linkbutton button-success">
								<i class="fa fa-external-link fa-lg"></i>&nbsp;&nbsp;分配活动
							</a>
						</shiro:hasPermission>

						<shiro:hasPermission name="accessSystem:distributionChannel">
							<a id="btnDistributionChannel" href="javascript:void(0)" class="easyui-linkbutton button-default">
								<%--<i class="fa fa-search fa-lg">--%>
								<i class="fa fa-cc-visa fa-lg"></i>&nbsp;&nbsp;分配支付渠道</a>
						</shiro:hasPermission>

						<shiro:hasPermission name="accessSystem:create">
					        <a id="btnCreate" href="javascript:void(0)" class="easyui-linkbutton button-success"><i class="fa fa-plus-circle fa-lg"></i>&nbsp;&nbsp;新增</a>
						</shiro:hasPermission>

						<shiro:hasPermission name="accessSystem:update">
					        <a id="btnUpdate" href="javascript:void(0)" class="easyui-linkbutton button-default"><i class="fa fa-pencil fa-lg"></i>&nbsp;&nbsp;修改</a>
						</shiro:hasPermission>

						<shiro:hasPermission name="accessSystem:delete">
					        <a id="btnDelete" href="javascript:void(0)" class="easyui-linkbutton button-danger"><i class="fa fa-minus-circle fa-lg"></i>&nbsp;&nbsp;删除</a>
						</shiro:hasPermission>
						<shiro:hasPermission name="accessSystem:details">
							<a id="btnDetails" href="javascript:void(0)" class="easyui-linkbutton button-danger"><i class="fa fa-minus-circle fa-lg"></i>&nbsp;&nbsp;查看详情</a>
						</shiro:hasPermission>
				    </div>
				</form>
		    </div>
		</div>
	</div>
	
    <!-- js脚本，必须写在body中，tab的url加载模式只会异步加载body中的内容到tab中 -->
	<script type="text/javascript">
		require(['jquery','common'], function($){
			// 给分配活动按钮添加点击事件
			$("#btnDistributionActivity").on('click', function () {
				var selected = $("#Grid").datagrid('getSelections');
				if (selected.length == 0) {
					$.messager.alert('提示', '请选择需要分配活动的记录', "info");
				}
				var id = selected[0].identification;
				var isOpen = selected[0].isOpen;
				if("1"==isOpen) {
					$.messager.alert('提示', '接入系统未开启，不可关联', "info");
				}else {
					if (selected.length > 1) {
						$.messager.alert('提示', '只能选择一条需要分配权限的记录', "info");
					}
					if (selected.length == 1) {
						$.ajax({
							url: '${ctx}/accesssystem/accessSystem/allocation',
							data: {
								id: id
							},
							type: 'post',
							dataType: 'json',
							success: function (json) {
								if (json && json.rtnCode == '00000000') {
									showDialog('分配', '${ctx}/accesssystem/accessSystem/permissionActivity?id=' + selected[0].id, 800, 550, function () {
										$('#Grid').datagrid('reload');
									});
								} else {
									$.messager.alert('提示', '当前系统关联的活动已发布，不可以继续分配！', "info");
								}
							}
						});
						
					}
				}
			});

			// 给分配按钮添加点击事件
			$("#btnDistributionChannel").on('click', function(){
				var selected = $("#Grid").datagrid('getSelections');
				if (selected.length == 0) {
					$.messager.alert('提示', '请选择需要分配支付渠道的记录', "info");
				}
				var isOpen = selected[0].isOpen; 
				if("1"==isOpen) {
					$.messager.alert('提示', '接入系统未开启，不可关联', "info");
				}else {
					if (selected.length > 1) {
						$.messager.alert('提示', '只能选择一条需要分配权限的记录', "info");
					}
					if (selected.length == 1) {
						showDialog('分配', '${ctx}/accesssystem/accessSystem/permissionChannel?id=' + selected[0].id+'&name='+selected[0].name, 800, 550, function () {
							$('#Grid').datagrid('reload');
						});
					}
				}
			});


			// 给新增按钮添加点击事件
			$("#btnCreate").on('click', function(){
				showDialog('新增系统', '${ctx}/accesssystem/accessSystem/add', 800, 500, function () {
					$('#Grid').datagrid('reload');
				});
			});
			
			// 给修改按钮添加点击事件
			$("#btnUpdate").on('click', function(){
				var selected = $("#Grid").datagrid('getSelections');
				
				if(selected.length == 0){
					$.messager.alert('提示','请选择需要修改的记录', "info");
				}
				var isOpen = selected[0].isOpen;
				if("1"!=isOpen) {
					$.messager.alert('提示', '接入系统已开启，不可修改', "info");
				}else {
					if(selected.length > 1){
						$.messager.alert('提示','只能选择一条需要修改的记录', "info");
					}
					if(selected.length == 1){
						showDialog('编辑系统', '${ctx}/accesssystem/accessSystem/edit?id=' + selected[0].id, 800, 500, function () {
							$('#Grid').datagrid('reload');
						}); 
					}
				}
			});

			// 给详情按钮添加点击事件
			$("#btnDetails").on('click', function(){
				var selected = $("#Grid").datagrid('getSelections');
				if(selected.length == 0){
					$.messager.alert('提示','请选择查看的记录', "info");
				}else{
					showDialog('<i class="fa fa-eye fa-lg"></i>&nbsp;&nbsp;详情页面', '${ctx}/accesssystem/accessSystem/view?id=' + selected[0].id, 900, 600);
				}
			});
			
			// 给删除按钮添加点击事件
			$("#btnDelete").on('click', function(){
				var selected = $("#Grid").datagrid('getSelections');
				if(selected.length == 0){
					$.messager.alert('提示','请选择需要删除的记录', "info");
				}
				var isActivity = selected[0].isActivity;
				var isChannel = selected[0].isChannel;
				if("已关联"==isActivity && "已关联"==isChannel) {
					$.messager.alert('提示', '接入系统已关联活动和支付渠道，不可删除', "info");
				}else if("已关联"==isActivity) {
					$.messager.alert('提示', '接入系统已关联活动，不可删除', "info");
				}else if("已关联"==isChannel){
					$.messager.alert('提示', '接入系统已支付渠道，不可删除', "info");
				} else{
						$.messager.confirm('警告', '确认删除本条记录吗?', function (r) {
							if(r){
								var ids = '';
								for (var i = 0; i < selected.length; i++) {
									ids += selected[i].id + ',';
								}

								$.ajax({
									url: '${ctx}/accesssystem/accessSystem/delete',
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
			params.identification = $('#identification').val();
			params.isOpen = $('#isOpen').val();
			$('#Grid').datagrid('options').queryParams = params;
			$('#Grid').datagrid('reload');
		}

		function onDblClickRow (index, row) {
			showDialog('<i class="fa fa-eye fa-lg"></i>&nbsp;&nbsp;详情页面', '/admin/accesssystem/accessSystem/view?id=' + row.id, 800, 500);
		}
		
		function switchstate(value,rowData,rowIndex){
			var operate = '';
			if(value == "0"){ // 0 开启
				operate = '<div class="switch active" id='+rowData.id+' onclick="switchClick(\''+value+'\',\''+rowData.id+'\',\''+rowIndex+'\',this)"><div><b></b></div></div>';
			}else{ // 1 关闭
				operate = '<div class="switch" id='+rowData.id+' onclick="switchClick(\''+value+'\',\''+rowData.id+'\',\''+rowIndex+'\',this)"><div><b></b></div></div>';
			}
			return operate;
		}
		
		function switchClick(value,id,index,e){
			var selected = $("#Grid").datagrid('getSelections');
			var isActivity = selected[0].isActivity;
			var isChannel = selected[0].isChannel;
			if("已关联"==isActivity || "已关联"==isChannel) {
				$.messager.alert('提示', '当前系统已经关联活动或支付渠道，不可以关闭！', "info");
			}else{
				var msg = (value=="0"?"关闭":"开启");
				$.messager.confirm('警告', '您确定'+msg+'吗?', function (r) {
				if(r) {
					value=(value=="0"?"1":"0");
					$.post('${ctx}/accesssystem/accessSystem/updateIsOpen',{id:id,isOpen:value},function(data){
						if(data.rtnCode == '00000000'){//修改成功
							$("#Grid").datagrid("updateRow",{  
                                index:index, //行索引  
                                row:{  
                                    isOpen:value //行中的某个字段  
                                }  
                            });  
							if(value == "0"){
								$("#"+id).addClass("active");
							}else{
								$("#"+id).removeClass("active");
							}
						}else{
							$.messager.alert('提示','该系统关联的活动已发布,不可以关闭！', "info");
						}
					});
				}
			});
			}
		}
	</script>
</body>
</html>