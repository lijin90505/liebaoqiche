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
	<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'center'">
	    	<form id="DataForm" method="post">
   				<input type="hidden" id="id" name="id" value="${sysDictionary.id}">
   				<input type="hidden" id="parent" name="parent" value="${sysDictionary.parent}">
   			<c:if test="${sysDictionary.parent!=null}">
   				<input type="hidden" id="type" name="type" value="${sysDictionary.type}">
   			</c:if>
	    		<table style="width: 100%;">
	    			<tbody>
	    
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="name" name="name" value="${sysDictionary.name}"
	    							labelWidth="100" label="字典名称" required="true" style="width: 90%;"
	    							data-options="validType:['remote[\'${ctx}/system/sysDictionary/checkDictionaryParamter?id=${sysDictionary.id}&parent=${sysDictionary.parent}\',\'name\']',
	    								'special','length[0,25]'],prompt:'字典名称'">
	    					</td>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="code" name="code" value="${sysDictionary.code}"
	    							labelWidth="100" label="字典代码" required="true" style="width: 90%;" 
	    							data-options="validType:['remote[\'${ctx}/system/sysDictionary/checkDictionaryParamter?id=${sysDictionary.id}&type=${sysDictionary.type}\',\'code\']',
	    								'special','length[0,25]'],prompt:'字典代码'">
	    					</td>
	    				</tr>
	    				<tr>
    						<c:if test="${sysDictionary.parent==null}">
		    					<td style="width: 50%; padding: 5px; text-align: center;">
		    						<input class="easyui-textbox" id="type" name="type" value="${sysDictionary.type}"
		    							labelWidth="100" label="字典类别" required="true" style="width: 90%;" 
		    							data-options="validType:['special','length[0,25]'],prompt:'字典类别'">
		    					</td>
			    				<td style="width: 50%; padding: 5px; text-align: center;">
			    						<input class="easyui-numberbox" id="orderNo" name="orderNo" value="${sysDictionary.orderNo}"
			    							labelWidth="100" label="排序号" required="true" style="width: 90%;"
			    							data-options="validType:['numbers','length[0,10]'],prompt:'排序号'">
		    					</td>
	    	 				</c:if>
	    				</tr>
	    				<tr>
	    					<c:if test="${sysDictionary.parent!=null}">
	    						<td style="width: 50%; padding: 5px; text-align: center;">
		    						<input class="easyui-numberbox" id="orderNo" name="orderNo" value="${sysDictionary.orderNo}"
		    							labelWidth="100" label="排序号" required="true" style="width: 90%;"
		    							data-options="validType:['numbers','length[0,10]'],prompt:'排序号'">
    							</td>
	    					</c:if>
	    					<c:if test="${sysDictionary != null && sysDictionary.id != null}">
	    						<td style="width: 50%; padding: 5px; text-align: center;">
									<input class="easyui-combobox" id="isDelete" value="${sysDictionary.isDelete}"
										name="isDelete" labelWidth="100" label="是否删除"  required="true" style="width: 90%;"
										data-options="
												url:'${ctx}/enumData/isDelete',
												method:'post',
												valueField:'value',
												textField:'label',
												panelHeight:'auto',
												editable:false,
												loadFilter:function(data){
									        		for(var i=0 ; i<data.length ; i++){
									        			if(data[i].value == '999'){
										        				data.splice(i--,1);
										        			}
										        		}
													return data;
										        }
										">
		    					</td>
	    					</c:if>
	    				</tr>
	    				<tr>
	    					<td colspan="2" style="width: 90%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" name="remarks" value="${sysDictionary.remarks}"
	    							style="width:95%; height:80px;" labelWidth="100" label="备注" 
	    							data-options="validType:['length[0,150]'],prompt:'备注',
	    								tipPosition:'top',multiline:true">
	    					</td>
	    				</tr>
	    			</tbody>
	    		</table>
			</form>
		</div>
		<div data-options="region:'south',border:false" style="text-align:right; padding:10px;">
            <a id="btnSave" href="javascript:void(0)" class="easyui-linkbutton button-success" style="width: 80px;">
            	<i class="fa fa-check fa-lg"></i>&nbsp;&nbsp;保存</a>
            <a id="btnCancel" href="javascript:void(0)" class="easyui-linkbutton button-warning" style="width: 80px;">
            	<i class="fa fa-remove fa-lg"></i>&nbsp;&nbsp;取消</a>
        </div>
   	</div>
    
    <!-- js脚本，必须写在body中，tab的url加载模式只会异步加载body中的内容到tab中 -->
	<script type="text/javascript">
		require(['jquery','common'], function($){
			// 给保存按钮添加点击事件
			$("#btnSave").on('click', function(){
				
				$("#DataForm").form('submit',{
					url:$("#id").val() == ''?'${ctx}/system/sysDictionary/create':'${ctx}/system/sysDictionary/update',
					onSubmit:function(){
						//参数校验
						if($(this).form('enableValidation').form('validate')){
							$("#btnSave").linkbutton('disable');
							return true;
						}
						return false;
					},
					success: function(data){
						var json = $.parseJSON(data);
						if(json && json.rtnCode == '00000000'){
							$.messager.alert('提示', "保存成功", "success",function(){
								hideDialog();
							});
						}else{
							$.messager.alert('提示', json.rtnMsg, "error");
							$("#btnSave").linkbutton('enable');
						}
					},
					error: function(){
						$("#btnSave").linkbutton('enable');
					}
				});
				
			});
			
			// 给保存按钮添加点击事件
			$("#btnCancel").on('click', function(){
				hideDialog();
			});
		});
	</script>
</body>
</html>