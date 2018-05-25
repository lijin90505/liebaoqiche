<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
	<title>SysDictionary</title>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/loading.jsp"%>
	<!-- 数据列表  -->
	<div class="easyui-layout" data-options="fit:true,border:false">
		<div data-options="region:'west', collapsible:false" title="字典模块" style="width: 200px;">
	        <ul id="DictionaryTree_SysDictionary" class="easyui-tree" url="${ctx}/system/sysDictionary/dictionaryTree">
	        </ul>
	    </div>
		<div data-options="region:'center'">
			<table id="Grid" class="easyui-datagrid" title="" ctrlSelect="true" striped="true"
				rownumbers="true" pagination="true" fitColumns="true" toolbar="#Grid_Toolbar"
				loadMsg="正在加载数据，请稍等..." emptyMsg="没有找到符合条件的数据"
				data-options="url:'${ctx}/system/sysDictionary/list',fit:true, fitColumns:true, checkOnSelect:true, selectOnCheck:true, border: false, onDblClickRow :showDetail">
			    <thead>
			        <tr>
			            <th data-options="field:'ck',checkbox:true"></th>
			            <th data-options="field:'name'">字典名称</th>
			            <th data-options="field:'code'">字典代码</th>
			            <th data-options="field:'type'">字典分类</th>
			            <th data-options="field:'parent'">父节点</th>
			            <th data-options="field:'orderNo'">排序号</th>
			            <th data-options="field:'remarks',align:'center'" style="width:100px;" class="remarks">备注</th>
			            <th data-options="field:'isDeleteName'">是否删除</th>
			            <th data-options="field:'operate',fixed:true,width:80,align:'center',formatter:formatOperate">操作</th>
			        </tr>
			    </thead>
			</table>
			<div id="Grid_Toolbar">
				<form id="searchForm" name="searchForm">
					<shiro:hasPermission name="sysDictionary:query" >
	        		<input class="easyui-textbox" id="name"
		                 data-options="validType:['special','length[0,50]'],prompt:'字典名称'" style="width:160px"
		                iconWidth="0"/>
		            <input class="easyui-textbox" id="code"
		                 data-options="validType:['special','length[0,50]'],prompt:'字典代码'" style="width:160px"
		                iconWidth="0"/>
		            <input class="easyui-textbox" id="type"
		                 data-options="validType:['special','length[0,50]'],prompt:'字典分类'" style="width:160px"
		                iconWidth="0"/>
		                 <input class="easyui-combobox" id="isDeletes" name="isDeletes" value="999"
	    							data-options="url:'${ctx}/enumData/isDelete',
										method:'post',
										onLoadSuccess:function(data){ 
											$('#isDelete').combobox('setValue','999');
										},		
										valueField:'value',		
										textField:'label',
										panelHeight:'auto',
										editable:false" style="width:160px">
	                        	</input>
			            <a id="btnSearch" href="javascript:void(0)" class="easyui-linkbutton button-primary">
			           	 	<i class="fa fa-search fa-lg"></i>&nbsp;&nbsp;查询
			            </a>
						<a id="btnReset" href="javascript:void(0)" class="easyui-linkbutton reset">
							<i class="fa fa-repeat fa-lg"></i>&nbsp;&nbsp;重置
						</a>
		            	
		            	</shiro:hasPermission>
						
						<div style="text-align:right;margin-top:5px;">
							<shiro:hasPermission name="sysDictionary:create">
						        <a id="btnCreate" href="javascript:void(0)" class="easyui-linkbutton button-success"><i class="fa fa-plus-circle fa-lg"></i>&nbsp;&nbsp;新增</a>
							</shiro:hasPermission>
							
							<shiro:hasPermission name="sysDictionary:update">
						        <a id="btnUpdate" href="javascript:void(0)" class="easyui-linkbutton button-default"><i class="fa fa-pencil fa-lg"></i>&nbsp;&nbsp;修改</a>
							</shiro:hasPermission>
							
							<shiro:hasPermission name="sysDictionary:delete">
						        <a id="btnDelete" href="javascript:void(0)" class="easyui-linkbutton button-danger"><i class="fa fa-minus-circle fa-lg"></i>&nbsp;&nbsp;删除</a>
							</shiro:hasPermission>
							<a id="btnReturn" href="javascript:void(0)" class="easyui-linkbutton reset"><i class="fa fa-repeat fa-lg"></i>&nbsp;&nbsp;返回顶级分类</a>
						</div>
		            </form>		    	
		    </div>
		</div>
	</div>
	
    <!-- js脚本，必须写在body中，tab的url加载模式只会异步加载body中的内容到tab中 -->
	<script type="text/javascript">
		require(['jquery','common'], function($){
			var nodeId;
			// 给新增按钮添加点击事件
			$("#btnCreate").on('click', function(){
				if($("#DictionaryTree_SysDictionary").tree('getSelected') == null){
					 $.messager.defaults.ok='字典分类';
					 $.messager.defaults.cancel='字典数据';
					$.messager.confirm('确认','您想新增什么', function(r){
						if(r){
							//新增字典分类
							showDialog('<i class="fa fa-plus-circle fa-lg"></i>&nbsp;&nbsp;添加字典分类', '${ctx}/system/sysDictionary/add', 800, 385, function(){
			            		$('#Grid').datagrid('reload');
			            		$('#DictionaryTree_SysDictionary').tree("reload");
			            	});
							
						}else{
							 $.messager.defaults.ok='确认';
							 $.messager.alert('提示','请先选中左侧字典模块',"info"); 
						}
					});
					$.messager.defaults.ok='确认';
					$.messager.defaults.cancel='取消';
					return ;
				}
				var parentId = $("#DictionaryTree_SysDictionary").tree('getSelected').id;
				var type = $("#DictionaryTree_SysDictionary").tree('getSelected').type;
				showDialog('<i class="fa fa-plus-circle fa-lg"></i>&nbsp;&nbsp;添加字典', '${ctx}/system/sysDictionary/add?id='+parentId+'&type='+type, 800, 385, function(){
            		$('#Grid').datagrid('reload');
            		$('#DictionaryTree_SysDictionary').tree("reload");
            	});
			});
			
			// 给修改按钮添加点击事件
			$("#btnUpdate").on('click', function(){
				var selected = $("#Grid").datagrid('getSelections');
				var seectTree = $("#DictionaryTree_SysDictionary").tree('getSelected');
				if(selected.length == 0){
					$.messager.alert('提示','请选择需要修改的记录', "info");
				}
				var parentId = $("#Grid").datagrid('getSelected').parent;
				if(parentId == ''){
					$.messager.alert('提示','没有父节点不能修改', "info");
				}
				if(selected.length > 1){
					$.messager.alert('提示','只能选择一条需要修改的记录', "info");
				}
				if(selected.length == 1&&parentId != ''){
					var type = $("#Grid").datagrid('getSelected').type
					showDialog('<i class="fa fa-pencil fa-lg"></i>&nbsp;&nbsp;修改字典', '${ctx}/system/sysDictionary/edit?id=' + selected[0].id + '&parentId='+parentId + '&type='+type, 800, 385, function(){
	            		$('#Grid').datagrid('reload');
	            		$('#DictionaryTree_SysDictionary').tree("reload");
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
                            	if(selected[i].isDelete == 0){
                            		ids += selected[i].id + ',';
                            	}
                            }
                            if(ids != ''){
	                            $.ajax({
		                            url: '${ctx}/system/sysDictionary/delete',
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
				var params = $('#Grid').datagrid('options').queryParams;
				params.name = $('#name').val();
				params.code = $('#code').val();
				params.type = $('#type').val();
				params.isDeletes = $('#isDeletes').combobox('getValue');
				if(params.isDeletes=="999"){
					params.isDeletes="";
				}
				$('#Grid').datagrid('options').queryParams = params;
				$('#Grid').datagrid('reload');
				}
			});
			// 给重置按钮添加点击事件
			$("#btnReset").on('click', function(){
				$('#name').textbox('clear');
				$('#code').textbox('clear');
				$('#type').textbox('clear');
				$('#isDeletes').combobox('setValue','999');
				var params = new Object();
				$('#Grid').datagrid('options').queryParams = params;
				$('#Grid').datagrid('reload');
			});
			
			// 给返回顶级按钮添加点击事件
			$("#btnReturn").on('click', function(){
				window.location.href = "${ctx}/system/sysDictionary/"
			});
			
			//点击树重新加载表格
	        $('#DictionaryTree_SysDictionary').tree({
	            onSelect: function (node) {
	            	$("#searchForm").form('reset');
	            	nodeId=node.id;
	                $('#Grid').datagrid({
	                    url: '${ctx}/system/sysDictionary/list',
	                    queryParams: {
	                    	parent: node.id
	                    }
	                });
	            },
	            onLoadSuccess: function (data){  
			        if(nodeId!=null){  
			            var node = $('#DictionaryTree_SysDictionary').tree('find', nodeId);  
			            $('#DictionaryTree_SysDictionary').tree('expandTo', node.target).tree('select', node.target);  
			        }  
		        }  
	        });
		});
		
		//grid双击打开详情弹窗
		function showDetail(rowIndex, rowData){
			commonDetail(rowData.id);
		}
		
		function commonDetail(id){
			showDialog('<i class="fa fa-eye fa-lg"></i>&nbsp;&nbsp;详情页面', '${ctx}/system/sysDictionary/view?id='+id,800,350);
		}
		
		function formatOperate(value,rowData,rowIndex){
			return '<a class="btn btn-default" href="#" onclick="commonDetail('+rowData.id+')"><i class="fa fa-eye fa-lg"></i> 查看详情</a>';
		}
	</script>
</body>
</html>