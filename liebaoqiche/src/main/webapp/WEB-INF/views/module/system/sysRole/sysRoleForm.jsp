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
	<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'center'">
	    	<form id="DataForm" method="post">
	    	<input type="hidden" id="id" name="id" value="${sysRole.id}">
	    		<table style="width: 100%;">
	    			<tbody>
	    				<tr>
	    					<td style="width: 50%; padding: 5px;">
	    						<input class="easyui-textbox" id="name" name="name" value="${sysRole.name}" labelWidth="100" label="角色名称" placeholder="角色名称" required="true" style="width: 90%;"
	    							data-options="prompt:'角色名称',
				    						validType:['length[1,50]','special','checkRoleName']"
	    						>
	    					</td>
	    					<td style="width: 50%; padding: 5px;">
	    						<input class="easyui-textbox" id="code" name="code" value="${sysRole.code}" labelWidth="100" label="角色代码" placeholder="角色代码" required="true"
								    data-options="validType:['length[1,50]','special','checkRoleCode'],prompt:'角色代码'" style="width: 90%;">
	    					</td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px;">
	    						<input class="easyui-numberbox" id="orderNo" name="orderNo" value="${sysRole.orderNo}" labelWidth="100" label="排序号" required="true" data-options="validType:'length[1,10]',prompt:'排序号'" style="width: 90%;">
	    					</td>
	    					<c:if test="${sysRole != null && sysRole.id != null}">
	    						<td style="width: 50%; padding: 5px;">
									<input class="easyui-combobox" id="isDelete" value="${sysRole.isDelete}" name="isDelete" labelWidth="100" label="是否删除"  required="true" style="width: 90%;"
										data-options="
												url:'${ctx}/enumData/isDelete',
												method:'post',
												valueField:'value',
												textField:'label',
												panelHeight:'auto',
												editable:false,
												prompt:'是否删除',
												loadFilter:function(data){
													var newData = new Array();
													for(var i=0; i<data.length; i++){
														if(data[i].value != '999'){
															newData.push(data[i]);
														}
													}
													return newData;
												}
												">
		    					</td>
	    					</c:if>
	    				</tr>
	    				<tr>
	    					<td colspan="2" class="remarks" style="padding: 5px;">
	    						<input class="easyui-textbox" name="remarks" value="${sysRole.remarks}" style="width:95%; height:80px;" labelWidth="100" label="备注"  data-options="validType:'length[0,150]',prompt:'备注',tipPosition:'top'" multiline="true">
	    					</td>
	    				</tr>
	    			</tbody>
	    		</table>
			</form>
		</div>
		<div data-options="region:'south',border:false" style="text-align:right; padding:5px 10px;">
            <a id="btnSave" href="javascript:void(0)" class="easyui-linkbutton button-success" style="width: 80px;"><i class="fa fa-check fa-lg"></i>&nbsp;&nbsp;保存</a>
            <a id="btnCancel" href="javascript:void(0)" class="easyui-linkbutton button-warning" style="width: 80px;"><i class="fa fa-remove fa-lg"></i>&nbsp;&nbsp;取消</a>
        </div>
   	</div>

    <!-- js脚本，必须写在body中，tab的url加载模式只会异步加载body中的内容到tab中 -->
	<script type="text/javascript">
		require(['jquery','common'], function($){

			//扩展校验
			$.extend($.fn.textbox.defaults.rules, {
				checkRoleName : {
					validator : function(value) {

						var url = '${ctx}/system/sysRole/checkRole?id=${sysRole.id}&name='+encodeURI(encodeURI(value));
						var ret = $.ajax({url:url,async:false,cache:false,type:"post"}).responseText;
						return ret=='true';
					},
					message : '该角色名称已存在'
				},
				checkRoleCode : {
					validator : function(value) {
						var url = '${ctx}/system/sysRole/checkRole?id=${sysRole.id}&code='+encodeURI(encodeURI(value));
						var ret = $.ajax({url:url,async:false,cache:false,type:"post"}).responseText;
						return ret=='true';
					},
					message : '该角色代码已存在'
				}
			});

			// 给保存按钮添加点击事件
			$("#btnSave").on('click', function(){
				
				$("#DataForm").form('submit',{
					url:$("#id").val() == ''?'${ctx}/system/sysRole/create':'${ctx}/system/sysRole/update',
					onSubmit:function(){
						if($(this).form('enableValidation').form('validate')){
							$("#btnSave").linkbutton('disable');
							return true;
						}
						return false;
					},
					success: function(data){
						var json = $.parseJSON(data);
						if(json && json.rtnCode == '00000000'){
							$.messager.alert('提示', "保存成功", "success", function(){
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