<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
	<title>版本信息</title>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/loading.jsp"%>
	
	<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'center'">
	    	<form id="DataForm" method="post" enctype="multipart/form-data">
	    		<input type="hidden" id="id" name="id" value="${appVersion.id}">
	    		<table style="width: 100%;">
	    		<c:choose>
	    		<c:when test="${appVersion.id !=null && appVersion.id !=''}">
	    		<tbody>
	    				<tr>
	    					<td style="width: 50%; padding: 5px;">
	    						<input class="easyui-textbox" id="appVersion" name="appVersion" 
	    						value="${appVersion.appVersion}" labelWidth="120" label="客户端版本号" required="true" readonly="readonly"  
	    					    data-options="prompt:'客户端版本号'"  type="text"  style="width: 100%;">
	    					</td>
	    					<td style="width: 50%; padding: 5px;" colspan="2">
	    						<input class="easyui-combobox" id="appType" name="appType" value="${appVersion.appType}" labelWidth="120" label="终端类型" required="true" data-options="url:'${ctx }/enumData/appType', textField:'label', valueField:'value',editable:false,prompt:'终端类型'" style="width: 100%;" readonly="readonly"  >
	    					</td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px;">
	    						<input class="easyui-numberbox" id="verNum" name="verNum" value="${appVersion.verNum}" labelWidth="120" label="版本编号数字" required="true" 
	    						readonly="readonly"   data-options="prompt:'版本编号数字（如：101）'" style="width: 100%;">
	    					</td>
	    					<td style="width: 50%; padding: 5px;">
	    						<input class="easyui-textbox" id="verCode" name="verCode" value="${appVersion.verCode}" labelWidth="120" label="版本编号文字" required="true" data-options="prompt:'版本编号文字（如：V1.0.1）'" style="width: 100%;" readonly="readonly"  >
	    					</td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px;" colspan="2">
	    						<input class="easyui-filebox" id="sourcesFile" name="sourcesFile" labelWidth="120" label="资源包地址" data-options="prompt:'资源包地址',buttonText:'选择文件'" style="width: 100%;">
	    					</td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px;" colspan="2">
	    						<input class="easyui-textbox" id="content" name="content" value="${appVersion.content}" style="width:100%; height:80px;" labelWidth="120" label="更新内容" required="true" data-options="prompt:'更新内容',multiline:true,validType:'length[1,150]',tipPosition:'top'" style="width: 100%;" missingMessage="更新内容不能为空">
	    					</td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px;" colspan="2">
	    						<input class="easyui-textbox" id="remarks" name="remarks" value="${appVersion.remarks}" style="width:100%; height:80px;" labelWidth="120" label="备注" data-options="prompt:'备注',multiline:true,validType:'length[1,150]',tipPosition:'top'" style="width: 100%;">
	    					</td>
	    				</tr>
	    			</tbody>
	    		</c:when>
	    		
	    		<c:otherwise>
	    		<tbody>
	    				<tr>
	    					<td style="width: 50%; padding: 5px;">
	    						<input class="easyui-textbox" id="appVersion" name="appVersion" 
	    						value="${appVersion.appVersion}" labelWidth="120" label="客户端版本号" required="true"  validType="remote['${ctx}/system/appVersion/validAppVersion','appVersion']" 
	    						invalidMessage="客户端版本号低于历史最高版本号或字符长度过长"  missingMessage="客户端版本号不能为空" data-options="prompt:'客户端版本号',validType:'length[1,150]'"  type="text"  style="width: 100%;">
	    					</td>
	    					<td style="width: 50%; padding: 5px;" colspan="2">
	    						<input class="easyui-combobox" id="appType" name="appType" value="${appVersion.appType}" labelWidth="120" label="终端类型" required="true" data-options="url:'${ctx }/enumData/appType', textField:'label', valueField:'value',editable:false,prompt:'终端类型'" missingMessage="终端类型不能为空" style="width: 100%;">
	    					</td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px;">
	    						<input class="easyui-numberbox" id="verNum" name="verNum" value="${appVersion.verNum}" labelWidth="120" label="版本编号数字" required="true" validType="remote['${ctx}/system/appVersion/validVersion','verNum']" 
	    						invalidMessage="版本号低于历史最高版本号或版本号长度过长"  missingMessage="版本号不能为空" data-options="prompt:'版本编号数字（如：101）',validType:'length[1,8]'" style="width: 100%;">
	    					</td>
	    					<td style="width: 50%; padding: 5px;">
	    						<input class="easyui-textbox" id="verCode" name="verCode" value="${appVersion.verCode}" labelWidth="120" label="版本编号文字" required="true" data-options="prompt:'版本编号文字（如：V1.0.1）',validType:'length[1,150]'" style="width: 100%;" missingMessage="版本编号文字不能为空">
	    					</td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px;" colspan="2">
	    						<input class="easyui-filebox" id="sourcesFile" name="sourcesFile" labelWidth="120" label="资源包地址" data-options="prompt:'资源包地址',buttonText:'选择文件'" style="width: 100%;">
	    					</td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px;" colspan="2">
	    						<input class="easyui-textbox" id="content" name="content" value="${appVersion.content}" style="width:100%; height:80px;" labelWidth="120" label="更新内容" required="true" data-options="prompt:'更新内容',multiline:true,validType:'length[1,150]',tipPosition:'top'" style="width: 100%;" missingMessage="更新内容不能为空">
	    					</td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px;" colspan="2">
	    						<input class="easyui-textbox" id="remarks" name="remarks" value="${appVersion.remarks}" style="width:100%; height:80px;" labelWidth="120" label="备注" data-options="prompt:'备注',multiline:true,validType:'length[1,150]',tipPosition:'top'" style="width: 100%;">
	    					</td>
	    				</tr>
	    			</tbody>
	    			</c:otherwise>
	    		</c:choose>
	    			
	    		</table>
			</form>
		</div>
		<div data-options="region:'south',border:false" style="text-align:right; padding:10px;">
            <a id="btnSave" href="javascript:void(0)" class="easyui-linkbutton button-success" style="width: 80px;"><i class="fa fa-check fa-lg"></i>&nbsp;&nbsp;保存</a>
            <a id="btnCancel" href="javascript:void(0)" class="easyui-linkbutton button-warning" style="width: 80px;"><i class="fa fa-remove fa-lg"></i>&nbsp;&nbsp;取消</a>
        </div>
   	</div>
    
    <!-- js脚本，必须写在body中，tab的url加载模式只会异步加载body中的内容到tab中 -->
	<script type="text/javascript">
		require(['jquery','common'], function($){
			// 给保存按钮添加点击事件
			$("#btnSave").on('click', function(){
				
				$("#btnSave").linkbutton('disable');
			
				$("#DataForm").form('submit',{
					url:$("#id").val() == ''?'${ctx}/system/appVersion/create':'${ctx}/system/appVersion/update',
					onSubmit:function(){
						return $(this).form('enableValidation').form('validate');
					},
					success: function(data){
						var json = $.parseJSON(data);
						if(json && json.rtnCode == '00000000'){
							$.messager.alert('提示', "保存成功", "success", function(){
								hideDialog();
							});
							$("#btnSave").linkbutton('enable');
						}else{
							$.messager.alert('提示', json.rtnMsg, "error");
							$("#btnSave").linkbutton('enable');
						}
					},
					error: function(){
						$("#btnSave").linkbutton('enable');
					}
				});
				
				/* $.extend($.fn.validatebox.defaults.rules, {  
			         checkVersion : {
			        	validator:function (value) {    
		                    var flag="";
		                    	$.ajax({
		                   		async : false,
		                   		cache : false,
		                        type : 'post',
		                        url : '${ctx}/system/appVersion/validVersion',   
		                        data : {      
		                        	id:'${appVersion.id}',appVersion:value  
		                        },
		                        success : function(data) {
		                        	flag=data;
		                        },
		   				});
		                    	return flag;
		                 },
		                 message : '版本号小于以前版本号'
		             }
		         }); */
	
			});
			
			// 给保存按钮添加点击事件
			$("#btnCancel").on('click', function(){
				hideDialog();
			});
		});
		
	</script>
</body>
</html>