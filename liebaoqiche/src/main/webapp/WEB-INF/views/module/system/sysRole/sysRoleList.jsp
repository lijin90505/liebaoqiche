<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
	<title>SysRole</title>
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
				data-options="url:'${ctx}/system/sysRole/list',fit:true, fitColumns:true, checkOnSelect:true, selectOnCheck:true, border: false, onDblClickRow :showDetail">
			    <thead>
			        <tr>
			            <th data-options="field:'ck',checkbox:true"></th>
			            <th data-options="field:'name'">角色名称</th>
			            <th data-options="field:'code'">角色代码</th>
			            <th data-options="field:'orderNo',align:'center'">显示顺序</th>
			            <th data-options="field:'remarks'" style="width:100px;" class="remarks">备注</th>
			            <th data-options="field:'isDeleteName',align:'center'">是否删除</th>
			            <th data-options="field:'isDelete',hidden:'true'"></th>
			            <th data-options="field:'operate',fixed:true,width:230,align:'center',formatter:formatOperate">操作</th>
			        </tr>
			    </thead>
			</table>
			<div id="Grid_Toolbar">
				<form id="searchForm" name="searchForm">
			    	<shiro:hasPermission name="sysRole:query">
			    		<input class="easyui-textbox" id="roleName" name="roleName"
			                 data-options="validType:['length[0,50]','special'],prompt:'角色名称'" style="width:160px"
			                iconWidth="0">
			            <input class="easyui-textbox" id="roleCode" name="roleCode"
			                 data-options="validType:['length[0,50]','special'],prompt:'角色代码'" style="width:160px"
			                iconWidth="0">
			            <input class="easyui-combobox" id="isDeletes" name="isDeletes" value='999'
	    							data-options="url:'${ctx}/enumData/isDelete',
										method:'post',
										valueField:'value',			
										textField:'label',
										panelHeight:'auto',
										editable:false" style="width:160px">
	                        	</input>
		           		<a id="btnSearch" href="javascript:void(0)" class="easyui-linkbutton button-primary"><i class="fa fa-search fa-lg"></i>&nbsp;&nbsp;查询</a>
		    		    <a id="btnReset" href="javascript:void(0)" class="easyui-linkbutton reset">
				    			<i class="fa fa-repeat fa-lg"></i>&nbsp;&nbsp;重置
			    			</a>
			    		
			    		</shiro:hasPermission>	
			    		
			    		<div class="pull-right">
							<shiro:hasPermission name="sysRole:create">
						        <a id="btnCreate" href="javascript:void(0)" class="easyui-linkbutton button-success"><i class="fa fa-plus-circle fa-lg"></i>&nbsp;&nbsp;新增</a>
							</shiro:hasPermission>
							
							<shiro:hasPermission name="sysRole:delete">
						        <a id="btnDelete" href="javascript:void(0)" class="easyui-linkbutton button-danger"><i class="fa fa-minus-circle fa-lg"></i>&nbsp;&nbsp;删除</a>
							</shiro:hasPermission>
				        </div>	
		    		</form>
		    </div>
		</div>
	</div>
	
    <!-- js脚本，必须写在body中，tab的url加载模式只会异步加载body中的内容到tab中 -->
	<script type="text/javascript">
		require(['jquery','common','easyui'], function($){
			// 给新增按钮添加点击事件
			$("#btnCreate").on('click', function(){
				showDialog('<i class="fa fa-plus-circle fa-lg"></i>&nbsp;&nbsp;添加角色', '${ctx}/system/sysRole/add', 800, 350, function(){
					reload();
					$('#ModuleTree_SysModule').tree('reload');
            	});
			});
			
			$("#isDeletes").combobox({
				onLoadSuccess:function(data){
					$("#isDeletes").combobox('setValue','999');
				}
			});
			// 给修改按钮添加点击事件
// 			$("#btnUpdate").on('click', function(){
// 				var selected = $("#Grid").datagrid('getSelections');
// 				if(selected.length == 0){
// 					$.messager.alert('提示','请选择需要修改的记录', "info");
// 				}
// 				if(selected.length > 1){
// 					$.messager.alert('提示','只能选择一条需要修改的记录', "info");
// 				}
// 				if(selected.length == 1){
// 					showDialog('<i class="fa fa-pencil fa-lg"></i>&nbsp;&nbsp;修改角色', '${ctx}/system/sysRole/edit?id=' + selected[0].id, 800, 350, function(){
// 	            		$('#Grid').datagrid('reload');
// 	            		$('#ModuleTree_SysModule').tree('reload');
// 	            	});
// 				}
// 			});
			
			// 给删除按钮添加点击事件
			$("#btnDelete").on('click', function(){
				var selected = $("#Grid").datagrid('getSelections');
				if(selected.length == 0){
					$.messager.alert('提示','请选择需要删除的记录', "info");
				}else{
                    $.messager.confirm('警告', '删除角色将删除相关用户的权限，确认是否删除选中的角色?', function (r) {
                        if(r){
                            var ids = '';
                            for (var i = 0; i < selected.length; i++) {
                            	if(selected[i].isDelete == 0){
                            		ids += selected[i].id + ',';
                            	}
                            }
                            if(ids != ''){
                            	$.ajax({
    	                            url: '${ctx}/system/sysRole/delete',
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
			
			// 给重置按钮添加点击事件
			$("#btnReset").on('click', function(){
				$('#roleName').textbox('setValue','');
				$('#roleCode').textbox('setValue','');
				$('#isDeletes').combobox('setValue','999');
				var params = new Object();
				$('#Grid').datagrid('options').queryParams = params;
				$('#Grid').datagrid('reload');
			});
			
			
			//授权按钮
// 	        $('#btnAccredit').click(function () {
// 	            var selected = $("#Grid").datagrid('getSelections');
// 	            if (selected.length == 0) {
// 	                $.messager.alert('提示', '请选择需要授权的角色', "info");
// 	                return;
// 	            }
// 	            if (selected.length > 1) {
// 	                $.messager.alert('提示', '只能选择一条需要修改的记录', "info");
// 	                return;
// 	            }
// 	            if(selected[0].isDelete== 1){
// 	            	$.messager.alert('提示', '已删除的角色无法进行授权', "info");
// 	                return;
// 	            }
	            
// 	            if (selected.length == 1) {
// 	            	// 加载角色授权信息
// 	            	showDialog('<i class="fa fa-wrench fa-lg"></i>&nbsp;&nbsp;授权', '${ctx}/system/sysRole/accreditPage?id=' + selected[0].id, 800, 600, function(){
// 	            		$('#Grid').datagrid('reload');
// 	            	});
// 	            }
// 	        });
			
		});
		
		function reload(){
			var params = $('#Grid').datagrid('options').queryParams;
			params.name = $('#roleName').val();
			params.code = $('#roleCode').val();
			params.isDeletes = $('#isDeletes').combobox('getValue');
//				if(params.isDelete == '999'){
//					params.isDelete = "";
//	        	}
			$('#Grid').datagrid('options').queryParams = params;
			$('#Grid').datagrid('reload');
		}
		
		function showDetail(rowIndex, rowData){
			commonDetail(rowData.id);
		}
		
		function commonDetail(id){
			showDialog('<i class="fa fa-eye fa-lg"></i>&nbsp;&nbsp;详情页面', '${ctx}/system/sysRole/view?id='+id,800,300);
		}
		
		function commonUpdate(id){
			showDialog('<i class="fa fa-pencil fa-lg"></i>&nbsp;&nbsp;修改角色', '${ctx}/system/sysRole/edit?id=' + id, 800, 350, function(){
        		$('#Grid').datagrid('reload');
        		$('#ModuleTree_SysModule').tree('reload');
        	});
		}
		
		function commonDelete(id){
			 $.messager.confirm('警告', '删除角色将删除相关用户的权限，确认是否删除选中的角色?', function (r) {
				 var selected = $("#Grid").datagrid('getSelections');
				 if(r){
					 if(selected[0].isDelete === 0){
						 $.ajax({
		                     url: '${ctx}/system/sysRole/delete',
		                     data: {
		                         ids: id
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
		
		function commonAccedit(id){
			// 加载角色授权信息
			var selected = $("#Grid").datagrid('getSelections');
			if(selected[0].isDelete === 1){
				$.messager.alert('提示', '已删除记录无法授权', "info");
			}else{
				showDialog('<i class="fa fa-wrench fa-lg"></i>&nbsp;&nbsp;授权', '${ctx}/system/sysRole/accreditPage?id=' + id, 800, 600, function(){
	        		$('#Grid').datagrid('reload');
	        	});
			}
		}
		
		function formatOperate(value,rowData,rowIndex){
			return '<a class="btn btn-default" href="#" onclick="commonDetail('+rowData.id+')"><i class="fa fa-eye fa-lg"></i> 查看详情</a>'
			+'<shiro:hasPermission name="sysRole:update">&nbsp;&nbsp;<a class="btn btn-default" href="javascript:void(0)" onclick="commonUpdate('+rowData.id+')"><i class="fa fa-pencil fa-lg"></i> 修改</a></shiro:hasPermission>'
			+'<shiro:hasPermission name="sysRole:delete">&nbsp;&nbsp;<a class="btn btn-default" href="javascript:void(0)" onclick="commonDelete('+rowData.id+')"><i class="fa fa-minus-circle fa-lg"></i> 删除</a></shiro:hasPermission>'
			+'<shiro:hasPermission name="sysRole:accedit">&nbsp;&nbsp;<a class="btn btn-default" href="javascript:void(0)" onclick="commonAccedit('+rowData.id+')"><i class="fa fa-wrench fa-lg"></i> 授权</a></shiro:hasPermission>';
		}
		
	</script>
</body>
</html>