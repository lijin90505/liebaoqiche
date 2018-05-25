<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
	<title>SysParameter</title>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/loading.jsp"%>
	<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'center'">
	    	<form id="DataForm" method="post">
   				<input type="hidden" id="id" name="id" value="${sysParameter.id}">
	    		<table style="width: 100%;">
	    			<tbody>
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="paramName" name="paramName" value="${sysParameter.paramName}"
	    						<c:if test="${not empty sysParameter.id}">editable="false"</c:if>
	    							labelWidth="100" label="参数名称" required="true" style="width: 90%;"
	    							data-options="validType:['remote[\'${ctx}/system/sysParameter/checkParameter?id=${sysParameter.id}\',\'paramName\']',
	    								'engOrChineseAndLength','length[0,25]','special'],prompt:'参数名称'">
	    					</td>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="paramCode" name="paramCode" value="${sysParameter.paramCode}" 
	    						<c:if test="${not empty sysParameter.id}">editable="false"</c:if>
	    							labelWidth="100" label="参数代码" required="true" style="width: 90%;" 
	    							data-options="validType:['special','length[0,25]','special'],prompt:'参数代码'">
	    					</td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="paramValue" name="paramValue" value="${sysParameter.paramValue}"
	    							labelWidth="100" label="参数值" required="true" style="width: 90%;"
	    							data-options="validType:['special','length[0,25]','special'],prompt:'参数值'">
	    					</td>
	    					<c:if test="${sysParameter != null && sysParameter.id != null}">
	    						<td style="width: 50%; padding: 5px; text-align: center;">
									<input class="easyui-combobox" id="isDelete" value="${sysParameter.isDelete}"
										name="isDelete" labelWidth="100" label="是否删除" required="true" style="width: 90%;"
										data-options="
												url:'${ctx}/enumData/isDelete',
												method:'post',
												valueField:'value',
												textField:'label',
												panelHeight:'auto',
												editable:false
										">
		    					</td>
	    					</c:if>
	    				</tr>
	    				<tr>
	    					<td colspan="2" style="width: 100%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" name="remarks" value="${sysParameter.remarks}"
	    						<c:if test="${not empty sysParameter.id}">editable="false"</c:if>
	    							style="width:95%; height:80px;" labelWidth="100" label="备注" 
	    							data-options="validType:['special','length[0,150]'],prompt:'备注',
	    								multiline:true,tipPosition:'top'">
	    					</td>
	    				</tr>
	    			</tbody>
	    		</table>
			</form>
		</div>
		<div data-options="region:'south',border:false" style="text-align:right; padding:5px 10px;">
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
					url:$("#id").val() == ''?'${ctx}/system/sysParameter/create':'${ctx}/system/sysParameter/update',
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