<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
<title>SysUser</title>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/loading.jsp"%>
	<div class="easyui-layout" data-options="fit:true">
	    <div data-options="region:'north', collapsible:false" title="当前操作角色信息"  style="height: 80px; line-height: 40px; padding: 0 15px;">
    		角色名称：<span id="Label_SysRoleAccedit_Name"></span>
    	</div>
    	<div data-options="region:'center', collapsible:false, border:false" >
    		<table id="roleTreeGrid" class="easyui-treegrid" style="width:98%;height:420px;"></table>
    	</div>
		<div data-options="region:'south',border:false" style="text-align:right; padding:10px;">
			<a id="btnSave" class="easyui-linkbutton button-success"><i class="fa fa-wrench fa-lg"></i>&nbsp;&nbsp;授权</a>
			<a id="btnCancel" class="easyui-linkbutton button-warning"><i class="fa fa-remove fa-lg"></i>&nbsp;&nbsp;取消</a>
		</div>
    </div>

	<!-- js脚本，必须写在body中，tab的url加载模式只会异步加载body中的内容到tab中 -->
	<script type="text/javascript">
		require(['jquery','common','easyui'], function($){
			$("#Label_SysRoleAccedit_Name").html('${role.name}(${role.code})');
			$('#roleTreeGrid').treegrid({
                url:'${ctx}/system/sysRole/sysRoleAccredit?roleId='+'${role.id}',
                method: 'post',
                idField:'id',//根据那个字段判断树节点关系
                treeField:'name',//根据那个列展现树
                sortName:'orderNo',//默认排序字段,后台通过参数名“sort”获取
                sortOrder:'desc',//默认排序规则，后台通过参数名“order”获取
                singleSelect:false,
                frozenColumns:[[
                    {title:'系统模块',field:'name',fixed:true,width:'30%',formatter:function(value, row, index){
                    	var name = '';
                		if(row.parent){
                			name = 'root' + row.parent + '_module' + row.id;
                		}else{
                			name = 'root' + row.id;
                		}
                		if(row.checked){
                			return '<input type="checkbox" checked='+row.checked+' onclick="checkAllResources(this);" name="'+name+'" value="'+row.id+'">'
                           	+ value;
                		}
                		return '<input type="checkbox" onclick="checkAllResources(this);" name="'+name+'" value="'+row.id+'">'
                       	+ value;
                    }}          
                ]],
                columns:[[
                    {title:'系统资源',field:'sysResources',formatter:function(value, row, index){
                    	if(value && value.length > 0){
                    		var resources = '';
                    		$.each(value,function(index, resource){
                    			var name = '';
                        		if(row.parent){
                        			name = 'root' + row.parent + '_module' + row.id +'_' + 'resource';
                        		}else{
                        			name = 'root' + row.id + '_' + 'resource';
                        		}
                        		if(resource.checked){
                        			resources += '<input type="checkbox" checked='+resource.checked+' onclick="checkResource(this);" name="'+name+'" value="'+resource.id+'">'
                        		}else{
                        			resources += '<input type="checkbox" onclick="checkResource(this);" name="'+name+'" value="'+resource.id+'">'
                        		}
	                    		resources += resource.name + '&nbsp;&nbsp;&nbsp;&nbsp;'; 
                    		});
                    		return resources;
                    	}else{
                    		return '';
                    	}
                    }},
                ]],
                onLoadSuccess : function(row, data){
                	$('#roleTreeGrid').treegrid('expandAll');
                },
                onBeforeExpand:function(row){
                	//禁止无children时重新加载一次
                	if(row.children == null || row.children.length == 0){
                		return false;
                	}
                }
			});
			
			$('#btnSave').on('click',function(){
				$.messager.confirm("授权确认","确认要给该角色进行授权？",function(r){
	        		if(r){
	        			var selectedModules = $('input:not([name$="resource"]):checked');
	        			var selectedResources = $('input[name$="resource"]:checked');
	        			
	        			var moduleIds = "";
	        			for(var i = 0; i < selectedModules.length; i++){
	        				moduleIds += $(selectedModules[i]).val();
	        				if(i != selectedModules.length - 1){
	        					moduleIds += ",";
	        				}
	        			}
	        			
	        			var resourcesIds = "";
	        			for(var i = 0; i < selectedResources.length; i++){
	        				resourcesIds += $(selectedResources[i]).val();
	        				if(i != selectedResources.length - 1){
	        					resourcesIds += ",";
	        				}
	        			}
	        			$.ajax({
	        				url: '${ctx}/system/sysRole/accredit',
	                        data: {
	                            roleId : '${role.id}',
	                        	moduleIds : moduleIds,
	                        	resourcesIds : resourcesIds
	                        },
	                        type: 'post',
	                        dataType: 'json',
	                        success: function (json) {
	                            if (json && json.rtnCode == '00000000') {
	                                $.messager.alert('提示', "授权成功", "success",function(){
	                                	hideDialog();
	                                });
	                            } else {
	                                $.messager.alert('提示', json.rtnMsg, "error");
	                            }
	                        }
	        			});
	        		}
				});
			});
			
			// 给取消按钮添加点击事件
			$("#btnCancel").on('click', function(){
				hideDialog();
			});
		});
		
		function checkAllResources(obj){
			var name = $(obj).attr('name');
			$('input[name^="'+name+'_"]').prop('checked',$(obj).prop('checked'));
			if((name.indexOf('module') != -1)){
				var pname = name.split('_')[0];
				if($(obj).prop('checked') || 
					(!$(obj).prop('checked') 
							&& $('input[name^="'+pname+'_"]:checked').length == 0)){
					//取消菜单选项时 若其对应的一级菜单所有资源无选中时取消一级菜单选项
					$('input[name="'+pname+'"]').prop('checked',$(obj).prop('checked'));
				}
				
			}
		}
		
		function checkResource(obj){
			var name = $(obj).attr('name');
			var names = name.split('_');
			if($(obj).prop('checked')){
				$('input[name="'+names[0]+'"]').prop('checked',$(obj).prop('checked'));
				$('input[name="'+names[0]+'_'+names[1]+'"]').prop('checked',$(obj).prop('checked'));
			}else{
				if($('input[name="'+name+'"]:checked').length == 0){
					//二级菜单对应的资源无选中时取消该二级菜单选项
					$('input[name="'+names[0]+'_'+names[1]+'"]').prop('checked',$(obj).prop('checked'));
				}
				if($('input[name^="'+names[0]+'_"]:checked').length == 0){
					//取消资源选项时 若其一级菜单对应的所有资源无选中时取消一级菜单选项
					$('input[name="'+names[0]+'"]').prop('checked',$(obj).prop('checked'));
				}
			}
			
		}
		
	</script>
</body>
</html>