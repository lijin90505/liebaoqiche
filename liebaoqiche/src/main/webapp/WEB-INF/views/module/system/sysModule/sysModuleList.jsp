<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
	<title>SysModule</title>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/loading.jsp"%>
	<!-- 数据列表  -->
	<div class="easyui-layout" data-options="fit:true,border:false">
		<div data-options="region:'west', collapsible:false" title="系统模块" style="width: 200px;">
	        <ul id="ModuleTree_SysModule" class="easyui-tree" url="${ctx}/system/sysModule/moduleTree">
	
	        </ul>
	    </div>
		<div data-options="region:'center'">
			<table id="Grid" class="easyui-datagrid" title="" ctrlSelect="true" striped="true"
				rownumbers="true" pagination="true" fitColumns="true" toolbar="#Grid_Toolbar"
				loadMsg="正在加载数据，请稍等..." emptyMsg="没有找到符合条件的数据"
				data-options="url:'${ctx}/system/sysModule/list',fit:true, fitColumns:true, checkOnSelect:true, selectOnCheck:true, border: false, onDblClickRow :showDetail">
			    <thead frozen="true">
			    	<tr>
				    	<th data-options="field:'ck',checkbox:true"></th>
			            <th data-options="field:'name',fixed:true,width:100">模块名称</th>
			            <th data-options="field:'path',fixed:true,width:200">模块地址</th>
			            <th data-options="field:'icon',formatter:formatIcon,align:'center'">模块图标</th>
			    	</tr>
		    	</thead>
			    <thead>
			        <tr>
			            <th data-options="field:'code',fixed:true,width:200">模块代码</th>
			            <th data-options="field:'orderNo',align:'center'">显示顺序</th>
			            <th data-options="field:'remarks'" style="width:100px;" class="remarks">备注</th>
			            <th data-options="field:'isDeleteName',align:'center'">是否删除</th>
			            <th data-options="field:'operate',fixed:true,width:80,align:'center',formatter:formatOperate">操作</th>
			        </tr>
			    </thead>
			</table>
			<div id="Grid_Toolbar">
					<form id="searchForm" name="searchForm">
						<shiro:hasPermission name="sysModule:query">
		        		<input class="easyui-textbox" id="moduleName"
			                data-options="validType:['length[0,50]','special'],prompt:'模块名称'" style="width:160px"
			                iconWidth="0">
			            <input class="easyui-textbox" id="moduleCode"
			                data-options="validType:['length[0,50]','special'],prompt:'模块代码'" style="width:160px"
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
							
							<shiro:hasPermission name="sysModule:create">
						        <a id="btnCreate" href="javascript:void(0)" class="easyui-linkbutton button-success"><i class="fa fa-plus-circle fa-lg"></i>&nbsp;&nbsp;新增</a>
							</shiro:hasPermission>
							
							<shiro:hasPermission name="sysModule:update">
						        <a id="btnUpdate" href="javascript:void(0)" class="easyui-linkbutton button-default"><i class="fa fa-pencil fa-lg"></i>&nbsp;&nbsp;修改</a>
							</shiro:hasPermission>
							
							<shiro:hasPermission name="sysModule:delete">
						        <a id="btnDelete" href="javascript:void(0)" class="easyui-linkbutton button-danger"><i class="fa fa-minus-circle fa-lg"></i>&nbsp;&nbsp;删除</a>
							</shiro:hasPermission>
						</div>
		    		
		    		</form>
		    	
		    </div>
		</div>
	</div>
	
    <!-- js脚本，必须写在body中，tab的url加载模式只会异步加载body中的内容到tab中 -->
	<script type="text/javascript">
		function getParents(node,pids){
			if(node){
				var parent = $("#ModuleTree_SysModule").tree('getParent',node.target);
				if(parent && parent.id){
					pids += parent.id + ',';
					getParents(parent,pids);
				}
			}
			return pids;
		}
	
		require(['jquery','common'], function($){
			// 给新增按钮添加点击事件
			$("#btnCreate").on('click', function(){
				var selectedNode = $("#ModuleTree_SysModule").tree("getSelected");
                var id = ''; //当前选中节点
                var pids = ''; //所有的父节点(包含当前选中的节点) 格式: ,1,2,3,15,151,  方便与模糊查询使用 like '%,n,%'
				if (selectedNode) {
					id = selectedNode.id;
					pids = getParents(selectedNode,',' + id + ',');
                }
				showDialog('<i class="fa fa-save fa-lg"></i>&nbsp;&nbsp;添加菜单', '${ctx}/system/sysModule/add?parent='+id+'&parentKey='+pids, 800, 450, function(){
					reload();
					if(pids == ''||pids == null) {
						$('#ModuleTree_SysModule').tree('reload');
					}
					
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
					showDialog('<i class="fa fa-pencil fa-lg"></i>&nbsp;&nbsp;修改菜单', '${ctx}/system/sysModule/edit?id=' + selected[0].id, 800, 450, function(){
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
		                            url: '${ctx}/system/sysModule/delete',
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
			
			//点击树重新加载表格
	        $('#ModuleTree_SysModule').tree({
	        	onBeforeSelect: function (node) {
	                if (node.path) {
	                    return false;
	                } else {
	                    return true;
	                }
	            },
	            onSelect: function (node) {
	            	$("#searchForm").form('reset');
	                $('#Grid').datagrid({
	                    url: '${ctx}/system/sysModule/list',
	                    queryParams: {
	                    	parentKey: ',' + node.id + ','
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
				window.location.href = "${ctx}/system/sysModule/"
			});
			
		});
		
		function reload(){
			var params = $('#Grid').datagrid('options').queryParams;
			params.name = $('#moduleName').val();
			params.code = $('#moduleCode').val();
			params.isDelete = $('#isDelete').val();
			$('#Grid').datagrid('options').queryParams = params;
			$('#Grid').datagrid('reload');
		}
		
		function showDetail(rowIndex, rowData){
			commonDetail(rowData.id);
		}
		
		function commonDetail(id){
			showDialog('<i class="fa fa-eye fa-lg"></i>&nbsp;&nbsp;详情页面', '${ctx}/system/sysModule/view?id='+id,800,300);
		}
		
		function formatOperate(value,rowData,rowIndex){
			return '<a class="btn btn-default" href="#" onclick="commonDetail('+rowData.id+')"><i class="fa fa-eye fa-lg"></i> 查看详情</a>';
		}
		
		function formatIcon(value,rowData,rowIndex){
			return '<i class="fa '+value+' fa-lg"></i>';
		}
	</script>
</body>
</html>