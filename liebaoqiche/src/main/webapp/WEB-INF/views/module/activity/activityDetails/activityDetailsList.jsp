<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
	<title>ActivityDetails</title>
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
				data-options="url:'${ctx}/activity/activityDetails/list',fit:true, fitColumns:true, checkOnSelect:true, selectOnCheck:true, border: false,
					onDblClickRow:onDblClickRow">
			    <thead>
			        <tr>
			            <th data-options="field:'ck',checkbox:true"></th>
			            <th data-options="field:'id',hidden:true,width:100">id</th>
			            <th data-options="field:'activityName',width:100">活动名称</th>
			            <th data-options="field:'activityContent',width:100">活动内容</th>
			            <th data-options="field:'startTime',width:100">生效日期</th>
			            <th data-options="field:'endTime',width:100">截止日期</th>
			            <th data-options="field:'state',width:100 ,formatter:switchstate">状态</th>
			            <th data-options="field:'isDeleteDesc',hidden:true,width:100">是否删除</th>
			            <th data-options="field:'isDelete',hidden:true,width:100">是否删除；0未删除，1删除</th>
<!-- 			        	<th data-options="field:'operate',fixed:true,width:230,align:'center',formatter:formatOperate">操作</th> -->
			        </tr>
			    </thead>
			</table>
			<div id="Grid_Toolbar">
				<form id="searchForm" name="searchForm">
					<input class="easyui-textbox" style="width:110px;" id="activityName" name="activityName" labelWidth="70" data-options="validType:'special',validType:'special',prompt:'活动名称'">
					<input class="easyui-textbox" style="width:120px;" id="activityContent" name="activityContent" labelWidth="70" data-options="validType:'special',validType:'special',prompt:'活动内容'">
					<input class="easyui-combobox" style="width:120px;" id="state" name="state" labelWidth="50"
					       data-options="
											url:'${ctx}/enumData/lieBao/enumsActivityDetailsSatus',
											textField:'label',
											panelHeight:'auto',
											editable:false,
											prompt:'状态'">
<!-- 					<input class="easyui-combobox" style="width:120px;" id="isDelete" name="isDelete" value="" labelWidth="50" -->
<%-- 					       data-options="url:'${ctx}/enumData/lieBao/isDelete', --%>
<!-- 										method:'post', -->
<!-- 										onLoadSuccess:function(data){ -->
<!-- 											if($('#id').val() == '') -->
<!-- 											$('#isDelete').combobox('setValue',0); -->
<!-- 										}, -->
<!-- 										value:'0', -->
<!-- 										textField:'label', -->
<!-- 										panelHeight:'auto', -->
<!-- 										editable:false, -->
<%-- 										prompt:'是否删除'"> --%>
					<a id="btnSearch" href="javascript:void(0)" class="easyui-linkbutton button-primary"><i class="fa fa-search fa-lg"></i>&nbsp;&nbsp;查询</a>
					<a href="javascript:void(0)" class="easyui-linkbutton reset l-btn l-btn-small" plain="true" onclick="resetForm('searchForm')"><i class="fa fa-repeat fa-lg"></i>&nbsp;&nbsp;重置</a>
					<div class="pull-right">
						<shiro:hasPermission name="activity:relevanceIntegral">
							<a id="btnRelevanceIntegral" href="javascript:void(0)" class="easyui-linkbutton button-success">
								<i class="fa fa-check-circle-o fa-lg"></i>&nbsp;&nbsp;关联积分
							</a>
						</shiro:hasPermission>

						<shiro:hasPermission name="activityDetails:relevanceCard">
							<a id="btnRelevanceCard" href="javascript:void(0)" class="easyui-linkbutton button-default">
								<i class="fa fa-check-circle-o fa-lg"></i>&nbsp;&nbsp;关联卡券
							</a>
						</shiro:hasPermission>

						<shiro:hasPermission name="activityDetails:relevanceExperience">
							<a id="btnRelevanceExperience" href="javascript:void(0)" class="easyui-linkbutton button-danger">
								<i class="fa fa-check-circle-o fa-lg"></i>&nbsp;&nbsp;关联经验值
							</a>
						</shiro:hasPermission>

						<shiro:hasPermission name="activityDetails:create">
					        <a id="btnCreate" href="javascript:void(0)" class="easyui-linkbutton button-success"><i class="fa fa-plus-circle fa-lg"></i>&nbsp;&nbsp;新增</a>
						</shiro:hasPermission>

						<shiro:hasPermission name="activityDetails:update">
					        <a id="btnUpdate" href="javascript:void(0)" class="easyui-linkbutton button-default"><i class="fa fa-pencil fa-lg"></i>&nbsp;&nbsp;修改</a>
						</shiro:hasPermission>

						<shiro:hasPermission name="activityDetails:delete">
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
				var selected = $("#Grid").datagrid('getSelections');
				showDialog('新增', '${ctx}/activity/activityDetails/add', 800, 500, function () {
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
					var state = selected[0].state;
					if ("0" == state){
						$.messager.alert('提示','活动已开启，不可进行活动变更', "info");
					}else{
						showDialog('编辑', '${ctx}/activity/activityDetails/edit?id=' + selected[0].id, 800, 500, function () {
							$('#Grid').datagrid('reload');
						});
					}
				}
			});

			//给关联积分按钮添加点击事件
			$("#btnRelevanceIntegral").on('click', function () {
				var selected = $("#Grid").datagrid('getSelections');
				if (selected.length == 0) {
					$.messager.alert('提示', '请选择需要关联的记录', "info");
				}
				if (selected.length > 1) {
					$.messager.alert('提示', '只能选择一条需要关联的记录', "info");
				}
				if (selected.length == 1) {
					var state = selected[0].state;
					if ("1" == state){
						$.messager.alert('提示','活动内容未开启，不可进行活动关联', "info");
					}else{
						$.ajax({
		                    url: '${ctx}/activity/activityDetails/checkAccredit',
		                    data: {
		                        id: selected[0].id
		                    },
		                    type: 'post',
		                    dataType: 'json',
		                    success: function (json) {
		                    	 if (json && json.rtnMsg == "true") {
	                                    $.messager.alert('提示', "活动已发布不可进行关联操作！！！", "info");	                                   
	                                } else {	                                	
	                                	showDialog('关联积分', '${ctx}/activity/activityDetails/integral?id=' + selected[0].id, 800, 550, function () {
	            							$('#Grid').datagrid('reload');
	            						});	                                  
	                                }
		                    }
		            	});
					}
				}
			});

			//给关联卡券
			$("#btnRelevanceCard").on('click', function () {
				var selected = $("#Grid").datagrid('getSelections');
				if (selected.length == 0) {
					$.messager.alert('提示', '请选择需要关联的记录', "info");
				}
				if (selected.length > 1) {
					$.messager.alert('提示', '只能选择一条需要关联的记录', "info");
				}
				if (selected.length == 1) {
					var state = selected[0].state;
					if ("1" == state){
						$.messager.alert('提示','活动内容未开启，不可进行活动关联', "info");
					}else{						
						$.ajax({
		                    url: '${ctx}/activity/activityDetails/checkAccredit',
		                    data: {
		                        id: selected[0].id
		                    },
		                    type: 'post',
		                    dataType: 'json',
		                    success: function (json) {
		                    	 if (json && json.rtnMsg == "true") {
	                                    $.messager.alert('提示', "活动已发布不可进行关联操作！！！", "info");	                                   
	                                } else {	                                	
	                                	showDialog('关联卡券', '${ctx}/activity/activityDetails/card?id=' + selected[0].id, 800, 550, function () {
	            							$('#Grid').datagrid('reload');
	            						});	                                  
	                                }
		                    }
		            	});
		
					}
				}
			});

			//给关联经验值
			$("#btnRelevanceExperience").on('click', function () {
				var selected = $("#Grid").datagrid('getSelections');
				if (selected.length == 0) {
					$.messager.alert('提示', '请选择需要关联的记录', "info");
				}
				if (selected.length > 1) {
					$.messager.alert('提示', '只能选择一条需要关联的记录', "info");
				}
				if (selected.length == 1) {
					var state = selected[0].state;
					if ("1" == state){
						$.messager.alert('提示','活动内容未开启，不可进行活动关联', "info");
					}else{
						
						$.ajax({
		                    url: '${ctx}/activity/activityDetails/checkAccredit',
		                    data: {
		                        id: selected[0].id
		                    },
		                    type: 'post',
		                    dataType: 'json',
		                    success: function (json) {
		                    	 if (json && json.rtnMsg == "true") {
	                                    $.messager.alert('提示', "活动已发布不可进行关联操作！！！", "info");	                                   
	                                } else {	                                	
	                                	showDialog('关联经验值', '${ctx}/activity/activityDetails/experience?id=' + selected[0].id, 800, 550, function () {
	            							$('#Grid').datagrid('reload');
	            						});	                                  
	                                }
		                    }
		            	});
					}
				}
			});
			
			// 给删除按钮添加点击事件
			$("#btnDelete").on('click', function(){
				var selected = $("#Grid").datagrid('getSelections');
				if(selected.length == 0){
					$.messager.alert('提示','请选择需要删除的记录', "info");
				}else if (selected.length > 0){
					var state = selected[0].state;
					if ("0" == state){
						$.messager.alert('提示','活动已开启，不可进行活动变更', "info");
					}else{
	                    $.messager.confirm('警告', '确认删除本条记录吗?', function (r) {
	                        if(r){
	                            var ids = '';
	                            for (var i = 0; i < selected.length; i++) {
	                                ids += selected[i].id + ',';
	                            }
	                            
	                            $.ajax({
		                            url: '${ctx}/activity/activityDetails/delete',
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
			params.activityName = $('#activityName').val();
			params.activityContent = $('#activityContent').val();
			params.state = $('#state').val();
			params.isDelete = $('#isDelete').val();
			$('#Grid').datagrid('options').queryParams = params;
			$('#Grid').datagrid('reload');
		}
		function onDblClickRow (index, row) {
			showDialog('<i class="fa fa-eye fa-lg"></i>&nbsp;&nbsp;详情页面', '/admin/activity/activityDetails/view?id=' + row.id, 800, 500);
		}
		
// 		function switchstate(value,rowData,rowIndex){
// 			console.log(rowData);
// 			var operate = '';
// 			if (value == "已关联"||value == "已发布") {
// 				if(value == "已关联"){ // 
// 					operate = '<div class="switch" id='+rowData.id+' onclick="switchClick(\''+value+'\',\''+rowData.id+'\',\''+rowIndex+'\',this)"><div><b></b></div></div>';
// 				}else if(value == "已发布"){ // 
// 					operate = '<div class="switch active" id='+rowData.id+' onclick="switchClick(\''+value+'\',\''+rowData.id+'\',\''+rowIndex+'\',this)"><div><b></b></div></div>';
// 				}
// 				return operate;
// 			}else {
// 				operate =rowData.state;
// 				return operate;
// 			}
			
// 		}
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
				var msg = (value=="0"?"关闭":"开启");
				$.messager.confirm('警告', '您确定'+msg+'吗?', function (r) {
				if(r) {
					value=(value=="0"?"1":"0");
					$.post('${ctx}/activity/activityDetails/updateIsPublish',{id:id,state:value},function(data){
						if(data.rtnCode == '00000000'){//修改成功
							$("#Grid").datagrid("updateRow",{  
                                index:index, //行索引  
                                row:{  
                                	state:value //行中的某个字段  
                                }  
                            });  
							if(value == "0"){
								$("#"+id).addClass("active");
							}else{
								$("#"+id).removeClass("active");
							}
						}else{						
							$.messager.alert('提示',data.rtnMsg, "info");
						}
					});
				}
			});
		}
		
		// 操作列
		function formatOperate(value,rowData,rowIndex){
			return '<a class="btn btn-default" href="#"><i class="fa fa-eye fa-lg"></i> 查看详情 &nbsp;&nbsp;</a>'
			+'<a class="btn btn-default" href="javascript:void(0)"><i class="fa fa-pencil fa-lg"></i> 修改 &nbsp;&nbsp;</a>'
			+'<a class="btn btn-default" href="javascript:void(0)"><i class="fa fa-minus-circle fa-lg"></i> 删除 &nbsp;&nbsp;</a>'
		}
	</script>
</body>
</html>