<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
	<title>SysResources</title>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
</head>

<body>
	<%@ include file="/WEB-INF/views/include/loading.jsp"%>
	
	<!-- 数据列表  -->
	<div class="easyui-layout" data-options="fit:true,border:false">
		<div data-options="region:'west', collapsible:false" title="系统模块" style="width: 200px;">
	        <ul id="ModuleTree_SysResources" class="easyui-tree" url="${ctx}/system/sysModule/moduleTree">
	
	        </ul>
	    </div>
		<div data-options="region:'center'">
			<table id="Grid" class="easyui-datagrid" title="" ctrlSelect="true" striped="true"
				rownumbers="true" pagination="true" fitColumns="true" toolbar="#Grid_Toolbar"
				loadMsg="正在加载数据，请稍等..." emptyMsg="没有找到符合条件的数据"
				data-options="url:'${ctx}/system/sysResources/list',fit:true, fitColumns:true, checkOnSelect:true, selectOnCheck:true, border: false, onDblClickRow :showDetail">
			    <thead>
			        <tr>
			            <th data-options="field:'ck',checkbox:true"></th>
			            <th data-options="field:'name'">资源名称</th>
			            <th data-options="field:'code'">资源代码</th>
			            <th data-options="field:'orderNo',align:'center'">显示顺序</th>
			            <th data-options="field:'remarks'" style="width:100px;" class="remarks">备注</th>
			            <th data-options="field:'isDeleteName',align:'center'">是否删除</th>
			            <th data-options="field:'operate',fixed:true,width:80,align:'center',formatter:formatOperate">操作</th>
			        </tr>
			    </thead>
			</table>
			<div id="Grid_Toolbar">
	        		<form id="searchForm" name="searchForm">
	        			<shiro:hasPermission name="sysResources:query">
	        			
		        		<input class="easyui-textbox" id="resourcesName" name="resourcesName"
			                data-options="validType:['length[0,50]','special'],prompt:'资源名称'" style="width:160px"
			                iconWidth="0">
			            <input class="easyui-textbox" id="resourcesCode" name="resourcesCode"
			                data-options="validType:['length[0,50]','special'],prompt:'资源代码'" style="width:160px"
			                iconWidth="0">
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
										editable:false" style="width:160px">
	                    </input>
			            <a id="btnSearch" href="javascript:void(0)" class="easyui-linkbutton button-primary"><i class="fa fa-search fa-lg"></i>&nbsp;&nbsp;查询</a>
		    			
		    			</shiro:hasPermission>
		    			
		    			<div class="pull-right">
				
							<a id="btnReturn" href="javascript:void(0)" class="easyui-linkbutton reset"><i class="fa fa-repeat fa-lg"></i>&nbsp;&nbsp;返回顶级分类</a>
							
							<shiro:hasPermission name="sysResources:create">
						        <a id="btnCreate" href="javascript:void(0)" class="easyui-linkbutton button-success"><i class="fa fa-plus-circle fa-lg"></i>&nbsp;&nbsp;新增</a>
							</shiro:hasPermission>
							
							<shiro:hasPermission name="sysResources:update">
						        <a id="btnUpdate" href="javascript:void(0)" class="easyui-linkbutton button-default"><i class="fa fa-pencil fa-lg"></i>&nbsp;&nbsp;修改</a>
							</shiro:hasPermission>
							
							<shiro:hasPermission name="sysResources:delete">
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
				var selectedNode = $("#ModuleTree_SysResources").tree("getSelected");
	            if (selectedNode && selectedNode.parent) {
	            	showDialog('<i class="fa fa-save fa-lg"></i>&nbsp;&nbsp;添加权限', '${ctx}/system/sysResources/add?moduleId='+selectedNode.id, 800, 350, function(){
	            		reload();
	            		$('#ModuleTree_SysModule').tree('reload');
	            	});
	            } else {
	                $.messager.alert('提示', "请先选择模块", "info");
	            }
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
					showDialog('<i class="fa fa-pencil fa-lg"></i>&nbsp;&nbsp;修改权限', '${ctx}/system/sysResources/edit?id=' + selected[0].id, 800, 400, function(){
						reload();
						$('#ModuleTree_SysModule').tree('reload');
	            	});
				}
			});
			
			// 给删除按钮添加点击事件
			$("#btnDelete").on('click', function(){
				var selected = $("#Grid").datagrid('getSelections');
				if(selected.length == 0){
					$.messager.alert('提示','请选择需要删除的记录', "info");
				}else{
                    $.messager.confirm('警告', '确认删除选中的记录吗?', function (r) {
                        if(r){
                            var ids = '';
                            for (var i = 0; i < selected.length; i++) {
                            	if(selected[i].isDelete == 0){
                            		ids += selected[i].id + ',';
                            	}
                            }
                            if(ids != ''){
	                            $.ajax({
		                            url: '${ctx}/system/sysResources/delete',
		                            data: {
		                                ids: ids
		                            },
		                            type: 'post',
		                            dataType: 'json',
		                            success: function (json) {
		                                if (json && json.rtnCode == '00000000') {
		                                    $.messager.alert('提示', "删除成功", "success",function(){
		                                    	reload();
		                                    });
		                                } else {
		                                    $.messager.alert('提示', json.rtnMsg);
		                                }
		                            }
	                        	});
                            }else{
                            	$.messager.alert('提示','已删除的记录不可再进行删除', "info");
                            }
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
			
			// 给返回顶级按钮添加点击事件
			$("#btnReturn").on('click', function(){
				window.location.href = "${ctx}/system/sysResources/"
			});
			
			//点击树重新加载表格
	        $('#ModuleTree_SysResources').tree({
	        	
	            onSelect: function (node) {
	            	$("#searchForm").form('reset');
	                $('#Grid').datagrid({
	                    url: '${ctx}/system/sysResources/list',
	                    queryParams: {
	                        moduleId: node.id
	                    }
	                });
	            }
	        });
		});
		
		function reload(){
			var params = $('#Grid').datagrid('options').queryParams;
			params.name = $('#resourcesName').val();
			params.code = $('#resourcesCode').val();
			params.isDelete = $('#isDelete').val();
			$('#Grid').datagrid('options').queryParams = params;
			$('#Grid').datagrid('reload');
		}
		
		function showDetail(rowIndex, rowData){
			commonDetail(rowData.id);
		}
		
		function commonDetail(id){
			showDialog('<i class="fa fa-eye fa-lg"></i>&nbsp;&nbsp;详情页面', '${ctx}/system/sysResources/view?id='+id,800,300);
		}
		
		function formatOperate(value,rowData,rowIndex){
			return '<a class="btn btn-default" href="#" onclick="commonDetail('+rowData.id+')"><i class="fa fa-eye fa-lg"></i> 查看详情</a>';
		}
	</script>
</body>
</html>