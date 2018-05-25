<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
	<title>UserCard</title>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/loading.jsp"%>
	<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'center'">
	    	<form id="DataForm" method="post">
	    		<table style="width: 100%;">
	    			<tbody>
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="userId" name="userId" value="${userCard.userId}" labelWidth="100" label="user_id" required="true" data-options="prompt:'user_id'" style="width: 90%;">
	    					</td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="vinNo" name="vinNo" value="${userCard.vinNo}" labelWidth="100" label="vin_no" required="true" data-options="prompt:'vin_no'" style="width: 90%;">
	    					</td>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="cardId" name="cardId" value="${userCard.cardId}" labelWidth="100" label="card_id" required="true" data-options="prompt:'card_id'" style="width: 90%;">
	    					</td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="accessSystemId" name="accessSystemId" value="${userCard.accessSystemId}" labelWidth="100" label="access_system_id" required="true" data-options="prompt:'access_system_id'" style="width: 90%;">
	    					</td>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="appId" name="appId" value="${userCard.appId}" labelWidth="100" label="app_id" required="true" data-options="prompt:'app_id'" style="width: 90%;">
	    					</td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="state" name="state" value="${userCard.state}" labelWidth="100" label="状态；0未使用，1已使用"  data-options="prompt:'状态；0未使用，1已使用'" style="width: 90%;">
	    					</td>
	    				</tr>
					    <tr>
						    <td style="width: 50%; padding: 5px; text-align: center;" colspan="2">
	    													<textarea class="easyui-textbox" name="remarks"
														              style="width: 95%; height: 80px;" labelWidth="70" label="备注"
														              data-options="validType:'length[1,300]',prompt:'备注'">${userCard.remarks}</textarea>
						    </td>
					    </tr>
					    <tr>
						    <td style="width: 50%; padding: 5px; text-align: center;">
							    <input class="" hidden="true" id="id" name="id" value="${userCard.id}" labelWidth="100" label="id" required="true" data-options="prompt:'id'" style="width: 90%;">
						    </td>
						    <td style="width: 50%; padding: 5px; text-align: center;">
							    <input class="" hidden="true" id="isDelete" name="isDelete" value="${userCard.isDelete}" labelWidth="100" label="是否删除；0未删除，1删除"  data-options="prompt:'是否删除；0未删除，1删除'" style="width: 90%;">
						    </td>
					    </tr>
					    <tr>
						    <td style="width: 50%; padding: 5px; text-align: center;">
							    <input class="" hidden="true" id="creater" name="creater" value="${userCard.creater}" labelWidth="100" label="创建人"  data-options="prompt:'创建人'" style="width: 90%;">
						    </td>
						    <td style="width: 50%; padding: 5px; text-align: center;">
							    <input class="" hidden="true" id="createTime" name="createTime" value="${userCard.createTime}" labelWidth="100" label="创建时间"  data-options="prompt:'创建时间'" style="width: 90%;">
						    </td>
					    </tr>
					    <tr>
						    <td style="width: 50%; padding: 5px; text-align: center;">
							    <input class="" hidden="true" id="modifier" name="modifier" value="${userCard.modifier}" labelWidth="100" label="修改人"  data-options="prompt:'修改人'" style="width: 90%;">
						    </td>
						    <td style="width: 50%; padding: 5px; text-align: center;">
							    <input class="" hidden="true" id="modifyTime" name="modifyTime" value="${userCard.modifyTime}" labelWidth="100" label="修改时间"  data-options="prompt:'修改时间'" style="width: 90%;">
						    </td>
					    </tr>
					    <tr>
						    <td style="width: 50%; padding: 5px; text-align: center;">
							    <input class="" hidden="true" id="version" name="version" value="${userCard.version}" labelWidth="100" label="版本"  data-options="prompt:'版本'" style="width: 90%;">
						    </td>
					    </tr>
	    			</tbody>
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
					url:$("#id").val() == ''?'${ctx}/card/userCard/create':'${ctx}/card/userCard/update',
					onSubmit:function(){
						return $(this).form('enableValidation').form('validate');
					},
					success: function(data){
						var json = $.parseJSON(data);
						if(json && json.rtnCode == '00000000'){
							$.messager.alert('提示', "保存成功", "success");
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
			});
			
			// 给保存按钮添加点击事件
			$("#btnCancel").on('click', function(){
				history.go(-1);
			});
		});
	</script>
</body>
</html>